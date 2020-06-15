﻿<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:sp="http://www.spase-group.org/data/schema" xmlns:vot="http://www.ivoa.net/xml/VOTable/VOTable/v1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  version="1.0" exclude-result-prefixes="sp vot">
  <xsl:param name="spase.resolver" select="'http://spase-group.org/registry/resolver'"/>
  <xsl:param name="spase.render" select="'http://spase-group.org/registry/render'"/>
  <!--
  <xsl:output doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" doctype-public="-//W3C//DTD XHTML 1.1//EN" method="xhtml" indent="yes" omit-xml-declaration="yes"/>
  -->
  <xsl:strip-space elements="*"/>
  
  <xsl:template match="/">
   <html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>SPASE Resource Description</title>
	  <!-- CSS -->
	  <style>
/* http://spase-group.org/tools/xmlviewer */
/* v1.0 | 20160908 */

* {
   margin: 0;
   padding: 0;
   border: 0;
   outline: 0;
   font-size: 100%;
   vertical-align: baseline;
   background: transparent;
}

body {
	background-color: #eaf5e9;/*#277bc0;/*#d3d3f9; */
	color: black;
	font-family: Verdana, Arial, sans-serif; 
	font-size:12px; 
	line-height: 1.2;
	padding: 10px 3% 10px 3%;
}
 
h1,h2,h3,h4,h5,h6 {
	margin-top: 10px;
	margin-bottom: 10px;
	font-weight:bold;
}

h1 {
	font-size: 140%;
}

h2 {
	font-size: 120%;
}

h3 {
	font-size: 110%;
	font-style: oblique;
}

p {
	margin-bottom: 0.75ex;
}

dt {
	margin-top: 5px;
	padding-left: 5px;
	border-top: 1px solid #DDD;
	font-weight: bold;
}

dd {
	margin-left: 5ex;
}

a:link,
a:visited {
   color: #277bc0;/* #339;*/
   font-weight:bolder; 
   text-decoration:none; 
}

a:hover {
   color: blue;
   font-weight:bolder; 
   text-decoration:underline; 
}

ul {
	list-style: square inside ;
	margin-bottom: 0.75ex;
}

table {
   border: thin solid #666;
	margin-top: 5px;
	margin-bottom: 10px;
}

thead,tbody {
   border: thin solid #666;
}

td, th {
   margin: 0;
	padding: 2px 2px 2px 2px;
}

th {
	font-style: oblique;
}

h1.detail {
}

div.product {
	background-color: white;
	border: thin solid #333;
	padding: 10px 15px 10px 15px;
	margin-top: 10px;
}

div.parameter {
	margin-top: 10px;
	padding: 5px 10px 10px 10px;
	border: thin dotted #333;
	background-color: #ebebeb;
}

dt.parameter {
	margin-top: 10px;
	padding: 5px 10px 10px 10px;
	border: thin dotted #333;
	background-color: #ebebeb;
}

#toc {
   border: thin solid #333;
   background-color: #F5F5F5; 
   padding: 10px 15px 10px 15px;
   margin-left: 5%;
   margin-right: 5%;
   margin-bottom: 30px;
}

#toc ol, ul, li {
	padding-left: 5ex;
}

#toc ol {
	list-style-type: decimal;
	list-style-position: inside; 
}

#toc ul {
	list-style-type: square;
	list-style-position: inside; 
}

p.version {
  float: right;
  width: 100%;
  margin-top: 5px;
  text-align: right;
  font-size: x-small;
}

p.right {
  float: right;
  text-align: right;
}

.box-title {
	font-size: 120%;
	font-weight:bold;
	text-align: center;
	border-bottom: 1px solid #DDD;
}

ul.list {
	list-style-position: outside;
	padding-left: 1.5em;
}

li.list {
	text-align: left;
	padding-left: 0px;
}

.no-break {
	white-space: nowrap;
}

p.author {
	font-size: 120%;
}

div.brand {
	width: 100%;
	text-align: right;
}

div.container {
	display: table;
	position: relative;
}

div.citation {
}

div.access {
	float: left;
	width: 20%;
	background-color: white;
	border: thin solid #333;
	padding: 5px 5px 5px 5px;
	margin-right: 1em;
}

