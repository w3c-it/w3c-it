<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output doctype-system= "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" indent="yes" method="html"/>

<xsl:template match="pagina">
<html>
<xsl:apply-templates/>
</html>
</xsl:template>

<xsl:template match="head">
<head>
  <title>
    <xsl:value-of select="title"/>
  </title>
  <link rel="stylesheet" href="stile.css" type="text/css" />
</head>
</xsl:template>

<xsl:template match="body">
<body>
  <xsl:apply-templates/>
  <table width="100%"> 
  <tr> 
    <td valign="top" width="67%" height="30"></td>
    <td valign="top" width="33%" height="30"> 
      <div align="right">
      <a href="c_scavo.htm" onmouseout="MM_swapImgRestore()"
        onmouseover="MM_swapImage('Image3','','rollovers/back_on.jpg',1)"
        target="_self"><img name="Image3" alt="back" border="0"
        src="rollovers/back_off.jpg" width="120" height="54" /></a></div>
    </td>
  </tr>
</table>
</body>
</xsl:template>

<xsl:template match="immagineIntestazione">
<p>
<img src="{src}" alt="{alt}" />
</p>
</xsl:template>


<xsl:template match="immagine">
  <xsl:choose>
    <xsl:when test="@align!=''">
      <img src="{src}" alt="{alt}" width="{@width}" height="{@height}"
    align="{@align}" />
    </xsl:when>
    <xsl:otherwise>
      <img src="{src}" alt="{alt}" width="{@width}" height="{@height}" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="notizia">
  <xsl:choose>
    <xsl:when test="@lang='en'"/>
    <xsl:otherwise>
      <span id="{@id}">
        <xsl:apply-templates/>
      </span>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="notizia/titolo">
  <xsl:choose>
    <xsl:when test="@align!=''">
      <p class="titoletto" align="{@align}">
        <xsl:value-of select="."/>
      </p>
    </xsl:when>
    <xsl:otherwise>
      <p class="titoletto">
        <xsl:value-of select="."/>
      </p>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="notizia/corpo">
  <xsl:choose>
    <xsl:when test="@align!=''">
     <p class="corpo" align="{@align}">
        <br>
	</br>
        <xsl:apply-templates/>
     </p> 
    </xsl:when>
    <xsl:otherwise>
      <p class="corpo">
        <br />
        <xsl:apply-templates/>
      </p>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="notizia/corpo/testo">
    <xsl:value-of select="."/>
    <br />
</xsl:template>

<xsl:template match="bibliografia">
  <p class="titoletto">Bibliografia</p>
  <p class="corpo">
    <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="bibliografia/titolo">
  <xsl:value-of select="."/>
  <br />
</xsl:template>

<xsl:template match="bibliografia/riferimento">
  <xsl:apply-templates/>
  <br />
</xsl:template>

<xsl:template match="autore">
  <span class="autore"><xsl:value-of select="."/></span>,
</xsl:template>

<xsl:template match="sezione">
  <i><xsl:value-of select="."/></i>,
</xsl:template>

<xsl:template match="libro">
  <i><xsl:value-of select="."/></i>
</xsl:template>

<xsl:template match="luogoPubblicazione">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="dataPubblicazione">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="pagine">
  <xsl:value-of select="."/>
</xsl:template>

</xsl:stylesheet>
