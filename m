Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D16C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 06:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B680B10E275;
	Mon,  6 Nov 2023 06:49:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E9910E275
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 06:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699253341; x=1730789341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fxh7fUdL+Gl2QnKQGQyWOWVGI1wsZtpvWV85KSXUfQ4=;
 b=Stui7gCLICScmEe9P1JKGpwSBK50Ph805gBNUZwnMfpEKt67cU7tlGHD
 xec3lW0TqARxBUbT2rM6CxvSSlQ7jPGGt+TK72yGLVWy2/FgRirhSRizL
 66XITHqZMNyMSZJRpgyEpUicX2kQm25S4FdGTIUDsBlSuP76j63M7CWeF
 VkVfFYfWifIU6Az5NIptnu28ryeAbdIDA1MINpnR8c75vmTRvM0LXUHDE
 24eoW/efSSMcgzIRqqMd2/6mV5G0yRv4wlPzJHtNqlDZbraN10eQUT4+5
 LnMo6bLzepN4+i3ZgL6Wn0XjiIwftOtzwsKleyDcTiI4NJLrcz/v06Trb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369424650"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="369424650"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:49:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3534673"
Received: from rdegreef-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.42.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:58 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 08:48:31 +0200
Message-Id: <20231106064834.161647-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106064834.161647-1-jouni.hogander@intel.com>
References: <20231106064834.161647-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/8] drm/i915/display: Use dma_fence interfaces
 instead of i915_sw_fence
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are preparing for Xe driver. Xe driver doesn't have i915_sw_fence
implementation. Lets drop i915_sw_fence usage from display code and
use dma_fence interfaces directly.

For this purpose stack dma fences from related objects into new plane
state. Drm_gem_plane_helper_prepare_fb can be used for fences in new
fb. Separate local implementation is used for Stacking fences from old fb
into new plane state. Then wait for these stacked fences during atomic
commit. There is no be need for separate GPU reset handling in
intel_atomic_commit_fence_wait as the fences are signaled when GPU hang is
detected and GPU is being reset.

v4:
  - Drop to_new_plane_state suffix from add_dma_resv_fences
  - Use dma_resv_usage_rw(false) (DMA_RESV_USAGE_WRITE)
v3:
  - Rename add_fences and it's parameters
  - Remove signaled check
  - Remove waiting old_plane_state fences
v2:
  - Add fences from old fb into new_plane_state->uapi.fence rather than
    into old_plane_state->uapi.fence

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231031084557.1181630-1-jouni.hogander@intel.com
(cherry picked from commit d59cf7bb73f3c702112a5a07824254345b7d089f)
---
 drivers/gpu/drm/i915/display/intel_atomic.c   |  3 -
 .../gpu/drm/i915/display/intel_atomic_plane.c | 83 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_display.c  | 68 ++++-----------
 .../drm/i915/display/intel_display_types.h    |  2 -
 4 files changed, 61 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 5d18145da279..ec0d5168b503 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -331,9 +331,6 @@ void intel_atomic_state_free(struct drm_atomic_state *_state)
 
 	drm_atomic_state_default_release(&state->base);
 	kfree(state->global_objs);
-
-	i915_sw_fence_fini(&state->commit_ready);
-
 	kfree(state);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index e90e96061f48..a71170a0666d 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -31,7 +31,10 @@
  * prepare/check/commit/cleanup steps.
  */
 
+#include <linux/dma-fence-chain.h>
+
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 
@@ -1016,6 +1019,41 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 	return 0;
 }
 
