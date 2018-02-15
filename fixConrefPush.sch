<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
	xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<!-- offer fixes for incorrect conref push markup -->
	
	<sch:pattern id="fixPushBeforeAfterWithConref">
		<sch:rule context="*[@conaction]">
			<sch:report test="@conref and @conaction='pushbefore'"
				 sqf:fix="insertMarkAfter">
				You are trying to push content before the element
				identified by <sch:value-of select="@conref"/> without 
				marking the target in a separate element, as required by 
				the DITA specification. You need to mark the location 
				in a separate element.
			</sch:report>
			<sqf:fix id="insertMarkAfter">
				<sqf:description>
					<sqf:title>Insert a conref push mark element after the
					conref push before action</sqf:title>
				</sqf:description>
				<!-- insert the mark -->
				<sqf:add position="after" node-type="element" target="{name()}">
					<xsl:copy-of select="@* except (@class,@conaction)"/>
					<xsl:attribute name="conaction" select="'mark'"/>
				</sqf:add>
				<!-- copy the push before without the conref attribute -->
				<sqf:add position="after" node-type="element" target="{name()}">
					<xsl:copy-of select="@* except (@class,@conref)"/>
					<xsl:copy-of select="node()"/>
				</sqf:add>
				<!-- delete the original wrong conref push -->
				<sqf:delete/>
			</sqf:fix>
			<sch:report test="@conref and @conaction='pushafter'"
				sqf:fix="insertMarkBefore">
				You are trying to push content after the element
				identified by <sch:value-of select="@conref"/> without 
				marking the target in a separate element, as required by 
				the DITA specification. You need to mark the location 
				in a separate element.
			</sch:report>
			<sqf:fix id="insertMarkBefore">
				<sqf:description>
					<sqf:title>Insert a conref push mark element before the
						conref push after action</sqf:title>
				</sqf:description>
				<!-- copy the push before without the conref attribute -->
				<sqf:add position="after" node-type="element" target="{name()}">
					<xsl:copy-of select="@* except (@class,@conref)"/>
					<xsl:copy-of select="node()"/>
				</sqf:add>
				<!-- insert the mark -->
				<sqf:add position="after" node-type="element" target="{name()}">
					<xsl:copy-of select="@* except (@class,@conaction)"/>
					<xsl:attribute name="conaction" select="'mark'"/>
				</sqf:add>
				<!-- delete the original wrong conref push -->
				<sqf:delete/>
			</sqf:fix>
			
		</sch:rule>
	</sch:pattern>
	
</sch:schema>