Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3F2C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 21:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5743A10E1D6;
	Thu, 12 Jun 2025 21:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQhYV8++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BB310E1D6
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 21:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749764355; x=1781300355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LADu1cMiYm8EYW1FooIpG1eqDiUg7XBy5aQH50aD1Yw=;
 b=nQhYV8++IfiiNIDfIBz88+M+gjVkLU7LVmKcrMZxOnjh4JfwP9+6rx/S
 YnBe+wAut1M1M4vh8R6WbMpisFlj7rQ9hZs9l/M+SYsY9whD6D+zZfjDJ
 Bw03Cs3GXG11kgAFN20bhpQ1nAkGKVaVu3nkYbSj/QSMp6gQ0IXIpUbjk
 vutnzFR2r6a/kOwt/YceOnFfTaZx9PtG/0qz6E7hBhU9BKWcp6S7I4NHq
 bus3IB5KpH55OhRmbS4ZOPjCNCXeCPcO39lcKAmB03s1s10IVCYKsI0pu
 7vVrgRXqQatYtsCSWOCCrcbjsVgJhqPWbJKxqr7QrPHJ3a7Ma5eQzMCio w==;
X-CSE-ConnectionGUID: x5m8TUKrRXaD5gtiMAMRdQ==
X-CSE-MsgGUID: I7zyz/1JSB+P+u+VHIYX+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51834250"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51834250"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 14:39:08 -0700
X-CSE-ConnectionGUID: gCsZrM+3SM2IV6rJ04gNuQ==
X-CSE-MsgGUID: XTot3xDsSNiwQRmaPXKO8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152411176"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 14:39:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Use TLB innvalidation context for invalidations
 issued from bind queues
Date: Thu, 12 Jun 2025 14:40:41 -0700
Message-Id: <20250612214041.235258-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

In order to avoid adding tons of invalidation fences to dma-resv
BOOKKEEP slots, and thus jobs dependencies, when stream of unbinds
arrives (e.g., many user frees or unmaps), use a dma fence tlb
invalidation context associated with the queue issuing the bind
operation.

Two fence contexts are needed - one for each GT as TLB invalidations
are only ordered on a GT. A per GT ordered wq is needed to queue the
invalidations to maintain dma fence ordering as well.

This fixes the below splat when the number of invalidations gets out of
hand:

[ 1661.638258] watchdog: BUG: soft lockup - CPU#2 stuck for 26s!
[kworker/u65:8:75257]
[ 1661.638262] Modules linked in: xe drm_gpusvm drm_gpuvm
drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy
drm_kms_helper x86_pkg_temp_thermal coretemp snd_hda_cod      ec_realtek
snd_hda_codec_generic snd_hda_scodec_component mei_pxp mei_hdcp wmi_bmof
snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep i2c_i801
snd_hda_core i2c_mux snd_pcm i2c_s      mbus video wmi mei_me mei fuse
igb e1000e i2c_algo_bit ptp ghash_clmulni_intel pps_core intel_lpss_pci
[last unloaded: xe]
[ 1661.638278] CPU: 2 UID: 0 PID: 75257 Comm: kworker/u65:8
Tainted: G S                  6.16.0-rc1-xe+ #397 PREEMPT(undef)
[ 1661.638280] Tainted: [S]=CPU_OUT_OF_SPEC
[ 1661.638280] Hardware name: Intel Corporation Raptor Lake Client
Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS
RPLSFWI1.R00.3492.A00.2211291114 11/29/2022
[ 1661.638281] Workqueue: xe_gt_page_fault_work_queue
xe_svm_garbage_collector_work_func [xe]
[ 1661.638311] RIP: 0010:xas_start+0x47/0xd0
[ 1661.638317] Code: 07 48 8b 57 08 48 8b 40 08 48 89 c1 83 e1 03
48 83 f9 02 75 08 48 3d 00 10 00 00 77 21 48 85 d2 75 29 48 c7 47 18 00
00 00 00 <c3> cc cc cc cc 48 c1 fa 02 85 d2       74 c7 31 c0 c3 cc cc
cc cc 0f b6
[ 1661.638317] RSP: 0018:ffffc90003d9b968 EFLAGS: 00000297
[ 1661.638318] RAX: ffff88810459b232 RBX: ffffc90003d9b9a0 RCX:
0000000000000006
[ 1661.638319] RDX: 0000000000000009 RSI: 0000000000000003 RDI:
ffffc90003d9b9a0
[ 1661.638320] RBP: ffffffffffffffff R08: ffff888197a0a600 R09:
0000000000000228
[ 1661.638320] R10: ffffffffffffffff R11: ffffffffffffffc0 R12:
0000000000000241
[ 1661.638320] R13: ffffffffffffffff R14: 0000000000000040 R15:
ffff8881014db000
[ 1661.638321] FS:  0000000000000000(0000)
GS:ffff88890aee8000(0000) knlGS:0000000000000000
[ 1661.638322] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1661.638322] CR2: 00007fc07287fff8 CR3: 000000000242c003 CR4:
0000000000f70ef0
[ 1661.638323] PKRU: 55555554
[ 1661.638323] Call Trace:
[ 1661.638325]  <TASK>
[ 1661.638326]  xas_load+0xd/0xb0
[ 1661.638328]  xas_find+0x187/0x1d0
[ 1661.638330]  xa_find_after+0x10f/0x130
[ 1661.638332]  drm_sched_job_add_dependency+0x80/0x1e0
[gpu_sched]
[ 1661.638335]  drm_sched_job_add_resv_dependencies+0x62/0x120
[gpu_sched]
[ 1661.638337]  xe_pt_vm_dependencies+0x5b/0x2f0 [xe]
[ 1661.638359]  xe_pt_svm_pre_commit+0x59/0x1a0 [xe]
[ 1661.638376]  xe_migrate_update_pgtables+0x67f/0x910 [xe]
[ 1661.638397]  ? xe_pt_stage_unbind+0x92/0xd0 [xe]
[ 1661.638416]  xe_pt_update_ops_run+0x12e/0x7f0 [xe]
[ 1661.638433]  ops_execute+0x1b1/0x430 [xe]
[ 1661.638449]  xe_vm_range_unbind+0x260/0x2a0 [xe]
[ 1661.638465]  xe_svm_garbage_collector+0xfe/0x1c0 [xe]
[ 1661.638478]  xe_svm_garbage_collector_work_func+0x25/0x30 [xe]
[ 1661.638491]  process_one_work+0x16b/0x2e0
[ 1661.638495]  worker_thread+0x284/0x410
[ 1661.638496]  ? __pfx_worker_thread+0x10/0x10
[ 1661.638496]  kthread+0xe9/0x210
[ 1661.638498]  ? __pfx_kthread+0x10/0x10

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c          |  8 +++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h    | 17 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 23 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  4 +++-
 drivers/gpu/drm/xe/xe_pt.c                  | 10 +++++++--
 drivers/gpu/drm/xe/xe_svm.c                 |  9 +++++---
 drivers/gpu/drm/xe/xe_vm.c                  |  6 ++++--
 7 files changed, 64 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fee22358cc09..71e354c56ad9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -94,6 +94,14 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	else
 		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
