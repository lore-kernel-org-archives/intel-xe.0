Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594ADCCFA0C
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122FB10E210;
	Mon,  3 Nov 2025 17:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="QWNx5S1R";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5899710E4BB
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1762192014;
 bh=J17qz3acoolp69Z44md1B5Q1vF/K6mIUidhmirN/VZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QWNx5S1RZjM+GIbVQpwHUiM4gZ0MQylTeX0x03l8KO42Lr5Cf9fzapYQ/OzQEFfjy
 wXOPhZwDeK0tWv8T5mDDwX5BgZSIvim69+y/n3NwMdB8P58ZH0wtHX/LyYqgaXE15z
 22y4Gdz82dDoDuN0TGDP/9SSmiR6L6M5cEeQHMHXRAN4XQbIgIBBnR+v+S/yIRLyh2
 kdOeBj/Qwazgw18qJ5FtvY+MjCSgexjgJr7a8ksLJCeo5mEf2Jd/UVwie0wbrcOcDN
 6Buw2sbSAUMolttnmUgiwJ9ZAGylMkR5vVNYhLxRtAD5wo+GgKkrVbuEQCXVDZwecK
 VBx3t+SNld+0A==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Mario Kleiner <mario.kleiner.de@gmail.com>,
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 5/7] drm/i915/display: Make icl_dsi_frame_update use _fw too
Date: Mon,  3 Nov 2025 18:47:08 +0100
Message-ID: <20251103174718.139798-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103174718.139798-1-dev@lankhorst.se>
References: <20251103174718.139798-1-dev@lankhorst.se>
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
index 9ecdcf6b73e4d..b7d1df02a9319 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -214,6 +214,12 @@ intel_de_write_fw(struct intel_display *display, i915_reg_t reg, u32 val)
 	intel_uncore_write_fw(__to_uncore(display), reg, val);
 }
 
+static inline u32
+intel_de_rmw_fw(struct intel_display *display, i915_reg_t reg, u32 clear, u32 set)
+{
+	return intel_uncore_rmw_fw(__to_uncore(display), reg, clear, set);
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

