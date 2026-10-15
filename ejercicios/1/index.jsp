<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Nivel 1 - La primera salida" />
<c:set var="arenaNivel" value="1" />
<c:set var="arenaCompletar" value="1" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">

    <div class="acciones mb-3">
      <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp">
        <i class="bi bi-house-door-fill"></i> Volver al inicio
      </a>
    </div>

    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 01</span>
      <h1>La primera salida</h1>
      <p>El tag <span class="text-cyan">&lt;c:out&gt;</span> escapa el contenido y eval&uacute;a expresiones EL.</p>
    </div>

    <div class="row g-4">
      <div class="col-md-6">
        <div class="glass" style="padding:1.2rem;height:100%;">
          <p class="mb-1"><strong>Texto literal</strong> (comillas dobles):</p>
          <code class="codigo">&lt;c:out value="1+2+3" /&gt;</code>
          <p class="mt-3 mb-1">Resultado literal:</p>
          <span class="muestra"><c:out value="1+2+3" /></span>
        </div>
      </div>
      <div class="col-md-6">
        <div class="glass" style="padding:1.2rem;height:100%;">
          <p class="mb-1"><strong>Expresi&oacute;n EL</strong> (<code>\${...}</code>):</p>
          <code class="codigo">&lt;c:out value="\${1+2+3}" /&gt;</code>
          <p class="mt-3 mb-1">Resultado calculado:</p>
          <span class="muestra"><c:out value="${1+2+3}" /></span>
        </div>
      </div>
    </div>

    <div class="panel-mensaje mt-4">
      <div class="pm-icon"><i class="bi bi-info-circle-fill"></i></div>
      <p class="pm-titulo">
        Con comillas dobles, <code>1+2+3</code> queda como texto; con
        <code>\${1+2+3}</code> JSTL lo eval&uacute;a y lo convierte en <b>6</b>.
      </p>
    </div>

    <div class="acciones mt-arena">
      <a class="btn-neon" href="${ctx}/ejercicios/2/index.jsp">Siguiente nivel <i class="bi bi-arrow-right"></i></a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Volver al inicio</a>
    </div>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
