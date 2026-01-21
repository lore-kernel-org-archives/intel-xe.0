Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0C9C4453F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 13:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECB410E7CB;
	Wed, 21 Jan 2026 13:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="oAmMkIpW";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8485310E7D9;
 Wed, 21 Jan 2026 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769003615;
 bh=zPk2a5OoenQEAeK4SGQrvgyZ/9REEJF04aMPPmwVtWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oAmMkIpWkmHWkG+gYILmBR14oH85UtVL/rAA02OXDCYoammZFGM/lA1q0bfIHeDAF
 dG+UDcCsKHU6TcHcgukOvNDxc/LKmP+7jI+BHWTZfqXUsWfER2V/6pF6gBsbggkptG
 ClfEcf69LYLAT028WwmdBlYSmkM3NQnuLSKkDGLm9LYRceOP1Xh9KSfok2hOowScXg
 XIwmX1npIF8MwcFwa/lWKndPdKS5tc5rmmLdMepE/4BTnsRs/F92w1GShylqyG2vqy
 44aXorbTOTvq11RSPLjnxXEu60U2eVC5nFbgHJwo3gsQw6YNsJ0rxYXhike+z+p1tN
 bkIG56Uwxs8cQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v5 06/21] drm/i915/display: Remove locking from
 intel_vblank_evade critical section
Date: Wed, 21 Jan 2026 14:53:02 +0100
Message-ID: <20260121135318.651622-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260121135318.651622-1-dev@lankhorst.se>
References: <20260121135318.651622-1-dev@lankhorst.se>
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

finish_wait() may take a lock, which means that it can take any amount
of time. On PREEMPT-RT we should not be taking any lock after disabling
preemption, so ensure that the completion is done before disabling
interrupts.

This also has the benefit of making vblank evasion more deterministic,
by performing the final vblank check after all locking is done.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c | 30 +++++++++------------
 drivers/gpu/drm/i915/display/intel_vblank.h |  1 +
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 778ebc5095c38..cb31c9c1c2525 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -684,7 +684,7 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	enum pipe pipe = crtc->pipe;
-	int scanline_end = intel_get_crtc_scanline(crtc);
+	int scanline_end = __intel_get_crtc_scanline(crtc);
 	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
 	ktime_t end_vbl_time = ktime_get();
 
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index a85796f9d29ba..58c374a7530fe 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -241,7 +241,7 @@ int intel_crtc_scanline_offset(const struct intel_crtc_state *crtc_state)
  * intel_de_read_fw(), only for fast reads of display block, no need for
  * forcewake etc.
  */
-static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
+int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(&crtc->base);
@@ -732,6 +732,16 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 		evade->min -= vblank_delay;
 }
 
+static bool scanline_in_safe_range(struct intel_vblank_evade_ctx *evade, int *scanline, bool unlocked)
+{
+	if (unlocked)
+		*scanline = intel_get_crtc_scanline(evade->crtc);
+	else
+		*scanline = __intel_get_crtc_scanline(evade->crtc);
+
+	return *scanline < evade->min || *scanline > evade->max;
+}
+
 /* must be called with vblank interrupt already enabled! */
 int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 {
@@ -739,24 +749,12 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 	struct intel_display *display = to_intel_display(crtc);
 	long timeout = msecs_to_jiffies_timeout(1);
 	wait_queue_head_t *wq = drm_crtc_vblank_waitqueue(&crtc->base);
-	DEFINE_WAIT(wait);
 	int scanline;
 
 	if (evade->min <= 0 || evade->max <= 0)
 		return 0;
 
-	for (;;) {
-		/*
-		 * prepare_to_wait() has a memory barrier, which guarantees
-		 * other CPUs can see the task state update by the time we
-		 * read the scanline.
-		 */
-		prepare_to_wait(wq, &wait, TASK_UNINTERRUPTIBLE);
-
-		scanline = intel_get_crtc_scanline(crtc);
-		if (scanline < evade->min || scanline > evade->max)
-			break;
-
+	while (!scanline_in_safe_range(evade, &scanline, false)) {
 		if (!timeout) {
 			drm_dbg_kms(display->drm,
 				    "Potential atomic update failure on pipe %c\n",
@@ -766,13 +764,11 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 
 		local_irq_enable();
 
-		timeout = schedule_timeout(timeout);
+		timeout = wait_event_timeout(*wq, scanline_in_safe_range(evade, &scanline, true), timeout);
 
 		local_irq_disable();
 	}
 
-	finish_wait(wq, &wait);
-
 	/*
 	 * On VLV/CHV DSI the scanline counter would appear to
 	 * increment approx. 1/3 of a scanline before start of vblank.
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.h b/drivers/gpu/drm/i915/display/intel_vblank.h
index 98d04cacd65f8..aa1974400e9fc 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.h
+++ b/drivers/gpu/drm/i915/display/intel_vblank.h
@@ -38,6 +38,7 @@ u32 g4x_get_vblank_counter(struct drm_crtc *crtc);
 bool intel_crtc_get_vblank_timestamp(struct drm_crtc *crtc, int *max_error,
 				     ktime_t *vblank_time, bool in_vblank_irq);
 int intel_get_crtc_scanline(struct intel_crtc *crtc);
+int __intel_get_crtc_scanline(struct intel_crtc *crtc);
 void intel_wait_for_pipe_scanline_stopped(struct intel_crtc *crtc);
 void intel_wait_for_pipe_scanline_moving(struct intel_crtc *crtc);
 void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
-- 
2.51.0

