<?xml version="1.0" encoding="UTF-8"?>
<!--Clean up unnecessary markup-->
<xsl:stylesheet version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:osb="http://www.openswatchbook.org/uri/2009/osb" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape">
	<xsl:output method="xml" indent="yes" cdata-section-elements="script style"/>
	
	<!--Identity template - copy everything with recursion-->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<!--Reset all styling within desk elements-->
	<xsl:template match="*[ancestor-or-self::*/@class='desk']/@style"/>
	
	<!--Remove all those extra titles-->
	<xsl:template match="title|svg:title"/>
	
	<!--Remove Inkscape labels-->
	<xsl:template match="inkscape:label"/>
	
	<!--Remove clip paths-->
	<xsl:template match="svg:clipPath"/>
	
	<!--Remove masks-->
	<xsl:template match="svg:mask" />
	
</xsl:stylesheet>
