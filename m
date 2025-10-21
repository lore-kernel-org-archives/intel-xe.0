Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33814CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 13:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C231910E5E9;
	Tue, 21 Oct 2025 13:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4V+OilW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6496210E5E9
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 13:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761053142; x=1792589142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OeAfzRjg1ZQktH6jOvF2F46JZpuQqeRoxRaduNShiFA=;
 b=G4V+OilW5SzvhniFZtFvgR/VXk2zxAnwB/2ZO9nKO+wyK+9wqLGzz4LN
 cBZpUEaxRwHuJV9i9gIaebQE+kZc+fqtN1S0w1e+pDHz2efTeU7XH6E8+
 +FlZSSio50VmGwD3q9oMjII7JjJy9eaQffkP1EosVi4XhHh+bJJm7CoZC
 UVnKtd2o8yQI4cIUeJXFSOnmygD0iBIMPeKn8hHa8Cvud6RS4BWpDSO1t
 eNngTMiy9E6lSVJSmrWc0Ew/s9ntoa8DjxYjIt2/UFW/0DvaBSZcDPxhf
 Iv5/KT/fu5vKVOjLETtWAz0xa1Swo3IlYULM+4qHv30ffE7V3tMleG2xC Q==;
X-CSE-ConnectionGUID: GdruLkUHQwm4RWWcoensMg==
X-CSE-MsgGUID: 1OmLaMhkTZOHnjj2e9EMWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63218549"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63218549"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 06:25:42 -0700
X-CSE-ConnectionGUID: cuTQkaeXSiK1u51mo8WmXg==
X-CSE-MsgGUID: M/7ov5qPTA20i2IzvtqqMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="187859410"
Received: from sanjay-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 06:25:41 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] drm/xe: Fix spelling and typos across XE driver files
Date: Tue, 21 Oct 2025 18:50:55 +0530
Message-ID: <20251021132054.840023-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Corrected various spelling mistakes and typos in multiple
files under the XE directory. These fixes improve clarity
and maintain consistency in documentation.

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c            | 4 ++--
 drivers/gpu/drm/xe/xe_device.c        | 2 +-
 drivers/gpu/drm/xe/xe_gt_freq.c       | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   | 2 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 4 ++--
 drivers/gpu/drm/xe/xe_pm.c            | 2 +-
 drivers/gpu/drm/xe/xe_svm.c           | 2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.h     | 2 +-
 drivers/gpu/drm/xe/xe_validation.h    | 6 +++---
 drivers/gpu/drm/xe/xe_vm.c            | 8 ++++----
 drivers/gpu/drm/xe/xe_vm_types.h      | 2 +-
 12 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7b6502081873..c899a895492e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2105,7 +2105,7 @@ void xe_bo_free(struct xe_bo *bo)
  * if the function should allocate a new one.
  * @tile: The tile to select for migration of this bo, and the tile used for
  * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
- * @resv: Pointer to a locked shared reservation object to use fo this bo,
+ * @resv: Pointer to a locked shared reservation object to use of this bo,
  * or NULL for the xe_bo to use its own.
  * @bulk: The bulk move to use for LRU bumping, or NULL for external bos.
  * @size: The storage size to use for the bo.
@@ -2629,7 +2629,7 @@ struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
  * @size: The storage size to use for the bo.
  * @type: The TTM buffer object type.
  * @flags: XE_BO_FLAG_ flags.
- * @intr: Whether to execut any waits for backing store interruptible.
+ * @intr: Whether to execute any waits for backing store interruptible.
  *
  * Create a pinned and mapped bo. The bo will be external and not associated
  * with a VM.
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5f6a412b571c..47f5391ad8e9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1217,7 +1217,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
  *
  *   /sys/bus/pci/devices/<device>/survivability_mode
  *
- * - Admin/userpsace consumer can use firmware flashing tools like fwupd to flash
+ * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
  *   firmware and restore device to normal operation.
  */
 
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 701349251bbc..e88f113226bc 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -36,7 +36,7 @@
  * - act_freq: The actual resolved frequency decided by PCODE.
  * - cur_freq: The current one requested by GuC PC to the PCODE.
  * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
- * - rpa_freq: The Render Performance (RP) A level, which is the achiveable one.
+ * - rpa_freq: The Render Performance (RP) A level, which is the achievable one.
  *   Calculated by PCODE at runtime based on multiple running conditions
  * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
  *   Calculated by PCODE at runtime based on multiple running conditions
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 46518e629ba3..382083675021 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -739,7 +739,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
 		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
-		smp_wmb();	/* Ensure above writes visable before wake */
+		smp_wmb();	/* Ensure above writes visible before wake */
 
 		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 6bf2103602f8..a80175c7c478 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -207,7 +207,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
  * @guc: GuC object
  * @tlb_inval: TLB invalidation client
  *
- * Inititialize GuC TLB invalidation by setting back pointer in TLB invalidation
+ * Initialize GuC TLB invalidation by setting back pointer in TLB invalidation
  * client to the GuC and setting GuC backend ops.
  */
 void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3112c966c67d..7d60c7c09f33 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1981,7 +1981,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
  *
  * Copy from an array dma addresses to a VRAM device physical address
  *
- * Return: dma fence for migrate to signal completion on succees, ERR_PTR on
+ * Return: dma fence for migrate to signal completion on success, ERR_PTR on
  * failure
  */
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
@@ -2002,7 +2002,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
  *
  * Copy from a VRAM device physical address to an array dma addresses
  *
