Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563E0D5B858
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 00:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB7210E58B;
	Tue, 29 Oct 2024 00:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkW6j0Z4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED1C10E259
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 00:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730161919; x=1761697919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BqayzHsGT9ugy+ccmSxHDOlEOvw8CYf6mGh+LRYTlIY=;
 b=fkW6j0Z4hK5TaAX6gK4OGmuoOT+9M5YBCRzB1QQFtdSoh3nERjYYOpKJ
 j0j0eS4nCEYQjzKKfHLJcux9wgsFOuYduk+qDB+oYZmbSF5JqD5j/Cd9R
 lElwJOKWS4jrQegvgx5xlpJBYd2c+IB5D1qstfa3Ssml5v8kam1CAJ/j2
 kyvMh30pA7ZDIlwiukQkFRT+TGyZt2z5AWaqaFOH3R9xHxG7DAMdgpvSA
 f5dOjOmfIIeUt2y7AQSsL/t/grnwyqlj+J1pRUR4FRRGIOOb2qeRjcJEj
 cylyWjO/yInyMUXH/LA9wC3aIPFG4FFUp7boCnz0M+wEpLbJQL06KvL9e A==;
X-CSE-ConnectionGUID: vEi2C6PwRWyGrkraJQjc5w==
X-CSE-MsgGUID: Wda7GxqJR3S3U25mBNJkPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52337962"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52337962"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 17:31:58 -0700
X-CSE-ConnectionGUID: yBgP3Ig/QAKH/za89j9T8A==
X-CSE-MsgGUID: zJiVXv9KROGW7BuUOaZDPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="119244307"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 17:31:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, umesh.nerlige.ramappa@intel.com,
 riana.tauro@intel.com
Subject: [PATCH 3/3] drm/xe: Add XE_BO_FLAG_PINNED_NEED_LOAD
Date: Mon, 28 Oct 2024 17:32:24 -0700
Message-Id: <20241029003224.2257439-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029003224.2257439-1-matthew.brost@intel.com>
References: <20241029003224.2257439-1-matthew.brost@intel.com>
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

Not all pinned BOs need a memcpy to restored, rather just ones which are
required for resume to complete. Add XE_BO_FLAG_PINNED_NEED_LOAD which
indicates a BO needs to restored via a memcpy prior to loading GuC. This
should speedup resume / d3cold exit slightly as the GPU can be used to
copy some of the pinned BOs.

Marking most kernel BOs and migration LRC with
XE_BO_FLAG_PINNED_NEED_LOAD to be safe. This could be trimmed down in
future.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                 |  10 +-
 drivers/gpu/drm/xe/xe_bo.h                 |   1 +
 drivers/gpu/drm/xe/xe_bo_evict.c           | 117 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ggtt.c               |   2 +-
 drivers/gpu/drm/xe/xe_gsc.c                |   1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c          |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |   1 +
 drivers/gpu/drm/xe/xe_huc.c                |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.c          |   1 +
 drivers/gpu/drm/xe/xe_lmtt.c               |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                |   3 +
 drivers/gpu/drm/xe/xe_memirq.c             |   1 +
 drivers/gpu/drm/xe/xe_migrate.c            |   1 +
 drivers/gpu/drm/xe/xe_uc_fw.c              |   1 +
 14 files changed, 108 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6c8fd5ced2a2..4c48e7ef1e1f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -773,15 +773,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
 		ttm_bo_move_null(&bo->ttm, new_mem);