a.xml-logo:link,
a.xml-logo:visited {
   background: #ff6600;
   color: #ffffff;
   font-weight:bolder; 
   text-decoration:none; 
   padding-left:2px;
   padding-right:2px;
}
a.xml-logo:hover {
   text-decoration:underline; 
}

	  </style>
	</head>
	<body>
		<div><a id="top"></a></div>
		<div class="brand">Provided by: <a target="blank" href="http://spase.info">SPASE.info</a></div>
       <xsl:apply-templates select="Package"/>	<!-- create table of content if present -->
       <xsl:apply-templates select="./*/sp:Spase"/> <!-- Process each description in a Package -->
       <xsl:apply-templates select="sp:Spase"/> <!-- Process a single description -->
   </body>
   </html>
</xsl:template>

<xsl:template match="Package">
    <div id="toc">
      <h2>Table of Contents</h2>
      <ol>
		<xsl:for-each select="./sp:Spase">
			<li><a href="#{./*/sp:ResourceID}"><xsl:value-of select="./*/sp:ResourceID" /></a></li>
		</xsl:for-each>
	  </ol>
	</div>
</xsl:template>
	  
<xsl:template match="sp:Spase">
	<div class="spase">
		<div class="container">
		<xsl:if test="./*/sp:AccessInformation">
		<div class="access">
			<p class="box-title">Data Access</p>
			<ul class="list">
			<xsl:for-each select="./*/sp:AccessInformation">
				<xsl:for-each select="./sp:AccessURL">
					<li class="list"><a target="_blank" href="{./sp:URL}"><xsl:if test="./sp:Style"><xsl:value-of select="./sp:Style" />: </xsl:if><xsl:value-of select="./sp:Name" /></a></li>
				</xsl:for-each>
			</xsl:for-each>
			</ul>
		</div>
		</xsl:if>
		<div class="citation">
			<h1><a name="{./*/sp:ResourceID}"><xsl:value-of select="./*/sp:ResourceHeader/sp:ResourceName" /></a></h1>
			<xsl:if test="./*/sp:ResourceHeader/sp:PublicationInfo">
			<p class="author"><xsl:value-of select="./*/sp:ResourceHeader/sp:PublicationInfo/sp:Authors" />
			(<xsl:value-of select="substring(./*/sp:ResourceHeader/sp:PublicationInfo/sp:PublicationDate, 1, 4)" />), 
			<xsl:value-of select="./*/sp:ResourceHeader/sp:PublicationInfo/sp:PublishedBy" /><xsl:if test="./*/sp:ResourceHeader/sp:DOI">, doi: <xsl:value-of select="./*/sp:ResourceHeader/sp:DOI" />
			</xsl:if>
			</p>
			</xsl:if>
			<p><dt>ResourceID</dt><dd><xsl:value-of select="./*/sp:ResourceID" /></dd></p>
			<p><xsl:apply-templates select="./*/sp:ResourceHeader/sp:Description"></xsl:apply-templates></p>
		
		</div>
		</div>
		
		<div>
			<p class="right">
				<xsl:if test="name(..) = 'Package'"><a href="#top">top</a> | </xsl:if>
				<xsl:variable name="fileName">
					<xsl:call-template name="fileName">
						<xsl:with-param name="path" select="./*/sp:ResourceID" />
					</xsl:call-template>  
				</xsl:variable>				
				<a target="_blank" href="{$fileName}.xml">View XML</a> | <a target="_blank" href="{$fileName}.json">View JSON</a>
			</p>
	   <h1 class="detail">Details</h1>
		</div>
		
	<xsl:for-each select="*">
	   <xsl:choose>
			<xsl:when test="local-name() = 'Version'"> <!-- We skip this -->
			</xsl:when>
			<xsl:otherwise> <!-- All others -->
				<div class="product">
					<p class="version">Version:<xsl:value-of select="../sp:Version"/></p>

					<h1><xsl:value-of select="local-name()"/></h1>
					<xsl:apply-templates select="*"></xsl:apply-templates>
				</div>
			</xsl:otherwise>
	   </xsl:choose>			
    </xsl:for-each>
	</div>
</xsl:template>

