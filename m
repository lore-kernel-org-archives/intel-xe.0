Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06055EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 13:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22DF10E088;
	Fri, 21 Jul 2023 13:21:08 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CD710E088
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689945666; x=1721481666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=44Mp8IFBBL69UIY/140Hv9ChrAFgMC/aw0uq3BwZV/g=;
 b=nJXHVasMzEFvnk/MYynauUuDd1/oXmLRCHHI/orW5l6TJzSM/gCM8Txe
 vtXNF3LjkbA9RBb5aQ02SYnsPWXjHhJniZb4jLDCVACmku1ah2ssXxsfw
 F9i3fq3TGF0NR7/Or788iLRv5U39rJYFVzrQw7E4F3wbb1hDiAwmmf+YD
 q/EXKa8ty2OfM1/fYE1rsILErrI/clyVIw8puogpdEwXz823UvX68NubY
 vqD0Utqesp03Va7+ViBGOFIUAGjQckjm+SgqOTLvKsylxdt7oczPYAVLt
 8BZlpjGCf5/nUQwRnMsAzDlAWud6F05SQ5Z+0WbPIEnNEPFPHpsgLke4Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365914368"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="365914368"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="675043837"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="675043837"
Received: from agobando-mobl1.amr.corp.intel.com (HELO f5a11c4ff530.intel.com)
 ([10.249.37.51])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:20:47 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jul 2023 13:20:30 +0000
Message-Id: <20230721132030.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721132030.7-1-francois.dugast@intel.com>
References: <20230721132030.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: Remove uses of BUG_ON
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

BUG_ON is for when the code should stop and not execute further because
something went terribly wrong. This is not the case in many existing
uses, where recovery should be intended and BUG_ON is now replaced
with drm_err().

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                  | 105 ++++++++++++----
 drivers/gpu/drm/xe/xe_bo_evict.c            |  10 +-
 drivers/gpu/drm/xe/xe_execlist.c            |  22 +++-
 drivers/gpu/drm/xe/xe_force_wake.c          |  10 +-
 drivers/gpu/drm/xe/xe_gt_clock.c            |   5 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |   5 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  31 ++++-
 drivers/gpu/drm/xe/xe_guc.c                 |  32 +++--
 drivers/gpu/drm/xe/xe_guc_ads.c             |  35 ++++--
 drivers/gpu/drm/xe/xe_guc_hwconfig.c        |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  95 +++++++++++----
 drivers/gpu/drm/xe/xe_huc.c                 |   5 +-
 drivers/gpu/drm/xe/xe_migrate.c             |  61 ++++++++--
 drivers/gpu/drm/xe/xe_sched_job.c           |   9 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c      |  10 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 125 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_wopcm.c               |  45 +++++--
 17 files changed, 482 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 538501c46b8b..3126035c4cff 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -88,7 +88,11 @@ static bool xe_bo_is_user(struct xe_bo *bo)
 static struct xe_tile *
 mem_type_to_tile(struct xe_device *xe, u32 mem_type)
 {
-	XE_BUG_ON(mem_type != XE_PL_STOLEN && !mem_type_is_vram(mem_type));
+	if (mem_type != XE_PL_STOLEN && !mem_type_is_vram(mem_type)) {
+		drm_err(&xe->drm,
+			"mem_type != XE_PL_STOLEN && !mem_type_is_vram(mem_type)");
+		return NULL;
+	}
 
 	return &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
 }
@@ -125,7 +129,10 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 {
 	struct xe_tile *tile = mem_type_to_tile(xe, mem_type);
 
-	XE_BUG_ON(!tile->mem.vram.usable_size);
+	if (!tile->mem.vram.usable_size) {
+		drm_err(&xe->drm, "!tile->mem.vram.usable_size");
+		return;
+	}
 
 	places[*c] = (struct ttm_place) {
 		.mem_type = mem_type,
@@ -667,8 +674,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	else if (mem_type_is_vram(old_mem_type))
 		tile = mem_type_to_tile(xe, old_mem_type);
 
-	XE_BUG_ON(!tile);
-	XE_BUG_ON(!tile->migrate);
+	if (!tile) {
+		drm_err(&xe->drm, "!tile");
+		return -EINVAL;
+	}
+	if (!tile->migrate) {
+		drm_err(&xe->drm, "!tile->migrate");
+		return -EINVAL;
+	}
 
 	trace_xe_bo_move(bo);
 	xe_device_mem_access_get(xe);
@@ -698,8 +711,10 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 					goto out;
 				}
 
-				XE_BUG_ON(new_mem->start !=
-					  bo->placements->fpfn);
+				if (new_mem->start != bo->placements->fpfn) {
+					drm_err(&xe->drm, "new_mem->start != bo->placements->fpfn");
+					return -EINVAL;
+				}
 
 				iosys_map_set_vaddr_iomem(&bo->vmap, new_addr);
 			}
@@ -1159,7 +1174,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	int err;
 
 	/* Only kernel objects should set GT */
-	XE_BUG_ON(tile && type != ttm_bo_type_kernel);
+	if (tile && type != ttm_bo_type_kernel) {
+		drm_err(&xe->drm, "tile && type != ttm_bo_type_kernel");
+		return NULL;
+	}
 
 	if (XE_WARN_ON(!size))
 		return ERR_PTR(-EINVAL);
@@ -1304,7 +1322,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		if (!tile && flags & XE_BO_CREATE_STOLEN_BIT)
 			tile = xe_device_get_root_tile(xe);
 
-		XE_BUG_ON(!tile);
+		if (!tile) {
+			drm_err(&xe->drm, "!tile");
+			return NULL;
+		}
 
 		if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
 			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
@@ -1434,8 +1455,14 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
 