-	} else if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
+	} else if (xe_bo_is_pinned(bo) && bo->flags & XE_BO_FLAG_PINNED_NEED_LOAD) {
 		/*
 		 * Kernel memory that is pinned should only be moved on suspend
 		 * / resume, some of the pinned memory is required for the
 		 * device to resume / use the GPU to move other evicted memory
-		 * (user memory) around. This likely could be optimized a bit
-		 * futher where we find the minimum set of pinned memory
-		 * required for resume but for simplity doing a memcpy for all
-		 * pinned memory.
+		 * (user memory, pinned kernel not required for load) around.
 		 */
 		ret = xe_bo_vmap(bo);
 		if (!ret) {
@@ -1706,7 +1703,8 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
 	u32 dst_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT;
 
 	dst_flags |= (*src)->flags & (XE_BO_FLAG_GGTT_INVALIDATE |
-				      XE_BO_FLAG_PINNED_WONTNEED);
+				      XE_BO_FLAG_PINNED_WONTNEED |
+				      XE_BO_FLAG_PINNED_NEED_LOAD);
 
 	xe_assert(xe, IS_DGFX(xe));
 	xe_assert(xe, !(*src)->vmap.is_iomem);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 854ab8624d7a..cbda820c9d79 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -40,6 +40,7 @@
 #define XE_BO_FLAG_NEEDS_2M		BIT(16)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
 #define XE_BO_FLAG_PINNED_WONTNEED	BIT(18)
+#define XE_BO_FLAG_PINNED_NEED_LOAD	BIT(19)
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 32043e1e5a86..049868610e0b 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -78,6 +78,37 @@ int xe_bo_evict_all(struct xe_device *xe)
 	list_splice_tail(&still_in_list, &xe->pinned.external_vram);
 	spin_unlock(&xe->pinned.lock);
 
+	/* Kernel memory with GPU copy */
+	INIT_LIST_HEAD(&still_in_list);
+	spin_lock(&xe->pinned.lock);
+	for (;;) {
+		bo = list_first_entry_or_null(&xe->pinned.kernel_bo_present,
+					      typeof(*bo), pinned_link);
+		if (!bo)
+			break;
+
+		if (bo->flags & (XE_BO_FLAG_PINNED_NEED_LOAD |
+				 XE_BO_FLAG_PINNED_WONTNEED)) {
+			list_move_tail(&bo->pinned_link, &still_in_list);
+			continue;
+		}
+
+		xe_bo_get(bo);
+		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
+		spin_unlock(&xe->pinned.lock);
+
+		xe_bo_lock(bo, false);
+		ret = xe_bo_evict_pinned(bo);
+		xe_bo_unlock(bo);
+		xe_bo_put(bo);
+		if (ret)
+			return ret;
+
+		spin_lock(&xe->pinned.lock);
+	}
+	list_splice_tail(&still_in_list, &xe->pinned.kernel_bo_present);
+	spin_unlock(&xe->pinned.lock);
+
 	/*
 	 * Wait for all user BO to be evicted as those evictions depend on the
 	 * memory moved below.
@@ -109,6 +140,43 @@ int xe_bo_evict_all(struct xe_device *xe)
 	return 0;
 }
 
+static int do_restore_kernel(struct xe_device *xe, struct xe_bo *bo)
+{
+	int ret;
+
+	xe_bo_get(bo);
+	list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
+	spin_unlock(&xe->pinned.lock);
+
+	xe_bo_lock(bo, false);
+	ret = xe_bo_restore_pinned(bo);
+	xe_bo_unlock(bo);
+	if (ret) {
+		xe_bo_put(bo);
+		return ret;
+	}
+
+	if (bo->flags & XE_BO_FLAG_GGTT) {
+		struct xe_tile *tile = bo->tile;
+
+		mutex_lock(&tile->mem.ggtt->lock);
+		xe_ggtt_map_bo(tile->mem.ggtt, bo);
+		mutex_unlock(&tile->mem.ggtt->lock);
+	}
+
+	/*
+	 * We expect validate to trigger a move VRAM and our move code
+	 * should setup the iosys map.
+	 */
+	xe_assert(xe, !iosys_map_is_null(&bo->vmap));
+
+	xe_bo_put(bo);
+
+	spin_lock(&xe->pinned.lock);
+
+	return 0;
+}
+
 /**
  * xe_bo_restore_kernel - restore kernel BOs to VRAM
  *
@@ -122,48 +190,32 @@ int xe_bo_evict_all(struct xe_device *xe)
  */
 int xe_bo_restore_kernel(struct xe_device *xe)
 {
+	struct list_head still_in_list;
 	struct xe_bo *bo;
 	int ret;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
+	INIT_LIST_HEAD(&still_in_list);
 	spin_lock(&xe->pinned.lock);
 	for (;;) {
 		bo = list_first_entry_or_null(&xe->pinned.evicted,
 					      typeof(*bo), pinned_link);
 		if (!bo)
 			break;
-		xe_bo_get(bo);
-		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
-		spin_unlock(&xe->pinned.lock);
 
-		xe_bo_lock(bo, false);
-		ret = xe_bo_restore_pinned(bo);
-		xe_bo_unlock(bo);
-		if (ret) {
-			xe_bo_put(bo);
-			return ret;
+		if (!(bo->flags & (XE_BO_FLAG_PINNED_NEED_LOAD |
+				   XE_BO_FLAG_PINNED_WONTNEED))) {
+			list_move_tail(&bo->pinned_link, &still_in_list);
+			continue;
 		}
 
-		if (bo->flags & XE_BO_FLAG_GGTT) {
-			struct xe_tile *tile = bo->tile;
-
-			mutex_lock(&tile->mem.ggtt->lock);
-			xe_ggtt_map_bo(tile->mem.ggtt, bo);
-			mutex_unlock(&tile->mem.ggtt->lock);
-		}
-
-		/*
-		 * We expect validate to trigger a move VRAM and our move code
-		 * should setup the iosys map.
-		 */
-		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
-
-		xe_bo_put(bo);
-
-		spin_lock(&xe->pinned.lock);
+		ret = do_restore_kernel(xe, bo);
+		if (ret)
+			return ret;
 	}
+	list_splice_tail(&still_in_list, &xe->pinned.evicted);
 	spin_unlock(&xe->pinned.lock);
 
 	return 0;
@@ -190,9 +242,20 @@ int xe_bo_restore_user(struct xe_device *xe)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Pinned user memory in VRAM should be validated on resume */
 	INIT_LIST_HEAD(&still_in_list);
 	spin_lock(&xe->pinned.lock);
+	/* Pinned kernel memory with GPU copy */
+	for (;;) {
+		bo = list_first_entry_or_null(&xe->pinned.evicted,
+					      typeof(*bo), pinned_link);
+		if (!bo)
+			break;
+
+		ret = do_restore_kernel(xe, bo);
+		if (ret)
+			return ret;
+	}
+	/* Pinned user memory in VRAM should be validated on resume */
 	for (;;) {
 		bo = list_first_entry_or_null(&xe->pinned.external_vram,
 					      typeof(*bo), pinned_link);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0124ad120c04..d42dbda983c1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -357,7 +357,7 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
 int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	unsigned int flags;
+	unsigned int flags = XE_BO_FLAG_PINNED_NEED_LOAD;
 	int err;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 1eb791ddc375..bbb68575a207 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -474,6 +474,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 		return -ENODEV;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, SZ_4M,
+					  XE_BO_FLAG_PINNED_NEED_LOAD |
 					  XE_BO_FLAG_STOLEN |
 					  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index fc64b45d324b..df271f9b657d 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -384,6 +384,7 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 		return -ENOMEM;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, GSC_PROXY_CHANNEL_SIZE,
+					  XE_BO_FLAG_PINNED_NEED_LOAD |
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 062a0c2fd2cd..75b225cbddf8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1405,6 +1405,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	bo = xe_bo_create_pin_map(xe, tile, NULL,
 				  ALIGN(size, PAGE_SIZE),
 				  ttm_bo_type_kernel,
+				  XE_BO_FLAG_PINNED_NEED_LOAD |
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				  XE_BO_FLAG_NEEDS_2M |
 				  XE_BO_FLAG_PINNED);
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 6a846e4cb221..1008626b517e 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -53,6 +53,7 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 	/* we use a single object for both input and output */
 	bo = xe_managed_bo_create_pin_map(xe, gt_to_tile(gt),
 					  PXP43_HUC_AUTH_INOUT_SIZE * 2,
+					  XE_BO_FLAG_PINNED_NEED_LOAD |
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1557acee3523..46e4342cc9cd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -577,6 +577,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_sr_apply_whitelist(hwe);
 
 	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
+						 XE_BO_FLAG_PINNED_NEED_LOAD |
 						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 						 XE_BO_FLAG_GGTT |
 						 XE_BO_FLAG_GGTT_INVALIDATE);
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index a60ceae4c6dd..c3e76ddf24be 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -70,6 +70,7 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 				  PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
 					     lmtt->ops->lmtt_pte_num(level)),
 				  ttm_bo_type_kernel,
+				  XE_BO_FLAG_PINNED_NEED_LOAD |
 				  XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
 				  XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_PINNED);
 	if (IS_ERR(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4f64c7f4e68d..fec5aa700ce1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -884,6 +884,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	void *init_data = NULL;
 	u32 arb_enable;
 	u32 lrc_size;
+	unsigned long restore_flags = vm && vm->flags & XE_VM_FLAG_MIGRATION ?
+		XE_BO_FLAG_PINNED_NEED_LOAD : 0;
 	int err;
 
 	kref_init(&lrc->refcount);
@@ -898,6 +900,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 */
 	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc_size,
 				       ttm_bo_type_kernel,
+				       restore_flags |
 				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				       XE_BO_FLAG_GGTT |
 				       XE_BO_FLAG_GGTT_INVALIDATE);
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index f833da88150a..6e63a7c4206e 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -187,6 +187,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	/* XXX: convert to managed bo */
 	bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
 				  ttm_bo_type_kernel,
+				  XE_BO_FLAG_PINNED_NEED_LOAD |
 				  XE_BO_FLAG_SYSTEM |
 				  XE_BO_FLAG_GGTT |
 				  XE_BO_FLAG_GGTT_INVALIDATE |
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cfd31ae49cc1..cf8ad0c47dfb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -208,6 +208,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm,
 				  num_entries * XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
+				  XE_BO_FLAG_PINNED_NEED_LOAD |
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				  XE_BO_FLAG_PINNED);
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b0deb082ab2b..984b0e0a6241 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -793,6 +793,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		return 0;
 
 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
+			 XE_BO_FLAG_PINNED_NEED_LOAD |
 			 XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT |
 			 XE_BO_FLAG_GGTT_INVALIDATE);
 
-- 
2.34.1

