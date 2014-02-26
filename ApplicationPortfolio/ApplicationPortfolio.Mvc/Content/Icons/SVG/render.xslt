<?xml version="1.0" encoding="UTF-8"?>
<!--
This stylesheet uses the XSLT identity template to process the SVG file,
therefore all existing elements and attributes are processed
unless specific templates are matched that override them.
See http://www.xmlplease.com/xsltidentity for more information on using identity templates
-->
<!--Note: tmbc namespace added for using with custom SVG markup (e.g. dynamic viewBox coordinates)-->
<xsl:stylesheet version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:osb="http://www.openswatchbook.org/uri/2009/osb" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" xmlns:tmbc="http://www.trafford.gov.uk">
	<xsl:output method="xml" indent="yes" cdata-section-elements="style"/>
	
	<!--
	XSL transformation testing in XMLSpy requires these XSL parameters to have valid values

	Example:
	resource-status = document('ResourceStatus.xml')
	resource-id-filter = '662ad5d6-68f0-4a06-9b67-f6785a3d9ec9'

	See menu item XSL/XQuery > XSL parameters/XQuery variables
	-->
	
	<!--Set select attribute for dynamic parameters to "/.." or it will not work-->
	<xsl:param name="resource-status" select="/.."/>
	<xsl:param name="resource-id-filter" select="/.."/>
	
	<xsl:param name="booking-date"/>
	<xsl:param name="booking-start-time"/>
	<xsl:param name="booking-end-time"/>
	<xsl:param name="target-url"/>
	<xsl:param name="desk-info-target-url" select="'/Bookings/Room/Information/'" />
	
	<!--Include the SVG document containing the popup graphics-->
	<xsl:variable name="popup-doc" select="document('popup.svg')"/>
	
	<!--Index resource IDs for use later (enables quicker lookup)-->
	<xsl:key use="ResourceId" name="resources" match="//AvaliableResource"/>
	
	<!--Exlude all unnecessary markup-->
	<xsl:template match="sodipodi:*|@sodipodi:*"/>
	<xsl:template match="@inkscape:*"/>
	<xsl:template match="title|svg:title"/>
	<xsl:template match="svg:defs/svg:style"/>
	<xsl:template match="svg:clipPath"/>
	<xsl:template match="svg:mask"/>
	
	<!--Always copy metadata and defs-->
	<xsl:template match="svg:metadata|svg:defs">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<!--Reset all styling within desk child elements-->
	<xsl:template match="*[ancestor::*/@class='desk']/@style"/>
	<xsl:template match="*[ancestor::*/@class='pc-desk']/@style"/>
	
	<!--By default hide the PC symbol-->
	<xsl:template match="svg:*[@class='pc']"/>
	
	<!--
	Identity template
	This template does all the main work - copying everything (with recursion), unless there is a more specific template match
	-->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<!--Copy all attributes first-->
			<xsl:apply-templates select="@*"/>
			<!--Make sure the element matching resource-id-filter is visible-->
			<xsl:if test="./@id = $resource-id-filter">
				<xsl:attribute name="style">display:inline;</xsl:attribute>
			</xsl:if>
			<!--Ensure floor containing the resource is visible-->
			<xsl:if test="./@class='floor' and ./descendant-or-self::*/@id = $resource-id-filter">
				<xsl:attribute name="style">display:inline;</xsl:attribute>
			</xsl:if>
			<!--Copy all child nodes-->
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	<!--
	The main work to process the SVG starts here, starting with the root-level svg element.

	Output SVG content in the following order:

	* SVG attributes,
	* Scripting functionality,
	* Metadata and defs,
	* Main SVG content,
	* Popup element.
	-->
	<xsl:template match="svg:svg">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="onload">loaded();</xsl:attribute>
			<xsl:attribute name="width">750</xsl:attribute>
			<xsl:attribute name="height">775</xsl:attribute>
			<!--If tmbc:viewBox attribute exists for this floor then use that as the main SVG viewBox-->
			<xsl:choose>
				<xsl:when test="normalize-space(//*[@class='floor'][descendant-or-self::*/@id=$resource-id-filter]/@tmbc:viewBox)!=''">
					<xsl:attribute name="viewBox"><xsl:value-of select="//*[@class='floor'][descendant-or-self::*/@id=$resource-id-filter]/@tmbc:viewBox"></xsl:value-of></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="viewBox">0 0 750 775</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:attribute name="preserveAspectRatio">xMinYMin meet</xsl:attribute>
			<!--If tmbc:popupx (and tmbc:popupy) coordinates exist for this floor then pass them to the script parameters-->
			<xsl:choose>
				<xsl:when test="normalize-space(//*[@class='floor'][descendant-or-self::*/@id=$resource-id-filter]/@tmbc:popupx)!=''">
					<xsl:call-template name="script">
						<xsl:with-param name="mx" select="//*[@class='floor'][descendant-or-self::*/@id=$resource-id-filter]/@tmbc:popupx">
				</xsl:with-param>
						<xsl:with-param name="my" select="//*[@class='floor'][descendant-or-self::*/@id=$resource-id-filter]/@tmbc:popupy">
				</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="script">
			</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="svg:metadata|svg:defs"/>
			<xsl:apply-templates select="//*[@class='floor'][descendant-or-self::*/@id=$resource-id-filter]"/>

			<!--Output the popup elements-->
			<xsl:apply-templates select="$popup-doc//svg:*[@id='popup0']"/>
			<xsl:apply-templates select="$popup-doc//svg:*[@id='popup1']"/>
		</xsl:copy>
	</xsl:template>
		
	<xsl:template match="*[@class='floorplan']">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
			<xsl:attribute name="style">fill:none;stroke:#000000;stroke-width:4px;</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	
	<!--
	Templates for object classes.

	Conventional practice would search the resource status doc each time for every element ID.
	By using xsl:key the resource status records are indexed and can be retrieved using key() function.
	See http://clover.slavic.pitt.edu/repertorium/plectogram/keys/keys.html for help
	-->

	<xsl:template match="*[@class='room']">
		<xsl:variable name="this-object" select="."/>
		<xsl:for-each select="$resource-status">
			<xsl:variable name="matching-resource" select="key('resources', $this-object/@id)"/>
			<xsl:for-each select="$this-object">
				<a xlink:href="{$desk-info-target-url}{$this-object/@id}" target="_parent">
					<xsl:copy>
						<xsl:apply-templates select="@*"/>
						<xsl:attribute name="style">fill:#C1CBEB;stroke:#888888;stroke-width:1px;</xsl:attribute>
						<xsl:if test="normalize-space($matching-resource//ResourceName)!=''">
							<xsl:attribute name="onmousemove">ShowTooltip(evt, 'zone', '<xsl:value-of select="$matching-resource//ResourceName"/>', '', '');</xsl:attribute>
							<xsl:attribute name="onmouseout">HideTooltip(evt);</xsl:attribute>
						</xsl:if>
						<set attributeName="fill" to="#E1EBFB" begin="mouseover" end="mouseout"/>
						<xsl:apply-templates select="node()"/>
					</xsl:copy>
				</a>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*[@class='zone']">
		<xsl:variable name="this-object" select="."/>
		<xsl:for-each select="$resource-status">
			<xsl:variable name="matching-resource" select="key('resources', $this-object/@id)"/>
			<xsl:for-each select="$this-object">
				<xsl:copy>
					<xsl:apply-templates select="@*"/>
					<!-- <xsl:attribute name="style">fill:#FFFFFF;</xsl:attribute> -->
					<xsl:if test="normalize-space($matching-resource//ResourceName)!=''">
						<xsl:attribute name="onmousemove">ShowTooltip(evt, 'zone', '<xsl:value-of select="$matching-resource//ResourceName"/>', '', '');</xsl:attribute>
						<xsl:attribute name="onmouseout">HideTooltip(evt);</xsl:attribute>
					</xsl:if>
					<!--<set attributeName="fill" to="#F8F8F8" begin="mouseover" end="mouseout"/>-->
					<xsl:apply-templates select="node()"/>
				</xsl:copy>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*[@class='desk' or @class='pc-desk']">
		<xsl:variable name="this-object" select="."/>
		<xsl:for-each select="$resource-status">
			<xsl:variable name="matching-resource" select="key('resources', $this-object/@id)"/>
			<xsl:for-each select="$this-object">
				<xsl:choose>
					<!--A desk booking found-->
					<xsl:when test="count($matching-resource//ResourceBookings)=1">
						<xsl:copy>
							<xsl:apply-templates select="@*"/>
							<xsl:attribute name="style">fill:#CC0000;stroke:#888888;stroke-width:1px;</xsl:attribute>
							<xsl:attribute name="onmousemove">ShowTooltip(evt, 'resource', '<xsl:value-of select="$matching-resource//ResourceName"/>', '<xsl:value-of select="$matching-resource//ResourceBookings[1]/StartTime"/>-<xsl:value-of select="$matching-resource//ResourceBookings[1]/EndTime"/>: <xsl:call-template name="escape-apos"><xsl:with-param name="string" select="$matching-resource//ResourceBookings[1]/BookingInformation"/></xsl:call-template>','');</xsl:attribute>
							<xsl:attribute name="onmouseout">HideTooltip(evt);</xsl:attribute>
							<set attributeName="fill" to="#FF0000" begin="mouseover" end="mouseout"/>
							<xsl:apply-templates select="node()"/>
						</xsl:copy>
					</xsl:when>
					<xsl:when test="count($matching-resource//ResourceBookings)=2">
						<xsl:copy>
							<xsl:apply-templates select="@*"/>
							<xsl:attribute name="style">fill:#CC0000;stroke:#888888;stroke-width:1px;</xsl:attribute>
							<xsl:attribute name="onmousemove">ShowTooltip(evt, 'resource', '<xsl:value-of select="$matching-resource//ResourceName"/>', '<xsl:value-of select="$matching-resource//ResourceBookings[1]/StartTime"/>-<xsl:value-of select="$matching-resource//ResourceBookings[1]/EndTime"/>: <xsl:call-template name="escape-apos"><xsl:with-param name="string" select="$matching-resource//ResourceBookings[1]/BookingInformation"/></xsl:call-template>', '<xsl:value-of select="$matching-resource//ResourceBookings[2]/StartTime"/>-<xsl:value-of select="$matching-resource//ResourceBookings[2]/EndTime"/>: <xsl:call-template name="escape-apos"><xsl:with-param name="string" select="$matching-resource//ResourceBookings[2]/BookingInformation"/></xsl:call-template>');</xsl:attribute>
							<xsl:attribute name="onmouseout">HideTooltip(evt);</xsl:attribute>
							<set attributeName="fill" to="#FF0000" begin="mouseover" end="mouseout"/>
							<xsl:apply-templates select="node()"/>
						</xsl:copy>
					</xsl:when>
					<!--Class A desks that can be released-->
					<xsl:when test="$matching-resource//Releasable = 'True'">
						<a xlink:href="{$target-url}Desk/Release/{$this-object/@id}" target="_parent">
							<xsl:copy>
								<xsl:apply-templates select="@*"/>
								<xsl:attribute name="style">fill:#EEEEEE;stroke:#888888;</xsl:attribute>
								<xsl:attribute name="onmousemove">ShowTooltip(evt, 'resource', '<xsl:value-of select="$matching-resource//ResourceName"/>','Work style A desk', 'Click to release desk...');</xsl:attribute>
								<xsl:attribute name="onmouseout">HideTooltip(evt);</xsl:attribute>
								<set attributeName="fill" to="#CCCCCC" begin="mouseover" end="mouseout"/>
								<xsl:apply-templates select="node()"/>
							</xsl:copy>
						</a>
					</xsl:when>
					<!--Bookable, so let user click to book-->
					<xsl:when test="$matching-resource/Bookable='True'">
						<!--Generate hyperlink with relevant parameters-->
						<a xlink:href="{$target-url}Desk/Book/{$this-object/@id}?date&#61;{$booking-date}&#38;start&#61;{$booking-start-time}&#38;end&#61;{$booking-end-time}" target="_parent">
							<xsl:copy>
								<!--Output all attributes-->
								<xsl:apply-templates select="@*"/>
								<!--Set default style-->
								<xsl:attribute name="style">fill:#00CC00;stroke:#888888;stroke-width:1px;</xsl:attribute>
								<xsl:attribute name="onmouseout">HideTooltip(evt);</xsl:attribute>
								<xsl:choose>
									<!--Extra info to show that desks with class 'pc-desk' have a PC installed-->
									<!--<xsl:when test="$this-object/@class='pc-desk'">
										<xsl:attribute name="style">fill:#FE9C55;stroke:#888888;stroke-width:1px;</xsl:attribute>
										<xsl:attribute name="onmousemove">ShowTooltip(evt, 'resource', '<xsl:value-of select="$matching-resource//ResourceName"/>', 'THIS DESK INCLUDES A PC', 'Click to book...');</xsl:attribute>
										<set attributeName="fill" to="#FFD740" begin="mouseover" end="mouseout"/>
										<xsl:apply-templates select="node()"/>
										<xsl:for-each select="descendant::svg:circle">
											<xsl:copy>
												<xsl:apply-templates select="@*"/>
												<xsl:attribute name="style">fill:888888;</xsl:attribute>
											</xsl:copy>
										</xsl:for-each>
									</xsl:when>-->
									<!--Show that released class A desks also have a PC-->
									<xsl:when test="$matching-resource//hasPC='True'">
										<xsl:attribute name="onmousemove">ShowTooltip(evt, 'resource', '<xsl:value-of select="$matching-resource//ResourceName"/>', 'THIS DESK INCLUDES A PC', 'Click to book...');</xsl:attribute>
										<set attributeName="fill" to="#00FF00" begin="mouseover" end="mouseout"/>
										<xsl:apply-templates select="node()"/>
										<!--Render pc symbol (circle) last so that appears on top-->
										<xsl:for-each select="descendant::svg:*[@class='pc']">
											<xsl:copy>
												<xsl:apply-templates select="@*"/>
												<xsl:attribute name="style">fill:000000;</xsl:attribute>
											</xsl:copy>
										</xsl:for-each>
									</xsl:when>
									<!--Show as default bookable desk-->
									<xsl:otherwise>
										<xsl:attribute name="onmousemove">ShowTooltip(evt, 'resource', '<xsl:value-of select="$matching-resource//ResourceName"/>', 'Click to book...', '');</xsl:attribute>
										<set attributeName="fill" to="#00FF00" begin="mouseover" end="mouseout"/>
										<xsl:apply-templates select="node()"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:copy>
						</a>
					</xsl:when>
					<!--Otherwise, set default style (grey)-->
					<xsl:otherwise>
						<xsl:copy>
							<xsl:apply-templates select="@*"/>
							<!--Always ensure the object is displayed if we have a match-->
							<xsl:attribute name="display">inline</xsl:attribute>
							<xsl:attribute name="style">fill:#EEEEEE;stroke:#888888;</xsl:attribute>
							<xsl:apply-templates select="node()"/>
						</xsl:copy>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	
	<!--Escape apostrophes-->
	<xsl:template name="escape-apos">
		<xsl:param name="string"/>
		<xsl:variable name="apos">'</xsl:variable>
		<xsl:choose>
			<xsl:when test='contains($string, $apos)'>
				<xsl:value-of select="substring-before($string, $apos)"/>
				<xsl:text>\'</xsl:text>
				<xsl:call-template name="escape-apos">
					<xsl:with-param name="string" select="substring-after($string, $apos)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$string"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!--Javascript output-->
	<xsl:template name="script">
		<!--
			Coordinates for popup information window that can be over-ridden by passing relevant mx/my parameters
			This has to be done outside of the CDATA section or else the markup would be encoded and ignored
		-->
		<xsl:param name="mx" select="'350'">
		</xsl:param>
		<xsl:param name="my" select="'425'">
		</xsl:param>
		<script type="text/ecmascript">
			var mx = <xsl:value-of select="$mx">
		
		</xsl:value-of>;
			var my = <xsl:value-of select="$my"/>;
			
		<![CDATA[
		  function loaded() {
			  var onloadFunc = init;
  			
			  if (window.svgweb) {
			    window.svgweb.addOnLoad(onloadFunc, true, window);
			  } else {
			    onloadFunc();
			  }
		  }
      		  
	    function init(evt)
	    {
	        tooltip = document.getElementById('popup0');
	        pop_title = document.getElementById('pop_title');
			pop_contentText1 = document.getElementById('pop_contentText1');
			pop_contentText2 = document.getElementById('pop_contentText2');
			
			zoneTooltip = document.getElementById('popup1');
			pop_ZoneText = document.getElementById('pop_ZoneText');
			
			HideTooltip(evt);
	    }
	    
	    function ShowTooltip(evt, tooltipName, titleText, contentText1, contentText2)
	    {
			//mx = evt.clientX;
			//my = evt.clientY;
			
			//mx = 100;
			//my = 0;
			
			if(mx<95) mx = 95;
			if(mx>655) mx = 655;
			
			if (tooltipName == "resource")
			{
				pop_title.firstChild.textContent = titleText;
				pop_contentText1.firstChild.textContent = contentText1;
				pop_contentText2.firstChild.textContent = contentText2;
				tooltip.setAttributeNS('','transform','translate('+ (mx) +','+ (my) +')');
				tooltip.setAttributeNS(null,"visibility","visible");
			}
			else if (tooltipName == "zone")
			{
				pop_ZoneText.firstChild.textContent = titleText;
				zoneTooltip.setAttributeNS('','transform','translate('+ (mx) +','+ (my) +')');
				zoneTooltip.setAttributeNS(null,"visibility","visible");
			}
			
	    }

	    function HideTooltip(evt)
	    {
	        tooltip.setAttributeNS(null,"visibility","hidden");
	        zoneTooltip.setAttributeNS(null,"visibility","hidden");
	    }
	    
	  ]]></script>
	</xsl:template>
	
</xsl:stylesheet>