-	XE_BUG_ON(bo->vm);
-	XE_BUG_ON(!xe_bo_is_user(bo));
+	if (bo->vm) {
+		drm_err(&xe->drm, "bo->vm");
+		return -EINVAL;
+	}
+	if (!xe_bo_is_user(bo)) {
+		drm_err(&xe->drm, "!xe_bo_is_user(bo)");
+		return -EINVAL;
+	}
 
 	if (!xe_bo_is_pinned(bo)) {
 		err = xe_bo_validate(bo, NULL, false);
@@ -1467,20 +1494,31 @@ int xe_bo_pin(struct xe_bo *bo)
 	int err;
 
 	/* We currently don't expect user BO to be pinned */
-	XE_BUG_ON(xe_bo_is_user(bo));
+	if (xe_bo_is_user(bo)) {
+		drm_err(&xe->drm, "xe_bo_is_user(bo)");
+		return -EINVAL;
+	}
 
 	/* Pinned object must be in GGTT or have pinned flag */
-	XE_BUG_ON(!(bo->flags & (XE_BO_CREATE_PINNED_BIT |
-				 XE_BO_CREATE_GGTT_BIT)));
+	if (!(bo->flags & (XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_GGTT_BIT))) {
+		drm_err(&xe->drm, "!(bo->flags & (XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_GGTT_BIT))");
+		return -EINVAL;
+	}
 
 	/*
 	 * No reason we can't support pinning imported dma-bufs we just don't
 	 * expect to pin an imported dma-buf.
 	 */
-	XE_BUG_ON(bo->ttm.base.import_attach);
+	if (bo->ttm.base.import_attach) {
+		drm_err(&xe->drm, "bo->ttm.base.import_attach");
+		return -EINVAL;
+	}
 
 	/* We only expect at most 1 pin */
-	XE_BUG_ON(xe_bo_is_pinned(bo));
+	if (xe_bo_is_pinned(bo)) {
+		drm_err(&xe->drm, "xe_bo_is_pinned(bo)");
+		return -EINVAL;
+	}
 
 	err = xe_bo_validate(bo, NULL, false);
 	if (err)
@@ -1497,7 +1535,11 @@ int xe_bo_pin(struct xe_bo *bo)
 		bool vram;
 
 		if (mem_type_is_vram(place->mem_type)) {
-			XE_BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
+			if (!(place->flags & TTM_PL_FLAG_CONTIGUOUS)) {
+				drm_err(&xe->drm,
+					"!(place->flags & TTM_PL_FLAG_CONTIGUOUS)");
+				return -EINVAL;
+			}
 
 			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
 				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
@@ -1534,9 +1576,18 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 
-	XE_BUG_ON(bo->vm);
-	XE_BUG_ON(!xe_bo_is_pinned(bo));
-	XE_BUG_ON(!xe_bo_is_user(bo));
+	if (bo->vm) {
+		drm_err(&xe->drm, "bo->vm");
+		return;
+	}
+	if (!xe_bo_is_pinned(bo)) {
+		drm_err(&xe->drm, "!xe_bo_is_pinned(bo)");
+		return;
+	}
+	if (!xe_bo_is_user(bo)) {
+		drm_err(&xe->drm, "!xe_bo_is_user(bo)");
+		return;
+	}
 
 	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link)) {
 		spin_lock(&xe->pinned.lock);
@@ -1557,15 +1608,25 @@ void xe_bo_unpin(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 
-	XE_BUG_ON(bo->ttm.base.import_attach);
-	XE_BUG_ON(!xe_bo_is_pinned(bo));
+	if (bo->ttm.base.import_attach) {
+		drm_err(&xe->drm, "bo->ttm.base.import_attach");
+		return;
+	}
+	if (!xe_bo_is_pinned(bo)) {
+		drm_err(&xe->drm, "!xe_bo_is_pinned(bo)");
+		return;
+	}
 
 	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
 	    bo->flags & XE_BO_INTERNAL_TEST)) {
 		struct ttm_place *place = &(bo->placements[0]);
 
 		if (mem_type_is_vram(place->mem_type)) {
-			XE_BUG_ON(list_empty(&bo->pinned_link));
+			if (list_empty(&bo->pinned_link)) {
+				drm_err(&xe->drm,
+					"list_empty(&bo->pinned_link)");
+				return;
+			}
 
 			spin_lock(&xe->pinned.lock);
 			list_del_init(&bo->pinned_link);
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index f559a7f3eb3e..d14db51c3a55 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -160,8 +160,14 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		 * We expect validate to trigger a move VRAM and our move code
 		 * should setup the iosys map.
 		 */
-		XE_BUG_ON(iosys_map_is_null(&bo->vmap));
-		XE_BUG_ON(!xe_bo_is_vram(bo));
+		if (iosys_map_is_null(&bo->vmap)) {
+			drm_err(&xe->drm, "iosys_map_is_null(&bo->vmap)");
+			return -EINVAL;
+		}
+		if (!xe_bo_is_vram(bo)) {
+			drm_err(&xe->drm, "!xe_bo_is_vram(bo)");
+			return -EINVAL;
+		}
 
 		xe_bo_put(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 541f82387bb5..1c0ba0360b48 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -50,10 +50,17 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	lrc_desc = xe_lrc_descriptor(lrc);
 
 	if (GRAPHICS_VERx100(xe) >= 1250) {
-		XE_BUG_ON(!FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
+		if (!FIELD_FIT(XEHP_SW_CTX_ID, ctx_id)) {
+			drm_err(&xe->drm, "!FIELD_FIT(XEHP_SW_CTX_ID,ctx_id)");
+			return;
+		}
 		lrc_desc |= FIELD_PREP(XEHP_SW_CTX_ID, ctx_id);
 	} else {
-		XE_BUG_ON(!FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
+		if (!FIELD_FIT(GEN11_SW_CTX_ID, ctx_id)) {
+			drm_err(&xe->drm,
+				"!FIELD_FIT(GEN11_SW_CTX_ID,ctx_id)");
+			return;
+		}
 		lrc_desc |= FIELD_PREP(GEN11_SW_CTX_ID, ctx_id);
 	}
 
@@ -321,7 +328,10 @@ static int execlist_engine_init(struct xe_engine *e)
 	struct xe_device *xe = gt_to_xe(e->gt);
 	int err;
 
-	XE_BUG_ON(xe_device_guc_submission_enabled(xe));
+	if (xe_device_guc_submission_enabled(xe)) {
+		drm_err(&xe->drm, "xe_device_guc_submission_enabled(xe)");
+		return -EINVAL;
+	}
 
 	drm_info(&xe->drm, "Enabling execlist submission (GuC submission disabled)\n");
 
@@ -389,7 +399,11 @@ static void execlist_engine_fini_async(struct work_struct *w)
 	struct xe_execlist_engine *exl = e->execlist;
 	unsigned long flags;
 
-	XE_BUG_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
+	if (xe_device_guc_submission_enabled(gt_to_xe(e->gt))) {
+		drm_err(&gt_to_xe(e->gt)->drm,
+			"xe_device_guc_submission_enabled(gt_to_xe(e->gt))");
+		return;
+	}
 
 	spin_lock_irqsave(&exl->port->lock, flags);
 	if (WARN_ON(exl->active_priority != DRM_SCHED_PRIORITY_UNSET))
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 7403673d532d..6c5a8d264de8 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -45,7 +45,10 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	mutex_init(&fw->lock);
 
 	/* Assuming gen11+ so assert this assumption is correct */
-	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
+	if (GRAPHICS_VER(gt_to_xe(gt)) < 11) {
+		drm_err(&xe->drm, "GRAPHICS_VER(gt_to_xe(gt))<11");
+		return;
+	}
 
 	if (xe->info.graphics_verx100 >= 1270) {
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
@@ -67,7 +70,10 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 	int i, j;
 
 	/* Assuming gen11+ so assert this assumption is correct */
-	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
+	if (GRAPHICS_VER(gt_to_xe(gt)) < 11) {
+		drm_err(&gt_to_xe(gt)->drm, "GRAPHICS_VER(gt_to_xe(gt)) < 11");
+		return;
+	}
 
 	if (!xe_gt_is_media_type(gt))
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 932b61e0cf67..4d1250b0c800 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -58,7 +58,10 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	u32 freq = 0;
 
 	/* Assuming gen11+ so assert this assumption is correct */
-	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
+	if (GRAPHICS_VER(gt_to_xe(gt)) < 11) {
+		drm_err(&gt_to_xe(gt)->drm, "GRAPHICS_VER(gt_to_xe(gt)) < 11");
+		return -EINVAL;
+	}
 
 	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
 		freq = read_reference_ts_freq(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index e622174a866d..d5c9e2452f2d 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -157,7 +157,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	char name[8];
 	int i;
 
-	XE_BUG_ON(!minor->debugfs_root);
+	if (!minor->debugfs_root) {
+		drm_err(&gt_to_xe(gt)->drm, "!minor->debugfs_root");
+		return;
+	}
 
 	sprintf(name, "gt%d", gt->info.id);
 	root = debugfs_create_dir(name, minor->debugfs_root);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index cad0ade595ec..bf28c5376de1 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -250,7 +250,10 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	int len = 0;
 
-	XE_BUG_ON(!vma);
+	if (!vma) {
+		drm_err(&xe->drm, "!vma");
+		return -EINVAL;
+	}
 
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
@@ -288,10 +291,23 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			start = ALIGN_DOWN(xe_vma_start(vma), length);
 		}
 
-		XE_BUG_ON(length < SZ_4K);
-		XE_BUG_ON(!is_power_of_2(length));
-		XE_BUG_ON(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1));
-		XE_BUG_ON(!IS_ALIGNED(start, length));
+		if (length < SZ_4K) {
+			drm_err(&xe->drm, "length < SZ_4K");
+			return -EINVAL;
+		}
+		if (!is_power_of_2(length)) {
+			drm_err(&xe->drm, "!is_power_of_2(length)");
+			return -EINVAL;
+		}
+		if (length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1)) {
+			drm_err(&xe->drm,
+				"length&GENMASK(ilog2(SZ_16M)-1,ilog2(SZ_2M)+1)");
+			return -EINVAL;
+		}
+		if (!IS_ALIGNED(start, length)) {
+			drm_err(&xe->drm, "!IS_ALIGNED(start, length)");
+			return -EINVAL;
+		}
 
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
 		action[len++] = xe_vma_vm(vma)->usm.asid;
@@ -300,7 +316,10 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		action[len++] = ilog2(length) - ilog2(SZ_4K);
 	}
 
-	XE_BUG_ON(len > MAX_TLB_INVALIDATION_LEN);
+	if (len > MAX_TLB_INVALIDATION_LEN) {
+		drm_err(&xe->drm, "len > MAX_TLB_INVALIDATION_LEN");
+		return -EINVAL;
+	}
 
 	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8ae026838702..42c4b4af501c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -614,14 +614,30 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
-	XE_BUG_ON(guc->ct.enabled);
-	XE_BUG_ON(!len);
-	XE_BUG_ON(len > VF_SW_FLAG_COUNT);
-	XE_BUG_ON(len > MED_VF_SW_FLAG_COUNT);
-	XE_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) !=
-		  GUC_HXG_ORIGIN_HOST);
-	XE_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) !=
-		  GUC_HXG_TYPE_REQUEST);
+	if (guc->ct.enabled) {
+		drm_err(&xe->drm, "guc->ct.enabled");
+		return -EINVAL;
+	}
+	if (!len) {
+		drm_err(&xe->drm, "!len");
+		return -EINVAL;
+	}
+	if (len > VF_SW_FLAG_COUNT) {
+		drm_err(&xe->drm, "len>VF_SW_FLAG_COUNT");
+		return -EINVAL;
+	}
+	if (len > MED_VF_SW_FLAG_COUNT) {
+		drm_err(&xe->drm, "len>MED_VF_SW_FLAG_COUNT");
+		return -EINVAL;
+	}
+	if (FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) != GUC_HXG_ORIGIN_HOST) {
+		drm_err(&xe->drm, "FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) != GUC_HXG_ORIGIN_HOST");
+		return -EINVAL;
+	}
+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) != GUC_HXG_TYPE_REQUEST) {
+		drm_err(&xe->drm, "FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) != GUC_HXG_TYPE_REQUEST");
+		return -EINVAL;
+	}
 
 retry:
 	/* Not in critical data-path, just do if else for GT type */
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index d4c3a5ce3252..3907cd62b13d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -118,7 +118,10 @@ struct __guc_ads_blob {
 
 static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
 {
-	XE_BUG_ON(!ads->regset_size);
+	if (!ads->regset_size) {
+		drm_err(&ads_to_xe(ads)->drm, "!ads->regset_size");
+		return -EINVAL;
+	}
 
 	return ads->regset_size;
 }
@@ -312,7 +315,10 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 	struct xe_gt *gt = ads_to_gt(ads);
 	u32 prev_regset_size = ads->regset_size;
 
-	XE_BUG_ON(!ads->bo);
+	if (!ads->bo) {
+		drm_err(&ads_to_xe(ads)->drm, "!ads->bo");
+		return -EINVAL;
+	}
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
@@ -518,7 +524,10 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
 		regset_used += count * sizeof(struct guc_mmio_reg);
 	}
 
