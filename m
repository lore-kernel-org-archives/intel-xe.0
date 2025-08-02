Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF4EC87FCA
	for <intel-xe@archiver.kernel.org>; Sat,  2 Aug 2025 03:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDB610E3F3;
	Sat,  2 Aug 2025 03:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zt6yIegp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E2110E3F3
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Aug 2025 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754104236; x=1785640236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gBQQ1EXSLSPZOkzuywKWWOpEK1jXRtwzltkyhMSurBg=;
 b=Zt6yIegpK9YmbjAqKUnKKOXNptoz35NuaYL6QXUHRHPDlbDIuxZJE0qN
 Ow+x9TTTuwPZ+oBvI5Ts4aOs6kmBYdr1trHpRVB6sMCVdZlvNcC9uiBWY
 rq9TVWApgxn8uwwliMZ1UIMYNsKWcCHDG20WwTmjYC6+3EtASoQ1cf9Bu
 OxLnZhoOC1c7OPP9ieHfKQHMrYsJvf0CCktEF8850n8lWGpBI5TCWelUD
 cwCyMh3jcCy0hwMjnT0UsYH6juXGTOJAubIH3rkdZBRQw/rIQsh7NM1UJ
 4IOX2EWwZoDZJOeg8VeqCaXHs/GfWq2AAfXn0feedf0N9XJlLFFnbJwFI w==;
X-CSE-ConnectionGUID: 4Xm7fEhQQDuebpLzuIRckg==
X-CSE-MsgGUID: kvEivqEKQVeiT6jzQ8V/kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73910611"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="73910611"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 20:10:36 -0700
X-CSE-ConnectionGUID: 4YDiqveLS8C/35t/G51y/Q==
X-CSE-MsgGUID: v82Ega78T3SXU/p/xoSp6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="169093878"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa005.jf.intel.com with ESMTP; 01 Aug 2025 20:10:34 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v9 5/8] drm/xe/vf: Rebase MEMIRQ structures for all contexts
 after migration
Date: Sat,  2 Aug 2025 05:10:42 +0200
Message-Id: <20250802031045.1127138-6-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250802031045.1127138-1-tomasz.lis@intel.com>
References: <20250802031045.1127138-1-tomasz.lis@intel.com>
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

All contexts require an update of state data, as the data includes
GGTT references to memirq-related buffers.

Default contexts need these references updated as well, because they
are not refreshed when a new context is created from them.

The way we write to vram requires scratch buffer to be used
before the whole block is memcopied. Since using kalloc() within
specific recovery functions would lead to unintended relations
between locks, we are allocating the buffer earlier, before
any locks are taken. The same buffer will be used for other steps
of the recovery.

v2: Update addresses by xe_lrc_write_ctx_reg() rather than
  set_memory_based_intr()
v3: Renamed parameter, reordered parameters in some functs
v4: Check if have MEMIRQ, move `xe_gt*` funct to proper file
v5: Revert back to requiring scratch buffer, but allocate it
  earlier this time

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com> (v3)
Reviewed-by: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c  |  7 ++--
 drivers/gpu/drm/xe/xe_exec_queue.h  |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 14 ++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c  |  5 +--
 drivers/gpu/drm/xe/xe_guc_submit.h  |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c         | 51 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_lrc.h         |  4 +++
 drivers/gpu/drm/xe/xe_sriov_vf.c    | 20 +++++++++--
 9 files changed, 96 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ae36a35ec80b..0beb6388acb0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1081,11 +1081,14 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
  * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
  * within all LRCs of a queue.
  * @q: the &xe_exec_queue struct instance containing target LRCs
+ * @scratch: scratch buffer to be used as temporary storage
  */
-void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
+void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 {
 	int i;
 
-	for (i = 0; i < q->width; ++i)
+	for (i = 0; i < q->width; ++i) {
+		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
 		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
+	}
 }
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 1d399a33c5c0..da720197929b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -90,6 +90,6 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
 				      struct xe_vm *vm);
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
-void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
+void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index b282838d59e6..0461d5513487 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -25,6 +25,7 @@
 #include "xe_guc.h"
 #include "xe_guc_hxg_helpers.h"
 #include "xe_guc_relay.h"
+#include "xe_lrc.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
@@ -750,6 +751,19 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
 	return err;
 }
 
+/**
+ * xe_gt_sriov_vf_default_lrcs_hwsp_rebase - Update GGTT references in HWSP of default LRCs.
+ * @gt: the &xe_gt struct instance
+ */
+void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id)
+		xe_default_lrc_update_memirq_regs_with_address(hwe);
+}
+
 /**
  * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
  *   or just mark that a GuC is ready for it.
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index e0357f341a2d..0af1dc769fe0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -21,6 +21,7 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
 int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
+void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index bc0fc0494250..452fb6e63f31 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2504,14 +2504,15 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
  * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
  * exec queues registered to given GuC.
  * @guc: the &xe_guc struct instance
+ * @scratch: scratch buffer to be used as temporary storage
  */
