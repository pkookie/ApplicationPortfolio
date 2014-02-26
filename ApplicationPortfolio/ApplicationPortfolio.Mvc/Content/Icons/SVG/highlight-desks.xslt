<?xml version="1.0" encoding="UTF-8"?>
<!--
Highlights valid/invalid desk IDs

All desks should be assigned a 36-character GUID. 
This stylehseet assumes that @id attributes shorter than that are invalid or missing GUIDs.

'Correct' IDs = green
'Incorrect' IDs = red

This stylesheet uses the XSLT identity template to process the SVG file,
therefore all existing elements and attributes are processed
unless specific templates are matched that override them
-->
<xsl:stylesheet version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:osb="http://www.openswatchbook.org/uri/2009/osb" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape">
	<xsl:output method="xml" indent="yes" cdata-section-elements="script style"/>
	<!--Identity template - copy everything with recursion-->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="*[@class='desk']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:choose>
				<!--Test the length of the ID attribute-->
				<xsl:when test="string-length(@id) &lt; 36">
					<xsl:attribute name="style">fill:#FF0000;stroke:#FF0000;</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="style">fill:#00FF00;stroke:#00FF00;</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="node()"/>
			<svg:title>
				<xsl:value-of select="@id">
			</xsl:value-of>
			</svg:title>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*[@class='desk']//*[@class='pc']">
	</xsl:template>
</xsl:stylesheet>