-	XE_BUG_ON(regset_used > ads->regset_size);
+	if (regset_used > ads->regset_size) {
+		drm_err(&ads_to_xe(ads)->drm, "regset_used > ads -> regset_size");
+		return;
+	}
 }
 
 static void guc_um_init_params(struct xe_guc_ads *ads)
@@ -573,7 +582,10 @@ void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads)
 			offsetof(struct __guc_ads_blob, system_info));
 	u32 base = xe_bo_ggtt_addr(ads->bo);
 
-	XE_BUG_ON(!ads->bo);
+	if (!ads->bo) {
+		drm_err(&ads_to_xe(ads)->drm, "!ads->bo");
+		return;
+	}
 
 	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
 	guc_policies_init(ads);
@@ -597,7 +609,10 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 			offsetof(struct __guc_ads_blob, system_info));
 	u32 base = xe_bo_ggtt_addr(ads->bo);
 
-	XE_BUG_ON(!ads->bo);
+	if (!ads->bo) {
+		drm_err(&xe->drm, "!ads->bo");
+		return;
+	}
 
 	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
 	guc_policies_init(ads);
@@ -647,7 +662,10 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
 				   engine_enabled_masks[guc_class]))
 			continue;
 
-		XE_BUG_ON(!gt->default_lrc[class]);
+		if (!gt->default_lrc[class]) {
+			drm_err(&xe->drm, "!gt->default_lrc[class]");
+			return;
+		}
 
 		real_size = xe_lrc_size(xe, class);
 		alloc_size = PAGE_ALIGN(real_size);
