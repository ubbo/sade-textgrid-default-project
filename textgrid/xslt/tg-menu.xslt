<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tgmenu="http://tgmenu" exclude-result-prefixes="xs tgmenu" 
version="2.0">
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>
    <xsl:function name="tgmenu:setImage">
        <xsl:param name="type"/>
        <xsl:choose>
            <xsl:when test="$type = 'collection'">/exist/rest/sade-projects/textgrid/templates/bootstrap3/resources/img/Collection.gif</xsl:when>
            <xsl:when test="$type = 'edition'">/exist/rest/sade-projects/textgrid/templates/bootstrap3/resources/img/Edition.gif</xsl:when>
            <xsl:when test="$type = 'aggregation'">/exist/rest/sade-projects/textgrid/templates/bootstrap3/resources/img/Aggregation.gif</xsl:when>
            <xsl:when test="$type = 'text/linkeditorlinkedfile'">/exist/rest/sade-projects/textgrid/templates/bootstrap3/resources/img/TILE.png</xsl:when>
            <xsl:when test="$type = 'text/xml'">/exist/rest/sade-projects/textgrid/templates/bootstrap3/resources/img/TEI.gif</xsl:when>
            <xsl:when test="starts-with($type,'image')">/exist/rest/sade-projects/textgrid/templates/bootstrap3/resources/img/Image.gif</xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="object">
        <li>
            <a>
                <xsl:attribute name="href">
                    <xsl:choose>
                        <xsl:when test="@type = 'text/xml'">index.html?id=/xml/data/<xsl:value-of select="substring-after(@uri, ':')"/>.xml</xsl:when>
                        <xsl:when test="@type = 'text/linkeditorlinkedfile'">index.html?id=/xml/tile/<xsl:value-of select="substring-after(@uri, ':')"/>.xml</xsl:when>
                        <xsl:when test="starts-with(@type,'image')">/exist/apps/textgrid-connect/digilib/textgrid/<xsl:value-of select="@uri"/>?dw=1000</xsl:when>
                    </xsl:choose>
                </xsl:attribute>
                <img src="{tgmenu:setImage(@type)}" alt="icon" style="padding-right:5px;"/>
                <xsl:value-of select="@title"/>
            </a>
        </li>
    </xsl:template>
    <xsl:template match="agg">
        <li>
            <label class="tree-toggle nav-header">
                <img src="{tgmenu:setImage(@type)}" alt="icon" style="padding-right:5px;"/>
                <xsl:value-of select="@title"/>
            </label>
            <ul class="nav nav-list tree">
                <xsl:apply-templates select="@*|node()"/>
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="navigation">
        <div class="row">
            <div class="span3">
                <div class="well">
                    <div id="nav-textgrid">
                        <ul class="nav nav-list">
                            <li>
                                <label class="tree-toggle nav-header">
                                    <a href="index.html">
                                        <img src="/exist/rest/sade-projects/textgrid/templates/bootstrap3/resources/img/Welcome.gif" alt="icon" style="padding-right:5px;"/>Home</a>
                                </label>
                            </li>
                            <li class="divider"/>
                            <xsl:apply-templates select="@*|node()"/>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="@uri|@type|@title"/>
</xsl:stylesheet>
