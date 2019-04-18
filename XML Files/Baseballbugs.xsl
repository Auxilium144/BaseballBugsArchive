<?xml version="1.0" encoding="UTF-8"?>
<!--The line above is a processing instruction telling the computer that this is an XML file.-->
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <!--What is this element? What are each of the four attributes doing? -->
    <xsl:output method="xhtml" indent="yes" encoding="utf-8"/>
    <!-- This line is saying that the output file will be xhtml and that the lines will wrap for easier reading -->
    
    <!-- FRAMEWORK TEMPLATE. THIS ORGANIZES THE BASIC STRUCTURE 
    OF THE OUTPUT DOCUMENT. IT IS GOING TO INSERT CONTENT INTO BASIC STRUCTURAL
    TAGS AND INDICATE WHERE MOST PULLED/REARRANGED INFORMATION SHOULD GO.-->
    
    <xsl:template match="/">
        <html>
            <head>
                <!-- Eventually we will put the reference to the CSS file here -->
            </head>
            <body>
                <xsl:call-template name="ParagraphCounter"/>
                <xsl:apply-templates/>
                <!-- Try using an XPath selection on apply-templates. -->
                <p>****THIS POEM CONTAINS <xsl:value-of select="count(//l)"/> LINES****</p>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="l">
        
        <xsl:apply-templates/>
        <br/>
        
    </xsl:template>
    
    <xsl:template match="div">
        <div>
            <!--    
        <xsl:value-of select="poem"/> 
        This is how you select the value within div--> 
            <strong>
                
                <xsl:apply-templates/>
            </strong>
        </div>
    </xsl:template>
    
    <xsl:template match="teiHeader">
        <br/>
        <xsl:apply-templates/>
        <br/>        
    </xsl:template>
    
    <xsl:template match="head[@type='chapter']">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    <xsl:template match="note">
        <br/>
        <xsl:apply-templates/>
        <br/>        
    </xsl:template>    
    
    <xsl:template match="p">
        
        <xsl:apply-templates/>
        <br/>
        <br/>
        <br/>
        <p>We've added in another paragraph here because I wanted to.</p>
        <br/>
        <br/>        
    </xsl:template>
    
    <xsl:template match="lg">
        
        <p>
            <xsl:apply-templates/>                        
        </p>
        
    </xsl:template>
    
    <xsl:template match="milestone">
        <xsl:choose>
            <xsl:when test="contains(@unit, 'flourish')">
                <br/>
                <img src="shun.gif"/>
                <br/>
            </xsl:when>
            <xsl:when test="contains(@unit, 'dash')">
                <br/>
                <img src="jumpy.gif"/>
                <br/>
            </xsl:when>
            <xsl:otherwise>
                <h1>OTHERWISE</h1>
            </xsl:otherwise>
        </xsl:choose>
        
        
        <!--        <br/>
        <p>
        -\-\-\-\-\-\-\-\-\-
        </p>
        <br/>-->
    </xsl:template>
    
    
    <xsl:template name="ParagraphCounter">
        <p>
            THIS is a book.  It has <xsl:value-of select="count(//p)"/> paragraphs
        </p>
    </xsl:template>
    
    <xsl:template match="pb">
        <!-- This is a way to point directly to the file 
        <img src="shun.gif"/>      -->
        
        <!-- This is a way to do dynamic output elements -->
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="width">
                <xsl:value-of select="'300'"/>
            </xsl:attribute>
        </xsl:element>            
    </xsl:template>
    <!--  -->
    
    
    
    
</xsl:stylesheet>