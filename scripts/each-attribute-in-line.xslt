<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" />

  <!-- Template for any element -->
  <xsl:template match="*">
    <xsl:text>&#10;</xsl:text>
    <!-- Start the element -->
    <xsl:text>&lt;</xsl:text>
    <xsl:value-of select="name()"/>

    <!-- Print each attribute on a new line -->
    <xsl:for-each select="@*">
      <xsl:text>&#10;  </xsl:text>
      <xsl:value-of select="name()"/>
      <xsl:text>="</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>"</xsl:text>
    </xsl:for-each>

    <!-- Check if the element has child nodes -->
    <xsl:choose>
      <xsl:when test="not(node())">
        <!-- Self-closing tag -->
        <xsl:text>/&gt;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <!-- Closing start tag -->
        <xsl:text>&gt;</xsl:text>
        <!-- Process child nodes -->
        <xsl:apply-templates select="node()"/>
        <!-- End tag -->
        <xsl:text>&#10;&lt;/</xsl:text>
        <xsl:value-of select="name()"/>
        <xsl:text>&gt;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Identity template for non-element nodes (text, comments, etc.) -->
  <xsl:template match="@*|text()|comment()|processing-instruction()">
    <xsl:copy/>
  </xsl:template>
</xsl:stylesheet>