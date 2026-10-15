<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Nivel 4 - Elige tu lenguaje" />
<c:set var="arenaNivel" value="4" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 04</span>
      <h1>Elige tu lenguaje</h1>
      <p>Un <span class="text-cyan">switch</span> con
        <span class="text-cyan">&lt;c:choose&gt;</span> /
        <span class="text-cyan">&lt;c:when&gt;</span> /
        <span class="text-cyan">&lt;c:otherwise&gt;</span>.</p>
    </div>

    <form class="form-neon row g-3" action="${ctx}/ejercicios/4/ProcesarC2.jsp" method="post">
      <div class="col-md-6">
        <label class="form-label" for="lenguaje">Selecciona un lenguaje</label>
        <select class="form-select" id="lenguaje" name="lenguaje">
          <option value="">--Seleccionar un Lenguaje--</option>
          <option value="Java">Java</option>
          <option value="C++">C++</option>
          <option value="Perl">Perl</option>
        </select>
      </div>
      <div class="col-12 acciones">
        <button class="btn-neon" type="submit"><i class="bi bi-cpu-fill"></i> Analizar</button>
        <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
      </div>
    </form>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
