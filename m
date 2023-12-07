Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD14C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DF210E06A;
	Thu,  7 Dec 2023 13:01:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93FE10E8A6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701954077; x=1733490077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DM1s/+usiSR6V5ue9o7RIDXxOeEUpyAeBiw8XWKE8OA=;
 b=bMyvofP4rARH0fhBaGHq0NpP6W9/bdhaY2i+BU1e9UR0Wq0PjDA+xXS7
 mSUQS5BA2Z7OOUEHJ0zHSqfIJQzJe0wUVzUWYQYn98h5xrQzcMmiHh42X
 2REKCwgO04pNqnlsqn0sjiiCkPg2Gnq0xUUZ9B6fmb2dc3kAbwObE4D6W
 9YqRrF4eowE705QNZkAZihDVAOXpQYDyNPdiOeaP6WuJXVADBU0Ov+M1h
 J/81NDGAdlZIy82HUnMwN7j3o5OtmRbQAfHS3DyDgW7Tx+F4tiCO8Hd7j
 6FGbDa1Ucman5WoA7IfeGWZX0ZUsNWJdpbna9qQHd9EoAm5bKfxpFqUCw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1309002"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1309002"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721454276"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721454276"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:15 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 9/9] fixup! FIXME: drm/i915/display: Remaining changes to
 make xe compile
Date: Thu,  7 Dec 2023 15:00:46 +0200
Message-Id: <20231207130046.2350822-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207130046.2350822-1-jouni.hogander@intel.com>
References: <20231207130046.2350822-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are defining I915_TILING_X and  I915_TILING_Y as 0. No need for these
ifdefs anymore.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ae6bad4407eb..5522d6725474 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2441,15 +2441,11 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		fb->modifier = DRM_FORMAT_MOD_LINEAR;
 		break;
 	case PLANE_CTL_TILED_X:
-#ifdef I915
 		plane_config->tiling = I915_TILING_X;
-#endif
 		fb->modifier = I915_FORMAT_MOD_X_TILED;
 		break;
 	case PLANE_CTL_TILED_Y:
-#ifdef I915
 		plane_config->tiling = I915_TILING_Y;
-#endif
 		if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
 			if (DISPLAY_VER(dev_priv) >= 14)
 				fb->modifier = I915_FORMAT_MOD_4_TILED_MTL_RC_CCS;
-- 
2.34.1

