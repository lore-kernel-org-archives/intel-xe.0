Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADE7CCFA00
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 18:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6D610EA0C;
	Thu, 30 Oct 2025 18:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="jRCjY8xu";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA9D10EA08
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 18:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761850035;
 bh=VBco7zVB9VTaGgt3tIx7GWoTZdb6hMaqwzco395EbzY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jRCjY8xun5KjYubA84Agv5Vkxx9dZ+JQX/v8nOPRdHb4PToXU6/P/C5sasmh/a25j
 WLaX2rMyaI8VbqE6lF1EQClqmT6rDMESvEcOd6hq7ovJoFqV3xkWyue+HBt82c+lla
 TOdCB9vO6xlAJxivAqQEHN+790ZQRwMk5bSDnr3RcwIPpPDNoyFVTo8Q9iLlWT+7V1
 s/y9oEtpvQl1hfbj3xxKom/AHyLOjPkOlf9n8CRT7eoO82GY6jcijr2XRsaY6k4mgO
 Mgp1ZvT7PNCXRgnXqY1ZWo9JzdgMd0Fh/we/tbgUoixthsQI7KFpD+KTWRtM5Gzoc9
 /M9yYM6KHdMOQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 6/8] PREEMPT_RT injection
Date: Thu, 30 Oct 2025 19:47:08 +0100
Message-ID: <20251030184710.359870-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030184710.359870-1-dev@lankhorst.se>
References: <20251030184710.359870-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/Kconfig.debug | 15 ---------------
 drivers/gpu/drm/xe/Kconfig.debug   |  5 +++++
 kernel/Kconfig.preempt             |  4 ++--
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 3562a02ef7adc..0ab10ff41e38d 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -233,21 +233,6 @@ config DRM_I915_LOW_LEVEL_TRACEPOINTS
 
 	  If in doubt, say "N".
 
-config DRM_I915_DEBUG_VBLANK_EVADE
-	bool "Enable extra debug warnings for vblank evasion"
-	depends on DRM_I915
-	default n
-	help
-	  Choose this option to turn on extra debug warnings for the
-	  vblank evade mechanism. This gives a warning every time the
-	  the deadline allotted for the vblank evade critical section
-	  is exceeded, even if there isn't an actual risk of missing
-	  the vblank.
-
-	  Recommended for driver developers only.
-
-	  If in doubt, say "N".
-
 config DRM_I915_DEBUG_RUNTIME_PM
 	bool "Enable extra state checking for runtime PM"
 	depends on DRM_I915
diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 01227c77f6d70..1d5f11c6e88f3 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -30,6 +30,11 @@ config DRM_XE_DEBUG
 
 	  If in doubt, say "N".
 
+config DRM_I915_DEBUG_VBLANK_EVADE
+        def_bool y
+        depends on DRM_XE
+
+
 config DRM_XE_DEBUG_VM
 	bool "Enable extra VM debugging info"
 	default n
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index da326800c1c9b..68a6d42c55abe 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -87,9 +87,9 @@ config PREEMPT_LAZY
 endchoice
 
 config PREEMPT_RT
-	bool "Fully Preemptible Kernel (Real-Time)"
-	depends on EXPERT && ARCH_SUPPORTS_RT && !COMPILE_TEST
+	def_bool y
 	select PREEMPTION
+	depends on ARCH_SUPPORTS_RT
 	help
 	  This option turns the kernel into a real-time kernel by replacing
 	  various locking primitives (spinlocks, rwlocks, etc.) with
-- 
2.51.0

