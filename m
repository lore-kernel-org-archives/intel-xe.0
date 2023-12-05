Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72765C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 14:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4726710E551;
	Tue,  5 Dec 2023 14:52:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E6710E56A
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701787967; x=1733323967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rpRLrUWClpZsA/oNgHI5EgkxDP4SZWVCUcee9QJ6yRU=;
 b=J3nrKt5ZM3/FvRPYf46GP28pEpBeKhM8UDcizwXoJzH5hWnXfVKIdrjj
 6PzOdg5ToN6keB6nWC6CzEQydnqJZMZriD5oDRkul34eQD6G0vKpRo4bZ
 b2fI5YNew+QhSVwOnsQTn098j+NNnw0S6kpOKpB4h4lfV1zFaGbhCRffO
 dCmIIT7oIdNmralKVeiUjXT/iZ8V6E4KswgSd40eSuzewxBVTwtwh7uvH
 /NyZhYeEDqZKwdRz8yPbzmrKwSIx2dtmoSIpLUIv3q4mOUqi2Ta1G28Y7
 jL7tM3ahRezIvL1Y8a47LlkvFjURD/ZuQIEmvkv4caZHX43gSoOUCPqJh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="7249484"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="7249484"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 06:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944281166"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="944281166"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 06:52:46 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 06:52:35 -0800
Message-Id: <20231205145235.2114761-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Rename info.supports_* to info.has_*
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rename supports_mmio_ext and supports_usm to use a has_ prefix so the
flags are grouped together. This settles on just one variant for
positive info matching ("has_") and one for negative ("skip_").

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  4 ++--
 drivers/gpu/drm/xe/xe_debugfs.c       |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h  |  8 ++++----
 drivers/gpu/drm/xe/xe_exec_queue.c    |  6 +++---
 drivers/gpu/drm/xe/xe_gt.c            |  2 +-
 drivers/gpu/drm/xe/xe_gt.h            |  2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c  |  4 ++--
 drivers/gpu/drm/xe/xe_guc_ads.c       |  4 ++--
 drivers/gpu/drm/xe/xe_hw_engine.c     |  4 ++--
 drivers/gpu/drm/xe/xe_lrc.c           |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_mmio.c          |  5 +++--
 drivers/gpu/drm/xe/xe_pci.c           | 12 ++++++------
 drivers/gpu/drm/xe/xe_pci_types.h     |  2 +-
 drivers/gpu/drm/xe/xe_vm.c            |  2 +-
 15 files changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 83d6a66ed369..47fcd6e6b777 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -37,7 +37,7 @@ static int run_sanity_job(struct xe_migrate *m, struct xe_device *xe,
 			  struct xe_bb *bb, u32 second_idx, const char *str,
 			  struct kunit *test)
 {
-	u64 batch_base = xe_migrate_batch_base(m, xe->info.supports_usm);
+	u64 batch_base = xe_migrate_batch_base(m, xe->info.has_usm);
 	struct xe_sched_job *job = xe_bb_create_migration_job(m->q, bb,
 							      batch_base,
 							      second_idx);
@@ -308,7 +308,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		goto free_pt;
 	}
 
-	bb = xe_bb_new(tile->primary_gt, 32, xe->info.supports_usm);
+	bb = xe_bb_new(tile->primary_gt, 32, xe->info.has_usm);
 	if (IS_ERR(bb)) {
 		KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
 			   PTR_ERR(bb));
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 2de8a0b9da18..f1e80be8b930 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -53,8 +53,8 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
 	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