@@ -676,7 +694,10 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
 		offset += alloc_size;
 	}
 
-	XE_BUG_ON(total_size != ads->golden_lrc_size);
+	if (total_size != ads->golden_lrc_size) {
+		drm_err(&xe->drm, "total_size!=ads->golden_lrc_size");
+		return;
+	}
 }
 
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index c8f875e970ab..7db19b72dc1f 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -120,7 +120,10 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 
-	XE_BUG_ON(!guc->hwconfig.bo);
+	if (!guc->hwconfig.bo) {
+		drm_err(&xe->drm, "!guc->hwconfig.bo");
+		return;
+	}
 
 	xe_map_memcpy_from(xe, dst, &guc->hwconfig.bo->vmap, 0,
 			   guc->hwconfig.size);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 911d4965c27c..0620d7bc1585 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -357,7 +357,10 @@ static void init_policies(struct xe_guc *guc, struct xe_engine *e)
 	u32 timeslice_us = e->sched_props.timeslice_us;
 	u32 preempt_timeout_us = e->sched_props.preempt_timeout_us;
 
-	XE_BUG_ON(!engine_registered(e));
+	if (!engine_registered(e)) {
+		drm_err(&gt_to_xe(e->gt)->drm, "!engine_registered(e)");
+		return;
+	}
 
 	__guc_engine_policy_start_klv(&policy, e->guc->id);
 	__guc_engine_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
@@ -395,7 +398,10 @@ static void __register_mlrc_engine(struct xe_guc *guc,
 	int len = 0;
 	int i;
 
-	XE_BUG_ON(!xe_engine_is_parallel(e));
+	if (!xe_engine_is_parallel(e)) {
+	drm_err(&gt_to_xe(e->gt)->drm, "!xe_engine_is_parallel(e)");
+	return;
+	}
 
 	action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
 	action[len++] = info->flags;
@@ -418,7 +424,10 @@ static void __register_mlrc_engine(struct xe_guc *guc,
 		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
 	}
 
-	XE_BUG_ON(len > MAX_MLRC_REG_SIZE);
+	if (len > MAX_MLRC_REG_SIZE) {
+		drm_err(&gt_to_xe(e->gt)->drm, "len > MAX_MLRC_REG_SIZE");
+		return;
+	}
 #undef MAX_MLRC_REG_SIZE
 
 	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
@@ -452,7 +461,10 @@ static void register_engine(struct xe_engine *e)
 	struct xe_lrc *lrc = e->lrc;
 	struct guc_ctxt_registration_info info;
 
-	XE_BUG_ON(engine_registered(e));
+	if (engine_registered(e)) {
+		drm_err(&xe->drm, "engine_registered(e)");
+		return;
+	}
 
 	memset(&info, 0, sizeof(info));
 	info.context_idx = e->guc->id;
@@ -542,7 +554,10 @@ static int wq_noop_append(struct xe_engine *e)
 	if (wq_wait_for_space(e, wq_space_until_wrap(e)))
 		return -ENODEV;
 
-	XE_BUG_ON(!FIELD_FIT(WQ_LEN_MASK, len_dw));
+	if (!FIELD_FIT(WQ_LEN_MASK, len_dw)) {
+		drm_err(&xe->drm, "!FIELD_FIT(WQ_LEN_MASK,len_dw)");
+		return -EINVAL;
+	}
 
 	parallel_write(xe, map, wq[e->guc->wqi_tail / sizeof(u32)],
 		       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
@@ -581,13 +596,19 @@ static void wq_item_append(struct xe_engine *e)
 		wqi[i++] = lrc->ring.tail / sizeof(u64);
 	}
 
-	XE_BUG_ON(i != wqi_size / sizeof(u32));
+	if (i != wqi_size / sizeof(u32)) {
+		drm_err(&xe->drm, "i!=wqi_size/sizeof(u32)");
+		return;
+	}
 
 	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
 				      wq[e->guc->wqi_tail / sizeof(u32)]));
 	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
 	e->guc->wqi_tail += wqi_size;
-	XE_BUG_ON(e->guc->wqi_tail > WQ_SIZE);
+	if (e->guc->wqi_tail > WQ_SIZE) {
+		drm_err(&xe->drm, "e->guc->wqi_tail>WQ_SIZE");
+		return;
+	}
 
 	xe_device_wmb(xe);
 
@@ -606,7 +627,10 @@ static void submit_engine(struct xe_engine *e)
 	int len = 0;
 	bool extra_submit = false;
 
