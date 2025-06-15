This chapter contains a few notes about this template, while also showing of most of the utility functions that are already present.

The template should pretty much compile out of the box, under the condition that you installed the required fonts on your system:

- Default font: https://fonts.google.com/specimen/IBM+Plex+Sans
- Serif variant: https://fonts.google.com/specimen/IBM+Plex+Serif
- Math font: https://online-fonts.com/fonts/stix-two-math

To use this package, you currently have to install it manually on your system. This requires copying the contents of this repository to your #link("https://github.com/typst/packages?tab=readme-ov-file#local-packages", [typst package folder]) under the `local` namespace.

Afterwards its just a matter of executing

`typst init @local/thesis-template:0.1.0`

to initialize an bare-bones project using this template. Now just open up the created folder in your favourite editor and begin setting everything up in the `main.typ` file.

== Modifying the Template

While this template is somewhat configurable (what would be the point of a template otherwise) there is only so much we can do with function parameters, before it gets kind of ridiculous. I created this template to fit a style I thought looked nice and I am relatively happy with how it turned out.

However that does not necessarily mean that you have to agree with every design decision I have made and that is totally fine! If that is the case, I highly encourage you to modify whatever you want so the template fits your specific needs. All of the design related code is contained in the `lib.typ` file and partially the `template/` folder and should at least be somewhat documented.

== Front Matter

The front matter of this document consists of five sections, starting with the _title page_ that is automatically generated using the information you provide. Second is a _statement in lieu of an oath_ that is currently hard coded, but is planned to be customizable in the future.

Next up are the _abstract_ and the _acknowledgements_, which you are meant to provide yourself by editing `frontmatter/abstract.typ` and `frontmatter/acknowledgements.typ` respectively.

Finally, there is the table of contents, that also generates automatically from the headings in the document. Variations, like a list of figures or a list of equations, are currently not included, but may be added in the future.

== Body

The body is where the actual content of your thesis goes in and also what you are reading right now. In fact, everything that comes after the initialization of the template in the `main.typ` is considered part of the body and also styled accordingly. While this tutorial sadly will not help you with the problems you might be facing during your research, it still provides a few utility functions that may make the process of writing a bit easier.

=== Notes and TODO-blocks

=== Citations

=== Subfigures