+	if (q->flags & (EXEC_QUEUE_FLAG_PERMANENT | EXEC_QUEUE_FLAG_VM)) {
+		int i;
+
+		for (i = 0; i < XE_EXEC_QUEUE_TLB_CONTEXT_COUNT; ++i)
+			q->tlb_invalidation.context[i] =
+				dma_fence_context_alloc(1);
+	}
+
 	if (vm)
 		q->vm = xe_vm_get(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index cc1cffb5c87f..81d240e561ee 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -132,6 +132,23 @@ struct xe_exec_queue {
 		struct list_head link;
 	} lr;
 
+	/** @tlb_invalidation: TLB invalidations exec queue state */
+	struct {
+		/**
+		 * @tlb_invalidation.context: The TLB invalidation context
+		 * for the queue (VM and MIGRATION queues only)
+		 */
+#define XE_EXEC_QUEUE_TLB_CONTEXT_PRIMARY_GT	0
+#define XE_EXEC_QUEUE_TLB_CONTEXT_MEDIA_GT	1
+#define XE_EXEC_QUEUE_TLB_CONTEXT_COUNT		(XE_EXEC_QUEUE_TLB_CONTEXT_MEDIA_GT  + 1)
+		u64 context[XE_EXEC_QUEUE_TLB_CONTEXT_COUNT];
+		/**
+		 * @tlb_invalidation.seqno: The TLB invalidation seqno for the
+		 * queue (VM and MIGRATION queues only)
+		 */
+		u32 seqno[XE_EXEC_QUEUE_TLB_CONTEXT_COUNT];
+	} tlb_invalidation;
+
 	/** @pxp: PXP info tracking */
 	struct {
 		/** @pxp.type: PXP session type used by this queue */
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 084cbdeba8ea..0a2fcaaf04fc 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -7,6 +7,7 @@
 
 #include "abi/guc_actions_abi.h"
 #include "xe_device.h"
+#include "xe_exec_queue_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
@@ -294,7 +295,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 		struct xe_gt_tlb_invalidation_fence fence;
 		int ret;
 
-		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
+		xe_gt_tlb_invalidation_fence_init(gt, NULL, &fence, 0, true);
 		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
 		if (ret)
 			return ret;
@@ -431,7 +432,7 @@ void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
 	u64 range = 1ull << vm->xe->info.va_bits;
 	int ret;
 
-	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
+	xe_gt_tlb_invalidation_fence_init(gt, NULL, &fence, 0, true);
 
 	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm->usm.asid);
 	if (ret < 0)
@@ -551,7 +552,9 @@ static const struct dma_fence_ops invalidation_fence_ops = {
 /**
  * xe_gt_tlb_invalidation_fence_init - Initialize TLB invalidation fence
  * @gt: GT
+ * @q: exec queue issuing TLB invalidation, if NULL no queue associated
  * @fence: TLB invalidation fence to initialize
+ * @tlb_context: TLB invalidation context for exec_queue
  * @stack: fence is stack variable
  *
  * Initialize TLB invalidation fence for use. xe_gt_tlb_invalidation_fence_fini
@@ -559,15 +562,25 @@ static const struct dma_fence_ops invalidation_fence_ops = {
  * even on error.
  */
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
+				       struct xe_exec_queue *q,
 				       struct xe_gt_tlb_invalidation_fence *fence,
+				       int tlb_context,
 				       bool stack)
 {
+	xe_gt_assert(gt, tlb_context < XE_EXEC_QUEUE_TLB_CONTEXT_COUNT);
+
 	xe_pm_runtime_get_noresume(gt_to_xe(gt));
 
 	spin_lock_irq(&gt->tlb_invalidation.lock);
-	dma_fence_init(&fence->base, &invalidation_fence_ops,
-		       &gt->tlb_invalidation.lock,
-		       dma_fence_context_alloc(1), 1);
+	if (q)
+		dma_fence_init(&fence->base, &invalidation_fence_ops,
+			       &gt->tlb_invalidation.lock,
+			       q->tlb_invalidation.context[tlb_context],
+			       ++q->tlb_invalidation.seqno[tlb_context]);
+	else
+		dma_fence_init(&fence->base, &invalidation_fence_ops,
+			       &gt->tlb_invalidation.lock,
+			       dma_fence_context_alloc(1), 1);
 	spin_unlock_irq(&gt->tlb_invalidation.lock);
 	INIT_LIST_HEAD(&fence->link);
 	if (stack)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index abe9b03d543e..8440c608a0ec 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -10,6 +10,7 @@
 
 #include "xe_gt_tlb_invalidation_types.h"
 
+struct xe_exec_queue;
 struct xe_gt;
 struct xe_guc;
 struct xe_vm;
@@ -29,8 +30,9 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
+				       struct xe_exec_queue *q,
 				       struct xe_gt_tlb_invalidation_fence *fence,
-				       bool stack);
+				       int tlb_context, bool stack);
 void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence);
 
 static inline void
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f39d5cc9f411..feab4b7c7e70 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1529,7 +1529,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 
 	trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
 	if (!ifence->fence->error) {
-		queue_work(system_wq, &ifence->work);
+		queue_work(ifence->gt->ordered_wq, &ifence->work);
 	} else {
 		ifence->base.base.error = ifence->fence->error;
 		xe_gt_tlb_invalidation_fence_signal(&ifence->base);
@@ -1551,13 +1551,15 @@ static void invalidation_fence_work_func(struct work_struct *w)
 static void invalidation_fence_init(struct xe_gt *gt,
 				    struct invalidation_fence *ifence,
 				    struct dma_fence *fence,
+				    struct xe_exec_queue *q, int tlb_context,
 				    u64 start, u64 end, u32 asid)
 {
 	int ret;
 
 	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt), &ifence->base);
 
