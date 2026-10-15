<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Nivel 8 - Jefe final" />
<c:set var="arenaNivel" value="8" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 08</span>
      <h1>Jefe final: base de datos</h1>
      <p>Inserta un empleado con <span class="text-cyan">&lt;sql:update&gt;</span> y lista la tabla con
        <span class="text-cyan">&lt;sql:query&gt;</span>.</p>
    </div>

    <form class="form-neon row g-3" action="${ctx}/ejercicios/8/Procesarinfo.jsp" method="post">
      <div class="col-md-6">
        <label class="form-label" for="nombres">Nombres</label>
        <input class="form-control" type="text" id="nombres" name="nombres" placeholder="Juanita" required>
      </div>
      <div class="col-md-6">
        <label class="form-label" for="edad">Edad</label>
        <input class="form-control" type="number" id="edad" name="edad" min="1" max="120" placeholder="25" required>
      </div>
      <div class="col-md-6">
        <label class="form-label" for="apellido1">Primer apellido</label>
        <input class="form-control" type="text" id="apellido1" name="apellido1" placeholder="Tamayo" required>
      </div>
      <div class="col-md-6">
        <label class="form-label" for="apellido2">Segundo apellido</label>
        <input class="form-control" type="text" id="apellido2" name="apellido2" placeholder="Marin" required>
      </div>
      <div class="col-12 acciones">
        <button class="btn-neon" type="submit"><i class="bi bi-database-fill-add"></i> Insertar y listar</button>
        <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
      </div>
    </form>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
