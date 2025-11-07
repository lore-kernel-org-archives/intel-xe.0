Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A25CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 19:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6164B10EB77;
	Fri,  7 Nov 2025 19:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="WpY+58g3";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83D410EAFB
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 19:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1762544389;
 bh=5EyVl++02A6gXmAu1FIdHW+rmMCx4mTCiwsTCNDLiTM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WpY+58g3vqauKVRYgnBeZPTqKzsptUw9sV8xegOl4tRfsLgl7RUAvP6t4O3FIWTli
 KXTlll/B8hiTvrvWotfzOgsb3MUvCpg2JDVX5fyau/XWE39CHqJvXJPw022L56ZmtO
 8lsiGzlSWBnMqeKi5Gq7Zvpye08wgvZOP86eOV2JOqGvm5zdf0qHR238LTuwDQrAvN
 QuK10h70h2APN3fNZD5R1FL3cpuYK+lmZq6efddoWmmlsA/1umCgt9xwxRCZYLnfWO
 a6gxuj34WdUE2K7+nvMAJygL8s/RpxIkdXowCvvwLWvk/h6fAQzJleh5S3Wf29Si3e
 bGnYuXxknGP5Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI 04/10] drm/i915/display: Remove locking from
 intel_vblank_evade critical section
Date: Fri,  7 Nov 2025 20:39:39 +0100
Message-ID: <20251107193946.1075137-5-dev@lankhorst.se>
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

finish_wait() may take a lock, which means that it can take any amount
of time. On PREEMPT-RT we should not be taking any lock after disabling
preemption, so ensure that the completion is done before disabling
interrupts.

This also has the benefit of making vblank evasion more deterministic,
by performing the final vblank check after all locking is done.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 35 ++++++++++-----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 2b106ffa3f5f5..3628d2a1b8f38 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -708,6 +708,13 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 		evade->min -= vblank_delay;
 }
 
+static inline int vblank_evadable(struct intel_vblank_evade_ctx *evade, int *scanline)
+{
+	*scanline = intel_get_crtc_scanline(evade->crtc);
+
+	return *scanline < evade->min || *scanline > evade->max;
+}
+
 /* must be called with vblank interrupt already enabled! */
 int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 {
@@ -715,23 +722,22 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
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
+	while (!vblank_evadable(evade, &scanline)) {
+		local_irq_enable();
 
-		scanline = intel_get_crtc_scanline(crtc);
-		if (scanline < evade->min || scanline > evade->max)
-			break;
+		DEFINE_WAIT(wait);
+		while (!vblank_evadable(evade, &scanline) && timeout > 0) {
+			prepare_to_wait(wq, &wait, TASK_UNINTERRUPTIBLE);
+			timeout = schedule_timeout(timeout);
+		}
+		finish_wait(wq, &wait);
+
+		local_irq_disable();
 
 		if (!timeout) {
 			drm_dbg_kms(display->drm,
@@ -740,15 +746,8 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 			break;
 		}
 
-		local_irq_enable();
-
-		timeout = schedule_timeout(timeout);
-
-		local_irq_disable();
 	}
 
-	finish_wait(wq, &wait);
-
 	/*
 	 * On VLV/CHV DSI the scanline counter would appear to
 	 * increment approx. 1/3 of a scanline before start of vblank.
-- 
2.51.0

