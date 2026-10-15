<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Nivel 4 - Resultado" />
<c:set var="arenaNivel" value="4" />
<c:set var="arenaCompletar" value="4" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 04 &middot; COMPLETADO</span>
      <h1>Veredicto del lenguaje</h1>
      <p>Analizado con <span class="text-cyan">&lt;c:choose&gt;</span>.</p>
    </div>

    <c:set var="lenguaje" value="${param.lenguaje}" />

    <div class="panel-mensaje ${empty lenguaje ? 'sin-seleccion' : ''}">
      <div class="pm-icon">
        <c:choose>
          <c:when test="${lenguaje == 'Java'}"><i class="bi bi-cup-hot-fill"></i></c:when>
          <c:when test="${lenguaje == 'C++'}"><i class="bi bi-gear-wide-connected"></i></c:when>
          <c:when test="${lenguaje == 'Perl'}"><i class="bi bi-terminal-fill"></i></c:when>
          <c:otherwise><i class="bi bi-question-lg"></i></c:otherwise>
        </c:choose>
      </div>
      <div>
        <p class="pm-lenguaje">
          <c:choose>
            <c:when test="${empty lenguaje}">Sin selecci&oacute;n</c:when>
            <c:otherwise><c:out value="${lenguaje}" /></c:otherwise>
          </c:choose>
        </p>
        <p class="pm-titulo">
          <c:choose>
            <c:when test="${lenguaje == 'Java'}">El rey de los lenguajes orientados a objetos</c:when>
            <c:when test="${lenguaje == 'C++'}">Ideal para aprender</c:when>
            <c:when test="${lenguaje == 'Perl'}">Lenguaje de scripting muy potente</c:when>
            <c:otherwise>No se seleccion&oacute; ninguno</c:otherwise>
          </c:choose>
        </p>
      </div>
    </div>

    <div class="acciones mt-arena">
      <a class="btn-neon" href="${ctx}/ejercicios/5/index.jsp">Siguiente nivel <i class="bi bi-arrow-right"></i></a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/ejercicios/4/index.jsp"><i class="bi bi-arrow-repeat"></i> Repetir</a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
    </div>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