+static int add_dma_resv_fences(struct dma_resv *resv,
+			       struct drm_plane_state *new_plane_state)
+{
+	struct dma_fence *fence = dma_fence_get(new_plane_state->fence);
+	struct dma_fence *new;
+	int ret;
+
+	ret = dma_resv_get_singleton(resv, dma_resv_usage_rw(false), &new);
+	if (ret)
+		goto error;
+
+	if (new && fence) {
+		struct dma_fence_chain *chain = dma_fence_chain_alloc();
+
+		if (!chain) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		dma_fence_chain_init(chain, fence, new, 1);
+		fence = &chain->base;
+
+	} else if (new) {
+		fence = new;
+	}
+
+	dma_fence_put(new_plane_state->fence);
+	new_plane_state->fence = fence;
+	return 0;
+
+error:
+	dma_fence_put(fence);
+	return ret;
+}
+
 /**
  * intel_prepare_plane_fb - Prepare fb for usage on plane
  * @_plane: drm plane to prepare for
@@ -1040,7 +1078,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(new_plane_state->uapi.state);
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
-	const struct intel_plane_state *old_plane_state =
+	struct intel_plane_state *old_plane_state =
 		intel_atomic_get_old_plane_state(state, plane);
 	struct drm_i915_gem_object *obj = intel_fb_obj(new_plane_state->hw.fb);
 	struct drm_i915_gem_object *old_obj = intel_fb_obj(old_plane_state->hw.fb);
@@ -1063,55 +1101,28 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		 * can safely continue.
 		 */
 		if (new_crtc_state && intel_crtc_needs_modeset(new_crtc_state)) {
-			ret = i915_sw_fence_await_reservation(&state->commit_ready,
-							      old_obj->base.resv,
-							      false, 0,
-							      GFP_KERNEL);
+			ret = add_dma_resv_fences(old_obj->base.resv,
+						  &new_plane_state->uapi);
 			if (ret < 0)
 				return ret;
 		}
 	}
 
-	if (new_plane_state->uapi.fence) { /* explicit fencing */
-		i915_gem_fence_wait_priority(new_plane_state->uapi.fence,
-					     &attr);
-		ret = i915_sw_fence_await_dma_fence(&state->commit_ready,
-						    new_plane_state->uapi.fence,
-						    i915_fence_timeout(dev_priv),
-						    GFP_KERNEL);
-		if (ret < 0)
-			return ret;
-	}
-
 	if (!obj)
 		return 0;
 
-
 	ret = intel_plane_pin_fb(new_plane_state);
 	if (ret)
 		return ret;
 
-	i915_gem_object_wait_priority(obj, 0, &attr);
+	ret = drm_gem_plane_helper_prepare_fb(&plane->base, &new_plane_state->uapi);
+	if (ret < 0)
+		goto unpin_fb;
 
-	if (!new_plane_state->uapi.fence) { /* implicit fencing */
-		struct dma_resv_iter cursor;
-		struct dma_fence *fence;
-
-		ret = i915_sw_fence_await_reservation(&state->commit_ready,
-						      obj->base.resv, false,
-						      i915_fence_timeout(dev_priv),
-						      GFP_KERNEL);
-		if (ret < 0)
-			goto unpin_fb;
+	if (new_plane_state->uapi.fence) {
+		i915_gem_fence_wait_priority(new_plane_state->uapi.fence,
+					     &attr);
 
-		dma_resv_iter_begin(&cursor, obj->base.resv,
-				    DMA_RESV_USAGE_WRITE);
-		dma_resv_for_each_fence_unlocked(&cursor, fence) {
-			intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
-							     fence);
-		}
-		dma_resv_iter_end(&cursor);
-	} else {
 		intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						     new_plane_state->uapi.fence);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d4b4334d0f6f..b27b533f03d6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -50,6 +50,7 @@
 #include "g4x_dp.h"
 #include "g4x_hdmi.h"
 #include "hsw_ips.h"
