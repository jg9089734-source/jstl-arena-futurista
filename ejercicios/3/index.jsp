<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Nivel 3 - Validacion de acceso" />
<c:set var="arenaNivel" value="3" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 03</span>
      <h1>Validaci&oacute;n de acceso</h1>
      <p>Campos obligatorios con <span class="text-cyan">&lt;c:if&gt;</span> y
        <span class="text-cyan">&lt;c:redirect&gt;</span>.</p>
    </div>

    <c:if test="${not empty param.error}">
      <div class="alerta-error mb-4" role="alert">
        <i class="bi bi-exclamation-triangle-fill ae-icon"></i>
        <span><c:out value="${param.error}" /></span>
      </div>
    </c:if>

    <form class="form-neon row g-3" action="${ctx}/ejercicios/3/Procesarif.jsp" method="post">
      <div class="col-md-6">
        <label class="form-label" for="nombre">Nombre <span class="text-magenta">*</span></label>
        <input class="form-control" type="text" id="nombre" name="nombre" placeholder="Juanita">
      </div>
      <div class="col-md-6">
        <label class="form-label" for="apellido1">Primer apellido <span class="text-magenta">*</span></label>
        <input class="form-control" type="text" id="apellido1" name="apellido1" placeholder="Tamayo">
      </div>
      <div class="col-12 acciones">
        <button class="btn-neon" type="submit"><i class="bi bi-shield-check"></i> Validar y entrar</button>
        <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
      </div>
    </form>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
