Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBAAC5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 05:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B12110EAD9;
	Wed,  6 Mar 2024 05:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bezkgOIj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73F610EAD4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 05:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709702396; x=1741238396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G8wQtaloqKBjd3A12kGac0hZd7eZNTe3tBSVWlyuoF4=;
 b=bezkgOIjIJrjv0DdfRhFfVYYq5l2+nf/pJGDiePj4gq63tlMVgn1FS02
 t9SUooKr//Ay3zqXmm1jm77nmDpmRllFbDRdnDNI7o2MrMR7ZBbjjCO69
 WPvWX9Cz0VhDrB57G0eD/+ZPPgquqQPIXJP1L0PjqxBZdW1VNupk7rSYF
 C7bdwZ/jV/ZbUF79UJ0wS7kI+MOe6aJh34DWcsFBaiUFfQDNcFJroWoNF
 kuehPvPKqv6kdXLrKH7Hx6nlWISroM53FOYIXRZnRuSB4p9SBRDRa+Jo/
 l5gaJwKTzPIdRcdziF59NNJTew1OOmfe25rRCO8KJIYFmv8WJipKd+b23 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4415013"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4415013"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="32789810"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:19:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: rodrigo.vivi@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 3/4] drm/xe: Add XE_BO_GGTT_INVALIDATE_BIT flag
Date: Tue,  5 Mar 2024 21:20:01 -0800
Message-Id: <20240306052002.311196-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306052002.311196-1-matthew.brost@intel.com>
References: <20240306052002.311196-1-matthew.brost@intel.com>
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

Add XE_BO_GGTT_INVALIDATE_BIT flag which indicates the GGTT should be
invalidated when a BO is added / removed from the GGTT. This is
typically set when a BO is used by the GuC as the GuC has GGTT TLBs.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c             |  2 +-
 drivers/gpu/drm/xe/xe_bo.h             |  1 +
 drivers/gpu/drm/xe/xe_ggtt.c           | 12 ++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h           |  3 ++-
 drivers/gpu/drm/xe/xe_guc_ads.c        |  3 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c         |  3 ++-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c   |  3 ++-
 drivers/gpu/drm/xe/xe_guc_log.c        |  3 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c         |  3 ++-
 drivers/gpu/drm/xe/xe_hw_engine.c      |  3 ++-
 drivers/gpu/drm/xe/xe_lrc.c            |  3 ++-
 drivers/gpu/drm/xe/xe_memirq.c         |  1 +
 drivers/gpu/drm/xe/xe_sa.c             |  3 ++-
 drivers/gpu/drm/xe/xe_uc_fw.c          |  3 ++-
 15 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a6acee04e90b..7454070c15b6 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -320,7 +320,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 		xe_bo_unpin_map_no_vm(vma->dpt);
 	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
 		 vma->bo->ggtt_node.start != vma->node.start)
-		xe_ggtt_remove_node(ggtt, &vma->node);
+		xe_ggtt_remove_node(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b89ac6db68a1..8ba38e8b51a4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1626,7 +1626,7 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
 
 	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
 					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-					    XE_BO_CREATE_GGTT_BIT);
+					    (*src)->flags);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c59ad15961ce..64cfa82ff285 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -45,6 +45,7 @@
 #define XE_BO_PAGETABLE			BIT(12)
 #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
 #define XE_BO_NEEDS_UC			BIT(14)
+#define XE_BO_GGTT_INVALIDATE_BIT	BIT(15)
 /* this one is trigger internally only */
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index cc60ea08fc84..42e92011dd69 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -390,7 +390,8 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
-	xe_ggtt_invalidate(ggtt);
+	if (bo->flags & XE_BO_GGTT_INVALIDATE_BIT)
+		xe_ggtt_invalidate(ggtt);
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
@@ -435,7 +436,8 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			 bool invalidate)
 {
 	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
@@ -444,7 +446,8 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	drm_mm_remove_node(node);
 	node->size = 0;
 
-	xe_ggtt_invalidate(ggtt);
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
 
 	mutex_unlock(&ggtt->lock);
 	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
@@ -458,7 +461,8 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	/* This BO is not currently in the GGTT */
 	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node);
+	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
+			    bo->flags & XE_BO_GGTT_INVALIDATE_BIT);
 }
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index dc9631d20720..8306ef74abc6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -23,7 +23,8 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
 				       struct drm_mm_node *node,
 				       u32 size, u32 align, u32 mm_flags);
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node);
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			 bool invalidate);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 6ad4c1a90a78..5deb95a5be89 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -274,7 +274,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
 					  XE_BO_CREATE_SYSTEM_BIT |
-					  XE_BO_CREATE_GGTT_BIT);
+					  XE_BO_CREATE_GGTT_BIT |
+					  XE_BO_GGTT_INVALIDATE_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 355edd4d758a..507d50a28d0f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -156,7 +156,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
 					  XE_BO_CREATE_SYSTEM_BIT |
-					  XE_BO_CREATE_GGTT_BIT);
+					  XE_BO_CREATE_GGTT_BIT |
+					  XE_BO_GGTT_INVALIDATE_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index ea49f3885c10..18aefb4aaadd 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -79,7 +79,8 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
 					  XE_BO_CREATE_SYSTEM_BIT |
-					  XE_BO_CREATE_GGTT_BIT);
+					  XE_BO_CREATE_GGTT_BIT |
+					  XE_BO_GGTT_INVALIDATE_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 	guc->hwconfig.bo = bo;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 45135c3520e5..e7f02c39c2e8 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -85,7 +85,8 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
 					  XE_BO_CREATE_SYSTEM_BIT |
-					  XE_BO_CREATE_GGTT_BIT);
+					  XE_BO_CREATE_GGTT_BIT |
+					  XE_BO_GGTT_INVALIDATE_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f4b031b8d9de..c0db425eb74a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -955,7 +955,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-					  XE_BO_CREATE_GGTT_BIT);
+					  XE_BO_CREATE_GGTT_BIT |
+					  XE_BO_GGTT_INVALIDATE_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b5e83ea172f3..ae1f32db584b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -491,7 +491,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
 						 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-						 XE_BO_CREATE_GGTT_BIT);
+						 XE_BO_CREATE_GGTT_BIT |
+						 XE_BO_GGTT_INVALIDATE_BIT);
 	if (IS_ERR(hwe->hwsp)) {
 		err = PTR_ERR(hwe->hwsp);
 		goto err_name;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index ff639fe9a181..8b1a8e27d6c1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -746,7 +746,8 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 				      ring_size + xe_lrc_size(xe, hwe->class),
 				      ttm_bo_type_kernel,
 				      XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				      XE_BO_CREATE_GGTT_BIT);
+				      XE_BO_CREATE_GGTT_BIT |
+				      XE_BO_GGTT_INVALIDATE_BIT);
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 76e95535d7f6..8d2f6faa572f 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -129,6 +129,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_SYSTEM_BIT |
 				  XE_BO_CREATE_GGTT_BIT |
+				  XE_BO_GGTT_INVALIDATE_BIT |
 				  XE_BO_NEEDS_UC |
 				  XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 2c4632259edd..e3f952822a1d 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -49,7 +49,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 
 	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
+				  XE_BO_CREATE_GGTT_BIT |
+				  XE_BO_GGTT_INVALIDATE_BIT);
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
 			PTR_ERR(bo));
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a9d25b3fa67c..31fd9bde5c87 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -771,7 +771,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		return 0;
 
 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
-			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
+			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT |
+			 XE_BO_GGTT_INVALIDATE_BIT);
 
 	uc_fw_release(fw);
 
-- 
2.34.1

