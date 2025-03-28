<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="*">
    <xsl:text>&#10;</xsl:text>
    <xsl:text><</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:for-each select="@*">
      <xsl:text>&#10;  </xsl:text>
      <xsl:value-of select="name()"/>
      <xsl:text>="</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>"</xsl:text>
    </xsl:for-each>
    <xsl:choose>
      <xsl:when test="count(child::node()) = 0">
        <xsl:text>/></xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>></xsl:text>
        <xsl:apply-templates select="node()"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text></</xsl:text>
        <xsl:value-of select="name()"/>
        <xsl:text>></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="text() | comment() | processing-instruction()">
    <xsl:copy/>
  </xsl:template>
</xsl:stylesheet>