+#include "i915_config.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "i915_utils.h"
@@ -7056,29 +7057,22 @@ void intel_atomic_helper_free_state_worker(struct work_struct *work)
 
 static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_state)
 {
-	struct wait_queue_entry wait_fence, wait_reset;
-	struct drm_i915_private *dev_priv = to_i915(intel_state->base.dev);
-
-	init_wait_entry(&wait_fence, 0);
-	init_wait_entry(&wait_reset, 0);
-	for (;;) {
-		prepare_to_wait(&intel_state->commit_ready.wait,
-				&wait_fence, TASK_UNINTERRUPTIBLE);
-		prepare_to_wait(bit_waitqueue(&to_gt(dev_priv)->reset.flags,
-					      I915_RESET_MODESET),
-				&wait_reset, TASK_UNINTERRUPTIBLE);
-
+	struct drm_i915_private *i915 = to_i915(intel_state->base.dev);
+	struct drm_plane *plane;
+	struct drm_plane_state *new_plane_state;
+	int ret, i;
 
-		if (i915_sw_fence_done(&intel_state->commit_ready) ||
-		    test_bit(I915_RESET_MODESET, &to_gt(dev_priv)->reset.flags))
-			break;
+	for_each_new_plane_in_state(&intel_state->base, plane, new_plane_state, i) {
+		if (new_plane_state->fence) {
+			ret = dma_fence_wait_timeout(new_plane_state->fence, false,
+						     i915_fence_timeout(i915));
+			if (ret <= 0)
+				break;
 
-		schedule();
+			dma_fence_put(new_plane_state->fence);
+			new_plane_state->fence = NULL;
+		}
 	}
-	finish_wait(&intel_state->commit_ready.wait, &wait_fence);
-	finish_wait(bit_waitqueue(&to_gt(dev_priv)->reset.flags,
-				  I915_RESET_MODESET),
-		    &wait_reset);
 }
 
 static void intel_atomic_cleanup_work(struct work_struct *work)
@@ -7404,32 +7398,6 @@ static void intel_atomic_commit_work(struct work_struct *work)
 	intel_atomic_commit_tail(state);
 }
 
-static int
-intel_atomic_commit_ready(struct i915_sw_fence *fence,
-			  enum i915_sw_fence_notify notify)
-{
-	struct intel_atomic_state *state =
-		container_of(fence, struct intel_atomic_state, commit_ready);
-
-	switch (notify) {
-	case FENCE_COMPLETE:
-		/* we do blocking waits in the worker, nothing to do here */
-		break;
-	case FENCE_FREE:
-		{
-			struct drm_i915_private *i915 = to_i915(state->base.dev);
-			struct intel_atomic_helper *helper =
-				&i915->display.atomic_helper;
-
-			if (llist_add(&state->freed, &helper->free_list))
-				queue_work(i915->unordered_wq, &helper->free_work);
-			break;
-		}
-	}
-
-	return NOTIFY_DONE;
-}
-
 static void intel_atomic_track_fbs(struct intel_atomic_state *state)
 {
 	struct intel_plane_state *old_plane_state, *new_plane_state;
@@ -7452,10 +7420,6 @@ int intel_atomic_commit(struct drm_device *dev, struct drm_atomic_state *_state,
 
 	state->wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
 
-	drm_atomic_state_get(&state->base);
-	i915_sw_fence_init(&state->commit_ready,
-			   intel_atomic_commit_ready);
-
 	/*
 	 * The intel_legacy_cursor_update() fast path takes care
 	 * of avoiding the vblank waits for simple cursor
@@ -7488,7 +7452,6 @@ int intel_atomic_commit(struct drm_device *dev, struct drm_atomic_state *_state,
 	if (ret) {
 		drm_dbg_atomic(&dev_priv->drm,
 			       "Preparing state failed with %i\n", ret);
-		i915_sw_fence_commit(&state->commit_ready);
 		intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
 		return ret;
 	}
@@ -7504,8 +7467,6 @@ int intel_atomic_commit(struct drm_device *dev, struct drm_atomic_state *_state,
 		struct intel_crtc *crtc;
 		int i;
 
-		i915_sw_fence_commit(&state->commit_ready);
-
 		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
 			intel_color_cleanup_commit(new_crtc_state);
 
@@ -7519,7 +7480,6 @@ int intel_atomic_commit(struct drm_device *dev, struct drm_atomic_state *_state,
 	drm_atomic_state_get(&state->base);
 	INIT_WORK(&state->base.commit_work, intel_atomic_commit_work);
 
-	i915_sw_fence_commit(&state->commit_ready);
 	if (nonblock && state->modeset) {
 		queue_work(dev_priv->display.wq.modeset, &state->base.commit_work);
 	} else if (nonblock) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index df2681258ef1..b5e4b94c129b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -672,8 +672,6 @@ struct intel_atomic_state {
 
 	bool rps_interactive;
 
-	struct i915_sw_fence commit_ready;
-
 	struct llist_node freed;
 };
 
-- 
2.34.1