-	XE_BUG_ON(!engine_registered(e));
+	if (!engine_registered(e)) {
+		drm_err(&gt_to_xe(e->gt)->drm, "!engine_registered(e)");
+		return;
+	}
 
 	if (xe_engine_is_parallel(e))
 		wq_item_append(e);
@@ -654,8 +678,11 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
 	struct xe_engine *e = job->engine;
 	bool lr = xe_engine_is_lr(e);
 
-	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
-		  !engine_banned(e) && !engine_suspended(e));
+	if ((engine_destroyed(e) || engine_pending_disable(e)) && !engine_banned(e) && !engine_suspended(e)) {
+		drm_err(&gt_to_xe(e->gt)->drm,
+			"(engine_destroyed(e) || engine_pending_disable(e)) && !engine_banned(e) && !engine_suspended(e)");
+		return NULL;
+	}
 
 	trace_xe_sched_job_run(job);
 
@@ -983,7 +1010,10 @@ static void __guc_engine_process_msg_cleanup(struct drm_sched_msg *msg)
 	struct xe_engine *e = msg->private_data;
 	struct xe_guc *guc = engine_to_guc(e);
 
-	XE_BUG_ON(e->flags & ENGINE_FLAG_KERNEL);
+	if (e->flags & ENGINE_FLAG_KERNEL) {
+		drm_err(&gt_to_xe(e->gt)->drm, "e->flags & ENGINE_FLAG_KERNEL");
+		return;
+	}
 	trace_xe_engine_cleanup_entity(e);
 
 	if (engine_registered(e))
@@ -1011,9 +1041,15 @@ static void suspend_fence_signal(struct xe_engine *e)
 {
 	struct xe_guc *guc = engine_to_guc(e);
 
-	XE_BUG_ON(!engine_suspended(e) && !engine_killed(e) &&
-		  !guc_read_stopped(guc));
-	XE_BUG_ON(!e->guc->suspend_pending);
+	if (!engine_suspended(e) && !engine_killed(e) && !guc_read_stopped(guc)) {
+		drm_err(&gt_to_xe(e->gt)->drm,
+			"!engine_suspended(e) && !engine_killed(e) && !guc_read_stopped(guc)");
+		return;
+	}
+	if (!e->guc->suspend_pending) {
+		drm_err(&gt_to_xe(e->gt)->drm, "!e->guc->suspend_pending");
+		return;
+	}
 
 	e->guc->suspend_pending = false;
 	smp_wmb();
@@ -1118,7 +1154,11 @@ static int guc_engine_init(struct xe_engine *e)
 	long timeout;
 	int err;
 
-	XE_BUG_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
+	if (!xe_device_guc_submission_enabled(guc_to_xe(guc))) {
+		drm_err(&gt_to_xe(e->gt)->drm,
+			"!xe_device_guc_submission_enabled(guc_to_xe(guc))");
+		return -EINVAL;
+	}
 
 	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
 	if (!ge)
@@ -1282,9 +1322,18 @@ static int guc_engine_set_job_timeout(struct xe_engine *e, u32 job_timeout_ms)
 {
 	struct drm_gpu_scheduler *sched = &e->guc->sched;
 
-	XE_BUG_ON(engine_registered(e));
-	XE_BUG_ON(engine_banned(e));
-	XE_BUG_ON(engine_killed(e));
+	if (engine_registered(e)) {
+		drm_err(&gt_to_xe(e->gt)->drm, "engine_registered(e)");
+		return -EINVAL;
+	}
+	if (engine_banned(e)) {
+		drm_err(&gt_to_xe(e->gt)->drm, "engine_banned(e)");
+		return -EINVAL;
+	}
+	if (engine_killed(e)) {
+		drm_err(&gt_to_xe(e->gt)->drm, "engine_killed(e)");
+		return -EINVAL;
+	}
 
 	sched->timeout = job_timeout_ms;
 
@@ -1316,7 +1365,10 @@ static void guc_engine_resume(struct xe_engine *e)
 {
 	struct drm_sched_msg *msg = e->guc->static_msgs + STATIC_MSG_RESUME;
 
-	XE_BUG_ON(e->guc->suspend_pending);
+	if (e->guc->suspend_pending) {
+		drm_err(&gt_to_xe(e->gt)->drm, "e->guc->suspend_pending");
+		return;
+	}
 
 	guc_engine_add_msg(e, msg, RESUME);
 }
@@ -1485,7 +1537,10 @@ g2h_engine_lookup(struct xe_guc *guc, u32 guc_id)
 		return NULL;
 	}
 
-	XE_BUG_ON(e->guc->id != guc_id);
+	if (e->guc->id != guc_id) {
+		drm_err(&xe->drm, "e->guc->id!=guc_id");
+		return NULL;
+	}
 
 	return e;
 }
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 373a65c77946..dfc9a6bab6ac 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -72,7 +72,10 @@ int xe_huc_auth(struct xe_huc *huc)
 	if (xe_uc_fw_is_disabled(&huc->fw))
 		return 0;
 
-	XE_BUG_ON(xe_uc_fw_is_running(&huc->fw));
+	if (xe_uc_fw_is_running(&huc->fw)) {
+		drm_err(&xe->drm, "xe_uc_fw_is_running(&huc->fw)");
+		return -EINVAL;
+	}
 
 	if (!xe_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index bc7dac4e2086..8c6fa0656d18 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -148,7 +148,10 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 
 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE, &is_vram);
-	XE_BUG_ON(!is_vram);
+	if (!is_vram) {
+		drm_err(&xe->drm, "!is_vram");
+		return -EINVAL;
+	}
 	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
 
 	return 0;
@@ -173,7 +176,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
 
 	/* Need to be sure everything fits in the first PT, or create more */
-	XE_BUG_ON(m->batch_base_ofs + batch->size >= SZ_2M);
+	if (m->batch_base_ofs + batch->size >= SZ_2M) {
+		drm_err(&xe->drm, "m->batch_base_ofs+batch->size>=SZ_2M");
+		return -EINVAL;
+	}
 
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm,
 				  num_entries * XE_PAGE_SIZE,
@@ -208,7 +214,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	}
 
 	if (!IS_DGFX(xe)) {
-		XE_BUG_ON(xe->info.supports_usm);
+		if (xe->info.supports_usm) {
+			drm_err(&xe->drm, "xe->info.supports_usm");
+			return -EINVAL;
+		}
 
 		/* Write out batch too */
 		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
@@ -493,7 +502,10 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 
 	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
 				    NUM_CCS_BYTES_PER_BLOCK);
