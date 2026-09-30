Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7EACA5FC7
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 16:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE7610E26B;
	Wed, 30 Sep 2026 16:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwvCFrfM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDD310E26B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790786849; x=1822322849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3GTkZvkxfXaUe5NchCKy1SKYqq6D9AhiVpbUJslkVEc=;
 b=OwvCFrfMRvn/YBPCU0nwbbCDleBJWeGo67NCnQdgmZChKSVIoTTtf77d
 doUSkLJdmfTumkXaE1F+/v34iz8sS2O+2E/OOAXEiPKJ9TEPAmtLaizSs
 IGrd6z91hsHQ+EpSZ8nXWb39wVH+mFhMfpMv1IU1qBa1YwVL4VdndxkvD
 OKzkB1NBbZzNxiZnrRrZZl0LImutSyexjmRb4ij9Yk1b7R681IYZgtLOz
 Qu/h/WD3o8NjCbyXMV7RFfKdjtLrkgvdFcWCYwhHVeMoBz65TdlW2DkUZ
 TGZwXJvdRSO5/swD7NKqG5ZHD1tzFYSc+kwe3tWZOagNEhwDoFYxcqBER A==;
X-CSE-ConnectionGUID: cR1OPmuJSHiqRPMeDF7YoQ==
X-CSE-MsgGUID: gXPGU8T1QMi89QEYQ699rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="107915554"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="107915554"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 09:47:28 -0700
X-CSE-ConnectionGUID: K/U5YNsQR7uIZsXotwZOrw==
X-CSE-MsgGUID: t7asQGygQ7uinhB6tyISOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="274360226"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa006.fm.intel.com with ESMTP; 30 Sep 2026 09:47:28 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH] drm/xe: Add focused VM teardown and page fault tracing
Date: Wed, 30 Sep 2026 09:46:45 -0700
Message-ID: <20260930164645.1243801-1-daniel.charles@intel.com>
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

Trace the start of VM teardown and ASID removal so late page faults can be
correlated with the VM lifecycle. Emit one failure event for all page fault
errors. Include the existing page fault reason alongside the errno.

Keep the trace set focused by avoiding separate events for userptr pin
attempts, individual close phases, ASID lookup rejection, and faults during
shutdown.

v2: Fix checkpatch warnings.
v3: Pass xe to the page fault tracepoint and print VM mode as
    dma-fence/preempt-fence/fault (Matt)

