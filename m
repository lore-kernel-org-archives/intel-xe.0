Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3057ACCD1AB
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E747810E5E2;
	Tue, 21 Oct 2025 12:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="NCC2F67y";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E80891D1
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761050560;
 bh=SB3dqSa+ppn03K5XTQyLqNMighwcf3vn66wCeTt7NNA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NCC2F67yxCTtqb5H6zKLYA6Auwf6vFFqB/TqNXdHF6dzEe3wI37JCPPRoeBP4Ijl5
 XdCyulCWT7/hcCzYhA/io2Wfz7SwldB5haNAlLD6dLFuGM9kGMJigi7aZx9X/dViz6
 hq1AETybtis7D4jyVRRXMwyLTuqiiQp+GXUyvmm7XRDj+Rd8zDMr2HOjvJJy6koFMk
 R4YKFD2x2tUFlVkpriJuF/PyBO44NIVV1KSwuf9LEmkHCRlHGxWdp0/2oeBZEOuQyu
 QX9H+IEFUcwgk4XhqNGIJnp34/JTKHiQosGX37QbLoQ0wU2YsU8iLY/xKll50tCzxL
 tHFghq9fPtrSQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 4/5] drm/xe/display: Disable migration in the most critical
 section
Date: Tue, 21 Oct 2025 14:43:08 +0200
Message-ID: <20251021124309.130121-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021124309.130121-1-dev@lankhorst.se>
References: <20251021124309.130121-1-dev@lankhorst.se>
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

Lets see what happens if we only disable migration in the critical
section to ensure we do run as fast as possible without disabling
too much.

First attempt: Only disable migration.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c   | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_cursor.c | 18 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dmc.c    |  4 ++--
 drivers/gpu/drm/i915/display/intel_vblank.c | 13 ++++++++++---
 4 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index f34745b5ea497..6972850a1f7db 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -569,6 +569,10 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		local_irq_disable();
+#ifndef I915
+	else
+		migrate_disable();
+#endif
 
 	crtc->debug.min_vbl = evade.min;
 	crtc->debug.max_vbl = evade.max;
@@ -588,6 +592,11 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 irq_disable:
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		local_irq_disable();
+#ifndef I915
+	else
+		migrate_disable();
+#endif
+
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_VBLANK_EVADE)
@@ -733,8 +742,13 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	if (!state->base.legacy_cursor_update)
 		intel_vrr_send_push(NULL, new_crtc_state);
 
+	/* Re-enable irqs here for !RT */
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		local_irq_enable();
+#ifndef I915
+	else
+		migrate_enable();
+#endif
 
 	if (intel_vgpu_active(dev_priv))
 		goto out;
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 780fcae77a984..08d56b9ea2526 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -912,6 +912,7 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	intel_psr_lock(crtc_state);
 
+	bool vblanked = false;
 	if (!drm_WARN_ON(display->drm, drm_crtc_vblank_get(&crtc->base))) {
 		/*
 		 * TODO: maybe check if we're still in PSR
@@ -921,13 +922,21 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 			local_irq_disable();
+#ifndef I915
+		else
+			migrate_disable();
+#endif
 
 		intel_vblank_evade(&evade);
 
-		drm_crtc_vblank_put(&crtc->base);
+		vblanked = true;
 	} else {
 		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 			local_irq_disable();
+#ifndef I915
+		else
+			migrate_disable();
+#endif
 	}
 
 	if (new_plane_state->uapi.visible) {
@@ -939,6 +948,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		local_irq_enable();
+#ifndef I915
+	else
+		migrate_enable();
+#endif
 
 	intel_psr_unlock(crtc_state);
 
@@ -955,6 +968,9 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		intel_plane_unpin_fb(old_plane_state);
 	}
 
+	if (vblanked)
+		drm_crtc_vblank_put(&crtc->base);
+
 out_free:
 	if (new_crtc_state)
 		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index be6d37ea1139a..239b6565105ea 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -604,7 +604,7 @@ static void dmc_load_program(struct intel_display *display, enum intel_dmc_id dm
 
 	disable_all_event_handlers(display, dmc_id);
 
-	preempt_disable();
+	migrate_disable();
 
 	for (i = 0; i < dmc->dmc_info[dmc_id].dmc_fw_size; i++) {
 		intel_de_write_fw(display,
@@ -612,7 +612,7 @@ static void dmc_load_program(struct intel_display *display, enum intel_dmc_id dm
 				  dmc->dmc_info[dmc_id].payload[i]);
 	}
 
-	preempt_enable();
+	migrate_enable();
 
 	dmc_load_mmio(display, dmc_id);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 7826f29619a14..6576088a6c6d8 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -387,7 +387,7 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 	intel_vblank_section_enter_irqf(display, &irqflags);
 
 	if (IS_ENABLED(CONFIG_PREEMPT_RT))
-		preempt_disable();
+		migrate_disable();
 
 	/* Get optional system timestamp before query. */
 	if (stime)
@@ -452,7 +452,7 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 		*etime = ktime_get();
 
 	if (IS_ENABLED(CONFIG_PREEMPT_RT))
-		preempt_enable();
+		migrate_enable();
 
 	intel_vblank_section_exit_irqf(display, irqflags);
 
@@ -763,11 +763,18 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 
 		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 			local_irq_enable();
+#ifndef I915
+		else
+			migrate_enable();
+#endif
 
 		timeout = schedule_timeout(timeout);
-
 		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 			local_irq_disable();
+#ifndef I915
+		else
+			migrate_disable();
+#endif
 	}
 
 	finish_wait(wq, &wait);
-- 
2.51.0

