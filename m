Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69027C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C1E10F11B;
	Thu, 27 Aug 2026 16:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtVY8qXi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F41310EFE6;
 Thu, 27 Aug 2026 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787849086; x=1819385086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=voTasEmsTU4CBrJfVrDTDR2mncLt9rYkxRdOES2rjIU=;
 b=FtVY8qXiE+/KtABZhrA9uEoGl05DAtQrM990FnycWR36jVtrHD2hUnlY
 2Gb4KKnoQyrXWpdkSg8kk2Z+NGZkTeLQLel0jRiGrCkzOUUcvaMoLuFjr
 XjFwqbqaEJiqcgPkXgbdQ08mHwRKsoy8a1YqEZwM5BrOo0CRCbm5jegIs
 cm56JC8atd4I2J/uF4kvdAKFlp+7MFnJTBabJswTpqxtxaN/NUTtuX6nr
 HNtZA7Pn4830LIzGdSvqekLLdFUWYHElAiMJIXtcLHB11FsErQVDqjF6t
 c1sPi78FOoovMhNz1wr7/0LjJILhu/m8Rw3c4f4dTFYFHisp1fe0HoBrc g==;
X-CSE-ConnectionGUID: lwnd8lzYQh2wVqotzn5YXw==
X-CSE-MsgGUID: PfYGDik8TfyF0kvt7kOvHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88276132"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88276132"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:44:46 -0700
X-CSE-ConnectionGUID: n6KnQ8w0TQGdkP1OfWyOxg==
X-CSE-MsgGUID: VY324/XtSxqq9XDj6yJUCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="306134055"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 27 Aug 2026 09:44:44 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 2/5] drm/i915/cursor: Add helper to update cursor plane
Date: Thu, 27 Aug 2026 22:12:00 +0530
Message-Id: <20260827164203.2371794-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827164203.2371794-1-nemesa.garg@intel.com>
References: <20260827164203.2371794-1-nemesa.garg@intel.com>
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

