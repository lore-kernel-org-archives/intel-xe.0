Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B87CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 18:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C61110EA0B;
	Thu, 30 Oct 2025 18:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="GmdyLlSJ";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC7310EA08
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 18:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761850036;
 bh=DgANSdDnMbMhz9tuJFLHa5LdxPfk20wgYJCHehuWRTo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GmdyLlSJiNTyJVqC7HkUu9Ddk9Y8gANbudaCqjyVG/OuQUE9h7YC+hBoCAvu61SLH
 OPOYe8rQjM7kFhaUNy6xkoKhp8YJXGLpq6/xBBvd4T8jpO9XZb0MmUUnJlTomShmzV
 aM+ykNbiljyHdbOfbRxAAFva/JMPj+mHATHG4sCehRcLFAec0phVHiO4CQ53uN+AUY
 UQAIIycvTo6sYErGJpJtHGG3FFroNU2hRP1z1qnDVFqiqaE4Trago+FnRnnzjuMPaE
 eKyzDTnNYjZr/jSoQ7gc7Qvm9hzeWP8lWhzCx1AgEreJin5AG5CbqRFPhtemXzBXMX
 mzKWZta6SWRoA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 7/8] With disabled irqs instead
Date: Thu, 30 Oct 2025 19:47:09 +0100
Message-ID: <20251030184710.359870-8-dev@lankhorst.se>
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
 drivers/gpu/drm/i915/display/intel_crtc.c   | 14 +++++---------
 drivers/gpu/drm/i915/display/intel_cursor.c | 18 ++++++------------
 drivers/gpu/drm/i915/display/intel_vblank.c |  8 ++++++--
 3 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 678264c9b82f2..832287b2f95a7 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -570,12 +570,10 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 	 */
 	intel_psr_wait_for_idle_locked(new_crtc_state);
 
+#ifdef I915
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_irq_disable();
-#ifndef I915
-	else
-		preempt_disable();
 #endif
+		local_irq_disable();
 
 	crtc->debug.min_vbl = evade.min;
 	crtc->debug.max_vbl = evade.max;
@@ -593,12 +591,10 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 	return;
 
 irq_disable:
+#ifdef I915
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_irq_disable();
-#ifndef I915
-	else
-		preempt_disable();
 #endif
+		local_irq_disable();
 
 }
 
@@ -699,7 +695,7 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 		icl_dsi_frame_update(new_crtc_state);
 
 #if !defined(I915) && IS_ENABLED(CONFIG_PREEMPT_RT)
-	preempt_enable();
+	local_irq_enable();
 #endif
 
 	/* We're still in the vblank-evade critical section, this can't race.
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 50ca39eb09145..6dbaeeb6084b2 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -920,23 +920,19 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		 */
 		intel_psr_wait_for_idle_locked(crtc_state);
 
+#ifdef I915
 		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-			local_irq_disable();
-#ifndef I915
-		else
-			preempt_disable();
 #endif
+			local_irq_disable();
 
 		intel_vblank_evade(&evade);
 
 		vblanked = true;
 	} else {
+#ifdef I915
 		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-			local_irq_disable();
-#ifndef I915
-		else
-			preempt_disable();
 #endif
+			local_irq_disable();
 	}
 
 	if (new_plane_state->uapi.visible) {
@@ -946,12 +942,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		intel_plane_disable_arm(NULL, plane, crtc_state);
 	}
 
+#ifdef I915
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_irq_enable();
-#ifndef I915
-	else
-		preempt_enable();
 #endif
+		local_irq_enable();
 
 	intel_psr_unlock(crtc_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 5fcf5c08187f7..e7450d4d99d25 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -386,7 +386,9 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 	 */
 	intel_vblank_section_enter_irqf(display, &irqflags);
 
-	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+#ifdef I915
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+#endif
 		preempt_disable();
 
 	/* Get optional system timestamp before query. */
@@ -451,7 +453,9 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 	if (etime)
 		*etime = ktime_get();
 
-	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+#ifdef I915
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+#endif
 		preempt_enable();
 
 	intel_vblank_section_exit_irqf(display, irqflags);
-- 
2.51.0

