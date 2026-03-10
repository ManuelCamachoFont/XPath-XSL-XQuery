<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="iso-8859-1" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Catálogo</title>
			</head>
			<body>
				<catalogo>
					<h1>Catálogo de libros</h1>
					<table border="1">
						<tr>
							<th>ID</th>
							<th>TÍTULO</th>
							<th>AUTOR</th>
							<th>GÉNERO</th>
							<th>PRECIO</th>
							<th>PUBLICACIÓN</th>
						</tr>
						<xsl:for-each select="catalogo/libro">
							<xsl:sort select="precio" order="ascending"/>
							<tr>
								<td>
									<xsl:value-of select="@id"/>
								</td>
								<td>
									<xsl:value-of select="titulo"/>
									<xsl:if test="titulo = '1984'">(Sin censura)</xsl:if>
								</td>
								<td>
									<xsl:value-of select="autor"/>
								</td>
								<td>
									<xsl:value-of select="genero"/>
								</td>
								<td>
									<span>
										<xsl:attribute name="style">color:<xsl:choose>
												<xsl:when test="precio &lt; 13">green</xsl:when>
												<xsl:otherwise>red</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<xsl:value-of select=" precio"/>
									</span>
								</td>
								<td>
									<xsl:value-of select="fecha_publicacion"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<footer>
						<p>Manuel Camacho Font</p>
						<p>Copyright <xsl:text>&#169;</xsl:text> 2026, todos los derechos reservados</p>
					</footer>
				</catalogo>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
