<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Nivel 2 - Resultado" />
<c:set var="arenaNivel" value="2" />
<c:set var="arenaCompletar" value="2" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 02 &middot; COMPLETADO</span>
      <h1>Imprimiendo par&aacute;metros con JSTL</h1>
      <p>Datos recibidos desde el formulario.</p>
    </div>

    <c:set var="nombre" value="${param.nombre}" />
    <c:set var="apellido1" value="${param.apellido1}" />
    <c:set var="apellido2" value="${param.apellido2}" />

    <div class="player-card glass">
      <div class="player-avatar"><i class="bi bi-person-badge-fill"></i></div>
      <div class="player-data">
        <div class="dato">
          <span class="dato-key">Nombre</span>
          <span class="dato-val"><c:out value="${nombre}" /></span>
        </div>
        <div class="dato">
          <span class="dato-key">Primer apellido</span>
          <span class="dato-val"><c:out value="${apellido1}" /></span>
        </div>
        <div class="dato">
          <span class="dato-key">Segundo apellido</span>
          <span class="dato-val"><c:out value="${apellido2}" /></span>
        </div>
      </div>
    </div>

    <div class="acciones mt-arena">
      <a class="btn-neon" href="${ctx}/ejercicios/3/index.jsp">Siguiente nivel <i class="bi bi-arrow-right"></i></a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/ejercicios/2/index.jsp"><i class="bi bi-arrow-repeat"></i> Repetir</a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
    </div>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
