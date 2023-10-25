Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF0BC25B6F
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 10:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0BA10E635;
	Wed, 25 Oct 2023 10:21:06 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C4410E642
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 10:20:58 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 12:20:39 +0200
Message-Id: <20231025102045.817068-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025102045.817068-1-maarten.lankhorst@linux.intel.com>
References: <20231025102045.817068-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/10] FIXME drm/i915/display: Use
 fence->set_deadline to boost requests
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

Instead of using a i915 specific method, use the generic helper to
combine fences and set the deadline.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c | 47 ++++---------------
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +
 2 files changed, 11 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index dd65498166fbf..98a59445e6f45 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1033,7 +1033,6 @@ static int
 intel_prepare_plane_fb(struct drm_plane *_plane,
 		       struct drm_plane_state *_new_plane_state)
 {
-	struct i915_sched_attr attr = { .priority = I915_PRIORITY_DISPLAY };
 	struct intel_plane *plane = to_intel_plane(_plane);
 	struct intel_plane_state *new_plane_state =
 		to_intel_plane_state(_new_plane_state);
@@ -1072,49 +1071,20 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
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
+	if (obj) {
+		ret = intel_plane_pin_fb(new_plane_state);
+		if (ret)
 			return ret;
 	}
 
-	if (!obj)
-		return 0;
-
-
-	ret = intel_plane_pin_fb(new_plane_state);
+	/* prepare after pinning */
+	ret = drm_gem_plane_helper_prepare_fb(_plane, _new_plane_state);
 	if (ret)
-		return ret;
+		goto unpin_fb;
 
-	i915_gem_object_wait_priority(obj, 0, &attr);
-
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
-
-		dma_resv_iter_begin(&cursor, obj->base.resv,
-				    DMA_RESV_USAGE_WRITE);
-		dma_resv_for_each_fence_unlocked(&cursor, fence) {
-			intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
-							     fence);
-		}
-		dma_resv_iter_end(&cursor);
-	} else {
+	if (new_plane_state->uapi.fence)
 		intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						     new_plane_state->uapi.fence);
-	}
 
 	/*
 	 * We declare pageflips to be interactive and so merit a small bias
@@ -1124,7 +1094,8 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	 * that are not quite steady state without resorting to forcing
 	 * maximum clocks following a vblank miss (see do_rps_boost()).
 	 */
-	intel_display_rps_mark_interactive(dev_priv, state, true);
+	if (obj)
+		intel_display_rps_mark_interactive(dev_priv, state, true);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 478b8764101a2..1b66d5adcebee 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6599,6 +6599,8 @@ static int intel_atomic_prepare_commit(struct intel_atomic_state *state)
 	if (ret < 0)
 		return ret;
 
+	drm_atomic_helper_set_fence_deadline(state->base.dev, &state->base);
+
 	for_each_new_intel_crtc_in_state(state, crtc, crtc_state, i) {
 		if (intel_crtc_needs_color_update(crtc_state))
 			intel_color_prepare_commit(crtc_state);
-- 
2.39.2

