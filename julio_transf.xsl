<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes" />
   
    <xsl:template match="/">
        <html>
        <head>
            <title>Test XSLT</title>
        </head>
        <body>
            <h1>Transformation xml to html</h1>
            <br></br>
            <h2>Test 1 fonction value-of</h2>
            <p>Type du numéro : <xsl:value-of select="repertoire/personne[nom='DOE']/telephones/telephone/@type">
                </xsl:value-of>
            </p>
            <p>Numéro : <xsl:value-of select="repertoire/personne[nom='POPPINS']/telephones/telephone">
                </xsl:value-of>
            </p>
            <br></br>
            <h2>Test 2 fonction for-each</h2>
            <xsl:for-each select="repertoire/personne[nom='DOE']/emails/email">
                <p>Type adresse mail : <xsl:value-of select="@type"></xsl:value-of></p>
                <p>Adresse e-mail : <xsl:value-of select="."></xsl:value-of></p>
            </xsl:for-each>
            <br></br>
            <h2>Test Tri des noms et prenoms personnes dans la liste </h2>
            <xsl:for-each select="repertoire/personne">
                <xsl:sort select="nom"></xsl:sort>
                <xsl:sort select="prenom"></xsl:sort>
                <p><xsl:value-of select="nom"></xsl:value-of>&#160;<xsl:value-of select="prenom"></xsl:value-of></p>
            </xsl:for-each>
            <br></br>
            <h2>Test des nom et prénoms des personns de sexe masculin</h2>
            <xsl:for-each select="repertoire/personne">
                <xsl:if test="@sexe='masculin'">
                <p><xsl:value-of select="nom"></xsl:value-of>&#160;<xsl:value-of select="prenom"></xsl:value-of></p>
                </xsl:if>
            </xsl:for-each>
            <br></br>
            <h2>Test choose</h2>
            <xsl:for-each select="repertoire/personne">
                <xsl:choose>
                    <xsl:when test="nom = 'DOE'">
                        <p>Bonjour John :)</p>
                    </xsl:when>
                    <xsl:when test="nom = 'POPPINS'">
                        <p>Quel beau sac !!!</p>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>Qui êtes-vous ?</p>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <br></br>
            <h2>Test de apply-templates</h2>
            <xsl:apply-templates select="repertoire/personne[nom='POPPINS']/nom"></xsl:apply-templates>
            
            <!--- FIN du HTML-->
        </body>
        </html>   
    </xsl:template>
    
    <xsl:template match="nom">
        <p><xsl:value-of select="."></xsl:value-of></p>
    </xsl:template>
    
    <xsl:template match="prenom">
        <p><xsl:value-of select="."></xsl:value-of></p>
    </xsl:template>
        
</xsl:stylesheet>