-	drm_printf(&p, "supports_usm %s\n", str_yes_no(xe->info.supports_usm));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
+	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	for_each_gt(gt, xe, id) {
 		drm_printf(&p, "gt%d force wake %d\n", id,
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9a212dbdb8a4..5b30836fcb23 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -242,8 +242,6 @@ struct xe_device {
 
 		/** @is_dgfx: is discrete device */
 		u8 is_dgfx:1;
-		/** @supports_usm: Supports unified shared memory */
-		u8 supports_usm:1;
 		/** @has_asid: Has address space ID */
 		u8 has_asid:1;
 		/** @force_execlist: Forced execlist submission */
@@ -252,18 +250,20 @@ struct xe_device {
 		u8 has_flat_ccs:1;
 		/** @has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
+		/** @has_mmio_ext: Device has extra MMIO address range */
+		u8 has_mmio_ext:1;
 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
 		u8 has_range_tlb_invalidation:1;
 		/** @has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
+		/** @has_usm: Device has unified shared memory support */
+		u8 has_usm:1;
 		/** @enable_display: display enabled */
 		u8 enable_display:1;
 		/** @skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
 		u8 skip_mtcfg:1;
 		/** @skip_pcode: skip access to PCODE uC */
 		u8 skip_pcode:1;
-		/** @supports_mmio_ext: supports MMIO extension/s */
-		u8 supports_mmio_ext:1;
 		/** @has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
 		/** @skip_guc_pc: Skip GuC based PM feature init */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index cb284c4ad049..53b432265631 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -362,7 +362,7 @@ static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue
 	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
+	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
 		return -EINVAL;
 
 	q->usm.acc_trigger = value;
@@ -376,7 +376,7 @@ static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue
 	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
+	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
 		return -EINVAL;
 
 	q->usm.acc_notify = value;
@@ -390,7 +390,7 @@ static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_q
 	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
+	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
 		return -EINVAL;
 
 	if (value > DRM_XE_ACC_GRANULARITY_64M)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a9c71da985d3..70ad563c2c65 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -427,7 +427,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		/*
 		 * USM has its only SA pool to non-block behind user operations
 		 */
-		if (gt_to_xe(gt)->info.supports_usm) {
+		if (gt_to_xe(gt)->info.has_usm) {
 			gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt), SZ_1M, 16);
 			if (IS_ERR(gt->usm.bb_pool)) {
 				err = PTR_ERR(gt->usm.bb_pool);
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a0..11265e851a81 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -63,7 +63,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
+	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index a5358064a4e0..4489aadc7a52 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -398,7 +398,7 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i;
 
-	if (!xe->info.supports_usm)
+	if (!xe->info.has_usm)
 		return 0;
 
 	for (i = 0; i < NUM_PF_QUEUE; ++i) {
@@ -431,7 +431,7 @@ void xe_gt_pagefault_reset(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i;
 
-	if (!xe->info.supports_usm)
+	if (!xe->info.has_usm)
 		return;
 
 	for (i = 0; i < NUM_PF_QUEUE; ++i) {
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 2f5ff090aa6b..6006f992b781 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -140,7 +140,7 @@ static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
 {
 	struct xe_device *xe = ads_to_xe(ads);
 
-	if (!xe->info.supports_usm)
+	if (!xe->info.has_usm)
 		return 0;
 
 	return GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX;
@@ -595,7 +595,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 	guc_capture_list_init(ads);
 	guc_doorbell_init(ads);
 
-	if (xe->info.supports_usm) {
+	if (xe->info.has_usm) {
 		guc_um_init_params(ads);
 		ads_blob_write(ads, ads.um_init_data, base +
 			       offsetof(struct __guc_ads_blob, um_init_params));
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 108ecbfe593e..37279cee6ad4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -450,7 +450,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		xe_hw_engine_enable_ring(hwe);
 
 	/* We reserve the highest BCS instance for USM */
-	if (xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY)
+	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
 		gt->usm.reserved_bcs_instance = hwe->instance;
 
 	err = drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
@@ -859,6 +859,6 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	if (hwe->class == XE_ENGINE_CLASS_OTHER)
 		return true;
 
-	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
+	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 17c0eb9e62cf..d6dfbd0bdc70 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -759,7 +759,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID,
 				     (q->usm.acc_granularity <<
 				      ACC_GRANULARITY_S) | vm->usm.asid);
-	if (xe->info.supports_usm && vm)
+	if (xe->info.has_usm && vm)
 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ACC_CTR_THOLD,
 				     (q->usm.acc_notify << ACC_NOTIFY_S) |
 				     q->usm.acc_trigger);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e8b567708ac0..c9c4d2428068 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -217,7 +217,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	if (!IS_DGFX(xe)) {
 		/* Write out batch too */
 		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
-		if (xe->info.supports_usm) {
+		if (xe->info.has_usm) {
 			batch = tile->primary_gt->usm.bb_pool->bo;
 			m->usm_batch_base_ofs = m->batch_base_ofs;
 		}
@@ -237,7 +237,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
 
-		if (xe->info.supports_usm) {
+		if (xe->info.has_usm) {
 			batch = tile->primary_gt->usm.bb_pool->bo;
 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
 			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
@@ -374,7 +374,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		return ERR_PTR(err);
 	}
 
-	if (xe->info.supports_usm) {
+	if (xe->info.has_usm) {
 		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
 							   XE_ENGINE_CLASS_COPY,
 							   primary_gt->usm.reserved_bcs_instance,
@@ -397,7 +397,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		xe_vm_close_and_put(vm);
 		return ERR_CAST(m->q);
 	}
-	if (xe->info.supports_usm)
+	if (xe->info.has_usm)
 		m->q->priority = DRM_SCHED_PRIORITY_KERNEL;
 
 	mutex_init(&m->job_mutex);
@@ -706,7 +706,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		u32 update_idx;
 		u64 ccs_ofs, ccs_size;
 		u32 ccs_pt;
-		bool usm = xe->info.supports_usm;
+		bool usm = xe->info.has_usm;
 
 		src_L0 = xe_migrate_res_sizes(&src_it);
 		dst_L0 = xe_migrate_res_sizes(&dst_it);
@@ -956,7 +956,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		struct xe_sched_job *job;
 		struct xe_bb *bb;
 		u32 batch_size, update_idx;
-		bool usm = xe->info.supports_usm;
+		bool usm = xe->info.has_usm;
 
 		clear_L0 = xe_migrate_res_sizes(&src_it);
 		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
@@ -1227,7 +1227,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
 	u64 addr;
 	int err = 0;
-	bool usm = !q && xe->info.supports_usm;
+	bool usm = !q && xe->info.has_usm;
 	bool first_munmap_rebind = vma &&
 		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
 	struct xe_exec_queue *q_override = !q ? m->q : q;
@@ -1264,7 +1264,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 */
 	xe_tile_assert(tile, batch_size < SZ_128K);
 
-	bb = xe_bb_new(gt, batch_size, !q && xe->info.supports_usm);
+	bb = xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
 	if (IS_ERR(bb))
 		return ERR_CAST(bb);
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 35aeb50b7158..f660cfb79f50 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -333,11 +333,12 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 	}
 
 add_mmio_ext:
-	/* By design, there's a contiguous multi-tile MMIO space (16MB hard coded per tile).
+	/*
+	 * By design, there's a contiguous multi-tile MMIO space (16MB hard coded per tile).
 	 * When supported, there could be an additional contiguous multi-tile MMIO extension
 	 * space ON TOP of it, and hence the necessity for distinguished MMIO spaces.
 	 */
-	if (xe->info.supports_mmio_ext) {
+	if (xe->info.has_mmio_ext) {
 		regs = xe->mmio.regs + tile_mmio_size * tile_count;
 
 		for_each_tile(tile, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 076e9dc85838..465ffbe9d032 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -59,14 +59,14 @@ struct xe_device_desc {
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
+
 	u8 has_display:1;
 	u8 has_heci_gscfi:1;
-
 	u8 has_llc:1;
+	u8 has_mmio_ext:1;
 	u8 has_sriov:1;
 	u8 skip_mtcfg:1;
 	u8 skip_pcode:1;
-	u8 supports_mmio_ext:1;
 	u8 skip_guc_pc:1;
 };
 
@@ -147,7 +147,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
 
 	.has_asid = 1,
 	.has_flat_ccs = 0,
-	.supports_usm = 1,
+	.has_usm = 1,
 };
 
 static const struct xe_graphics_desc graphics_xelpg = {
@@ -165,7 +165,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
 	.has_range_tlb_invalidation = 1, \
-	.supports_usm = 0 /* FIXME: implementation missing */, \
+	.has_usm = 0 /* FIXME: implementation missing */, \
 	.va_bits = 48, \
 	.vm_max_level = 4, \
 	.hw_engine_mask = \
@@ -548,10 +548,10 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_llc = desc->has_llc;
+	xe->info.has_mmio_ext = desc->has_mmio_ext;
 	xe->info.has_sriov = desc->has_sriov;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
-	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
@@ -614,10 +614,10 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.vram_flags = graphics_desc->vram_flags;
 	xe->info.va_bits = graphics_desc->va_bits;
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
-	xe->info.supports_usm = graphics_desc->supports_usm;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
+	xe->info.has_usm = graphics_desc->has_usm;
 
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index dd3546ba6f90..b1ad12fa22d6 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -27,7 +27,7 @@ struct xe_graphics_desc {
 	u8 has_asid:1;
 	u8 has_flat_ccs:1;
 	u8 has_range_tlb_invalidation:1;
-	u8 supports_usm:1;
+	u8 has_usm:1;
 };
 
 struct xe_media_desc {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e09050f16f07..b8e22d50d30d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1942,7 +1942,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
 
 	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
-			 !xe->info.supports_usm))
+			 !xe->info.has_usm))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
-- 
2.40.1

