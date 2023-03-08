Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4FBC678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 12:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4B210E2CA;
	Wed,  8 Mar 2023 12:30:31 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB84710E10F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678278630; x=1709814630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0jp9YFF+hc8AIyi+K8HQXZ0FyzgG3oEiA253dH6bey8=;
 b=AxGPiK9z44aZsmYXzV3iCVQ9Y3BasWv5XNdSUg0Oz/IFUT5Tx0skGMuC
 tyVnzS0Jt6OMuojW69+QLtmaM2PAmu8z6oHySqwDSSIVLS5HzojcXljW/
 GK9j6cEF/gMz/q23D461zA+kEimhVLpgmRTaIhf8E7zqHkKYY4LmO1DD4
 0CvzKe52cXNjlwA/2IKVh0bXqG24bkOaNEK0USeUfxsYLfp+EsjcFvMeY
 3HuptTndfwmggbMJZr9OajXvWSURBFUQJSgrDaGKNnY5LYlWJLP+7qYwv
 +v7C7HJttxUj/6Oj0/d/FPMv0CmTlWE9gpr6PgE9xwLeKUM2FlmwKHbTL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324452366"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="324452366"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 04:30:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="670312564"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="670312564"
Received: from jlenoir-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.24.168])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 04:30:28 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Mar 2023 12:30:07 +0000
Message-Id: <20230308123012.247091-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308123012.247091-1-matthew.auld@intel.com>
References: <20230308123012.247091-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/6] drm/xe: add
 xe_ttm_stolen_cpu_access_needs_ggtt()
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

xe_ttm_stolen_cpu_inaccessible() was originally meant to just cover the
case where stolen is not directly CPU accessible on some older
integrated platforms, and as such a GGTT mapping was also required for
CPU access (as per the check in xe_bo_create_pin_map_at()).

However with small-bar systems on dgfx we have one more case where
stolen is also inaccessible, however here we don't have any fallback
GGTT mode for CPU access. Fix the check in xe_bo_create_pin_map_at() to
make this distinction clear. In such a case the later vmap() will fail
anyway.

v2: fix kernel-doc warning
v3: Simplify further and remove cpu_inaccessible()

Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c             |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 39 ++++++++------------------
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  2 +-
 3 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bfd3f6f2e9a..876f77669104 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1151,7 +1151,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
 	u64 end = offset == ~0ull ? offset : start + size;
 
 	if (flags & XE_BO_CREATE_STOLEN_BIT &&
-	    xe_ttm_stolen_cpu_inaccessible(xe))
+	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_CREATE_GGTT_BIT;
 
 	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 2e8d07ad42ae..0ad0f1820f4b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -38,32 +38,17 @@ to_stolen_mgr(struct ttm_resource_manager *man)
 }
 
 /**
- * xe_ttm_stolen_cpu_inaccessible - Can we directly CPU access stolen memory for
- * this device.
+ * xe_ttm_stolen_cpu_access_needs_ggtt - If we can't directly CPU access stolen,
+ * can we then fallback to mapping through the GGTT.
  * @xe: xe device
  *
- * On some integrated platforms we can't directly access stolen via the CPU
- * (like some normal system memory).  Also on small-bar systems for discrete,
- * since stolen is always as the end of normal VRAM, and the BAR likely doesn't
- * stretch that far. However CPU access of stolen is generally rare, and at
- * least on discrete should not be needed.
- *
- * If this is indeed inaccessible then we fallback to using the GGTT mappable
- * aperture for CPU access. On discrete platforms we have no such thing, so when
- * later attempting to CPU map the memory an error is instead thrown.
+ * Some older integrated platforms don't support reliable CPU access for stolen,
+ * however on such hardware we can always use the mappable part of the GGTT for
+ * CPU access. Check if that's the case for this device.
  */
-bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe)
+bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
 {
-	struct ttm_resource_manager *ttm_mgr =
-		ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
-	struct xe_ttm_stolen_mgr *mgr;
-
-	if (!ttm_mgr)
-		return true;
-
-	mgr = to_stolen_mgr(ttm_mgr);
-
-	return !mgr->io_base || GRAPHICS_VERx100(xe) < 1270;
+	return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
 }
 
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
@@ -172,7 +157,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
 		    stolen_size);
 
-	if (!xe_ttm_stolen_cpu_inaccessible(xe))
+	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
 }
 
@@ -185,7 +170,7 @@ u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
 
 	XE_BUG_ON(!mgr->io_base);
 
-	if (!IS_DGFX(xe) && xe_ttm_stolen_cpu_inaccessible(xe))
+	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
 
 	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
@@ -251,10 +236,10 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
 	if (!mgr || !mgr->io_base)
 		return -EIO;
 
-	if (!xe_ttm_stolen_cpu_inaccessible(xe))
-		return __xe_ttm_stolen_io_mem_reserve_bar2(xe, mgr, mem);
-	else
+	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		return __xe_ttm_stolen_io_mem_reserve_stolen(xe, mgr, mem);
+	else
+		return __xe_ttm_stolen_io_mem_reserve_bar2(xe, mgr, mem);
 }
 
 u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
index 2fda97b97a05..1777245ff810 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
@@ -14,7 +14,7 @@ struct xe_device;
 
 void xe_ttm_stolen_mgr_init(struct xe_device *xe);
 int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
-bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe);
+bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
 u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe);
 
-- 
2.39.2

