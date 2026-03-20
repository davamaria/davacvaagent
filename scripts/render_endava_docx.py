#!/usr/bin/env python3
import json
import sys
import zipfile
from copy import deepcopy
from pathlib import Path
import xml.etree.ElementTree as ET

W_NS = "http://schemas.openxmlformats.org/wordprocessingml/2006/main"
ET.register_namespace("w", W_NS)


def w(tag: str) -> str:
    return f"{{{W_NS}}}{tag}"


def make_paragraph(text: str, style: str | None = None) -> ET.Element:
    p = ET.Element(w("p"))
    p_pr = ET.SubElement(p, w("pPr"))
    if style:
        p_style = ET.SubElement(p_pr, w("pStyle"))
        p_style.set(w("val"), style)
    r = ET.SubElement(p, w("r"))
    t = ET.SubElement(r, w("t"))
    if text.startswith(" ") or text.endswith(" "):
        t.set("{http://www.w3.org/XML/1998/namespace}space", "preserve")
    t.text = text
    return p


def main() -> int:
    if len(sys.argv) != 4:
        print("usage: render_endava_docx.py <template.docx> <spec.json> <output.docx>", file=sys.stderr)
        return 1

    template_path = Path(sys.argv[1])
    spec_path = Path(sys.argv[2])
    output_path = Path(sys.argv[3])

    spec = json.loads(spec_path.read_text())

    with zipfile.ZipFile(template_path, "r") as zin:
        document_xml = zin.read("word/document.xml")
        root = ET.fromstring(document_xml)
        body = root.find(w("body"))
        if body is None:
            raise RuntimeError("word/document.xml has no body")
        sect_pr = body.find(w("sectPr"))
        sect_copy = deepcopy(sect_pr) if sect_pr is not None else None

        for child in list(body):
            body.remove(child)

        body.append(make_paragraph(spec["title"], "Title"))
        if spec.get("subtitle"):
            body.append(make_paragraph(spec["subtitle"], "Subtitle"))

        for section in spec.get("sections", []):
            body.append(make_paragraph(section["heading"], "Heading1"))
            for paragraph in section.get("paragraphs", []):
                body.append(make_paragraph(paragraph))
            for bullet in section.get("bullets", []):
                body.append(make_paragraph(f"- {bullet}"))

        if sect_copy is not None:
            body.append(sect_copy)

        output_path.parent.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(output_path, "w") as zout:
            for item in zin.infolist():
                data = zin.read(item.filename)
                if item.filename == "word/document.xml":
                    data = ET.tostring(root, encoding="utf-8", xml_declaration=True)
                zout.writestr(item, data)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
