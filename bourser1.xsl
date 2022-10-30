<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Bourse</title>
            </head>
            <body>
                <xsl:for-each select="/bourse/societe[@type='banque']">
                    <ul>
                        <li>Code : <xsl:value-of select="code"></xsl:value-of></li>
                        <li>Nom : <xsl:value-of select="nom"></xsl:value-of></li>
                    </ul>
                    <table border="1" width="90%">
                        <tr>
                            <th>Num</th><th>Date</th><th>Val Action</th>
                        </tr>
                        <xsl:for-each select="cotations/cotation">
                            <tr>
                              <td><xsl:value-of select="@num"></xsl:value-of></td>
                              <td><xsl:value-of select="@date"></xsl:value-of></td>
                              <td><xsl:value-of select="@valAction"></xsl:value-of></td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <th colspan="2">Moyenne des cotation</th>
                            <th><xsl:value-of select="avg(cotations/cotation/@valAction)"></xsl:value-of></th>
                        </tr>
                    </table>
                </xsl:for-each>
                <ul>
                    <li>Nombre de sociétés : <xsl:value-of select="count(bourse/societe)"></xsl:value-of></li>
                    <li>Nombre de sociétés de type banque : <xsl:value-of select="count(bourse/societe[@type='banque'])"></xsl:value-of></li>
                    <li>Nombre de sociétés de type assurance : <xsl:value-of select="count(bourse/societe[@type='assurance'])"></xsl:value-of></li>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>