<xsl:template match="*">
    <dl>		
	   <xsl:choose>
		<xsl:when test="*"> <!-- has children -->
		   <xsl:choose>
				<xsl:when test="local-name() = 'Parameter'"> <!-- Add count to tabel -->
					<dt class="parameter"><xsl:value-of select="local-name()"/> #<xsl:value-of select="1 + count(preceding-sibling::*[name() = name(current())])" /></dt>
				</xsl:when>
				<xsl:otherwise>	<!-- Show name/value -->
					<dt><xsl:value-of select="local-name()"/></dt>
				</xsl:otherwise>
			</xsl:choose>
			<dd>
				<xsl:apply-templates select="*"></xsl:apply-templates>
			</dd>
		</xsl:when>
		<xsl:otherwise>
		   <xsl:choose>
				<xsl:when test="'ID' = substring(local-name(), string-length(local-name()) - 1)"> <!-- Fix-up ID: Length of string is 1 more than than position count -->
				<!-- <xsl:when test="ends-with(local-name(), 'ID')"> --> <!-- set anchor -->
					<dt><xsl:value-of select="local-name()"/></dt><dd><a href="http://spase.info/{.}"><xsl:value-of select="."/></a></dd> 
				</xsl:when>
				<xsl:when test="'Date' = substring(local-name(), string-length(local-name()) - 3)"> <!-- Fix-up date:  Length of string is 1 more than than position count -->
				<!--- <xsl:when test="ends-with(local-name(), 'Date')"> --> <!-- Fix-up date -->
					<dt><xsl:value-of select="local-name()"/></dt><dd><xsl:value-of select="translate(., 'T', ' ')"/></dd>
				</xsl:when>
				<xsl:when test="local-name() = 'URL'"> <!-- Format link -->
					<dt><xsl:value-of select="local-name()"/></dt><dd><a target="_blank" href="{.}"><xsl:value-of select="."/></a></dd>
				</xsl:when>
				<xsl:otherwise>	<!-- Show name/value -->
					<dt><xsl:value-of select="local-name()"/></dt><dd><xsl:value-of select="."/></dd>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	   </xsl:choose>
    </dl>

</xsl:template>

<xsl:template match="sp:Contact">
	<xsl:if test="count(preceding-sibling::*[name() = name(current())]) = 0">
		<!-- Encode tags that are split by XSLT -->
		<dt><xsl:value-of select="local-name()"/>s</dt>
		<xsl:text disable-output-escaping="yes">&lt;dd&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;table class="nested" cellspacing="0"&gt;</xsl:text>
		<tr><th></th><th class="center">Role</th><th class="center">Person</th></tr>
		<xsl:text disable-output-escaping="yes">&lt;tbody&gt;</xsl:text>
	</xsl:if>
	<tr><td><xsl:value-of select="1 + count(preceding-sibling::*[name() = name(current())])" />.</td><td><xsl:value-of select="sp:Role"/></td><td><a target="_blank" href="http://spase.info/registry/render?id={sp:PersonID}"><xsl:value-of select="sp:PersonID"/></a></td></tr>
	<xsl:if test="count(following-sibling::*[name() = name(current())]) = 0">
		<xsl:text disable-output-escaping="yes">&lt;/tbody&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;/dd&gt;</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="sp:Keyword">
	<xsl:if test="count(preceding-sibling::*[name() = name(current())]) = 0">
		<dt><xsl:value-of select="local-name()"/>s</dt>
	</xsl:if>
	<dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="sp:ResourceID">
	<dt><xsl:value-of select="local-name()"/></dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="sp:InstrumentID">
	<xsl:if test="count(preceding-sibling::*[name() = name(current())]) = 0">
		<dt><xsl:value-of select="local-name()"/>s</dt>
	</xsl:if>
	<dd><a target="_blank" href="http://spase.info/registry/render?id={.}"><xsl:value-of select="."/></a></dd>
</xsl:template>

<xsl:template match="sp:PriorID">
	<xsl:if test="count(preceding-sibling::*[name() = name(current())]) = 0">
		<dt><xsl:value-of select="local-name()"/>s</dt>
	</xsl:if>
	<dd><xsl:value-of select="."/></dd>
</xsl:template>

<!-- Get the fileName portion of a path. 
Call with the following:
	<xsl:call-template name="fileName">
		<xsl:with-param name="path" select="YourValue" />
	</xsl:call-template>  
-->
<xsl:template name="fileName">
  <xsl:param name="path" />
  <xsl:choose>
    <xsl:when test="normalize-space(substring-after($path,'/'))">
      <xsl:call-template name="fileName">
        <xsl:with-param name="path" select="substring-after($path,'/')" />
      </xsl:call-template>  
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$path" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
