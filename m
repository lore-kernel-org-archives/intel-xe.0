Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA3ACCFA0E
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D79F10E38B;
	Sat,  1 Nov 2025 01:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrF+JtNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725DA10E058
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958954; x=1793494954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DNZQMNbC2nWSFprB3XeiNXXov/hXyK4EybPw2qHgE5I=;
 b=nrF+JtNtnwTHBziVXnfMQ5wiVqDM6nTx5f+EcqcMaRktHqRBNxT5zgdA
 fwk/m75WjhFEeH8a/e24B4EE7lMNERMfiDJi22DHxCaPMPSVusPBxM86t
 JDKuPpEyhgkUT8j7M7YZWYpxyDlQUZQ4UgxXIovEUEbasQ3i0d2vg4+TB
 TLgD3/Vpe8EWQVQa53MIrmwa2U5oIZ+ExZtsUpeJVdVsr3mTe6uRcUVz6
 /ixfG4Gvw6jUtu5D8vwVSssFMS/pqyxz5a3NiZAnhPkxRv7mtkbvw4oUw
 anVZVdAcl+F3Fz8zVe/iqXCT1WvTo/+u15OVB9HNnXGtxKUaXuNLuTD8+ w==;
X-CSE-ConnectionGUID: XSKLOl0HR2C24KyahlycsA==
X-CSE-MsgGUID: bysOCDUKRoeB08Gcd6ylkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575698"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575698"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: Tiv/kdN9TVuspGUinPRb2Q==
X-CSE-MsgGUID: dyNDY5DpTTy/PDGk502csA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020195"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 11/12] drm/xe: Add context-based invalidation to GuC TLB
 invalidation backend
Date: Fri, 31 Oct 2025 18:02:24 -0700
Message-Id: <20251101010225.3095457-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101010225.3095457-1-matthew.brost@intel.com>
References: <20251101010225.3095457-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h  |   2 +
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 122 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c           |   1 +
 drivers/gpu/drm/xe/xe_pci_types.h     |   1 +
 4 files changed, 124 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 145951dd95c9..ca285f4bce11 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -316,6 +316,8 @@ struct xe_device {
 		u8 has_mem_copy_instr:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
+		/** @info.has_ctx_tlb_inval: Has context based TLB invalidations */
+		u8 has_ctx_tlb_inval:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
 		u8 has_range_tlb_inval:1;
 		/** @info.has_sriov: Supports SR-IOV */
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 6978ee8edf2e..00251dcd1e7c 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -6,14 +6,17 @@
 #include "abi/guc_actions_abi.h"
 
 #include "xe_device.h"
+#include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_exec_queue_types.h"
 #include "xe_guc_tlb_inval.h"
 #include "xe_force_wake.h"
 #include "xe_mmio.h"
 #include "xe_tlb_inval.h"
+#include "xe_vm.h"
 
 #include "regs/xe_guc_regs.h"
 
@@ -136,10 +139,16 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
 {
 #define MAX_TLB_INVALIDATION_LEN	7
 	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = guc_to_xe(guc);
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	u64 length = end - start;
 	int len = 0;
 
+	xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE &&
+		     !xe->info.has_ctx_tlb_inval) ||
+		     (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX &&
+		      xe->info.has_ctx_tlb_inval));
+
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = seqno;
 	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
@@ -176,6 +185,100 @@ static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 				    XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
 }
 
+static bool queue_mapped_in_guc(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	return q->gt == guc_to_gt(guc);
+}
+
+static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
+				    u64 start, u64 end, u32 asid)
+{
+	struct xe_guc *guc = tlb_inval->private;
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_exec_queue *q, *last_q = NULL;
+	struct xe_vm *vm;
+	int err = 0;
+
+	lockdep_assert_held(&tlb_inval->seqno_lock);
+
+	if (xe->info.force_execlist)
+		return -ECANCELED;
+
+	vm = xe_device_asid_to_vm(xe, asid);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);;
+
+	down_read(&vm->exec_queues.lock);
+
+	/*
+	 * XXX: Randomly picking a threshold for now. This will need to be
+	 * tuned based on expected UMD queue counts and performance profiling.
+	 */
+#define EXEC_QUEUE_COUNT_FULL_THRESHOLD	8
+	if (vm->exec_queues.count[guc_to_gt(guc)->info.id] >=
+	    EXEC_QUEUE_COUNT_FULL_THRESHOLD) {
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
+	list_for_each_entry_reverse(q, &vm->exec_queues.list,
+				    vm_exec_queue_link)
+		if (queue_mapped_in_guc(guc, q) && q->ops->active(q)) {
+			last_q = q;
+			break;
+		}
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
+	list_for_each_entry(q, &vm->exec_queues.list, vm_exec_queue_link) {
+		int __seqno = last_q == q ? seqno :
+			TLB_INVALIDATION_SEQNO_INVALID;
+		u32 type = XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX;
+
+		/*
+		 * XXX: Techincally we can race here and queue can become
+		 * inactive, not ideal. The TLB invalidation will timeout in
+		 * this case unless we get GuC support to convert to NOP...
+		 */
+		if (!queue_mapped_in_guc(guc, q) || !q->ops->active(q))
+			continue;
+
+		xe_assert(xe, q->vm == vm);
+
+		err = send_tlb_inval_ppgtt(guc, __seqno, start, end,
+					   q->guc->id, type);
+		if (err)
+			goto err_unlock;
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
@@ -203,7 +306,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
 	return hw_tlb_timeout + 2 * delay;
 }
 
-static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
+static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
 	.all = send_tlb_inval_all,
 	.ggtt = send_tlb_inval_ggtt,
 	.ppgtt = send_tlb_inval_asid_ppgtt,
@@ -212,6 +315,15 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
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
@@ -223,8 +335,14 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
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
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1959de3f7a27..9a11066c7d4a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -863,6 +863,7 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.has_device_atomics_on_smem = 1;
 
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
+	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9892c063a9c5..c08857c06c7e 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -63,6 +63,7 @@ struct xe_graphics_desc {
 	u8 has_atomic_enable_pte_bit:1;
 	u8 has_indirect_ring_state:1;
 	u8 has_range_tlb_inval:1;
+	u8 has_ctx_tlb_inval:1;
 	u8 has_usm:1;
 	u8 has_64bit_timestamp:1;
 };
-- 
2.34.1

