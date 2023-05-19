Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0554C7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5F110E64C;
	Fri, 19 May 2023 23:19:06 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73410E621
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538328; x=1716074328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ax/RT7HubGaetG7vNbMCN5aOjNjBFPOpVvgVc1LwL8=;
 b=glx87KKdsaHWgH2KJbHaxV2nlYEmZr3TZo4KAdHKFM7srdaU1pwymXjs
 HcqYJUePZcu9bwe6DEL9IeZevYWsGgYfmzUBX62RvlWHhow7urwuLIMh1
 Z7UiNmgiTWlF92YqjlNGlqH+ZsEEQrdxzyDk5cVWEixrObzuBEblxJ9RQ
 Qz5Js+rGU47sBzOZuHc21dCQmADTMVD3MkNNLqJm/Dq+K57PadYmgWZQE
 x2fBkSS4q5QlfXLhQQzWp5xt/Tm/Z8ufAptI/L6d5pAmkASBCX4+5vAVN
 PpmWU5t4Xbj9hxxom47sTQULDzvSuU3Ziw42PMZ+ZYmfBuh9eDjme2+Ut A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526340"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526340"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888688"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888688"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:00 -0700
Message-Id: <20230519231827.3572452-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 03/30] drm/xe: Add backpointer from gt to tile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rather than a backpointer to the xe_device, a GT should have a
backpointer to its tile (which can then be used to lookup the device if
necessary).

The gt_to_xe() helper macro (which moves from xe_gt.h to xe_gt_types.h)
can and should still be used to jump directly from an xe_gt to
xe_device.

v2:
 - Fix kunit test build
 - Move a couple changes to the previous patch. (Lucas)

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c            |  2 +-
 drivers/gpu/drm/xe/xe_bb.c                  |  2 +-
 drivers/gpu/drm/xe/xe_gt.h                  |  5 -----
 drivers/gpu/drm/xe/xe_gt_printk.h           |  6 +++---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++--
 drivers/gpu/drm/xe/xe_gt_types.h            | 14 ++++++++++++--
 drivers/gpu/drm/xe/xe_mocs.c                | 14 +++++++-------
 drivers/gpu/drm/xe/xe_pci.c                 |  2 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  2 +-
 9 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 6075f12a1962..8f3afdc6cca6 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -90,7 +90,7 @@ static int ccs_test_migrate(struct xe_gt *gt, struct xe_bo *bo,
 	}
 
 	/* Check last CCS value, or at least last value in page. */
