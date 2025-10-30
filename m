Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AA2CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 18:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5B310EA08;
	Thu, 30 Oct 2025 18:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="BXirMGQj";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580F610EA08
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 18:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761850034;
 bh=F0wDwLwTAt+4cQ9IGPagJg7PXtqAmwHdE5RZq8IJocY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BXirMGQjnWnLUwnsOMYe3jlXkr60bv25JdRO4//KbP/L6o8/1rvSFDGElBzbrdwQI
 WGWMy5skzc12durGpyWe+FBgB2VOr+Xf4rPfOPVP29om/CyzhCqAf/AIwiro5Rh522
 oc6kwRn0OuwaBPIt+Pcrr/7tEUJMnnAX6KaTlRKzhocdkNNWuSBjtSNBwJX0wIyE8f
 kdDDTeqStF22iKKRQfmCU9Xwv6mNVXsuuEV8Zyf7KLqJZP9jNW2Wvn6IuHsnTQxWjO
 CRw7uFUXLwWPqNA8odJbP94MoQCHKLpXNL6U1+KPwrkWOQ5ZMCc1blK06PHJuWB55s
 znveennTY5bAw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 4/8] drm/i915: Don't disable interrupts on PREEMPT_RT during
 atomic updates
Date: Thu, 30 Oct 2025 19:47:06 +0100
Message-ID: <20251030184710.359870-5-dev@lankhorst.se>
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

From: Mike Galbraith <umgwanakikbuti@gmail.com>

Commit
   8d7849db3eab7 ("drm/i915: Make sprite updates atomic")

started disabling interrupts across atomic updates. This breaks on PREEMPT_RT
because within this section the code attempt to acquire spinlock_t locks which
are sleeping locks on PREEMPT_RT.

According to the comment the interrupts are disabled to avoid random delays and
not required for protection or synchronisation.
If this needs to happen with disabled interrupts on PREEMPT_RT, and the
whole section is restricted to register access then all sleeping locks
need to be acquired before interrupts are disabled and some function
maybe moved after enabling interrupts again.
This includes:
- prepare_to_wait() + finish_wait() due its wake queue.
- drm_crtc_vblank_put() -> vblank_disable_fn() drm_device::vbl_lock.
- skl_pfit_enable(), intel_update_plane(), vlv_atomic_update_fifo() and
  maybe others due to intel_uncore::lock
- drm_crtc_arm_vblank_event() due to drm_device::event_lock and
  drm_device::vblank_time_lock.

Don't disable interrupts on PREEMPT_RT during atomic updates.

[bigeasy: drop local locks, commit message]

Signed-off-by: Mike Galbraith <umgwanakikbuti@gmail.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c   | 9 ++++++---
 drivers/gpu/drm/i915/display/intel_cursor.c | 9 ++++++---
 drivers/gpu/drm/i915/display/intel_vblank.c | 6 ++++--
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 802ae5aaece1a..4be5de737aa14 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -570,7 +570,8 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 	 */
 	intel_psr_wait_for_idle_locked(new_crtc_state);
 
-	local_irq_disable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_irq_disable();
 
 	crtc->debug.min_vbl = evade.min;
 	crtc->debug.max_vbl = evade.max;
@@ -588,7 +589,8 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 	return;
 
 irq_disable:
-	local_irq_disable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_irq_disable();
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_VBLANK_EVADE)
@@ -734,7 +736,8 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	if (!state->base.legacy_cursor_update)
 		intel_vrr_send_push(NULL, new_crtc_state);
 
-	local_irq_enable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_irq_enable();
 
 	if (intel_vgpu_active(dev_priv))
 		goto out;
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index c47c849358714..780fcae77a984 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -919,13 +919,15 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		 */
 		intel_psr_wait_for_idle_locked(crtc_state);
 
-		local_irq_disable();
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			local_irq_disable();
 
 		intel_vblank_evade(&evade);
 
 		drm_crtc_vblank_put(&crtc->base);
 	} else {
-		local_irq_disable();
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			local_irq_disable();
 	}
 
 	if (new_plane_state->uapi.visible) {
@@ -935,7 +937,8 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		intel_plane_disable_arm(NULL, plane, crtc_state);
 	}
 
-	local_irq_enable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_irq_enable();
 
 	intel_psr_unlock(crtc_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index cd7f2c1ef21af..cb060b5c04659 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -761,11 +761,13 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 			break;
 		}
 
-		local_irq_enable();
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			local_irq_enable();
 
 		timeout = schedule_timeout(timeout);
 
-		local_irq_disable();
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			local_irq_disable();
 	}
 
 	finish_wait(wq, &wait);
-- 
2.51.0

