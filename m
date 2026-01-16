Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D678C982C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B67A10E285;
	Fri, 16 Jan 2026 22:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXfMtahC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6781E10E264
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601867; x=1800137867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EYcoVH0CIKJyJpaTUuR5q09aoRqEHCjgwqEbhajsXVc=;
 b=MXfMtahCmvMrxQmIJAfJAjMzvVu7UAAD1WAXijalprZwIx1jWD/ibKX9
 l9+lLTe+Ous9ZFIjRqcg4Gj51VJmogU/h3FH0ULDSu4gK4Hoo8hyYXlha
 3Y4Eik00rpxUC+k0obWBkB8UlTFtChZbhYIzcBiuL0ZHE5anjOZFfOaNM
 gdDYRNvWzgKZF+fyEqJrOonaTTWDC+gMCT5KmKPlY07D4rFml7+6UNOj/
 bK9SNHT6Bkqsq1/qSbL3lnesDqOC3VcSeegXLfjxoxBPZ6hdabA//hvUw
 L0QpFshuUwbPX+1uCwXTWNaduRSbbOUu8C0OT9Wgf9L0TOYUm+w5XWfjB Q==;
X-CSE-ConnectionGUID: wZy33IpmQ+K1cDYdLeU9yA==
X-CSE-MsgGUID: wFX3iRu5QAGIw16ONEbT8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123353"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123353"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:46 -0800
X-CSE-ConnectionGUID: 4FGE1wbQRnOtQBtpmHAutQ==
X-CSE-MsgGUID: rHXT2u/uRauib9O1k868Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204962723"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 11/11] drm/xe: Add context-based invalidation to GuC TLB
 invalidation backend
Date: Fri, 16 Jan 2026 14:17:31 -0800
Message-Id: <20260116221731.868657-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116221731.868657-1-matthew.brost@intel.com>
References: <20260116221731.868657-1-matthew.brost@intel.com>
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

Introduce context-based invalidation support to the GuC TLB invalidation
backend. This is implemented by iterating over each exec queue per GT
within a VM, skipping inactive queues, and issuing a context-based (GuC
ID) H2G TLB invalidation. All H2G messages, except the final one, are
sent with an invalid seqno, which the G2H handler drops to ensure the
TLB invalidation fence is only signaled once all H2G messages are
completed.

A watermark mechanism is also added to switch between context-based TLB
invalidations and full device-wide invalidations, as the return on
investment for context-based invalidation diminishes when many exec
queues are mapped.

v2:
 - Fix checkpatch warnings
v3:
 - Rebase on PRL
 - Use ref counting to avoid racing with deregisters
v4:
 - Extra braces (Stuart)
 - Use per GT list (CI)
 - Reorder put

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 145 +++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 070d2e2cb7c9..ced58f46f846 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -6,15 +6,19 @@
 #include "abi/guc_actions_abi.h"
 
 #include "xe_device.h"
+#include "xe_exec_queue.h"
+#include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_exec_queue_types.h"
 #include "xe_guc_tlb_inval.h"
 #include "xe_force_wake.h"
 #include "xe_mmio.h"
 #include "xe_sa.h"
 #include "xe_tlb_inval.h"
+#include "xe_vm.h"
 
 #include "regs/xe_guc_regs.h"
 
@@ -156,10 +160,16 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
 {
 #define MAX_TLB_INVALIDATION_LEN	7
 	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = guc_to_xe(guc);
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	u64 length = end - start;
 	int len = 0, err;
 
+	xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE &&
+			  !xe->info.has_ctx_tlb_inval) ||
+		     (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX &&
+		      xe->info.has_ctx_tlb_inval));
+
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = !prl_sa ? seqno : TLB_INVALIDATION_SEQNO_INVALID;
 	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
@@ -168,9 +178,11 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
 	} else {
 		u64 normalize_len = normalize_invalidation_range(gt, &start,
 								 &end);
+		bool need_flush = !prl_sa &&
+			seqno != TLB_INVALIDATION_SEQNO_INVALID;
 
 		/* Flush on NULL case, Media is not required to modify flush due to no PPC so NOP */
-		action[len++] = MAKE_INVAL_OP_FLUSH(type, !prl_sa);
+		action[len++] = MAKE_INVAL_OP_FLUSH(type, need_flush);
 		action[len++] = id;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
@@ -181,8 +193,10 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
 #undef MAX_TLB_INVALIDATION_LEN
 
 	err = send_tlb_inval(guc, action, len);
-	if (!err && prl_sa)
+	if (!err && prl_sa) {
+		xe_gt_assert(gt, seqno != TLB_INVALIDATION_SEQNO_INVALID);
 		err = send_page_reclaim(guc, seqno, xe_sa_bo_gpu_addr(prl_sa));
+	}
 	return err;
 }
 
@@ -201,6 +215,114 @@ static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 				    XE_GUC_TLB_INVAL_PAGE_SELECTIVE, prl_sa);
 }
 
