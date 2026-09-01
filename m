Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F5CC624C6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 07:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E670910EB7B;
	Tue,  1 Sep 2026 07:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJAQJfhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABDF10EB73;
 Tue,  1 Sep 2026 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788247861; x=1819783861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=voTasEmsTU4CBrJfVrDTDR2mncLt9rYkxRdOES2rjIU=;
 b=UJAQJfhEQHuZzL+sBxoV36BrissjTMx4XAyaVm6lwzb1rf8MNpFE2vYx
 5Ha0XIE04Nk934n92zuPmfIO4obyVmyfzTnhoFrxYURjSxcMRw2ls2IQb
 bfZEVtpVWzNIZhaiGc1QOrGx8NAbPZUZ185EqEZlKwRYGTwlzmKFMFIJc
 Fj80NreoYPtsCaWhXyljrrPj/HdFGqxsBf2URcwYfBPzFLsk/yGLtj8Vu
 YCEd0v747ib5k2CWH9lRMKwSbgPPgMrOGOjDXhb81jUy/hvBIK8aXAqty
 boAKYaap6nTrQZLS7z0JMHSs7mwtDZkzc3SKeVaudeVyKKay+Wu/ZO+Sk g==;
X-CSE-ConnectionGUID: Fc7Zgj0ISkepdPBhkyfVnA==
X-CSE-MsgGUID: ernNHe+GRguop2lxvE8paQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88691991"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88691991"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 00:31:00 -0700
X-CSE-ConnectionGUID: kmuWyvQuSZq0vTwVYS/5Wg==
X-CSE-MsgGUID: XHfuu+vFSZ60+8eaHQqD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="272803098"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa004.jf.intel.com with ESMTP; 01 Sep 2026 00:30:59 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 2/5] drm/i915/cursor: Add helper to update cursor plane
Date: Tue,  1 Sep 2026 12:58:10 +0530
Message-Id: <20260901072813.2596383-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901072813.2596383-1-nemesa.garg@intel.com>
References: <20260901072813.2596383-1-nemesa.garg@intel.com>
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

Move cursor fast path plane state update into helper
function. The target hw.crtc is passed as a parameter
so a later patch can reuse the helper for joiner
secondary pipes, where hw.crtc points at the secondary
being programmed while uapi.crtc stays on the primary.

v4: Drop uapi.crtc assignment from the helper. [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 39 ++++++++++++++-------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 47ddb213e547..b57b446b9788 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -845,6 +845,29 @@ intel_cursor_joiner_commits_idle(struct intel_display *display,
 	return true;
 }
 
+static void
+intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
+					 struct drm_framebuffer *fb,
+					 struct intel_crtc *hw_crtc,
+					 int crtc_x, int crtc_y,
+					 unsigned int crtc_w, unsigned int crtc_h,
+					 u32 src_x, u32 src_y,
+					 u32 src_w, u32 src_h)
+{
+	drm_atomic_set_fb_for_plane(&plane_state->uapi, fb);
+
+	plane_state->uapi.src_x = src_x;
+	plane_state->uapi.src_y = src_y;
+	plane_state->uapi.src_w = src_w;
+	plane_state->uapi.src_h = src_h;
+	plane_state->uapi.crtc_x = crtc_x;
+	plane_state->uapi.crtc_y = crtc_y;
+	plane_state->uapi.crtc_w = crtc_w;
+	plane_state->uapi.crtc_h = crtc_h;
+
+	intel_plane_copy_uapi_to_hw_state(NULL, plane_state, plane_state, hw_crtc);
+}
+
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -920,18 +943,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		goto out_free;
 	}
 
-	drm_atomic_set_fb_for_plane(&new_plane_state->uapi, fb);
-
-	new_plane_state->uapi.src_x = src_x;
-	new_plane_state->uapi.src_y = src_y;
-	new_plane_state->uapi.src_w = src_w;
-	new_plane_state->uapi.src_h = src_h;
-	new_plane_state->uapi.crtc_x = crtc_x;
-	new_plane_state->uapi.crtc_y = crtc_y;
-	new_plane_state->uapi.crtc_w = crtc_w;
-	new_plane_state->uapi.crtc_h = crtc_h;
-
-	intel_plane_copy_uapi_to_hw_state(NULL, new_plane_state, new_plane_state, crtc);
+	intel_cursor_fastpath_update_plane_state(new_plane_state, fb,
+						 crtc,
+						 crtc_x, crtc_y, crtc_w, crtc_h,
+						 src_x, src_y, src_w, src_h);
 
 	ret = intel_plane_atomic_check_with_state(crtc_state, new_crtc_state,
 						  old_plane_state, new_plane_state);
-- 
2.25.1

