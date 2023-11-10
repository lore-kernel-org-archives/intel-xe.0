Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4F1C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 22:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB2910E2A4;
	Fri, 10 Nov 2023 22:46:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9978310E2A4
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699656407; x=1731192407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U6JJeGA+I+6gP4tJSalTMjV8N2aWRBkTtJEKIBwTwS8=;
 b=hGoibyhF5DfWSXI5fUA2nafntX2/ofOqpROXR+E5e6UMzzkn1pVUGEXa
 JMm47Ybapft2IakCePrlT7A2HEzXJ7HOVXnQ3x9D46w+bndvUyZS31i/a
 pgQ0CGOa2EJU/MSjvqi0MHL6HbNudX1U+3H6SNAZarym6O+Dc/woDQl78
 bUfpk/90JGLkqB9JhJbkkuj2gh9DDrSVGj/PAsW58d20v7IAzsfOXpsyz
 bvsAtjt2oTCVVnF0PGeeIw5Yt2hj5dz+27Pgm0r5J6tpeeaLFp85xWhbP
 oMiFrr52V5g7RwtN4Y5e+id974kQiDUmbgV86oHxXk1/Bjs4ZeZ5jTSW9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387404337"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="387404337"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 14:46:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1095278199"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="1095278199"
Received: from sschumil-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.111])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 14:46:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 11 Nov 2023 00:46:37 +0200
Message-Id: <20231110224640.3570307-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 1/4] Revert "FIXME: drm/i915/pxp: some hack to
 bypass pxp"
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
Cc: jani.nikula@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 7c700778c3b455c853c9ada8b85e83a550171c03.

To be replaced with a slightly cleaner abstraction.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 68eabe089aaf..a4d0e2ede2f7 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -21,11 +21,7 @@
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
-#ifdef I915
 #include "pxp/intel_pxp.h"
-#else
-// TODO: pxp?
-#endif
 
 static const u32 skl_plane_formats[] = {
 	DRM_FORMAT_C8,
@@ -1864,14 +1860,9 @@ static bool skl_fb_scalable(const struct drm_framebuffer *fb)
 
 static bool bo_has_valid_encryption(struct drm_i915_gem_object *obj)
 {
-#ifdef I915
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
 	return intel_pxp_key_check(i915->pxp, obj, false) == 0;
-#else
-#define i915_gem_object_is_protected(x) ((x) && 0)
-	return false;
-#endif
 }
 
 static bool pxp_is_borked(struct drm_i915_gem_object *obj)
-- 
2.39.2

