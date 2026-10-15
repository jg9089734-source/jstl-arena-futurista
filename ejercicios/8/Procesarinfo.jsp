<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8" />

<%@ include file="/WEB-INF/jspf/conexion.jspf" %>

<c:catch var="dbError">
  <sql:update dataSource="${empleados}" var="filasAfectadas">
    INSERT INTO empleados (nombres, apellido1, apellido2, edad)
    VALUES (?, ?, ?, ?)
    <sql:param value="${param.nombres}" />
    <sql:param value="${param.apellido1}" />
    <sql:param value="${param.apellido2}" />
    <sql:param value="${param.edad}" />
  </sql:update>

  <sql:query dataSource="${empleados}" var="result">
    SELECT id, nombres, apellido1, apellido2, edad FROM empleados ORDER BY id
  </sql:query>
</c:catch>

<c:if test="${empty dbError}">
  <c:set var="arenaCompletar" value="8" />
</c:if>

<c:set var="arenaTitulo" value="Nivel 8 - Resultado" />
<c:set var="arenaNivel" value="8" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 08</span>
      <h1>Registros en la base de datos</h1>
      <p>Tabla <span class="text-cyan">empleados</span> de la base de datos MySQL.</p>
    </div>

    <c:choose>
      <c:when test="${not empty dbError}">
        <div class="alerta-error" role="alert">
          <i class="bi bi-database-fill-exclamation ae-icon"></i>
          <div>
            <strong>No se pudo conectar a la base de datos.</strong><br>
            <c:out value="${dbError}" />
          </div>
        </div>
        <p class="mt-3 text-cyan">
          <i class="bi bi-info-circle"></i>
          Verifica que la base de datos <code>empleados</code> exista y que MySQL est&eacute; activo.
        </p>
      </c:when>
      <c:otherwise>
        <div class="dato mb-3">
          <span class="dato-key">Filas insertadas</span>
          <span class="dato-val"><c:out value="${filasAfectadas}" /></span>
        </div>

        <div class="leaderboard">
          <table class="leaderboard">
            <thead>
              <tr>
                <th>Id</th>
                <th>Nombres</th>
                <th>Primer apellido</th>
                <th>Segundo apellido</th>
                <th>Edad</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="fila" items="${result.rows}" varStatus="st">
                <tr class="${st.last ? 'fila-nueva' : ''}">
                  <td><span class="rank-badge"><c:out value="${fila.id}" /></span></td>
                  <td><c:out value="${fila.nombres}" /></td>
                  <td><c:out value="${fila.apellido1}" /></td>
                  <td><c:out value="${fila.apellido2}" /></td>
                  <td><c:out value="${fila.edad}" /></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>

        <p class="mt-3 text-cyan">
          <i class="bi bi-trophy-fill"></i>
          Total de registros: <b><c:out value="${result.rowCount}" /></b>
        </p>
      </c:otherwise>
    </c:choose>

    <div class="acciones mt-arena">
      <a class="btn-neon btn-neon-ghost" href="${ctx}/ejercicios/8/index.jsp"><i class="bi bi-arrow-repeat"></i> Insertar otro</a>
      <a class="btn-neon" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Volver al inicio</a>
    </div>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
