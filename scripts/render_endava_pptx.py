#!/usr/bin/env python3
import json
import re
import sys
import zipfile
from pathlib import Path
import xml.etree.ElementTree as ET

A_NS = "http://schemas.openxmlformats.org/drawingml/2006/main"
P_NS = "http://schemas.openxmlformats.org/presentationml/2006/main"
NS = {"a": A_NS, "p": P_NS}


def main() -> int:
    if len(sys.argv) != 4:
        print("usage: render_endava_pptx.py <template.pptx> <spec.json> <output.pptx>", file=sys.stderr)
        return 1

    template_path = Path(sys.argv[1])
    spec_path = Path(sys.argv[2])
    output_path = Path(sys.argv[3])

    spec = json.loads(spec_path.read_text())
    slide_map = {int(k): v for k, v in spec["slides"].items()}

    with zipfile.ZipFile(template_path, "r") as zin:
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(output_path, "w") as zout:
            for item in zin.infolist():
                data = zin.read(item.filename)
                match = re.fullmatch(r"ppt/slides/slide(\d+)\.xml", item.filename)
                if match:
                    slide_num = int(match.group(1))
                    if slide_num in slide_map:
                        root = ET.fromstring(data)
                        texts = root.findall(".//a:t", NS)
                        replacements = slide_map[slide_num]
                        for i, node in enumerate(texts):
                            node.text = replacements[i] if i < len(replacements) else ""
                        data = ET.tostring(root, encoding="utf-8", xml_declaration=True)
                zout.writestr(item, data)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
