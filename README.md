## Creating HTML output using EpiDoc Reference Stylesheets and Oxygen

### Before you start:

This document assumes that you have an 'epidoc' folder containing:

* a folder 'xml' which holds the tei-epidoc.rng and your XML files;
* a folder 'html' which will contain your output HTML
* a folder 'xsl' which contains all of the Example EpiDoc Stylesheets

If you are using a different folder structure, you may need to change some of the values below.

### Open the EpiDoc Project

Open Oxygen (close all files if necessary) Select Projects --> Open Project

* select: epidoc.xpr from the epidoc folder (Or double-click on epidoc.xpr to open Oxygen.)

### Opening XML in Oxygen
1.	Open/create an EpiDoc xml file in Oxygen
2.	Ensure that the processing instrcution at the top of your file reads:
3.	<?xml-model href="http://www.stoa.org/epidoc/schema/latest/tei-epidoc.rng" schematypens="http://relaxng.org/ns/structure/1.0"?> (unless you are using a local copy of the schema, in which case the path to that copy should be given instead)
4.	Make sure that your XML file validates to the schema by clicking on the 'validate' button (  ) on the toolbar.

### Preparing your XML transformation scenario (in the epidoc project this has already been done, so can be skipped)
1.	Select 'Configure Transformation Scenario' button from the toolbar ( )
2.	Create a New scenario and give it the name 'epidoc-text-to-html'
3.	XML URL: should read “${currentFileURL}”
4.	XSL URL: browse ( ) to the location of 'start-edition.xsl' (in xsl folder). Press OK.
   1.	or enter “../xsl/start-edition.xsl”
5.	Transformer: should read Saxon-HE 9.x.x.x (depending on Oxygen version)
6.	Output: set the value of "Save as" to:
    1.	../html/${cfn}.html
    1.	(this will automatically create an output file in the 'html' folder with the same name as your XML file but the suffix '.html')
7.	Ensure that the following check-boxes are NOT selected:
    1.	XHTML, XML, SVG
8.	Press OK two more times to close the Transformation Scenarios box.
9.	Select Projects -> Save Project
    1.	(When opening Oxygen in future, select Projects -> Open Project... and open epidoc.xpr.)

### Transformation to HTML
1.	With your document open and at the foreground of Oxygen, press the 'Apply Transformation Scenario' button (  ).
    1.	(If necessary, select “epidoc-text-to-html” from the scenarios list, and press “Apply associated”.)
2.	If the transformation is successful, you will see a green square appear at the bottom of the screen, followed by the phrase "Transformation Successful". The file will only transform if the XML validates; if not, a list of errors will appear at the bottom of the screen.
3. To see the html file in your web browser, open the ‘html’ folder. Select your new html (which will have the same name as the XML you transformed) and open it with Firefox, Chrome or whichever browser you use.