-	XE_BUG_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER);
+	if (num_ccs_blks > NUM_CCS_BLKS_PER_XFER) {
+		drm_err(&gt_to_xe(gt)->drm, "num_ccs_blks>NUM_CCS_BLKS_PER_XFER");
+		return;
+	}
 	*cs++ = XY_CTRL_SURF_COPY_BLT |
 		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
 		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
@@ -513,9 +525,18 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 		      u64 src_ofs, u64 dst_ofs, unsigned int size,
 		      unsigned int pitch)
 {
-	XE_BUG_ON(size / pitch > S16_MAX);
-	XE_BUG_ON(pitch / 4 > S16_MAX);
-	XE_BUG_ON(pitch > U16_MAX);
+	if (size / pitch > S16_MAX) {
+		drm_err(&gt_to_xe(gt)->drm, "size / pitch > S16_MAX");
+		return;
+	}
+	if (pitch / 4 > S16_MAX) {
+		drm_err(&gt_to_xe(gt)->drm, "pitch / 4 > S16_MAX");
+		return;
+	}
+	if (pitch > U16_MAX) {
+		drm_err(&gt_to_xe(gt)->drm, "pitch > U16_MAX");
+		return;
+	}
 
 	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
 	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
@@ -575,7 +596,10 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 		 * At the moment, we don't support copying CCS metadata from
 		 * system to system.
 		 */
-		XE_BUG_ON(!src_is_vram && !dst_is_vram);
+		if (!src_is_vram && !dst_is_vram) {
+			drm_err(&gt_to_xe(gt)->drm, "!src_is_vram && !dst_is_vram");
+			return -EINVAL;
+		}
 
 		emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
 			      src_is_vram, dst_size);
@@ -787,7 +811,10 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
 	*cs++ = upper_32_bits(src_ofs);
 	*cs++ = FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
 
-	XE_BUG_ON(cs - bb->cs != len + bb->len);
+	if (cs - bb->cs != len + bb->len) {
+		drm_err(&gt_to_xe(gt)->drm, "cs - bb -> cs != len + bb->len");
+		return;
+	}
 
 	bb->len += len;
 }
@@ -825,7 +852,10 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
 		*cs++ = 0;
 	}
 
-	XE_BUG_ON(cs - bb->cs != len + bb->len);
+	if (cs - bb->cs != len + bb->len) {
+		drm_err(&xe->drm, "cs-bb->cs!=len+bb->len");
+		return;
+	}
 
 	bb->len += len;
 }
@@ -1194,7 +1224,10 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
 	 * Should be reasonably bound..
 	 */
-	XE_BUG_ON(batch_size >= SZ_128K);
+	if (batch_size >= SZ_128K) {
+		drm_err(&xe->drm, "batch_size>=SZ_128K");
+		return NULL;
+	}
 
 	bb = xe_bb_new(gt, batch_size, !eng && xe->info.supports_usm);
 	if (IS_ERR(bb))
@@ -1204,7 +1237,11 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	if (!IS_DGFX(xe)) {
 		ppgtt_ofs = NUM_KERNEL_PDE - 1;
 		if (eng) {
-			XE_BUG_ON(num_updates > NUM_VMUSA_WRITES_PER_UNIT);
+			if (num_updates > NUM_VMUSA_WRITES_PER_UNIT) {
+				drm_err(&xe->drm,
+					"num_updates > NUM_VMUSA_WRITES_PER_UNIT");
+				return NULL;
+			}
 
 			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
 						 GFP_KERNEL, true, 0);
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index f581472cb391..345fb64c92f2 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -141,8 +141,13 @@ struct xe_sched_job *xe_sched_job_create(struct xe_engine *e,
 		}
 
 		/* Sanity check */
-		for (j = 0; j < e->width; ++j)
-			XE_BUG_ON(cf->base.seqno != fences[j]->seqno);
+		for (j = 0; j < e->width; ++j) {
+			if (cf->base.seqno != fences[j]->seqno) {
+				drm_err(&gt_to_xe(e->gt)->drm,
+					"cf->base.seqno != fences[j]->seqno");
+				return NULL;
+			}
+		}
 
 		job->fence = &cf->base;
 	}
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 21ecc734f10a..1473a41ac9ce 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -188,7 +188,10 @@ u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
 	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
 	struct xe_res_cursor cur;
 
-	XE_BUG_ON(!mgr->io_base);
+	if (!mgr->io_base) {
+		drm_err(&xe->drm, "!mgr->io_base");
+		return -EINVAL;
+	}
 
 	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
@@ -228,7 +231,10 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
 #ifdef CONFIG_X86
 	struct xe_bo *bo = ttm_to_xe_bo(mem->bo);
 
-	XE_BUG_ON(IS_DGFX(xe));
+	if (IS_DGFX(xe)) {
+		drm_err(&xe->drm, "IS_DGFX(xe)");
+		return -EINVAL;
+	}
 
 	/* XXX: Require BO to be mapped to GGTT? */
 	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_CREATE_GGTT_BIT)))
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6003c0be5b59..c0ea5951e55a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -63,7 +63,10 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	bool read_only = xe_vma_read_only(vma);
 
 	lockdep_assert_held(&vm->lock);
-	XE_BUG_ON(!xe_vma_is_userptr(vma));
+	if (!xe_vma_is_userptr(vma)) {
+		drm_err(&vm->xe->drm, "!xe_vma_is_userptr(vma)");
+		return -EINVAL;
+	}
 retry:
 	if (vma->gpuva.flags & XE_VMA_DESTROYED)
 		return 0;
@@ -252,7 +255,10 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
 		struct dma_fence *fence;
 
 		link = list->next;
