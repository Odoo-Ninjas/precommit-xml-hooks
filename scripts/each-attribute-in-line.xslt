<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <!-- Match any element -->
  <xsl:template match="*">
    <xsl:text>&#10;</xsl:text>
    <!-- Open the element -->
    <xsl:text>&lt;</xsl:text>
    <xsl:value-of select="name()"/>

    <!-- Add attributes, each on a new line -->
    <xsl:for-each select="@*">
      <xsl:text>&#10;  </xsl:text>
      <xsl:value-of select="name()"/>
      <xsl:text>="</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>"</xsl:text>
    </xsl:for-each>

    <!-- Handle empty or non-empty element -->
    <xsl:choose>
      <xsl:when test="not(node())">
        <xsl:text>/&gt;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>&gt;</xsl:text>
        <xsl:apply-templates select="node()"/>
        <xsl:text>&#10;&lt;/</xsl:text>
        <xsl:value-of select="name()"/>
        <xsl:text>&gt;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Copy text, comments, etc. -->
  <xsl:template match="@*|text()|comment()|processing-instruction()">
    <xsl:copy/>
  </xsl:template>
</xsl:stylesheet>