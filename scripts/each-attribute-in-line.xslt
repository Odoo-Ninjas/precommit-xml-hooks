<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="no"/>

  <!-- Match any element -->
  <xsl:template match="*">
    <xsl:text>&#10;</xsl:text>
    <xsl:element name="{name()}">
      <!-- Put each attribute on its own line -->
      <xsl:for-each select="@*">
        <xsl:text>&#10;  </xsl:text>
        <xsl:attribute name="{name()}">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
      <!-- Process children -->
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>

  <!-- Copy text, comments, etc. -->
  <xsl:template match="@*|text()|comment()|processing-instruction()">
    <xsl:copy/>
  </xsl:template>
</xsl:stylesheet>