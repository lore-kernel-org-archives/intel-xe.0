Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27237CCFA1F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 19:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD3D10EB6E;
	Fri,  7 Nov 2025 19:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="pASMRjcK";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6813910EB62
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1762544390;
 bh=0eIelrLCgvItLKJTaYXGJPRomkuTZ6Fb/nXo41fHTdc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pASMRjcKYXIlw+UOZz6ivdsfr1/FzE0XXvWNnJgbdfD3MzNSCu0/UmEmrAwGF7HHU
 8gwD0Z6SKhy+D5/tL4D8LvFwH527YRVY6On0NNg9ktG8Lnneujq9Th8ZZEAgCBnwyO
 TuQNKhYfYiAEjQ2Z66rYwefUw3KXsGB6iQ62x3YCro2d1wnXABhDVR6L2tdWCYophY
 Dg0YtaWY+MfzNdjwTUEOivXFMMP/03dTjlpw5LxCpKm0yRw3jUqWUi7k7/YJNJXbKd
 QCJbT+XikFAlA/ZwSXLSv6n09NK0fn8n7/VYhxq/9LsG4xtuuW+JFyh+Rm5FE6pQxU
 SNyE6F9Gt6nbQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI 05/10] drm/i915/display: Make icl_dsi_frame_update use _fw too
Date: Fri,  7 Nov 2025 20:39:40 +0100
Message-ID: <20251107193946.1075137-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107193946.1075137-1-dev@lankhorst.se>
References: <20251107193946.1075137-1-dev@lankhorst.se>
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

Don't use the dmc lock inside the vblank critical section,
not even as last call.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/icl_dsi.c                | 4 ++--
 drivers/gpu/drm/i915/display/intel_de.h               | 6 ++++++
 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h | 2 ++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 70d4c1bc70fc3..e52b434ac8f11 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -243,8 +243,8 @@ void icl_dsi_frame_update(struct intel_crtc_state *crtc_state)
 	else
 		return;
 
-	intel_de_rmw(display, DSI_CMD_FRMCTL(port), 0,
-		     DSI_FRAME_UPDATE_REQUEST);
+	intel_de_rmw_fw(display, DSI_CMD_FRMCTL(port), 0,
+			DSI_FRAME_UPDATE_REQUEST);
 }
 
 static void dsi_program_swing_and_deemphasis(struct intel_encoder *encoder)
diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 9ecdcf6b73e4d..15f606a4a2e9d 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -214,6 +214,12 @@ intel_de_write_fw(struct intel_display *display, i915_reg_t reg, u32 val)
 	intel_uncore_write_fw(__to_uncore(display), reg, val);
 }
 
+static inline void
+intel_de_rmw_fw(struct intel_display *display, i915_reg_t reg, u32 clear, u32 set)
+{
+	intel_uncore_rmw_fw(__to_uncore(display), reg, clear, set);
+}
+
 static inline u32
 intel_de_read_notrace(struct intel_display *display, i915_reg_t reg)
 {
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index d012f02bc84f7..57d5ffabf2d52 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -91,6 +91,8 @@ static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
 	return xe_mmio_rmw32(__compat_uncore_to_mmio(uncore), reg, clear, set);
 }
 
+#define intel_uncore_rmw_fw intel_uncore_rmw
+
 static inline int intel_wait_for_register(struct intel_uncore *uncore,
 					  i915_reg_t i915_reg, u32 mask,
 					  u32 value, unsigned int timeout)
-- 
2.51.0

