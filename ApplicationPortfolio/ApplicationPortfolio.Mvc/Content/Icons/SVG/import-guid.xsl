<?xml version="1.0" encoding="UTF-8"?>

<!--
	XML data should be in the format:
	
	<![CDATA[
	<rows>
		<row id="___" guid="___"></row>
	</rows>
	]]>
-->

<xsl:stylesheet version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:osb="http://www.openswatchbook.org/uri/2009/osb" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape">
	<xsl:output method="xml" indent="yes" cdata-section-elements="script style"/>
	<xsl:key name="id" match="//row" use="@id"/>
	<xsl:variable name="guid-doc" select="document('C:/temp/GUIDs.xml')"/>
	
	<!--Identity template - copy everything with recursion-->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<!--Find matching GUID record and add to desk-->
	<xsl:template match="*[@class='desk']">
		<xsl:variable name="this-object" select="."/>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<!--Switch context to GUIDs document-->
			<xsl:for-each select="$guid-doc">
				<xsl:variable name="matching-guid" select="key('id', $this-object/@id)"/>
				<!--Switch context back to SVG element-->
				<xsl:for-each select="$this-object">
					<xsl:if test="count($matching-guid) = 1">
						<xsl:attribute name="id"><xsl:value-of select="$matching-guid/@guid"/></xsl:attribute>
						<xsl:attribute name="inkscape:label">#<xsl:value-of select="$matching-guid/@guid"/></xsl:attribute>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	<!--Remove all those extra titles-->
	<xsl:template match="title|svg:title"/>
	
</xsl:stylesheet>
