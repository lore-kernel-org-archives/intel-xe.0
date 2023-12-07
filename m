Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA246C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 11:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E95B10E886;
	Thu,  7 Dec 2023 11:17:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF76310E884
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 11:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701947853; x=1733483853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+GBf83d6hprNNiPcleJ2FFD0lzgNqzV41G6cWV0OIq8=;
 b=KERs1hlPG1sHlIpY8i1/lgfRwZdZfYgEK1qNznd5AMmAa5t1LS7qSsaO
 oPm/IgGqo65ngmVk72qOXP6b5+d8FH3Sw5IDSw9k9EZ/Hn8Hql1Mp31Cl
 cCL7k51fet/uClDIZmIYseGroEtq7Tw8d1C7wphWrSIhHtfNLQpSsXSZ+
 LqaN0jliTu+uItXqfVJ5ckg5gSohaI248364fEItSpxpOzPf+PEa9Q2Ut
 vNotSrndQe+AHvOnffb1bE47OcLbUxqCnLuhhSYkUz8cUwURwJc0y/Xvn
 9TLBaNKwl6SMabUYfFVRpk/vsNzIQCyzhjKj6GaWYhrSfriAGQSCyXcQM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460704544"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460704544"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837686046"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837686046"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:32 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/9] fixup! FIXME: drm/i915/display: Remaining changes to make
 xe compile
Date: Thu,  7 Dec 2023 13:17:03 +0200
Message-Id: <20231207111706.2293105-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207111706.2293105-1-jouni.hogander@intel.com>
References: <20231207111706.2293105-1-jouni.hogander@intel.com>
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

We have now everything to build intel_display.c as it is without any
ifdefs. Thus revert local changes from intel_display.c.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 35 --------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5069b31bf1b7..c3a3a4c3b363 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -42,10 +42,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 
-#ifdef I915
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_object.h"
-#endif
 
 #include "g4x_dp.h"
 #include "g4x_hdmi.h"
@@ -7095,39 +7093,6 @@ static void intel_atomic_cleanup_work(struct work_struct *work)
 	intel_atomic_helper_free_state(i915);
 }
 
-#ifndef I915
-static int i915_gem_object_read_from_page(struct xe_bo *bo,
-					  u32 ofs, u64 *ptr, u32 size)
-{
-	struct ttm_bo_kmap_obj map;
-	void *virtual;
-	bool is_iomem;
-	int ret;
-
-	XE_WARN_ON(size != 8);
-
-	ret = xe_bo_lock(bo, true);
-	if (ret)
-		return ret;
-
-	ret = ttm_bo_kmap(&bo->ttm, ofs >> PAGE_SHIFT, 1, &map);
-	if (ret)
-		goto out_unlock;
-
-	ofs &= ~PAGE_MASK;
-	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
-	if (is_iomem)
-		*ptr = readq((void __iomem *)(virtual + ofs));
-	else
-		*ptr = *(u64 *)(virtual + ofs);
-
-	ttm_bo_kunmap(&map);
-out_unlock:
-	xe_bo_unlock(bo);
-	return ret;
-}
-#endif
-
 static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *state)
 {
 	struct drm_i915_private *i915 = to_i915(state->base.dev);
-- 
2.34.1