-	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base, false);
+	xe_gt_tlb_invalidation_fence_init(gt, q, &ifence->base, tlb_context,
+					  false);
 
 	ifence->fence = fence;
 	ifence->gt = gt;
@@ -2467,10 +2469,14 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		if (mfence)
 			dma_fence_get(fence);
 		invalidation_fence_init(tile->primary_gt, ifence, fence,
+					pt_update_ops->q,
+					XE_EXEC_QUEUE_TLB_CONTEXT_PRIMARY_GT,
 					pt_update_ops->start,
 					pt_update_ops->last, vm->usm.asid);
 		if (mfence) {
 			invalidation_fence_init(tile->media_gt, mfence, fence,
+						pt_update_ops->q,
+						XE_EXEC_QUEUE_TLB_CONTEXT_MEDIA_GT,
 						pt_update_ops->start,
 						pt_update_ops->last, vm->usm.asid);
 			fences[0] = &ifence->base.base;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 13abc6049041..2edd1c52150e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -227,7 +227,9 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 			int err;
 
 			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
-							  &fence[fence_id], true);
+							  NULL,
+							  &fence[fence_id], 0,
+							  true);
 
 			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
 							   &fence[fence_id],
@@ -241,8 +243,9 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 			if (!tile->media_gt)
 				continue;
 
-			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
-							  &fence[fence_id], true);
+			xe_gt_tlb_invalidation_fence_init(tile->media_gt, NULL,
+							  &fence[fence_id], 0,
+							  true);
 
 			err = xe_gt_tlb_invalidation_range(tile->media_gt,
 							   &fence[fence_id],
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d18807b92b18..730319b78a0a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3896,8 +3896,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 		if (xe_pt_zap_ptes(tile, vma)) {
 			xe_device_wmb(xe);
 			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
+							  NULL,
 							  &fence[fence_id],
-							  true);
+							  0, true);
 
 			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
 							 &fence[fence_id], vma);
@@ -3909,8 +3910,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 				continue;
 
 			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
+							  NULL,
 							  &fence[fence_id],
-							  true);
+							  0, true);
 
 			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
 							 &fence[fence_id], vma);
-- 
2.34.1