-		XE_BUG_ON(link == list);
+		if (link == list) {
+			drm_err(&vm->xe->drm, "link == list");
+			return;
+		}
 
 		fence = xe_preempt_fence_arm(to_preempt_fence_from_link(link),
 					     e, e->compute.context,
@@ -329,7 +335,10 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 	int err;
 	bool wait;
 
-	XE_BUG_ON(!xe_vm_in_compute_mode(vm));
+	if (!xe_vm_in_compute_mode(vm)) {
+		drm_err(&vm->xe->drm, "!xe_vm_in_compute_mode(vm)");
+		return -EINVAL;
+	}
 
 	down_write(&vm->lock);
 
@@ -549,7 +558,10 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	long wait;
 	int __maybe_unused tries = 0;
 
-	XE_BUG_ON(!xe_vm_in_compute_mode(vm));
+	if (!xe_vm_in_compute_mode(vm)) {
+		drm_err(&vm->xe->drm, "!xe_vm_in_compute_mode(vm)");
+		return;
+	}
 	trace_xe_vm_rebind_worker_enter(vm);
 
 	down_write(&vm->lock);
@@ -708,7 +720,10 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	struct dma_fence *fence;
 	long err;
 
-	XE_BUG_ON(!xe_vma_is_userptr(vma));
+	if (!xe_vma_is_userptr(vma)) {
+		drm_err(&vm->xe->drm, "!xe_vma_is_userptr(vma)");
+		return -EINVAL;
+	}
 	trace_xe_vma_userptr_invalidate(vma);
 
 	if (!mmu_notifier_range_blockable(range))
@@ -877,8 +892,14 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	struct xe_tile *tile;
 	u8 id;
 
-	XE_BUG_ON(start >= end);
-	XE_BUG_ON(end >= vm->size);
+	if (start >= end) {
+		drm_err(&vm->xe->drm, "start >= end");
+		return NULL;
+	}
+	if (end >= vm->size) {
+		drm_err(&vm->xe->drm, "end >= vm->size");
+		return NULL;
+	}
 
 	if (!bo && !is_null)	/* userptr */
 		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
@@ -1063,7 +1084,11 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	struct xe_vm *vm = xe_vma_vm(vma);
 
 	lockdep_assert_held_write(&vm->lock);
-	XE_BUG_ON(!list_empty(&vma->combined_links.destroy));
+	if (!list_empty(&vma->combined_links.destroy)) {
+		drm_err(&vm->xe->drm,
+			"!list_empty(&vma->combined_links.destroy)");
+		return;
+	}
 
 	if (xe_vma_is_userptr(vma)) {
 		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
@@ -1141,7 +1166,10 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range)
 	if (xe_vm_is_closed_or_banned(vm))
 		return NULL;
 
-	XE_BUG_ON(start + range > vm->size);
+	if (start + range > vm->size) {
+		drm_err(&vm->xe->drm, "start + range > vm->size");
+		return NULL;
+	}
 
 	gpuva = drm_gpuva_find_first(&vm->mgr, start, range);
 
@@ -1152,7 +1180,10 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
 	int err;
 
-	XE_BUG_ON(xe_vma_vm(vma) != vm);
+	if (xe_vma_vm(vma) != vm) {
+		drm_err(&vm->xe->drm, "xe_vma_vm(vma) != vm");
+		return -EINVAL;
+	}
 	lockdep_assert_held(&vm->lock);
 
 	err = drm_gpuva_insert(&vm->mgr, &vma->gpuva);
@@ -1163,7 +1194,10 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 
 static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
-	XE_BUG_ON(xe_vma_vm(vma) != vm);
+	if (xe_vma_vm(vma) != vm) {
+		drm_err(&vm->xe->drm, "xe_vma_vm(vma) != vm");
+		return;
+	}
 	lockdep_assert_held(&vm->lock);
 
 	drm_gpuva_remove(&vma->gpuva);
@@ -1414,7 +1448,10 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	struct drm_gpuva *gpuva, *next;
 	u8 id;
 
-	XE_BUG_ON(vm->preempt.num_engines);
+	if (vm->preempt.num_engines) {
+		drm_err(&vm->xe->drm, "vm->preempt.num_engines");
+		return;
+	}
 
 	xe_vm_close(vm);
 	flush_async_ops(vm);
@@ -1797,7 +1834,11 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence)
 		struct async_op_fence *afence =
 			container_of(fence, struct async_op_fence, fence);
 
-		XE_BUG_ON(xe_vm_no_dma_fences(afence->vm));
+		if (xe_vm_no_dma_fences(afence->vm)) {
+			drm_err(&afence->vm->xe->drm,
+				"xe_vm_no_dma_fences(afence->vm)");
+			return -EINVAL;
+		}
 
 		smp_rmb();
 		return wait_event_interruptible(afence->wq, afence->started);
@@ -1823,7 +1864,10 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 	} else {
 		int i;
 
-		XE_BUG_ON(!xe_vm_in_fault_mode(vm));
+		if (!xe_vm_in_fault_mode(vm)) {
+			drm_err(&vm->xe->drm, "!xe_vm_in_fault_mode(vm)");
+			return -EINVAL;
+		}
 
 		fence = dma_fence_get_stub();
 		if (last_op) {
@@ -2102,7 +2146,10 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 {
 	int err;
 
-	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
+	if (region > ARRAY_SIZE(region_to_mem_type)) {
+		drm_err(&vm->xe->drm, "region > ARRAY_SIZE(region_to_mem_type)");
+		return -EINVAL;
+	}
 
 	if (!xe_vma_has_no_bo(vma)) {
 		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
@@ -2183,7 +2230,8 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 			return -ENODATA;
 		break;
 	default:
-		XE_BUG_ON("NOT POSSIBLE");
+		drm_err(&vm->xe->drm, "NOT POSSIBLE");
+		return -EINVAL;
 		return -EINVAL;
 	}
 
@@ -2241,7 +2289,8 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma));
 		break;
 	default:
-		XE_BUG_ON("NOT POSSIBLE");
+		drm_err(&xe->drm, "NOT POSSIBLE");
+		return;
 	}
 }
 #else
@@ -2316,7 +2365,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		}
 		break;
 	case XE_VM_BIND_OP_UNMAP_ALL:
-		XE_BUG_ON(!bo);
+		if (!bo) {
+			drm_err(&vm->xe->drm, "!bo");
+			return NULL;
+		}
 
 		err = xe_bo_lock(bo, &ww, 0, true);
 		if (err)
@@ -2333,7 +2385,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		}
 		break;
 	default:
-		XE_BUG_ON("NOT POSSIBLE");
+		drm_err(&vm->xe->drm, "NOT POSSIBLE");
 		ops = ERR_PTR(-EINVAL);
 	}
 
