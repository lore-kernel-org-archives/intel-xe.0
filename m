Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3A3C25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 14:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AB710E7F6;
	Thu, 26 Oct 2023 14:09:22 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0410310E7F5
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 14:09:21 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 16:09:09 +0200
Message-Id: <20231026140914.10649-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/15] revert more (fbc)
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

Should be a noop.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index cd316e0caaa4..713210f6d7c1 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -453,7 +453,6 @@ static void g4x_fbc_program_cfb(struct intel_fbc *fbc)
 
 	intel_de_write(i915, DPFC_CB_BASE,
 		       i915_gem_stolen_node_offset(&fbc->compressed_fb));
-
 }
 
 static const struct intel_fbc_funcs g4x_fbc_funcs = {
@@ -612,8 +611,10 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
+#ifdef I915
 	if (intel_gt_support_legacy_fencing(to_gt(i915)))
 		snb_fbc_program_fence(fbc);
+#endif
 
 	intel_de_write(i915, ILK_DPFC_CONTROL(fbc->id),
 		       DPFC_CTL_EN | ivb_dpfc_ctl(fbc));
@@ -800,7 +801,6 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	drm_dbg_kms(&i915->drm,
 		    "reserved %llu bytes of contiguous stolen space for FBC, limit: %d\n",
 		    i915_gem_stolen_node_size(&fbc->compressed_fb), fbc->limit);
-
 	return 0;
 
 err_llb:
@@ -978,7 +978,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc,
 				   struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	__maybe_unused struct drm_i915_private *i915 = to_i915(state->base.dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_plane_state *plane_state =
@@ -993,7 +993,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 	/* FBC1 compression interval: arbitrary choice of 1 second */
 	fbc_state->interval = drm_mode_vrefresh(&crtc_state->hw.adjusted_mode);
-
+#ifdef I915
 	fbc_state->fence_y_offset = intel_plane_fence_y_offset(plane_state);
 
 	drm_WARN_ON(&i915->drm, plane_state->flags & PLANE_HAS_FENCE &&
@@ -1002,6 +1002,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 	if (plane_state->flags & PLANE_HAS_FENCE)
 		fbc_state->fence_id =  i915_vma_fence_id(plane_state->ggtt_vma);
 	else
+#endif
 		fbc_state->fence_id = -1;
 
 	fbc_state->cfb_stride = intel_fbc_cfb_stride(plane_state);
@@ -1011,6 +1012,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 {
+#ifdef I915
 	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
 
 	/*
@@ -1028,6 +1030,9 @@ static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 	return DISPLAY_VER(i915) >= 9 ||
 		(plane_state->flags & PLANE_HAS_FENCE &&
 		 i915_vma_fence_id(plane_state->ggtt_vma) != -1);
+#else
+	return true;
+#endif
 }
 
 static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
-- 
2.40.1

