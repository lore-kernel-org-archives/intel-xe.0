Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A566C77B60
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 15:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0216210EEEB;
	Thu, 30 Mar 2023 15:40:41 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4593F10EEE9
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190834; x=1711726834;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vL55DLAMrG/8noSVEnNsRgZI3em5YFO0lNBKKPzJqYY=;
 b=mTXuBSI9u5VnEoV0qeFpS80NwwC6oL0Vm4WnG/2k5fq+HdQzFKsw44PT
 YfDS/gVjPik49Fa4omxq62hyEi0yyEgM9PLBBGEhinn0RLAdQYAaJTzvu
 lUOgqv+eVwDEy8nHwkhwGycyy22VWc06nplczicSMHpQb0trOkG7WQBtO
 QcNNPCR0dPhDAbpA87ZdKA0BZvgfGzk015j6V7gvuWVlRqLKsr/C34uHn
 zyuZVLbtVea4zwntD09dgttn6x6Vn0jlAxpLDMOdPgQb2ZAAwZsnzVCbL
 WKChmtXs/2FqwREP5lO6y2MhX0j0PnhsxbI8T/zXUBm4LCLb46nSVOhIL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406196614"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="406196614"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="930768617"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="930768617"
Received: from dut731-pvc.fm.intel.com ([10.1.40.25])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:31 -0700
From: "Chang, Bruce" <yu.bruce.chang@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Mar 2023 15:40:26 +0000
Message-Id: <20230330154026.4282-1-yu.bruce.chang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: fix pvc unload issue
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

Currently, unload pvc driver will generate a null dereference
and the call stack is as below.

[ 4850.618000] Call Trace:
[ 4850.620740]  <TASK>
[ 4850.623134]  ttm_bo_cleanup_memtype_use+0x3f/0x50 [ttm]
[ 4850.628661]  ttm_bo_release+0x154/0x2c0 [ttm]
[ 4850.633317]  ? drm_buddy_fini+0x62/0x80 [drm_buddy]
[ 4850.638487]  ? __kmem_cache_free+0x27d/0x2c0
[ 4850.643054]  ttm_bo_put+0x38/0x60 [ttm]
[ 4850.647190]  xe_gem_object_free+0x1f/0x30 [xe]
[ 4850.651945]  drm_gem_object_free+0x1e/0x30 [drm]
[ 4850.656904]  ggtt_fini_noalloc+0x9d/0xe0 [xe]
[ 4850.661574]  drm_managed_release+0xb5/0x150 [drm]
[ 4850.666617]  drm_dev_release+0x30/0x50 [drm]
[ 4850.671209]  devm_drm_dev_init_release+0x3c/0x60 [drm]

There are a couple issues, but the main one is due to TTM has only
one TTM_PL_TT region, but since pvc has 2 tiles and tries to setup
1 TTM_PL_TT each tile. The second will overwrite the first one.

During unload time, the first tile will reset the TTM_PL_TT manger
and when the second tile is trying to free Bo and it will generate
the null reference since the TTM manage is already got reset to 0.

The fix is to share the TTM_PL_TT manager and use a count to only
allow the last instance to release.

Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.c           |  9 +++++++--
 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c  | 25 +++++++++++++++----------
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 88f863edc41c..ea771f120c0f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -195,6 +195,9 @@ struct xe_device {
 			/** @mapping: pointer to VRAM mappable space */
 			void *__iomem mapping;
 		} vram;
+		/** @gtt_mr: GTT TTM manager */
+		struct xe_ttm_gtt_mgr *gtt_mgr;
+		int instance;
 	} mem;
 
 	/** @usm: unified memory state */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index fd7a5b43ba3e..e7ca141478ef 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -77,8 +77,13 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 		if (!gt->mem.vram_mgr)
 			return -ENOMEM;
 
-		gt->mem.gtt_mgr = drmm_kzalloc(drm, sizeof(*gt->mem.gtt_mgr),
-					       GFP_KERNEL);
+		if (!xe->mem.gtt_mgr) {
+			xe->mem.gtt_mgr =
+				drmm_kzalloc(drm, sizeof(*gt->mem.gtt_mgr),
+					     GFP_KERNEL);
+			xe->mem.instance = 0;
+		}
+		gt->mem.gtt_mgr = xe->mem.gtt_mgr;
 		if (!gt->mem.gtt_mgr)
 			return -ENOMEM;
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
index 8075781070f2..05300c71928e 100644
--- a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
@@ -94,6 +94,9 @@ static void ttm_gtt_mgr_fini(struct drm_device *drm, void *arg)
 	struct ttm_resource_manager *man = &mgr->manager;
 	int err;
 
+	if (--xe->mem.instance)
+		return;
+
 	ttm_resource_manager_set_used(man, false);
 
 	err = ttm_resource_manager_evict_all(&xe->ttm, man);
@@ -113,18 +116,20 @@ int xe_ttm_gtt_mgr_init(struct xe_gt *gt, struct xe_ttm_gtt_mgr *mgr,
 
 	XE_BUG_ON(xe_gt_is_media_type(gt));
 
-	mgr->gt = gt;
-	man->use_tt = true;
-	man->func = &xe_ttm_gtt_mgr_func;
-
-	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
+	if (!xe->mem.instance) {
+		mgr->gt = gt;
+		man->use_tt = true;
+		man->func = &xe_ttm_gtt_mgr_func;
 
-	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, &mgr->manager);
-	ttm_resource_manager_set_used(man, true);
+		ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
 
-	err = drmm_add_action_or_reset(&xe->drm, ttm_gtt_mgr_fini, mgr);
-	if (err)
-		return err;
+		ttm_set_driver_manager(&xe->ttm, XE_PL_TT, &mgr->manager);
+		ttm_resource_manager_set_used(man, true);
+		err = drmm_add_action_or_reset(&xe->drm, ttm_gtt_mgr_fini, mgr);
+		if (err)
+			return err;
+	}
+	xe->mem.instance ++;
 
 	return 0;
 }
-- 
2.25.1