@@ -2420,7 +2472,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 	int err, i;
 
 	lockdep_assert_held_write(&vm->lock);
-	XE_BUG_ON(num_ops_list > 1 && !async);
+	if (num_ops_list > 1 && !async) {
+		drm_err(&vm->xe->drm, "num_ops_list > 1 && !async");
+		return -EINVAL;
+	}
 
 	if (num_syncs && async) {
 		u64 seqno;
@@ -2449,7 +2504,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 			bool first = !async_list;
 
-			XE_BUG_ON(!first && !async);
+			if (!first && !async) {
+				drm_err(&vm->xe->drm, "!first && !async");
+				return -EINVAL;
+			}
 
 			INIT_LIST_HEAD(&op->link);
 			if (first)
@@ -2561,7 +2619,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 				/* Nothing to do */
 				break;
 			default:
-				XE_BUG_ON("NOT POSSIBLE");
+				drm_err(&vm->xe->drm, "NOT POSSIBLE");
+				return -EINVAL;
 			}
 
 			last_op = op;
@@ -2623,7 +2682,8 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		/* Nothing to do */
 		break;
 	default:
-		XE_BUG_ON("NOT POSSIBLE");
+		drm_err(&vm->xe->drm, "NOT POSSIBLE");
+		return -EINVAL;
 	}
 
 	op->flags |= XE_VMA_OP_COMMITTED;
@@ -2741,7 +2801,8 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 				     op->flags & XE_VMA_OP_LAST);
 		break;
 	default:
-		XE_BUG_ON("NOT POSSIBLE");
+		drm_err(&vm->xe->drm, "NOT POSSIBLE");
+		return -EINVAL;
 	}
 
 	ttm_eu_backoff_reservation(&ww, &objs);
@@ -2800,7 +2861,8 @@ static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 					  op);
 		break;
 	default:
-		XE_BUG_ON("NOT POSSIBLE");
+		drm_err(&vm->xe->drm, "NOT POSSIBLE");
+		return -EINVAL;
 	}
 
 	return ret;
@@ -2876,7 +2938,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 		/* Nothing to do */
 		break;
 	default:
-		XE_BUG_ON("NOT POSSIBLE");
+		drm_err(&vm->xe->drm, "NOT POSSIBLE");
+		return;
 	}
 }
 
@@ -3406,7 +3469,10 @@ int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	LIST_HEAD(objs);
 	LIST_HEAD(dups);
 
-	XE_BUG_ON(!ww);
+	if (!ww) {
+		drm_err(&vm->xe->drm, "!ww");
+		return -EINVAL;
+	}
 
 	tv_vm.num_shared = num_resv;
 	tv_vm.bo = xe_vm_ttm_bo(vm);
@@ -3440,7 +3506,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	u8 id;
 	int ret;
 
-	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
+	if (!xe_vm_in_fault_mode(xe_vma_vm(vma))) {
+		drm_err(&xe->drm, "!xe_vm_in_fault_mode(xe_vma_vm(vma))");
+		return -EINVAL;
+	}
 	XE_WARN_ON(xe_vma_is_null(vma));
 	trace_xe_vma_usm_invalidate(vma);
 
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index d9acf8783b83..3c3682b154f4 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -144,10 +144,22 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 	u32 mask;
 	int err;
 
-	XE_BUG_ON(!(base & GUC_WOPCM_OFFSET_MASK));
-	XE_BUG_ON(base & ~GUC_WOPCM_OFFSET_MASK);
-	XE_BUG_ON(!(size & GUC_WOPCM_SIZE_MASK));
-	XE_BUG_ON(size & ~GUC_WOPCM_SIZE_MASK);
+	if (!(base & GUC_WOPCM_OFFSET_MASK)) {
+		drm_err(&xe->drm, "!(base & GUC_WOPCM_OFFSET_MASK)");
+		return -EINVAL;
+	}
+	if (base & ~GUC_WOPCM_OFFSET_MASK) {
+		drm_err(&xe->drm, "base &~ GUC_WOPCM_OFFSET_MASK");
+		return -EINVAL;
+	}
+	if (!(size & GUC_WOPCM_SIZE_MASK)) {
+		drm_err(&xe->drm, "!(size & GUC_WOPCM_SIZE_MASK)");
+		return -EINVAL;
+	}
+	if (size & ~GUC_WOPCM_SIZE_MASK) {
+		drm_err(&xe->drm, "size &~ GUC_WOPCM_SIZE_MASK");
+		return -EINVAL;
+	}
 
 	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
 	err = xe_mmio_write32_and_verify(gt, GUC_WOPCM_SIZE, size, mask,
@@ -213,9 +225,18 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 	drm_dbg(&xe->drm, "WOPCM: %uK\n", wopcm->size / SZ_1K);
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
-	XE_BUG_ON(guc_fw_size >= wopcm->size);
-	XE_BUG_ON(huc_fw_size >= wopcm->size);
-	XE_BUG_ON(ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size);
+	if (guc_fw_size >= wopcm->size) {
+		drm_err(&xe->drm, "guc_fw_size >= wopcm->size");
+		return -EINVAL;
+	}
+	if (huc_fw_size >= wopcm->size) {
+		drm_err(&xe->drm, "huc_fw_size >= wopcm->size");
+		return -EINVAL;
+	}
+	if (ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size) {
+		drm_err(&xe->drm, "ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size");
+		return -EINVAL;
+	}
 
 	locked = __wopcm_regs_locked(gt, &guc_wopcm_base, &guc_wopcm_size);
 	if (locked) {
@@ -256,8 +277,14 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 			   guc_fw_size, huc_fw_size)) {
 		wopcm->guc.base = guc_wopcm_base;
 		wopcm->guc.size = guc_wopcm_size;
-		XE_BUG_ON(!wopcm->guc.base);
-		XE_BUG_ON(!wopcm->guc.size);
+		if (!wopcm->guc.base) {
+			drm_err(&xe->drm, "!wopcm->guc.base");
+			return -EINVAL;
+		}
+		if (!wopcm->guc.size) {
+			drm_err(&xe->drm, "!wopcm->guc.size");
+			return -EINVAL;
+		}
 	} else {
 		drm_notice(&xe->drm, "Unsuccessful WOPCM partitioning\n");
 		return -E2BIG;
-- 
2.34.1

