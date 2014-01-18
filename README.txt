simple-template - A simple templating system

# Copyright 2014 Alan De Smet
#
# This is free software; you can redistribute it and/or modify it under the
# terms of either:
#
# a) the GNU General Public License as published by the Free Software
# Foundation; either version 2, or (at your option) any later version, or
#
# b) The "Artistic License 2.0" as published by The Perl Foundation.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License or Artistic
# License for more details.

simple-template is a simple templating system written in Perl.
It was designed for creating and maintaining small web sites with
a consistent look while offering enough power to support special
cases.  It takes a template file annotated with Perl code (using
Text::Template) and generates output based on an input file
written in Perl.

Features:
- Simple
- A single dependency (Text::Template) which is included.
- Uses Perl for the template files and the input files.


Limitations:
- Does not understand maintaining a heirarchy of files.
- Limited error reporting for invalid template files and input
  files. 
- Use requires basic Perl knowledge.

=================================================================
TEMPLATE FILES

For details on the template file, see Text::Template's
documentation:
http://search.cpan.org/~mjd/Text-Template-1.46/lib/Text/Template.pm
But in short:

- Most text will be written to the output file unmodified.

- Anything inside of { matching braces } will be evaluated as
  Perl code.  The last thing evaluated will be inserted into the
  output.

- Inside of the Perl code, you can append to $OUT to add text to
  the output.

Variables available to the template:

- Any variables set in the input file are available.

- The contents of __DATA__ are available as $DATA.

- The path to the input file is available as $SRC_FILE.

- The path to the output file is available as $DST_FILE.

- The filename only of the output file is available as $BASENAME.

See template.html for an example template.

=================================================================
INPUT FILES

The input files are valid Perl code.  Don't bother with the
#!/usr/bin/perl, don't bother with warnings, don't bother making
it a valid module.  Just set the variables you want visible to
the template.  As a special case the __DATA__ is available as
$DATA to the template.  Note that the __DATA__ detection is
special cased; it literally looks for the first
"[\r\n]+__DATA__[\r\n]+" and grabs everything afterward.  This is
slightly different from Perl's usual behavior, which will ignore
__DATA__ in some circumstances.

Input filenames must end with ".src".  The created output file
will have the same name with the last .src removed.

See index.html.src for an example input file.


=================================================================
RUNNING SIMPLE-TEMPLATE

simple-template accepts these arguments:

-h, --help              - Help informatoin

--template=PATH_TO_FILE - Specifies the template file to use.
                          Defaults to "template.html"

--dst=PATH_TO_DIR       - Specifies directory to write output
                          files to. Defaults to "output"


=================================================================
TEXT::TEMPLATE

As originally distributed, this software includes a copy of
Text::Template.  This is for convenience.  You'll probably want
to install your own copy to ensure that it's up to date.  You can
probably find it at
http://search.cpan.org/search?query=Text%3A%3ATemplate&mode=all

