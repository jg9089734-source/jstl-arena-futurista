<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Nivel 2 - Recibir jugador" />
<c:set var="arenaNivel" value="2" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 02</span>
      <h1>Recibir jugador</h1>
      <p>Env&iacute;a tus datos con <span class="text-cyan">POST</span> y el servidor los reimprime con
        <span class="text-cyan">&lt;c:out&gt;</span> y <span class="text-cyan">\${param.*}</span>.</p>
    </div>

    <form class="form-neon row g-3" action="${ctx}/ejercicios/2/ProcesarC.jsp" method="post">
      <div class="col-md-4">
        <label class="form-label" for="nombre">Nombre</label>
        <input class="form-control" type="text" id="nombre" name="nombre" placeholder="Juanita" required>
      </div>
      <div class="col-md-4">
        <label class="form-label" for="apellido1">Primer apellido</label>
        <input class="form-control" type="text" id="apellido1" name="apellido1" placeholder="Tamayo" required>
      </div>
      <div class="col-md-4">
        <label class="form-label" for="apellido2">Segundo apellido</label>
        <input class="form-control" type="text" id="apellido2" name="apellido2" placeholder="Marin" required>
      </div>
      <div class="col-12 acciones">
        <button class="btn-neon" type="submit"><i class="bi bi-send-fill"></i> Procesar</button>
        <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
      </div>
    </form>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
