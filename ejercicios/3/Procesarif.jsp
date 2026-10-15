<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />

<%-- Validacion: si falta un campo obligatorio, redirige con mensaje de error --%>
<c:if test="${empty param.nombre}">
  <c:redirect url="/ejercicios/3/index.jsp">
    <c:param name="error" value="Nombre obligatorio" />
  </c:redirect>
</c:if>

<c:if test="${empty param.apellido1}">
  <c:redirect url="/ejercicios/3/index.jsp">
    <c:param name="error" value="Primer apellido obligatorio" />
  </c:redirect>
</c:if>

<c:set var="arenaTitulo" value="Nivel 3 - Resultado" />
<c:set var="arenaNivel" value="3" />
<c:set var="arenaCompletar" value="3" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 03 &middot; COMPLETADO</span>
      <h1>Acceso concedido</h1>
      <p>Todos los campos obligatorios est&aacute;n completos.</p>
    </div>

    <div class="player-card glass">
      <div class="player-avatar"><i class="bi bi-person-check-fill"></i></div>
      <div class="player-data">
        <div class="dato">
          <span class="dato-key">Nombre</span>
          <span class="dato-val"><c:out value="${param.nombre}" /></span>
        </div>
        <div class="dato">
          <span class="dato-key">Primer apellido</span>
          <span class="dato-val"><c:out value="${param.apellido1}" /></span>
        </div>
      </div>
    </div>

    <div class="acciones mt-arena">
      <a class="btn-neon" href="${ctx}/ejercicios/4/index.jsp">Siguiente nivel <i class="bi bi-arrow-right"></i></a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/ejercicios/3/index.jsp"><i class="bi bi-arrow-repeat"></i> Repetir</a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
    </div>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
