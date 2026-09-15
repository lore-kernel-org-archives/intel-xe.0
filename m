Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08075C88E77
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A807010E2CD;
	Tue, 15 Sep 2026 20:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTEPf0dL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3834010E2CD;
 Tue, 15 Sep 2026 20:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789502976; x=1821038976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YhXaOdisIZD5olbTPhaT2/IIcEcijNEE8hgLfHKKW9c=;
 b=fTEPf0dLAHKQ3eB72kfNJnBeN7o7zgNwXN/g+RP6S2orgl149puMuWK6
 KZRcQ0P5Ndcs09Lzn7tpDEplhiMQRndBd+bUsqL7DBNj2BRq11dtWppkU
 Tw1r8DoFW3C9QxinusuDcJdeeMNreCIjhsHps+fMFGo6AC/SgcixVg/97
 k9bIJjxaHwIfA84fUmthUiqIxiuZLOxj/jJqH1VLw5est5Uar8jsZGQa6
 hXT9BZd99Y07sM+7G3mkrdZSP4BnwbvNrZjZZNbtbW3EH/53e+R+TVOSQ
 M73o1fPS/3ADkmGic0uqVfvURCiejyCXe4fSu8vUh1ZtmIui+OQNrovYc w==;
X-CSE-ConnectionGUID: 7Yf9LiwQTP2aPTQ8SgK+Eg==
X-CSE-MsgGUID: jYDOHfdqQzGUedhouYBN5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89902230"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89902230"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:36 -0700
X-CSE-ConnectionGUID: mtMaZXTkTyOTe5HRTTld4Q==
X-CSE-MsgGUID: w7Ib5CmPS8iowq9cccFqwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="268840545"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 02/10] drm/intel: rename i915_gtt_view_is_*() helpers to
 intel_gtt_view_is_*()
Date: Tue, 15 Sep 2026 23:09:13 +0300
Message-ID: <3e2e9cc19d08d372d065d31014dd3f5ce978f603.1789502902.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
References: <cover.1789502902.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Make the i915_gtt_view_is_*() helpers less i915 specific, and rename
them intel_gtt_view_is_*().

$ sed -i 's/i915_gtt_view_is_/intel_gtt_view_is_/g' -- $(git grep -l i915_gtt_view_is_)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 8 ++++----
 include/drm/intel/gtt_view_types.h      | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index c3e4c3f6d8cf..63b7644c5659 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1289,7 +1289,7 @@ bool intel_plane_uses_fence(const struct intel_plane_state *plane_state)
 
 	return intel_plane_needs_fence(display) ||
 		(plane->fbc && !plane_state->no_fbc_reason &&
-		 i915_gtt_view_is_normal(&plane_state->view.gtt));
+		 intel_gtt_view_is_normal(&plane_state->view.gtt));
 }
 
 static int intel_fb_pitch(const struct intel_framebuffer *fb, int color_plane, unsigned int rotation)
@@ -1511,7 +1511,7 @@ static u32 calc_plane_remap_info(const struct intel_framebuffer *fb, int color_p
 			       plane_view_height_tiles(fb, color_plane, dims, y));
 	}
 
-	if (i915_gtt_view_is_rotated(&view->gtt)) {
+	if (intel_gtt_view_is_rotated(&view->gtt)) {
 		drm_WARN_ON(display->drm, remap_info->linear);
 		check_array_bounds(display, view->gtt.rotated.plane, color_plane);
 
@@ -1536,7 +1536,7 @@ static u32 calc_plane_remap_info(const struct intel_framebuffer *fb, int color_p
 		/* rotate the tile dimensions to match the GTT view */
 		swap(tile_width, tile_height);
 	} else {
-		drm_WARN_ON(display->drm, !i915_gtt_view_is_remapped(&view->gtt));
+		drm_WARN_ON(display->drm, !intel_gtt_view_is_remapped(&view->gtt));
 
 		check_array_bounds(display, view->gtt.remapped.plane, color_plane);
 
@@ -1638,7 +1638,7 @@ static void intel_fb_view_init(struct intel_display *display,
 	memset(view, 0, sizeof(*view));
 	view->gtt.type = view_type;
 
-	if (i915_gtt_view_is_remapped(&view->gtt) &&
+	if (intel_gtt_view_is_remapped(&view->gtt) &&
 	    intel_fb_needs_pot_stride_remap(fb))
 		view->gtt.remapped.plane_alignment = SZ_2M / PAGE_SIZE;
 }
diff --git a/include/drm/intel/gtt_view_types.h b/include/drm/intel/gtt_view_types.h
index 35a48932e5e8..a39f7cae733b 100644
--- a/include/drm/intel/gtt_view_types.h
+++ b/include/drm/intel/gtt_view_types.h
@@ -56,17 +56,17 @@ struct i915_gtt_view {
 	};
 };
 
-static inline bool i915_gtt_view_is_normal(const struct i915_gtt_view *view)
+static inline bool intel_gtt_view_is_normal(const struct i915_gtt_view *view)
 {
 	return view->type == I915_GTT_VIEW_NORMAL;
 }
 
-static inline bool i915_gtt_view_is_remapped(const struct i915_gtt_view *view)
+static inline bool intel_gtt_view_is_remapped(const struct i915_gtt_view *view)
 {
 	return view->type == I915_GTT_VIEW_REMAPPED;
 }
 
-static inline bool i915_gtt_view_is_rotated(const struct i915_gtt_view *view)
+static inline bool intel_gtt_view_is_rotated(const struct i915_gtt_view *view)
 {
 	return view->type == I915_GTT_VIEW_ROTATED;
 }
-- 
2.47.3

