<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:osb="http://www.openswatchbook.org/uri/2009/osb" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape">
	<xsl:output method="text">
	</xsl:output>
	<xsl:template match="/">
		<xsl:for-each select="/svg:svg/svg:g[@inkscape:groupmode='layer']">
			<xsl:text>
		</xsl:text>
			<xsl:value-of select="@inkscape:label">
		</xsl:value-of>
			<xsl:text>
		</xsl:text>
			<xsl:for-each select="descendant::*[@class='desk']">
				<xsl:value-of select="@id"/>
				<xsl:text>
		</xsl:text>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