-	offset = xe_device_ccs_bytes(gt->xe, bo->size);
+	offset = xe_device_ccs_bytes(gt_to_xe(gt), bo->size);
 	offset = min_t(u32, offset, PAGE_SIZE) / sizeof(u64) - 1;
 	if (cpu_map[offset] != get_val) {
 		KUNIT_FAIL(test,
diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 3deb2d55f421..bf7c94b769d7 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -16,7 +16,7 @@
 
 static int bb_prefetch(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt->xe;
+	struct xe_device *xe = gt_to_xe(gt);
 
 	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
 		/*
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 086369f7ee6d..f4e98f499b36 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -49,11 +49,6 @@ static inline bool xe_gt_is_media_type(struct xe_gt *gt)
 	return gt->info.type == XE_GT_TYPE_MEDIA;
 }
 
-#define gt_to_xe(gt__)								\
-	_Generic(gt__,								\
-		 const struct xe_gt *: (const struct xe_device *)((gt__)->xe),	\
-		 struct xe_gt *: (gt__)->xe)
-
 static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 {
 	struct xe_device *xe = gt_to_xe(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 0b801429cf1a..5991bcadd47e 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -11,7 +11,7 @@
 #include "xe_device_types.h"
 
 #define xe_gt_printk(_gt, _level, _fmt, ...) \
-	drm_##_level(&(_gt)->xe->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
 
 #define xe_gt_err(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
@@ -32,10 +32,10 @@
 	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
 
 #define xe_gt_WARN(_gt, _condition, _fmt, ...) \
-	drm_WARN(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+	drm_WARN(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
 
 #define xe_gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
-	drm_WARN_ONCE(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+	drm_WARN_ONCE(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
 
 #define xe_gt_WARN_ON(_gt, _condition) \
 	xe_gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index c815a42e2cdb..c9e8825c02aa 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -322,8 +322,8 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		TLB_INVALIDATION_SEQNO_MAX;
 	if (!expected_seqno)
 		expected_seqno = 1;
-	if (drm_WARN_ON(&gt->xe->drm, expected_seqno != msg[0])) {
-		drm_err(&gt->xe->drm, "TLB expected_seqno(%d) != msg(%u)\n",
+	if (drm_WARN_ON(&gt_to_xe(gt)->drm, expected_seqno != msg[0])) {
+		drm_err(&gt_to_xe(gt)->drm, "TLB expected_seqno(%d) != msg(%u)\n",
 			expected_seqno, msg[0]);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index cac676353ac6..2bc88696af77 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -76,6 +76,16 @@ enum xe_steering_type {
 	NUM_STEERING_TYPES
 };
 
+#define gt_to_tile(gt__)							\
+	_Generic(gt__,								\
+		 const struct xe_gt *: (const struct xe_tile *)((gt__)->tile),	\
+		 struct xe_gt *: (gt__)->tile)
+
+#define gt_to_xe(gt__)										\
+	_Generic(gt__,										\
+		 const struct xe_gt *: (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
+		 struct xe_gt *: gt_to_tile(gt__)->xe)
+
 /**
  * struct xe_gt - A "Graphics Technology" unit of the GPU
  *
@@ -90,8 +100,8 @@ enum xe_steering_type {
  * separate GTs within a tile.
  */
 struct xe_gt {
-	/** @xe: backpointer to XE device */
-	struct xe_device *xe;
+	/** @tile: Backpointer to GT's tile */
+	struct xe_tile *tile;
 
 	/** @info: GT info */
 	struct {
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index c7a9e733ef3b..86277ecb749b 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -472,7 +472,7 @@ static void __init_mocs_table(struct xe_gt *gt,
 	unsigned int i;
 	u32 mocs;
 
-	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
+	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
 	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
 		      "Unused entries index should have been defined\n");
 	for (i = 0;
@@ -480,7 +480,7 @@ static void __init_mocs_table(struct xe_gt *gt,
 	     i++) {
 		struct xe_reg reg = XE_REG(addr + i * 4);
 
-		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
 		xe_mmio_write32(gt, reg, mocs);
 	}
 }
@@ -509,13 +509,13 @@ static void init_l3cc_table(struct xe_gt *gt,
 	unsigned int i;
 	u32 l3cc;
 
-	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
+	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
 	for (i = 0;
 	     i < (info->n_entries + 1) / 2 ?
 	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
 				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
 	     i++) {
-		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
 			 l3cc);
 		xe_mmio_write32(gt, LNCFCMOCS(i), l3cc);
 	}
@@ -525,7 +525,7 @@ void xe_mocs_init_early(struct xe_gt *gt)
 {
 	struct xe_mocs_info table;
 
-	get_mocs_settings(gt->xe, &table);
+	get_mocs_settings(gt_to_xe(gt), &table);
 	gt->mocs.uc_index = table.uc_index;
 	gt->mocs.wb_index = table.wb_index;
 }
@@ -538,8 +538,8 @@ void xe_mocs_init(struct xe_gt *gt)
 	/*
 	 * LLC and eDRAM control values are not applicable to dgfx
 	 */
-	flags = get_mocs_settings(gt->xe, &table);
-	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
+	flags = get_mocs_settings(gt_to_xe(gt), &table);
+	mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
 
 	if (flags & HAS_GLOBAL_MOCS)
 		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).addr);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index fc7984e4b40c..1e1e401b25ae 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -556,7 +556,7 @@ static int xe_info_init(struct xe_device *xe,
 
 		gt = &tile->primary_gt;
 		gt->info.id = id;
-		gt->xe = xe;
+		gt->tile = tile;
 
 		if (id == 0) {
 			gt->info.type = XE_GT_TYPE_MAIN;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f15282996c3b..61126cefe0b5 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -695,7 +695,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		 * TODO: Suballocate the pt bo to avoid wasting a lot of
 		 * memory.
 		 */
-		if (GRAPHICS_VERx100(xe_walk->gt->xe) >= 1250 && level == 1 &&
+		if (GRAPHICS_VERx100(gt_to_xe(xe_walk->gt)) >= 1250 && level == 1 &&
 		    covers && xe_pt_scan_64K(addr, next, xe_walk)) {
 			walk->shifts = xe_compact_pt_shifts;
 			flags |= XE_PDE_64K;
-- 
2.40.0

