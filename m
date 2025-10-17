Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7F9CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 15:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154F610EC69;
	Fri, 17 Oct 2025 15:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="N9JabTYj";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2446C10EC69
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 15:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1760715442;
 bh=kmF8fNz2BGeo1JDxZN8igeXBPqXeWbK78x19F8/26ys=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=N9JabTYjsitXc+2vx8nnwb/M48IZiRz+do93d6oiItsmhRh9Z0Ux6lQDtu68ecR4k
 lKvqTgrasNmYVQG6IU3upMS/PxnYWmGT+p/w8lcHTR1iAzB9hh0rNPjAvXD/bduoxr
 Tabc7Uy4K2ASn2sugUJVA2Mrqx+pLWrxpsjlvaQiAazShodpR6QeI/X7nV1rw9FRIf
 oPmx2Cs9nGBDGwyObPzARDkYuzUV4ZHxgh6pdM6aNLUSacq3kqpgojh9f00AjEWcoc
 8KP4C/U/s4t5m3bbx2/C08lXPzGGVxV69ucr97QadHUzqPqawpvlu/f6Ktmsq5rJaH
 wcq216Ey+hKVQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 4/5] drm/i915/display: Disable interrupts on xe for realtime
 preemption
Date: Fri, 17 Oct 2025 17:37:47 +0200
Message-ID: <20251017153748.26059-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017153748.26059-1-dev@lankhorst.se>
References: <20251017153748.26059-1-dev@lankhorst.se>
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

Check if it works at all, and then see what the timing results are.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c   | 12 +++++++-----
 drivers/gpu/drm/i915/display/intel_vblank.c |  4 ++--
 drivers/gpu/drm/i915/display/intel_vblank.h |  9 +++++++++
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index f34745b5ea497..39a4ff902e6ce 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -567,7 +567,7 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 	 */
 	intel_psr_wait_for_idle_locked(new_crtc_state);
 
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+	if (intel_disable_vblank_irqs())
 		local_irq_disable();
 
 	crtc->debug.min_vbl = evade.min;
@@ -586,7 +586,7 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 	return;
 
 irq_disable:
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+	if (intel_disable_vblank_irqs())
 		local_irq_disable();
 }
 
@@ -686,6 +686,10 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	    intel_crtc_has_type(new_crtc_state, INTEL_OUTPUT_DSI))
 		icl_dsi_frame_update(new_crtc_state);
 
+	preempt_disable();
+        if (intel_disable_vblank_irqs())
+		local_irq_enable();
+
 	/* We're still in the vblank-evade critical section, this can't race.
 	 * Would be slightly nice to just grab the vblank count and arm the
 	 * event outside of the critical section - the spinlock might spin for a
@@ -733,9 +737,7 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	if (!state->base.legacy_cursor_update)
 		intel_vrr_send_push(NULL, new_crtc_state);
 
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_irq_enable();
-
+	preempt_enable();
 	if (intel_vgpu_active(dev_priv))
 		goto out;
 
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 7826f29619a14..09be26f6a3df8 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -761,12 +761,12 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 			break;
 		}
 
-		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		if (intel_disable_vblank_irqs())
 			local_irq_enable();
 
 		timeout = schedule_timeout(timeout);
 
-		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		if (intel_disable_vblank_irqs())
 			local_irq_disable();
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.h b/drivers/gpu/drm/i915/display/intel_vblank.h
index 98d04cacd65f8..7207dcf7e1c5e 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.h
+++ b/drivers/gpu/drm/i915/display/intel_vblank.h
@@ -50,4 +50,13 @@ intel_pre_commit_crtc_state(struct intel_atomic_state *state,
 
 int intel_crtc_vblank_length(const struct intel_crtc_state *crtc_state);
 
+static inline int intel_disable_vblank_irqs(void)
+{
+#if !defined(I915) && !IS_ENABLED(CONFIG_PREEMPT_RT)
+	return true;
+#else
+	return false;
+#endif
+}
+
 #endif /* __INTEL_VBLANK_H__ */
-- 
2.51.0

