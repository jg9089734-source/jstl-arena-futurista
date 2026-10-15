<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Nivel 6 - Bucle de reloj" />
<c:set var="arenaNivel" value="6" />
<c:set var="arenaCompletar" value="6" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 06 &middot; COMPLETADO</span>
      <h1>Bucle de reloj</h1>
      <p><span class="text-cyan">&lt;c:forEach&gt;</span> con
        <span class="text-cyan">begin="1"</span>,
        <span class="text-cyan">end="24"</span>,
        <span class="text-cyan">step="2"</span> y
        <span class="text-cyan">varStatus</span>.</p>
    </div>

    <div class="chips mb-4">
      <c:forEach begin="1" end="24" step="2" var="hour" varStatus="status">
        <span class="chip ${status.first or status.count == 5 ? 'hito' : ''}">
          <span class="chip-badge"><c:out value="${status.count}" /></span>
          <c:out value="${hour}" />
          <c:if test="${status.first}"><i class="bi bi-star-fill text-ok"></i></c:if>
        </span>
      </c:forEach>
    </div>

    <c:forEach begin="1" end="24" step="2" var="hour" varStatus="status">
      <c:if test="${status.first}">
        <div class="panel-mensaje mb-3">
          <div class="pm-icon"><i class="bi bi-1-circle-fill"></i></div>
          <p class="pm-titulo">Estoy en uno &mdash; primera iteraci&oacute;n (hour = <c:out value="${hour}" />)</p>
        </div>
      </c:if>
      <c:if test="${status.count == 5}">
        <div class="panel-mensaje">
          <div class="pm-icon"><i class="bi bi-5-circle-fill"></i></div>
          <p class="pm-titulo">Estoy en la iteraci&oacute;n n&uacute;mero 5 (hour = <c:out value="${hour}" />)</p>
        </div>
      </c:if>
    </c:forEach>

    <div class="acciones mt-arena">
      <a class="btn-neon" href="${ctx}/ejercicios/7/index.jsp">Siguiente nivel <i class="bi bi-arrow-right"></i></a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
    </div>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
