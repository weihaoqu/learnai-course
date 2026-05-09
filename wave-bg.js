/* wave-bg.js – dependency-free dotted wave background for course pages */
(function () {
  "use strict";

  var GRID = {
    desktopCols: 50,
    desktopRows: 50,
    mobileCols: 40,
    mobileRows: 35,
    lowPowerRows: 30
  };

  var CONFIG = {
    maxDevicePixelRatio: 1.5,
    opacity: 0.16,
    reducedMotionOpacity: 0.12,
    speed: 0.42,
    dotRadius: 2.0,
    focalLength: 1040,
    cameraY: 355,
    cameraZ: 1220,
    cameraPitch: -0.28,
    sceneWidth: 2400,
    sceneDepth: 3200,
    sceneYOffset: 10,
    colorDark: "103, 232, 249"
  };

  function supportsCanvas() {
    var c = document.createElement("canvas");
    return !!(c.getContext && c.getContext("2d"));
  }

  function prefersReducedMotion() {
    return window.matchMedia &&
      window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  }

  function createLayer() {
    var layer = document.createElement("div");
    layer.className = "course-wave-bg";
    layer.setAttribute("aria-hidden", "true");

    var canvas = document.createElement("canvas");
    layer.appendChild(canvas);
    document.body.insertBefore(layer, document.body.firstChild);

    var style = document.createElement("style");
    style.textContent =
      ".course-wave-bg{position:fixed;inset:0;width:100vw;height:100vh;overflow:hidden;" +
      "pointer-events:none;z-index:1;}" +
      ".course-wave-bg canvas{position:fixed;inset:0;display:block;width:100vw;height:100vh;" +
      "pointer-events:none;}";
    document.head.appendChild(style);

    return canvas;
  }

  function buildDots(cols, rows) {
    var dots = [];
    var startX = CONFIG.sceneWidth / -2;
    var startZ = CONFIG.sceneDepth / -2;

    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < cols; col++) {
        var nx = cols <= 1 ? 0 : col / (cols - 1);
        var nz = rows <= 1 ? 0 : row / (rows - 1);
        dots.push({
          x: startX + nx * CONFIG.sceneWidth,
          z: startZ + nz * CONFIG.sceneDepth,
          nx: nx,
          nz: nz,
          phaseA: nx * 7.4 + nz * 4.8,
          phaseB: nx * 3.1 - nz * 8.7
        });
      }
    }
    return dots;
  }

  function init() {
    if (!supportsCanvas()) return;

    var reduceMotion = prefersReducedMotion();
    var canvas = createLayer();
    var ctx = canvas.getContext("2d", { alpha: true });
    var dots = [], width = 0, height = 0, dpr = 1;
    var color = CONFIG.colorDark;
    var running = true, lastTime = performance.now(), elapsed = 0;
    var lastFrameTime = 0, minFrameInterval = 0;

    function clamp(value, min, max) {
      return Math.max(min, Math.min(max, value));
    }

    function resize() {
      var mobile = window.innerWidth <= 768;
      var lowPower = (window.devicePixelRatio || 1) > 1.8 || window.innerWidth <= 540;
      var cols = mobile ? GRID.mobileCols : GRID.desktopCols;
      var rows = mobile ? GRID.mobileRows : GRID.desktopRows;

      if (lowPower) rows = Math.min(rows, GRID.lowPowerRows);
      width = window.innerWidth;
      height = window.innerHeight;
      dpr = Math.min(window.devicePixelRatio || 1, CONFIG.maxDevicePixelRatio);
      minFrameInterval = lowPower ? 1000 / 45 : 0;
      canvas.width = Math.floor(width * dpr);
      canvas.height = Math.floor(height * dpr);
      canvas.style.width = width + "px";
      canvas.style.height = height + "px";
      ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
      dots = buildDots(cols, rows);
      draw(0);
    }

    function draw(t) {
      ctx.clearRect(0, 0, width, height);
      var baseOpacity = reduceMotion ? CONFIG.reducedMotionOpacity : CONFIG.opacity;
      var centerX = width / 2;
      var horizonY = height * 0.5;
      var pitchCos = Math.cos(CONFIG.cameraPitch);
      var pitchSin = Math.sin(CONFIG.cameraPitch);

      for (var i = 0; i < dots.length; i++) {
        var d = dots[i];
        var waveA = Math.sin(d.phaseA + t * 2.0) * 54;
        var waveB = Math.sin(d.phaseB - t * 1.35) * 26;
        var worldY = CONFIG.sceneYOffset + waveA + waveB;

        var cameraX = d.x;
        var cameraY = worldY - CONFIG.cameraY;
        var cameraZ = d.z + CONFIG.cameraZ;
        var rotatedY = cameraY * pitchCos - cameraZ * pitchSin;
        var rotatedZ = cameraY * pitchSin + cameraZ * pitchCos;

        if (rotatedZ <= 80) continue;

        var perspective = CONFIG.focalLength / (rotatedZ + CONFIG.focalLength);
        var px = centerX + cameraX * perspective;
        var py = horizonY + rotatedY * perspective;
        var peakBoost = clamp((worldY + 80) / 160, 0, 1);
        var depthFade = clamp(1.18 - d.nz * 0.48, 0.58, 1.18);
        var edgeFade = clamp((1 - Math.abs(d.nx - 0.5) * 1.35), 0.38, 1);
        var alpha = baseOpacity * (0.78 + peakBoost * 0.34) * depthFade * edgeFade;
        if (alpha <= 0.003) continue;

        var radius = CONFIG.dotRadius * clamp(perspective / 0.48, 0.58, 1.45);
        ctx.beginPath();
        ctx.fillStyle = "rgba(" + color + "," + alpha.toFixed(4) + ")";
        ctx.arc(px, py, radius, 0, Math.PI * 2);
        ctx.fill();
      }
    }

    function frame(now) {
      if (!running) return;
      if (minFrameInterval && now - lastFrameTime < minFrameInterval) {
        window.requestAnimationFrame(frame);
        return;
      }
      elapsed += Math.min(0.05, (now - lastTime) / 1000) * CONFIG.speed;
      lastTime = now;
      lastFrameTime = now;
      draw(elapsed);
      window.requestAnimationFrame(frame);
    }

    document.addEventListener("visibilitychange", function () {
      running = !document.hidden;
      if (running && !reduceMotion) { lastTime = performance.now(); window.requestAnimationFrame(frame); }
    });

    resize();
    window.addEventListener("resize", resize, { passive: true });
    if (reduceMotion) { draw(0); } else { window.requestAnimationFrame(frame); }
  }

  document.readyState === "loading"
    ? document.addEventListener("DOMContentLoaded", init)
    : init();
}());