- * Return: dma fence for migrate to signal completion on succees, ERR_PTR on
+ * Return: dma fence for migrate to signal completion on success, ERR_PTR on
  * failure
  */
 struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 210298c4bcb1..4f8688fd3f00 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -102,7 +102,7 @@ static void xe_pm_block_end_signalling(void)
 /**
  * xe_pm_might_block_on_suspend() - Annotate that the code might block on suspend
  *
- * Annotation to use where the code might block or sieze to make
+ * Annotation to use where the code might block or seize to make
  * progress pending resume completion.
  */
 void xe_pm_might_block_on_suspend(void)
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 129e7818565c..13af589715a7 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -633,7 +633,7 @@ static int xe_svm_copy(struct page **pages,
 
 	/*
 	 * XXX: We can't derive the GT here (or anywhere in this functions, but
-	 * compute always uses the primary GT so accumlate stats on the likely
+	 * compute always uses the primary GT so accumulate stats on the likely
 	 * GT of the fault.
 	 */
 	if (gt)
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
index 554634dfd4e2..05614915463a 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -33,7 +33,7 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
  * xe_tlb_inval_fence_wait() - TLB invalidiation fence wait
  * @fence: TLB invalidation fence to wait on
  *
- * Wait on a TLB invalidiation fence until it signals, non interruptable
+ * Wait on a TLB invalidiation fence until it signals, non interruptible
  */
 static inline void
 xe_tlb_inval_fence_wait(struct xe_tlb_inval_fence *fence)
diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
index fec331d791e7..1699b9ea16a9 100644
--- a/drivers/gpu/drm/xe/xe_validation.h
+++ b/drivers/gpu/drm/xe/xe_validation.h
@@ -108,7 +108,7 @@ struct xe_val_flags {
  * @request_exclusive: Whether to lock exclusively (write mode) the next time
  * the domain lock is locked.
  * @exec_flags: The drm_exec flags used for drm_exec (re-)initialization.
- * @nr: The drm_exec nr parameter used for drm_exec (re-)initializaiton.
+ * @nr: The drm_exec nr parameter used for drm_exec (re-)initialization.
  */
 struct xe_validation_ctx {
 	struct drm_exec *exec;
@@ -137,7 +137,7 @@ bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
  * @_ret: The current error value possibly holding -ENOMEM
  *
  * Use this in way similar to drm_exec_retry_on_contention().
- * If @_ret contains -ENOMEM the tranaction is restarted once in a way that
+ * If @_ret contains -ENOMEM the transaction is restarted once in a way that
  * blocks other transactions and allows exhastive eviction. If the transaction
  * was already restarted once, Just return the -ENOMEM. May also set
  * _ret to -EINTR if not retrying and waits are interruptible.
@@ -180,7 +180,7 @@ static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
  * @_val: The xe_validation_device.
  * @_exec: The struct drm_exec object
  * @_flags: Flags for the xe_validation_ctx initialization.
- * @_ret: Return in / out parameter. May be set by this macro. Typicall 0 when called.
+ * @_ret: Return in / out parameter. May be set by this macro. Typical 0 when called.
  *
  * This macro is will initiate a drm_exec transaction with additional support for
  * exhaustive eviction.
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 10d77666a425..4eefe902f8a4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -824,7 +824,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
  *
  * (re)bind SVM range setting up GPU page tables for the range.
  *
- * Return: dma fence for rebind to signal completion on succees, ERR_PTR on
+ * Return: dma fence for rebind to signal completion on success, ERR_PTR on
  * failure
  */
 struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
@@ -907,7 +907,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
  *
  * Unbind SVM range removing the GPU page tables for the range.
  *
- * Return: dma fence for unbind to signal completion on succees, ERR_PTR on
+ * Return: dma fence for unbind to signal completion on success, ERR_PTR on
  * failure
  */
 struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
@@ -1291,7 +1291,7 @@ static u16 pde_pat_index(struct xe_bo *bo)
 	 * selection of options. The user PAT index is only for encoding leaf
 	 * nodes, where we have use of more bits to do the encoding. The
 	 * non-leaf nodes are instead under driver control so the chosen index
-	 * here should be distict from the user PAT index. Also the
+	 * here should be distinct from the user PAT index. Also the
 	 * corresponding coherency of the PAT index should be tied to the
 	 * allocation type of the page table (or at least we should pick
 	 * something which is always safe).
@@ -4319,7 +4319,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
 		} else if (__op->op == DRM_GPUVA_OP_MAP) {
 			vma = op->map.vma;
-			/* In case of madvise call, MAP will always be follwed by REMAP.
+			/* In case of madvise call, MAP will always be followed by REMAP.
 			 * Therefore temp_attr will always have sane values, making it safe to
 			 * copy them to new vma.
 			 */
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index d6e2a0fdd4b3..afde0e34eab2 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -52,7 +52,7 @@ struct xe_vm_pgtable_update_op;
  * struct xe_vma_mem_attr - memory attributes associated with vma
  */
 struct xe_vma_mem_attr {
-	/** @preferred_loc: perferred memory_location */
+	/** @preferred_loc: preferred memory_location */
 	struct {
 		/** @preferred_loc.migration_policy: Pages migration policy */
 		u32 migration_policy;
-- 
2.43.0