-void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
+void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
 
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
-		xe_exec_queue_contexts_hwsp_rebase(q);
+		xe_exec_queue_contexts_hwsp_rebase(q, scratch);
 	mutex_unlock(&guc->submission_state.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index d22f2d36dca1..9a2718c81d43 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -46,6 +46,6 @@ xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapsh
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
 void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
-void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc);
+void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index baf926ad3a66..9a67f4ae235a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -697,7 +697,13 @@ u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
 }
 
-static size_t lrc_reg_size(struct xe_device *xe)
+/**
+ * xe_lrc_reg_size() - Get size of the LRC registers area within queues
+ * @xe: the &xe_device struct instance
+ *
+ * Returns: Size of the LRC registers area for current platform
+ */
+size_t xe_lrc_reg_size(struct xe_device *xe)
 {
 	if (GRAPHICS_VERx100(xe) >= 1250)
 		return 96 * sizeof(u32);
@@ -707,7 +713,7 @@ static size_t lrc_reg_size(struct xe_device *xe)
 
 size_t xe_lrc_skip_size(struct xe_device *xe)
 {
-	return LRC_PPHWSP_SIZE + lrc_reg_size(xe);
+	return LRC_PPHWSP_SIZE + xe_lrc_reg_size(xe);
 }
 
 static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
@@ -948,6 +954,47 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 	return data;
 }
 
+/**
+ * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
+ * of given engine.
+ * @hwe: the &xe_hw_engine struct instance
+ */
+void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe->gt;
+	u32 *regs;
+
+	if (!gt->default_lrc[hwe->class])
+		return;
+
+	regs = gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE;
+	set_memory_based_intr(regs, hwe);
+}
+
+/**
+ * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references in mem interrupt data
+ * for given LRC.
+ * @lrc: the &xe_lrc struct instance
+ * @hwe: the &xe_hw_engine struct instance
+ * @regs: scratch buffer to be used as temporary storage
+ */
+void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+					    u32 *regs)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct iosys_map map;
+	size_t regs_len;
+
+	if (!xe_device_uses_memirq(gt_to_xe(gt)))
+		return;
+
+	map = __xe_lrc_regs_map(lrc);
+	regs_len = xe_lrc_reg_size(gt_to_xe(gt));
+	xe_map_memcpy_from(gt_to_xe(gt), regs, &map, 0, regs_len);
+	set_memory_based_intr(regs, hwe);
+	xe_map_memcpy_to(gt_to_xe(gt), &map, 0, regs, regs_len);
+}
+
 static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 {
 	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index cc231bec709c..eceeeee6c021 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -89,6 +89,9 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
 u32 *xe_lrc_regs(struct xe_lrc *lrc);
 void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
+void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
+void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+					    u32 *regs);
 
 u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
 void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
@@ -107,6 +110,7 @@ s32 xe_lrc_start_seqno(struct xe_lrc *lrc);
 u32 xe_lrc_parallel_ggtt_addr(struct xe_lrc *lrc);
 struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc);
 
+size_t xe_lrc_reg_size(struct xe_device *xe);
 size_t xe_lrc_skip_size(struct xe_device *xe);
 
 void xe_lrc_dump_default(struct drm_printer *p,
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 54a6218e48b0..43ac73e432d4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -13,6 +13,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_irq.h"
+#include "xe_lrc.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
@@ -244,6 +245,11 @@ static int vf_get_next_migrated_gt_id(struct xe_device *xe)
 	return -1;
 }
 
+static size_t post_migration_scratch_size(struct xe_device *xe)
+{
+	return xe_lrc_reg_size(xe);
+}
+
 /**
  * Perform post-migration fixups on a single GT.
  *
@@ -260,19 +266,29 @@ static int vf_get_next_migrated_gt_id(struct xe_device *xe)
 static int gt_vf_post_migration_fixups(struct xe_gt *gt)
 {
 	s64 shift;
+	void *buf;
 	int err;
 
+	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
 	err = xe_gt_sriov_vf_query_config(gt);
-	if (err)
+	if (err) {
+		kfree(buf);
 		return err;
+	}
 
 	shift = xe_gt_sriov_vf_ggtt_shift(gt);
 	if (shift) {
 		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
-		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
+		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
+		xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
 		/* FIXME: add the recovery steps */
 		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
 	}
+
+	kfree(buf);
 	return 0;
 }
 
-- 
2.25.1