+static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
+				    u64 start, u64 end, u32 asid,
+				    struct drm_suballoc *prl_sa)
+{
+	struct xe_guc *guc = tlb_inval->private;
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_exec_queue *q, *next, *last_q = NULL;
+	struct xe_vm *vm;
+	LIST_HEAD(tlb_inval_list);
+	int err = 0, id = guc_to_gt(guc)->info.id;
+
+	lockdep_assert_held(&tlb_inval->seqno_lock);
+
+	if (xe->info.force_execlist)
+		return -ECANCELED;
+
+	vm = xe_device_asid_to_vm(xe, asid);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);
+
+	down_read(&vm->exec_queues.lock);
+
+	/*
+	 * XXX: Randomly picking a threshold for now. This will need to be
+	 * tuned based on expected UMD queue counts and performance profiling.
+	 */
+#define EXEC_QUEUE_COUNT_FULL_THRESHOLD	8
+	if (vm->exec_queues.count[id] >= EXEC_QUEUE_COUNT_FULL_THRESHOLD) {
+		u32 action[] = {
+			XE_GUC_ACTION_TLB_INVALIDATION,
+			seqno,
+			MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
+		};
+
+		err = send_tlb_inval(guc, action, ARRAY_SIZE(action));
+		goto err_unlock;
+	}
+#undef EXEC_QUEUE_COUNT_FULL_THRESHOLD
+
+	/*
+	 * Move exec queues to a temporary list to issue invalidations. The exec
+	 * queue must active and a reference must be taken to prevent concurrent
+	 * deregistrations.
+	 *
+	 * List modification is safe because we hold 'vm->exec_queues.lock' for
+	 * reading, which prevents external modifications. Using a per-GT list
+	 * is also safe since 'tlb_inval->seqno_lock' ensures no other GT users
+	 * can enter this code path.
+	 */
+	list_for_each_entry_safe(q, next, &vm->exec_queues.list[id],
+				 vm_exec_queue_link) {
+		if (q->ops->active(q) && xe_exec_queue_get_unless_zero(q)) {
+			last_q = q;
+			list_move_tail(&q->vm_exec_queue_link, &tlb_inval_list);
+		}
+	}
+
+	if (!last_q) {
+		/*
+		 * We can't break fence ordering for TLB invalidation jobs, if
+		 * TLB invalidations are inflight issue a dummy invalidation to
+		 * maintain ordering. Nor can we move safely the seqno_recv when
+		 * returning -ECANCELED if TLB invalidations are in flight. Use
+		 * GGTT invalidation as dummy invalidation given ASID
+		 * invalidations are unsupported here.
+		 */
+		if (xe_tlb_inval_idle(tlb_inval))
+			err = -ECANCELED;
+		else
+			err = send_tlb_inval_ggtt(tlb_inval, seqno);
+		goto err_unlock;
+	}
+
+	list_for_each_entry_safe(q, next, &tlb_inval_list, vm_exec_queue_link) {
+		struct drm_suballoc *__prl_sa = NULL;
+		int __seqno = TLB_INVALIDATION_SEQNO_INVALID;
+		u32 type = XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX;
+
+		xe_assert(xe, q->vm == vm);
+
+		if (err)
+			goto unref;
+
+		if (last_q == q) {
+			__prl_sa = prl_sa;
+			__seqno = seqno;
+		}
+
+		err = send_tlb_inval_ppgtt(guc, __seqno, start, end,
+					   q->guc->id, type, __prl_sa);
+
+unref:
+		/*
+		 * Must always return exec queue to original list / drop
+		 * reference
+		 */
+		list_move_tail(&q->vm_exec_queue_link,
+			       &vm->exec_queues.list[id]);
+		xe_exec_queue_put(q);
+	}
+
+err_unlock:
+	up_read(&vm->exec_queues.lock);
+	xe_vm_put(vm);
+
+	return err;
+}
+
 static bool tlb_inval_initialized(struct xe_tlb_inval *tlb_inval)
 {
 	struct xe_guc *guc = tlb_inval->private;
@@ -228,7 +350,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
 	return hw_tlb_timeout + 2 * delay;
 }
 
-static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
+static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
 	.all = send_tlb_inval_all,
 	.ggtt = send_tlb_inval_ggtt,
 	.ppgtt = send_tlb_inval_asid_ppgtt,
@@ -237,6 +359,15 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
 	.timeout_delay = tlb_inval_timeout_delay,
 };
 
+static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
+	.ggtt = send_tlb_inval_ggtt,
+	.all = send_tlb_inval_all,
+	.ppgtt = send_tlb_inval_ctx_ppgtt,
+	.initialized = tlb_inval_initialized,
+	.flush = tlb_inval_flush,
+	.timeout_delay = tlb_inval_timeout_delay,
+};
+
 /**
  * xe_guc_tlb_inval_init_early() - Init GuC TLB invalidation early
  * @guc: GuC object
@@ -248,8 +379,14 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
 void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
 				 struct xe_tlb_inval *tlb_inval)
 {
+	struct xe_device *xe = guc_to_xe(guc);
+
 	tlb_inval->private = guc;
-	tlb_inval->ops = &guc_tlb_inval_ops;
+
+	if (xe->info.has_ctx_tlb_inval)
+		tlb_inval->ops = &guc_tlb_inval_ctx_ops;
+	else
+		tlb_inval->ops = &guc_tlb_inval_asid_ops;
 }
 
 /**
-- 
2.34.1

