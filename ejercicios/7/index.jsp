<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Nivel 7 - Separa el codigo" />
<c:set var="arenaNivel" value="7" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 07</span>
      <h1>Separa el c&oacute;digo</h1>
      <p>Divide un texto en tokens con
        <span class="text-cyan">&lt;c:forTokens&gt;</span> seg&uacute;n un delimitador.</p>
    </div>

    <form class="form-neon row g-3" action="${ctx}/ejercicios/7/ResultTokens.jsp" method="post">
      <div class="col-md-8">
        <label class="form-label" for="delimText">Texto a dividir</label>
        <input class="form-control" type="text" id="delimText" name="delimText"
               value="uno dos|tres" placeholder="uno dos|tres">
      </div>
      <div class="col-md-4">
        <label class="form-label" for="delim">Delimitador</label>
        <input class="form-control" type="text" id="delim" name="delim"
               value="|" placeholder="|">
      </div>
      <div class="col-12 acciones">
        <button class="btn-neon" type="submit"><i class="bi bi-scissors"></i> Dividir</button>
        <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
      </div>
    </form>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
