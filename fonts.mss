/*
About fonts:

Noto is a font family that wants to cover most of Unicode with a harmonic
design across various scripts. We use Noto for most text, with some support
for backward-compatibility and some fallback fonts.

By order:

1. Noto Sans is available for most scripts and it is used as a first choice.
Where available the UI version of the fonts – which provides tighter vertical
metrics – is used (except for the base font, where the UI version is deprecated
since Noto Phase III, and Sinhala where both versions are used for backwards
compatibility with Ubuntu 16.04). We intent to have all scripts of Noto in
our list except dead (historic) scripts of whom we assume that they are not
used in “name” tags in OSM. Most of the list is in alphabetical order,
but there are some exceptions.

  - Noto Sans is before all other fonts
  - The CJK fonts are manually ordered. The used CJK font covers all CJK
    languages, but defaults to the japanese glyph style if various glyph
    styles are available. (We have to default to one of JP, KR, SC, TC because
    this carto style has no knowledge about what language the “names” tag
    contains. As in Korea Han characters are not so widely used, it seems
    better to default to either Chinese or Japanese. As Chinese exists in the
    two variants SC/TC, it won’t be a uniform rendering anyway. So we default
    to Japanese. However, this choice stays somewhat arbitrary and subjective.
    See also https://github.com/gravitystorm/openstreetmap-carto/issues/2208)
  - For the Syriac script, there exist Noto Sans Syriac Eastern,
    Noto Sans Syriac Western Regular and Noto Sans Syriac Estrangela Regular.
    As for CJK fonts, we have no knowledge about what language the “names” tag
    contains. We choose Syriac Eastern because it seems to be the most
    widespreaded script variant (Syriac Western is less common, and Syriac
    Estrangela mostly of historic interest.)

2. Noto provides various variants of Arabic: Noto Kufi Arabic, Noto Naskh
Arabic, Noto Nastaliq Urdu and Noto Sans Arabic. Kufi and Urdu styles are not
widespread in use. Noto Sans Arabic (a Naskh-style low-contrast “Sans” font) and
Noto Naskh Arabic are the fonts with the greatest coverage and provide an UI
variant. This style uses Noto Sans Arabic UI because it’s consistent with the
other Sans fonts and legible. The Arabic fonts are placed behind Sans fonts
because they might re-define some commonly used signs like parenthesis or
quotation marks, and the arabic design should not overwrite the standard design.

3. Noto provides two variants of Emoji: Noto Color Emoji and Noto Emoji. The
colour variant is a SVG flavoured OpenType font that contains coloured emojis.
This is not useful in cartography, so we use the “normal” monochromatic
Noto Emoji.

4. The list still includes Noto Naskh Arabic UI for compatibility on systems
without Noto Sans Arabic UI.

5. The list still includes DejaVu for compatibility on systems without Noto.

6. Fallback fonts. Hanazono covers almost all CJK characters, even in Unicode
Plane 2. Unifont is a fallback of last resort with full coverage in Plane 0
(Unifont Medium), some coverage in Plane 1 (Unifont Upper Medium) and no
coverage in Plane 2. Unifont Medium Sample would cover the BMP PUA with
replacement characters, but cannot be used because Mapnik does not
support SBIT TTF.
*/

/*
A regular style.
*/
@book-fonts:    "DejaVu Sans Book";

/*
A bold style is available for almost all scripts. Bold text is heavier than
regular text and can be used for emphasis. Fallback is a regular style.
*/
@bold-fonts:    "DejaVu Sans Bold",

                @book-fonts;

/*
Italics are only available for the base font, not the other scripts.
For a considerable number of labels this style will make no difference to the regular style.
*/
@oblique-fonts: "DejaVu Sans Oblique", @book-fonts;
