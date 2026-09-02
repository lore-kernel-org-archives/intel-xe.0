Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED72DC624D9
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C20D10F066;
	Wed,  2 Sep 2026 08:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFJcNkuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5E110F051;
 Wed,  2 Sep 2026 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788337074; x=1819873074;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UYssTErCcN/6fkCcO8A0lqwdyMty0EUeHSqBTCebkr8=;
 b=aFJcNkuQlAikNQjJ7k7owzDoD/Af1a3BkEdrqHWSUvYjdDvHGKMjE9cC
 I6kJNy5fqQsaT8jfLumirTUuP0ltBu88SPHP5cNSW3BpVRazC5+8D+G8G
 B2KMl/0pp0TtQkG4Lv+1xoIRvV1evXUGxmKEDr654cEcLLGCg+OAvqWQy
 xs4z2M+67JDfHmqAVs3U5pohW+Hy/UJPtI+e0TakYePbHzqx/lDAMihv/
 IlL1nP4p0x9HrBR96IvKipXUzlmbprTzRkRXOckUsUzoY6wZB9pd5iVsr
 +Dv7iDeeGqzGMxCKcbqE+94Ip+2vPmNaPQKL1go7CTBuWoNhXHYANAJL+ A==;
X-CSE-ConnectionGUID: xGWXNqTtRCuxadw5I3h5Dw==
X-CSE-MsgGUID: gHeZJRNFSyOnl8BQAVBSvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100299813"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="100299813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:17:54 -0700
X-CSE-ConnectionGUID: NjLQ1PloTRKZ0aY0G6NOUQ==
X-CSE-MsgGUID: DEAcJr32SNWfomgd/WRxsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="263193667"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2026 01:17:53 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [CI 2/9] drm/i915/display: extract glk_plane_color_ctl_input_csc
 helper
Date: Wed,  2 Sep 2026 13:24:10 +0530
Message-ID: <20260902075417.656673-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
References: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
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

Extract the input CSC and YUV range correction logic from
glk_plane_color_ctl() into a dedicated glk_plane_color_ctl_input_csc()
helper. No functional change.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/skl_universal_plane.c    | 32 +++++++++++--------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 5cda1ab90e40..f6db8ee691a2 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1245,37 +1245,43 @@ static u32 glk_plane_color_ctl_crtc(const struct intel_crtc_state *crtc_state)
 	return plane_color_ctl;
 }
 
-static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
+static u32 glk_plane_color_ctl_input_csc(const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	u32 plane_color_ctl = 0;
-
-	plane_color_ctl |= PLANE_COLOR_PLANE_GAMMA_DISABLE;
-	plane_color_ctl |= glk_plane_color_ctl_alpha(plane_state);
+	u32 ctl = 0;
 
 	if (fb->format->is_yuv && !icl_is_hdr_plane(display, plane->id)) {
 		switch (plane_state->hw.color_encoding) {
 		case DRM_COLOR_YCBCR_BT709:
-			plane_color_ctl |= PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709;
+			ctl |= PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709;
 			break;
 		case DRM_COLOR_YCBCR_BT2020:
-			plane_color_ctl |=
-				PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020;
+			ctl |= PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020;
 			break;
 		default:
-			plane_color_ctl |=
-				PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601;
+			ctl |= PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601;
 		}
 		if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
-			plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
+			ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
 	} else if (fb->format->is_yuv) {
-		plane_color_ctl |= PLANE_COLOR_INPUT_CSC_ENABLE;
+		ctl |= PLANE_COLOR_INPUT_CSC_ENABLE;
 		if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
-			plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
+			ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
 	}
 
+	return ctl;
+}
+
+static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
+{
+	u32 plane_color_ctl = 0;
+
+	plane_color_ctl |= PLANE_COLOR_PLANE_GAMMA_DISABLE;
+	plane_color_ctl |= glk_plane_color_ctl_alpha(plane_state);
+	plane_color_ctl |= glk_plane_color_ctl_input_csc(plane_state);
+
 	if (plane_state->force_black)
 		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
 
-- 
2.50.1

