Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55CCC98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DAE10FBC4;
	Fri, 25 Sep 2026 17:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEaGtu0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDF210FBE1;
 Fri, 25 Sep 2026 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790357906; x=1821893906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=THhOtz9FxqmQWS1aQMYVlQBce7fjVJgBWokld1ecJ1U=;
 b=ZEaGtu0jqt/nEb4QqlZZs1H2vl1Byfm0NMJNeM1bsvTkyc9nzXPKIhPx
 NYdtvX0QTO4b+tMh7iw/yY0eB++9UhRVn3OCI5tZCQ1J7VywnCOuGfFnC
 P5g9qqBN7k9sXqNDLv+7Bb2IusyOpb3tsQpSuvINrrX6UxOqZcTGvWydy
 YFnXG/zq36QPf/QWKjcJccnSWwL2t0oDOyXNi1VBB3ehdrLBZuPGTalmq
 pcMMSABXdcIKl5LrzTb+E+zyD7t6TAHkqs1icWRslKN1sTTux1aPyhjMh
 Z/V9b0ufRbrL5tYElF9OonpjV71psizOCMqjiT3jCX6ZFLWj8gRAZBzK3 w==;
X-CSE-ConnectionGUID: 6MLbaqXORX2UazdAw6Msrg==
X-CSE-MsgGUID: Y5kGOm7NSOmBfRA+kBKURQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116677975"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="116677975"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 10:38:26 -0700
X-CSE-ConnectionGUID: 4VEdwJSWSGqHZdbr6HK1eQ==
X-CSE-MsgGUID: 8/5rllqQR/ib6nqoenKc5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="270874902"
Received: from chu13-desk.fm.intel.com ([10.80.209.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 10:38:25 -0700
From: Austin Hu <austin.hu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com, huchao426@gmail.com
Subject: [PATCH v4 3/3] drm/i915/fbc: nuke CFB if Plane setting (except for
 surf addr) changes
Date: Fri, 25 Sep 2026 10:36:58 -0700
Message-Id: <20260925173658.1042048-4-austin.hu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925173658.1042048-1-austin.hu@intel.com>
References: <20260925173658.1042048-1-austin.hu@intel.com>
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

When FBC Dirty Rectangle mode is enabled, any non-PLANE_SURF register
update requires fetching the full plane frame buffer from memory to
re-compress and update the CFB in stolen memory.

Check plane state attributes during atomic commits and force a full
CFB nuke if any setting other than the surface address changes.

v2: Address reviewer feedback to reuse intel_fbc_can_flip_nuke().

v3: Address reviewer feedback not to combine intel_fbc_can_flip_nuke()
    movement and changes.

Signed-off-by: Austin Hu <austin.hu@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 65 ++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 3915dea9edb1..0d3b25e7a9fc 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1510,6 +1510,7 @@ static bool intel_fbc_can_flip_nuke(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc,
 				    struct intel_plane *plane)
 {
+	struct intel_display *display = to_intel_display(state);
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_plane_state *old_plane_state =
@@ -1548,14 +1549,63 @@ static bool intel_fbc_can_flip_nuke(struct intel_atomic_state *state,
 	    intel_fbc_override_cfb_stride(new_plane_state))
 		return false;
 
+	if (!HAS_FBC_DIRTY_RECT(display))
+		return true;
+
+	/*
+	 * From BSpec about "FBC Dirty Rectangle", when Dirty Rectangle mode is
+	 * active, partial updates only apply to surface address changes. Any other
+	 * plane state modification requires Plane to fetch full-plane pixel data
+	 * from memory to re-compress and update the entire CFB in stolen memory.
+	 * Once fully re-compressed, subsequent atomic commits go ahead with FBC
+	 * dirty rectangle updates for smooth visual updates.
+	 *
+	 * So check other Plane attribute changed except for its surface address by
+	 * referring to intel_async_flip_check_hw() which also checks async flip.
+	 */
+
+	/* Includes pixel_blend_mode, color_encoding & color_range checking. */
+	if (old_plane_state->color_ctl != new_plane_state->color_ctl)
+		return false;
+
+	if (!drm_rect_equals(&old_plane_state->uapi.src,
+			     &new_plane_state->uapi.src) ||
+	    !drm_rect_equals(&old_plane_state->uapi.dst,
+			     &new_plane_state->uapi.dst))
+		return false;
+
+	if (old_plane_state->view.color_plane[0].x !=
+	    new_plane_state->view.color_plane[0].x ||
+	    old_plane_state->view.color_plane[0].y !=
+	    new_plane_state->view.color_plane[0].y)
+		return false;
+
+	if (old_plane_state->hw.rotation != new_plane_state->hw.rotation)
+		return false;
+
+	if (old_plane_state->hw.alpha != new_plane_state->hw.alpha)
+		return false;
+
+	if (skl_plane_aux_dist(old_plane_state, 0) !=
+	    skl_plane_aux_dist(new_plane_state, 0))
+		return false;
+
+	if (old_plane_state->decrypt != new_plane_state->decrypt)
+		return false;
+
+	if (old_plane_state->cus_ctl != new_plane_state->cus_ctl)
+		return false;
+
 	return true;
 }
 
 static void
-__intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
+__intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
+			       const struct intel_plane_state *plane_state,
 			       const struct intel_crtc_state *crtc_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_display *display = to_intel_display(plane_state);
 	struct intel_fbc *fbc = plane->fbc;
 	struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
@@ -1573,7 +1623,15 @@ __intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
 		return;
 	}
 
-	if (drm_rect_visible(damage)) {
+	if (!intel_fbc_can_flip_nuke(state, crtc, plane)) {
+		if (HAS_FBC_DIRTY_RECT(display))
+			drm_dbg_kms(display->drm,
+				    "[PLANE:%d:%s] Non surf addr changed for FBC DIRTY RECT\n",
+				    plane->base.base.id, plane->base.name);
+
+		/* compress the entire region due to non PLANE_SURF updating. */
+		*fbc_dirty_rect = DRM_RECT_INIT(0, y_offset, width, height);
+	} else if (drm_rect_visible(damage)) {
 		int y1, y2;
 
 		if (plane_state->hw.rotation & DRM_MODE_ROTATE_180) {
@@ -1633,8 +1691,7 @@ intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
 		mutex_lock(&fbc->lock);
 
 		if (fbc->state.plane == plane)
-			__intel_fbc_prepare_dirty_rect(plane_state,
-						       crtc_state);
+			__intel_fbc_prepare_dirty_rect(state, plane_state, crtc_state);
 
 		mutex_unlock(&fbc->lock);
 	}
-- 
2.34.1

