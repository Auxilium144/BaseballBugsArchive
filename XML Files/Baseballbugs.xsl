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
                <link href="css/BBBCSS.css" rel="stylesheet"/>
                
            </head>
            <body>
                <!-- 
                <xsl:call-template name="ParagraphCounter"/>
                 -->
                <xsl:apply-templates/>
                <!-- Try using an XPath selection on apply-templates. -->
                <!-- 
                <p>****THIS POEM CONTAINS <xsl:value-of select="count(//l)"/> LINES****</p>
                 -->
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="l">
        
        <xsl:apply-templates/>
        <br/>
        
    </xsl:template>
   
    <xsl:attribute-set name="myBorder">
        <xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template match="div[@type='joke']">
        <div class="joke" style="margin-left:200px; margin-right:200px;text-align:left;">
            <br/>
            <xsl:apply-templates/>
            <br/>
        </div>
    </xsl:template>    
   
    <xsl:template match="div[@type='poem']">
        <!--<div style="border: solid black;">-->
        <div class="poem" style="margin-left:200px; margin-right:200px;text-align:left;">
            <br/>
            <xsl:apply-templates/>
        </div>
  
    </xsl:template>
    
    <xsl:template match="div[@type='comic']">
        <div class="comic" style="margin-left:200px; margin-right:200px;text-align:left;">
            
            <br/>
            <xsl:apply-templates/>
            
        </div>
    </xsl:template>
    
   
    
<!--    <xsl:template match="div[@type='poem']">
        <div class="divborders"/>
        <xsl:apply-templates/>
    </xsl:template>-->
    
    <xsl:template match="teiHeader">
        <br/>
        <xsl:apply-templates/>
              
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
       <div style="margin-left:200px; margin-right:200px;text-align:left;">
        <xsl:apply-templates/>
       </div>
    </xsl:template>
    
    <xsl:template match="fileDesc">
        <div style="margin-left:200px; margin-right:200px;text-align:left;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="revisionDesc">
        <div style="margin-left:200px; margin-right:200px;text-align:center;">
            <br/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="sourceDesc">
        <div style="margin-left:200px; margin-right:200px;text-align:center;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="notesStmt">
        <div style="margin-left:200px; margin-right:200px;text-align:center;">
            <br/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="titleStmt">
        <div style="margin-left:200px; margin-right:200px;text-align:center;">
            
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="editionStmt">
        <div style="margin-left:200px; margin-right:200px;text-align:Center;">
            <br/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="publicationStmt">
        <div style="margin-left:200px; margin-right:200px;text-align:Center;">
            <br/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="lg">
        
        
        <div style="text-align: center;">
            <xsl:apply-templates/>                        
        </div>                   
    </xsl:template>
    
    <xsl:template match="milestone">
        <xsl:choose>
            <xsl:when test="contains(@unit, 'line')">
                <br/>
                <center>
                <p>&#9473;&#9473;&#9473;&#9473;&#9473;&#9473;&#9473;</p>
                </center>
                <!--     <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('resized_photos40/','milestone.jpg')"/>
                    </xsl:attribute>
                </xsl:element>  -->  

            </xsl:when>

        </xsl:choose>

    </xsl:template>
    
<!-- 
    <xsl:template name="ParagraphCounter">
        <p>
            THIS is a book.  It has <xsl:value-of select="count(//p)"/> paragraphs
        </p>
    </xsl:template>
 -->
    
  
    <xsl:template match="pb">
        
        <br/>
        
    </xsl:template>
    
    <xsl:template match="figure">
        <!-- This is a way to point directly to the file 
        <img src="shun.gif"/>      -->
        
        <!-- This is a way to do dynamic output elements -->
        <br/>
        <center>

        <xsl:apply-templates/>
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="concat('resized_photos40/',@facs)"/>
            </xsl:attribute>
           
           
        </xsl:element>    
        </center>
            <br/>
        

    </xsl:template>
    
    <xsl:template match="caption">
        
        <div style="text-align:center; margin-left:200px;margin-right:200px;">
            <p><strong>Caption: </strong><xsl:apply-templates/></p>
        </div>
    </xsl:template>
    
    <xsl:template match="head">
        <center>   
        <p><strong>Title: </strong><xsl:apply-templates/></p>
        </center>
    </xsl:template>
    
    
    
    <xsl:template match="note[@type='editorial']">
        <span class="ednote">&#10086;
        <span class="ednotetext">
            <xsl:apply-templates/>
        </span></span>
    </xsl:template>
    
    
</xsl:stylesheet>