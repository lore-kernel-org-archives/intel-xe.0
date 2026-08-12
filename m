Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65390C5CFEB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 21:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1CE10F13D;
	Wed, 12 Aug 2026 21:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/tz9GAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D926210F13D;
 Wed, 12 Aug 2026 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786571738; x=1818107738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vaNAN8OzUO4eNltZSZ7ZHdf0CI4gZtmYYe6ytCHNIhQ=;
 b=T/tz9GAWsrrzf8+zbOoipFCMD7uAKS6gVQ54uGHynQLSbwZV2CdDFWY+
 M9qO/azJrlEDD9bFASo7r/mevl7gH8a9VwMANCFI2dzLjdi0hXM+9a9gf
 04BTbXGUUXjFgTwl8hFK9zZ2wWxaNmZNZUS1aZhmVYhZ185CJXuXg0miT
 WiR6QlUq+ILqZ4tzQnN4v1PAsqoOoM4G44HtNURfB/GpT0YwSRrSNxVdD
 zf+fuSeH6OykM5As/k/TVtWDE6akrC3oYgwS2cRNg83jdU5JB9xsoT+OO
 41jGpm9WAENVsNhsFaG1L99a+SBDpQiJMhrdPAn36WeAeLzMFjaLRsO5m Q==;
X-CSE-ConnectionGUID: SekVh1sCQl6lLmEBUDrjrg==
X-CSE-MsgGUID: Af1oqLDiSzG4dFKPSE/uFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97803709"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="97803709"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 14:55:37 -0700
X-CSE-ConnectionGUID: SSctC0EJSw2m332ICUItYA==
X-CSE-MsgGUID: FaimI7XWT9SdLCDO686PXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="260456814"
Received: from chu13-desk.fm.intel.com ([10.80.209.189])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 14:55:38 -0700
From: Austin Hu <austin.hu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com
Subject: [PATCH 2/2] drm/i915/fbc: nuke CFB if Plane setting (except for surf
 addr) changes
Date: Wed, 12 Aug 2026 14:53:50 -0700
Message-Id: <20260812215350.3753102-3-austin.hu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260812215350.3753102-1-austin.hu@intel.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
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

Signed-off-by: Austin Hu <austin.hu@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 126 ++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index c0fed695af0d..6bf5c0947671 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1516,8 +1516,124 @@ static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
 		intel_fbc_is_cfb_ok(plane_state);
 }
 
+/*
+ * From BSpec about "FBC Dirty Rectangle", when Dirty Rectangle mode is active,
+ * partial updates only apply to surface address changes. Any other plane state
+ * modification requires Plane to fetch full-plane pixel data from memory to
+ * re-compress and update the entire CFB in stolen memory. Once fully
+ * re-compressed, subsequent atomic commits go ahead with FBC dirty rectangle
+ * updates for smooth visual updates.
+ *
+ * So check any Plane attribute changed except for its surface address by
+ * referring to intel_async_flip_check_hw() which also checks async flip.
+ */
+static bool intel_fbc_dirty_rect_needs_nuke(struct intel_atomic_state *state,
+					    struct intel_plane *plane)
+{
+	struct intel_display *display = to_intel_display(state);
+	const struct intel_plane_state *old_plane_state =
+		intel_atomic_get_old_plane_state(state, plane);
+	const struct intel_plane_state *new_plane_state =
+		intel_atomic_get_new_plane_state(state, plane);
+
+	/*
+	 * If the plane state isn't part of this atomic transaction or during
+	 * initial plane setup, conservatively force a full CFB nuke.
+	 */
+	if (!old_plane_state || !new_plane_state)
+		return true;
+
+	if (old_plane_state->view.color_plane[0].mapping_stride !=
+	    new_plane_state->view.color_plane[0].mapping_stride) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] Stride changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	if (old_plane_state->hw.fb->modifier !=
+	    new_plane_state->hw.fb->modifier) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] Modifier changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	if (old_plane_state->hw.fb->format != new_plane_state->hw.fb->format) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] Pixel format changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	if (old_plane_state->hw.rotation != new_plane_state->hw.rotation) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] Rotation changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	if (skl_plane_aux_dist(old_plane_state, 0) !=
+	    skl_plane_aux_dist(new_plane_state, 0)) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] AUX_DIST changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	if (!drm_rect_equals(&old_plane_state->uapi.src,
+			     &new_plane_state->uapi.src) ||
+	    !drm_rect_equals(&old_plane_state->uapi.dst,
+			     &new_plane_state->uapi.dst)) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] Size/coords changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	if (old_plane_state->hw.alpha != new_plane_state->hw.alpha) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] Alpha changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	if (old_plane_state->decrypt != new_plane_state->decrypt) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] Decryption changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	/* Includes pixel_blend_mode, color_encoding & color_range checking. */
+	if (old_plane_state->color_ctl != new_plane_state->color_ctl) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] Color ctl changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	if (old_plane_state->cus_ctl != new_plane_state->cus_ctl) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] CUS ctl changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	if (old_plane_state->view.color_plane[0].x !=
+	    new_plane_state->view.color_plane[0].x) {
+		drm_dbg_kms(display->drm,
+			    "[PLANE:%d:%s] Color plane 0 x changed in FBC DIRTY RECT\n",
+			    plane->base.base.id, plane->base.name);
+		return true;
+	}
+
+	return false;
+}
+
 static void
-__intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
+__intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
+			       const struct intel_plane_state *plane_state,
 			       const struct intel_crtc_state *crtc_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
@@ -1538,7 +1654,10 @@ __intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
 		return;
 	}
 
-	if (drm_rect_visible(damage)) {
+	if (intel_fbc_dirty_rect_needs_nuke(state, plane)) {
+		/* compress the entire region due to non PLANE_SURF updating. */
+		*fbc_dirty_rect = DRM_RECT_INIT(0, y_offset, width, height);
+	} else if (drm_rect_visible(damage)) {
 		int y1, y2;
 
 		if (plane_state->hw.rotation & DRM_MODE_ROTATE_180) {
@@ -1598,8 +1717,7 @@ intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
 		mutex_lock(&fbc->lock);
 
 		if (fbc->state.plane == plane)
-			__intel_fbc_prepare_dirty_rect(plane_state,
-						       crtc_state);
+			__intel_fbc_prepare_dirty_rect(state, plane_state, crtc_state);
 
 		mutex_unlock(&fbc->lock);
 	}
-- 
2.34.1

