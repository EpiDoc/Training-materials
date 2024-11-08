<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id$ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:t="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="t"  version="2.0">

   <xsl:template match="t:unclear">
       <xsl:param name="parm-edition-type" tunnel="yes" required="no"></xsl:param>
       <xsl:param name="parm-leiden-style" tunnel="yes" required="no"></xsl:param>
       <xsl:param name="text-content">
         <xsl:choose>
            <xsl:when test="ancestor::t:orig[not(ancestor::t:choice)]">
               <xsl:value-of select="upper-case(translate(normalize-unicode(translate(.,'&#x03f2;','&#x03f9;'),'NFD'),
                  '&#x0300;&#x0301;&#x0308;&#x0313;&#x0314;&#x0342;&#x0345;',''))"/>
            </xsl:when>
            <xsl:when test="ancestor::t:hi[@rend='apex']">
               <xsl:value-of select="translate(., 'aeiou', 'áéíóú')"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:param>

      <xsl:choose>
          <xsl:when test="$parm-leiden-style=('edh-names','edh-itx')">
            <xsl:apply-templates/>
         </xsl:when>
          <xsl:when test="$parm-edition-type = 'diplomatic'">
            <!-- Calculates the number of middots to output -->
            <xsl:variable name="un-len-all">
               <!-- collects all children text together -->
               <xsl:variable name="un-len-text">
                  <xsl:for-each select="text()">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </xsl:variable>
               <!-- Outputs one character per child <g> -->
               <xsl:variable name="un-len-g">
                  <xsl:for-each select="t:g">
                     <xsl:text>a</xsl:text>
                  </xsl:for-each>
               </xsl:variable>
               <xsl:value-of select="string-length($un-len-text) + string-length($un-len-g)"/>
            </xsl:variable>
            
            <xsl:for-each select="1 to $un-len-all">
               <xsl:choose>
                  <xsl:when test="$parm-leiden-style='medcyprus'">
                     <xsl:text>.</xsl:text>
                  </xsl:when>
                  <xsl:when test="$parm-leiden-style='london'">
                     <xsl:text>·</xsl:text>
                  </xsl:when>
                  <xsl:when test="$parm-leiden-style=('ddbdp','dclp','sammelbuch')">
                     <xsl:text>&#xa0;&#xa0;&#x0323;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:text>.</xsl:text>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:for-each>
            
         </xsl:when>
         <xsl:otherwise>
            <xsl:choose>
               <xsl:when test="t:g">
                  <xsl:apply-templates/>
                  <!-- templates (including tests for parent::unclear) are in teig.xsl -->
               </xsl:when>
               <xsl:otherwise>
                  <xsl:variable name="text" select="normalize-space($text-content)"/>
                  <xsl:for-each select="1 to string-length()">
                     <xsl:value-of select="concat(substring($text,.,1),'&#x0323;')"/>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

</xsl:stylesheet>
