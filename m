Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9255EE3F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 20:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7371210E083;
	Tue, 12 Sep 2023 20:00:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946D010E053
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694548799; x=1726084799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0oK11FbTawPMdctJdP1YWcsen3ICaANp+VwXcIYUIP4=;
 b=W0jtVLfjyR/192nfxwo6gQi1Vch1JeWl3C4Ve87IrCV1E3ic5WDGtjuQ
 UhuBsDQ7K02b/MJq26C12BwLRBVLEyH70LShMCeZVjAKWFCXzGw/mpKYe
 OHuvuUmJou8D9TE1w0yc1xFtD/FRNebi7DHh52yru9OwPbEXlXhckEPJF
 d12LzZZH/G0AmTiSt48mEK4qo9rBNTjwTImJGNzhR8qbhUmSl1kQMSh7b
 ln9J8LVHHIJT2it20FO0W/B17Pg/hjPX/HeOjFIJX+1umeHVx+MCYOwOt
 UX6lVdiNRHPNagSUWrDog5Xy3jpVj2StAICwcEWN/zS5DDHmI7duksdxv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="363513931"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="363513931"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 12:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990621087"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="990621087"
Received: from rdomark-mobl.ccr.corp.intel.com (HELO c4b530f05251.intel.com)
 ([10.252.37.41])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 12:59:57 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 19:59:43 +0000
Message-Id: <20230912195945.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912195945.7-1-francois.dugast@intel.com>
References: <20230912195945.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 1/3] drm/xe: Replace XE_WARN_ON with drm_warn
 when just printing a string
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use the generic drm_warn instead of the driver-specific XE_WARN_ON
in cases where XE_WARN_ON is used to unconditionally print a debug
message.

v2: Rebase

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c   |  5 +++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  3 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  9 ++++++---
 drivers/gpu/drm/xe/xe_vm.c           | 18 +++++++++---------
 drivers/gpu/drm/xe/xe_vm_madvise.c   |  2 +-
 6 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index b871e45af813..9229fd5b01cc 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -151,6 +151,7 @@ static const struct drm_info_list debugfs_list[] = {
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	struct drm_minor *minor = gt_to_xe(gt)->drm.primary;
 	struct dentry *root;
 	struct drm_info_list *local;
@@ -162,7 +163,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	sprintf(name, "gt%d", gt->info.id);
 	root = debugfs_create_dir(name, minor->debugfs_root);
 	if (IS_ERR(root)) {
-		XE_WARN_ON("Create GT directory failed");
+		drm_warn(&xe->drm, "Create GT directory failed");
 		return;
 	}
 
@@ -172,7 +173,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	 * passed in (e.g. can't define this on the stack).
 	 */
 #define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
-	local = drmm_kmalloc(&gt_to_xe(gt)->drm, DEBUGFS_SIZE, GFP_KERNEL);
+	local = drmm_kmalloc(&xe->drm, DEBUGFS_SIZE, GFP_KERNEL);
 	if (!local)
 		return;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index e6197ec6f72f..c0027982ab4c 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -321,6 +321,7 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
 int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
 	struct pf_queue *pf_queue;
 	unsigned long flags;
 	u32 asid;
@@ -339,7 +340,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		pf_queue->tail = (pf_queue->tail + len) % PF_QUEUE_NUM_DW;
 		queue_work(gt->usm.pf_wq, &pf_queue->worker);
 	} else {
-		XE_WARN_ON("PF Queue full, shouldn't be possible");
+		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
 	}
 	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b92e04ba8f63..13f2bd586f6a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1022,7 +1022,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 							   adj_len);
 		break;
 	default:
-		XE_WARN_ON("NOT_POSSIBLE");
+		drm_warn(&xe->drm, "NOT_POSSIBLE");
 	}
 
 	if (ret)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c6a9e17d6889..0a6c938ad3dc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -703,6 +703,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 					  struct xe_exec_queue *q)
 {
 	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
+	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
 	set_min_preemption_timeout(guc, q);
@@ -712,7 +713,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	if (!ret) {
 		struct drm_gpu_scheduler *sched = &q->guc->sched;
 
-		XE_WARN_ON("Pending enable failed to respond");
+		drm_warn(&xe->drm, "Pending enable failed to respond");
 		sched->timeout = MIN_SCHED_TIMEOUT;
 		drm_sched_run_wq_start(sched);
 		xe_gt_reset_async(q->gt);
@@ -794,6 +795,8 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_guc_exec_queue *ge =
 		container_of(w, struct xe_guc_exec_queue, lr_tdr);
 	struct xe_exec_queue *q = ge->q;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
 	struct drm_gpu_scheduler *sched = &ge->sched;
 
 	XE_WARN_ON(!xe_exec_queue_is_lr(q));
@@ -828,7 +831,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 					 !exec_queue_pending_disable(q) ||
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
-			XE_WARN_ON("Schedule disable failed to respond");
+			drm_warn(&xe->drm, "Schedule disable failed to respond");
 			drm_sched_run_wq_start(sched);
 			xe_gt_reset_async(q->gt);
 			return;
@@ -906,7 +909,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 					 !exec_queue_pending_disable(q) ||
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret || guc_read_stopped(guc)) {
-			XE_WARN_ON("Schedule disable failed to respond");
+			drm_warn(&xe->drm, "Schedule disable failed to respond");
 			sched->timeout = MIN_SCHED_TIMEOUT;
 			list_add(&drm_job->list, &sched->pending_list);
 			drm_sched_run_wq_start(sched);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 03ee6993e7c7..d8cf59512708 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1389,7 +1389,7 @@ static void vm_error_capture(struct xe_vm *vm, int err,
 	}
 
 	if (copy_to_user(address, &capture, sizeof(capture)))
-		XE_WARN_ON("Copy to user failed");
+		drm_warn(&vm->xe->drm, "Copy to user failed");
 
 	if (in_kthread) {
 		kthread_unuse_mm(vm->async_ops.error_capture.mm);
@@ -2183,7 +2183,7 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 			return -ENODATA;
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		drm_warn(&xe->drm, "NOT POSSIBLE");
 		return -EINVAL;
 	}
 
@@ -2241,7 +2241,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma));
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		drm_warn(&xe->drm, "NOT POSSIBLE");
 	}
 }
 #else
@@ -2332,7 +2332,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		}
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		ops = ERR_PTR(-EINVAL);
 	}
 
@@ -2463,7 +2463,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		op->flags |= XE_VMA_OP_COMMITTED;
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
 
 	return err;
@@ -2619,7 +2619,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 			/* Nothing to do */
 			break;
 		default:
-			XE_WARN_ON("NOT POSSIBLE");
+			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		}
 
 		last_op = op;
@@ -2734,7 +2734,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 				     op->flags & XE_VMA_OP_LAST);
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
 
 	if (err)
@@ -2812,7 +2812,7 @@ static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 					  op);
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
 
 	return ret;
@@ -2893,7 +2893,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 		/* Nothing to do */
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 05081fa0fbed..d2fd99462756 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -186,7 +186,7 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
 static int madvise_pin(struct xe_device *xe, struct xe_vm *vm,
 		       struct xe_vma **vmas, int num_vmas, u64 value)
 {
-	XE_WARN_ON("NIY");
+	drm_warn(&xe->drm, "NIY");
 	return 0;
 }
 
-- 
2.34.1

