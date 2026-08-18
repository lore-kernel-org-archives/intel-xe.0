Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8255FC5DF80
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 08:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BC010EA5C;
	Tue, 18 Aug 2026 08:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8NYllPl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6DC10EA5C;
 Tue, 18 Aug 2026 08:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787042840; x=1818578840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dtj4wY2ZcoQ1Pl/NJofh4GMtZnh5qzWbl6NmZQLgRps=;
 b=D8NYllPl9Ete+RrZLSbYVfep67AIxQjWvIoElx6nJZsdjXnkVUupnkdZ
 txkbzs0H4TvC7ZleoDNlQ/IaJDMIVVudr9pti2qrA6xC3fedwIAJDG1XI
 ANhTsHcwtpEeg8jF8nl5uG2ME2V1RG+eKymtDjdww00UHfIqLFZQpzU8y
 5ysPoUE60ohDn/D8fSyrWCgLr/anvS9lRUWEuqDmCTmlRwp2pAqkt+/CR
 iK5ibQYAYoZ9EOlk3kr+V2jfuHeLQR71T91qlKXNZNLTJmJYHCHywgtQb
 DyOd6JzIcW0zgQgISv2TCSv7n9d3y6Fy0kZE8at8YGrouVeSYrpDnJ1aY Q==;
X-CSE-ConnectionGUID: Nwg62c+XRq2IVYZ/FLIprw==
X-CSE-MsgGUID: 2ia0r7m1R5qR8XaaxFL7bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87403742"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87403742"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:47:20 -0700
X-CSE-ConnectionGUID: iDTYoEu+TeK8FCdndLHBTg==
X-CSE-MsgGUID: iSCOPJOcR8Gw4AQOiB7G3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="267136627"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 01:47:18 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 2/6] drm/i915/cursor: Add helper to update cursor plane
Date: Tue, 18 Aug 2026 14:12:32 +0530
Message-Id: <20260818084236.2168580-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260818084236.2168580-1-nemesa.garg@intel.com>
References: <20260818084236.2168580-1-nemesa.garg@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 39 ++++++++++++++-------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index bc1e58d5c4c5..db4eaa74fc58 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -840,6 +840,29 @@ intel_cursor_joiner_commits_idle(struct intel_display *display,
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
@@ -915,18 +938,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
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