Assisted-by: GitHub Copilot using Claude Sonnet 5
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 15 ++++++--
 drivers/gpu/drm/xe/xe_trace_bo.h  | 58 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c        |  4 +++
 3 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index f219e9e3b73ed..3a539ab504bf9 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -268,6 +268,7 @@ static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_pagefault *pf, u32 asid)
 static int xe_pagefault_service(struct xe_pagefault *pf)
 {
 	struct xe_gt *gt = pf->gt;
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	int err;
@@ -279,8 +280,13 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 		return -EFAULT;
 
 	vm = xe_pagefault_asid_to_vm(pf, asid);
-	if (IS_ERR(vm))
-		return PTR_ERR(vm);
+	if (IS_ERR(vm)) {
+		err = PTR_ERR(vm);
+		trace_xe_pagefault_fail(xe, NULL, NULL, asid,
+					xe_pagefault_addr(pf),
+					xe_pagefault_get_error(pf), err);
+		return err;
+	}
 
 	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
 
@@ -315,6 +321,11 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 		err = xe_pagefault_handle_vma(gt, vma, pf, atomic);
 
 unlock_vm:
+	if (err)
+		trace_xe_pagefault_fail(xe, vm, vma, asid,
+					xe_pagefault_addr(pf),
+					xe_pagefault_get_error(pf), err);
+
 	up_read(&vm->lock);
 	xe_vm_put(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 86323cf3be2c0..36fc7eb658828 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -16,10 +16,15 @@
 #include "xe_bo_types.h"
 #include "xe_vm.h"
 
+#define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
 #define __dev_name_bo(bo)	dev_name(xe_bo_device(bo)->drm.dev)
 #define __dev_name_vm(vm)	dev_name((vm)->xe->drm.dev)
 #define __dev_name_vma(vma)	__dev_name_vm(xe_vma_vm(vma))
 
+#define XE_VM_TRACE_MODE_DMA_FENCE	0
+#define XE_VM_TRACE_MODE_PREEMPT_FENCE	1
+#define XE_VM_TRACE_MODE_FAULT		2
+
 DECLARE_EVENT_CLASS(xe_bo,
 		    TP_PROTO(struct xe_bo *bo),
 		    TP_ARGS(bo),
@@ -194,6 +199,7 @@ DECLARE_EVENT_CLASS(xe_vm,
 			     __field(struct xe_vm *, vm)
 			     __field(u32, asid)
 			     __field(u32, flags)
+			     __field(u8, mode)
 			     ),
 
 		    TP_fast_assign(
@@ -201,11 +207,20 @@ DECLARE_EVENT_CLASS(xe_vm,
 			   __entry->vm = vm;
 			   __entry->asid = vm->usm.asid;
 			   __entry->flags = vm->flags;
+			   __entry->mode = xe_vm_in_fault_mode(vm) ?
+					   XE_VM_TRACE_MODE_FAULT :
+					   xe_vm_in_preempt_fence_mode(vm) ?
+					   XE_VM_TRACE_MODE_PREEMPT_FENCE :
+					   XE_VM_TRACE_MODE_DMA_FENCE;
 			   ),
 
-		    TP_printk("dev=%s, vm=%p, asid=0x%05x, vm flags=0x%05x",
+		    TP_printk("dev=%s, vm=%p, asid=0x%05x, vm flags=0x%05x, mode=%s",
 			      __get_str(dev), __entry->vm, __entry->asid,
-			      __entry->flags)
+			      __entry->flags,
+			      __print_symbolic(__entry->mode,
+					       { XE_VM_TRACE_MODE_DMA_FENCE, "dma-fence" },
+					       { XE_VM_TRACE_MODE_PREEMPT_FENCE, "preempt-fence" },
+					       { XE_VM_TRACE_MODE_FAULT, "fault" }))
 );
 
 DEFINE_EVENT(xe_vm, xe_vm_kill,
@@ -223,6 +238,16 @@ DEFINE_EVENT(xe_vm, xe_vm_free,
 	     TP_ARGS(vm)
 );
 
+DEFINE_EVENT(xe_vm, xe_vm_close_and_put,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
+DEFINE_EVENT(xe_vm, xe_vm_asid_release,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
 DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
 	     TP_PROTO(struct xe_vm *vm),
 	     TP_ARGS(vm)
@@ -253,6 +278,35 @@ DEFINE_EVENT(xe_vm, xe_vm_ops_fail,
 	     TP_ARGS(vm)
 );
 
+TRACE_EVENT(xe_pagefault_fail,
+	    TP_PROTO(struct xe_device *xe, struct xe_vm *vm, struct xe_vma *vma,
+		     u32 asid, u64 page_addr, u8 reason, int err),
+	    TP_ARGS(xe, vm, vma, asid, page_addr, reason, err),
+
+	    TP_STRUCT__entry(__string(dev, __dev_name_xe(xe))
+		     __field(struct xe_vm *, vm)
+		     __field(struct xe_vma *, vma)
+		     __field(u32, asid)
+		     __field(u64, page_addr)
+		     __field(u8, reason)
+		     __field(int, err)
+		     ),
+
+	    TP_fast_assign(__assign_str(dev);
+		   __entry->vm = vm;
+		   __entry->vma = vma;
+		   __entry->asid = asid;
+		   __entry->page_addr = page_addr;
+		   __entry->reason = reason;
+		   __entry->err = err;
+		   ),
+
+	    TP_printk("dev=%s, vm=%p, vma=%p, asid=0x%05x, page_addr=0x%012llx, reason=%u, err=%d",
+		      __get_str(dev), __entry->vm, __entry->vma,
+		      __entry->asid, __entry->page_addr, __entry->reason,
+		      __entry->err)
+);
+
 #endif
 
 /* This part must be outside protection */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 425c678f4480a..9b2e4f178836e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1915,6 +1915,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	xe_assert(xe, !vm->preempt.num_exec_queues);
 
+	trace_xe_vm_close_and_put(vm);
+
 	xe_vm_close(vm);
 	if (xe_vm_in_preempt_fence_mode(vm)) {
 		mutex_lock(&xe->rebind_resume_lock);
@@ -1993,6 +1995,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_assert(xe, xe->info.has_asid);
 		xe_assert(xe, !(vm->flags & XE_VM_FLAG_MIGRATION));
 
+		trace_xe_vm_asid_release(vm);
+
 		lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
 		xe_assert(xe, lookup == vm);
 	}
-- 
2.43.0

