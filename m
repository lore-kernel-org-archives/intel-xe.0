Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA455EA4FBB
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7CF10E39F;
	Mon, 23 Feb 2026 13:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxMViMXn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DEE10E39E;
 Mon, 23 Feb 2026 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771852273; x=1803388273;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J2vhozv/YvZShZIfb1naQVw5qy+u2SyNnAYnmLriOrc=;
 b=MxMViMXnyQ2x2LV2QRqvPgpkFBnSbd4MIk9uMlhW/naUWrN+LlWJ9apT
 F5nUdkf4WK9ycUuzOGNr15Uuf72JQ8jzShnxfkf7nkqEYb02MNe0CSgco
 oTTy3OL3Uok3cggI4y/eJ9JlBYD7Ou87dpWcgU0oqGFvOiz8E4RR9DKPe
 PYicqgZGgxGhe5LlBMU3lwYt6yBwZpVm6LJNyOcNnIc0B+8Yq0QnQZael
 CNK+C7C3c01YXeWXqGtKeUSZHYFNpTO0ADmPNaxmPLyvL3liRa2pV82ry
 PVRflY1fvPNsHnK3BMB833ZpPS6YDi2k5Zg9UOMOTpbyXXpYdSVWVzYac Q==;
X-CSE-ConnectionGUID: Z1ggkM3ARyOJZS8taSRZYw==
X-CSE-MsgGUID: 9RHXMVRTSKGt53CrhAp6fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72723026"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72723026"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:11:13 -0800
X-CSE-ConnectionGUID: tbfHqhOVSJWs7wd0ahR3HQ==
X-CSE-MsgGUID: 5nAm8neYR9yiVKCECValrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215575372"
Received: from rvuia-mobl.ger.corp.intel.com (HELO vgovind2-mobl4.intel.com)
 ([10.245.245.209])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:11:11 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
Subject: [PATCH] drm/i915/fbc: remove uint16 from supported fbc formats in
 xe3plpd
Date: Mon, 23 Feb 2026 15:10:51 +0200
Message-ID: <20260223131051.180311-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

As UINT16 pixel formats are not listed as supported formats in any
of the display versions so far, there is no point is having these
formats listed as supported for FBC. So remove the UINT16 formats
from the supported formats for FBC.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 9f39b6990bbd..cf4d145d6a8c 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1204,15 +1204,7 @@ static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state *p
 	if (xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
 		return true;
 
-	switch (fb->format->format) {
-	case DRM_FORMAT_XRGB16161616:
-	case DRM_FORMAT_XBGR16161616:
-	case DRM_FORMAT_ARGB16161616:
-	case DRM_FORMAT_ABGR16161616:
-		return true;
-	default:
-		return false;
-	}
+	return false;
 }
 
 bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_state)
-- 
2.43.0

