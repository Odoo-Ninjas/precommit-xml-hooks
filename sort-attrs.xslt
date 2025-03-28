<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>
  
  <xsl:template match="*">
    <xsl:copy>
      <!-- Sort attributes alphabetically -->
      <xsl:for-each select="@*">
        <xsl:sort select="name()"/>
        <xsl:copy/>
      </xsl:for-each>
      <!-- Process child nodes -->
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Copy text, comments, etc. as-is -->
  <xsl:template match="@*|text()|comment()|processing-instruction()">
    <xsl:copy/>
  </xsl:template>
</xsl:stylesheet>