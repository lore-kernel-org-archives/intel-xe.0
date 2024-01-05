Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92C5C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 16:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A405F10E647;
	Fri,  5 Jan 2024 16:45:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C045510E647
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704473099; x=1736009099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4MrAR/NJcGFZz2KJ4Y2BZRvAB07YVKPjHFy+8XZLJ7o=;
 b=AC9gOm+jP+CGpHqSCgthrub1IfqY4vWQ3NzH3mrdlTTCRgueqAxKjrYl
 EE82B+sQSP9LKzaDRX5nA1FXH2lGT6BNpvH5txA3eDz9TttjxOvq2a9Kx
 9Q57sg5eyEYiv4T1kxDsBgKpL8JPXbBccxJjN0mcK/irR5TCbB3FTsSK9
 sGP2sVnof3B7FRVyinL9QlO++FZfOdBs5p9cVG9AE752csSjPehm3cFD8
 69FRhGQEEawKIGCkClmiBupD3JeYyU9eZOBT5zGjpRhyu6htxFypmkyMO
 Io9wJ7Pa5phxUvh0NiVUwI7BQB3w4pH8Zkp12XX3R8PquyjEvCXkGUBaB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4345570"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="4345570"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 08:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="773890614"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="773890614"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 08:44:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Add DRM_XE_LOW_LEVEL_TRACEPOINTS
Date: Fri,  5 Jan 2024 08:45:30 -0800
Message-Id: <20240105164530.1328374-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Trace events are uABI. The Xe trace events currently implemented are
developer only and subject to change. Hide all Xe behind
DRM_XE_LOW_LEVEL_TRACEPOINTS so these are free to change going forward.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug |  10 +
 drivers/gpu/drm/xe/Makefile      |   4 +-
 drivers/gpu/drm/xe/xe_trace.h    | 339 +++++++++++++++++++++++++++++++
 3 files changed, 352 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 549065f57a78..a8785e71e224 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -105,3 +105,13 @@ config DRM_XE_USERPTR_INVAL_INJECT
 
 	 Recomended for driver developers only.
 	 If in doubt, say "N".
+
+config DRM_XE_LOW_LEVEL_TRACEPOINTS
+       bool "Enable low level trace events"
+       default n
+       help
+         Choose this option to enable low level trace events.
+
+	 Recomended for driver developers only.
+
+	 If in doubt, say "N".
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 53bd2a8ba1ae..9d33e6975ba0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -129,7 +129,6 @@ xe-y += xe_bb.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
-	xe_trace.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
 	xe_ttm_vram_mgr.o \
@@ -142,6 +141,9 @@ xe-y += xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
 
+# trace support
+xe-$(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS) += xe_trace.o
+
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 95163c303f3e..7163ac9b8eae 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -21,6 +21,7 @@
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
+#if defined(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS)
 DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
 		    TP_ARGS(fence),
@@ -597,6 +598,344 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
 			     __entry->tail, __entry->_head)
 
 );
+#else
+#if !defined(TRACE_HEADER_MULTI_READ)
+static inline void
+trace_xe_gt_tlb_invalidation_fence_create(struct xe_gt_tlb_invalidation_fence *fence)
+{
+}
+
+static inline void
+trace_xe_gt_tlb_invalidation_fence_work_func(struct xe_gt_tlb_invalidation_fence *fence)
+{
+}
+
+static inline void
+trace_xe_gt_tlb_invalidation_fence_cb(struct xe_gt_tlb_invalidation_fence *fence)
+{
+}
+
+static inline void
+trace_xe_gt_tlb_invalidation_fence_send(struct xe_gt_tlb_invalidation_fence *fence)
+{
+}
+
+static inline void
+trace_xe_gt_tlb_invalidation_fence_recv(struct xe_gt_tlb_invalidation_fence *fence)
+{
+}
+
+static inline void
+trace_xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+{
+}
+
+static inline void
+trace_xe_gt_tlb_invalidation_fence_timeout(struct xe_gt_tlb_invalidation_fence *fence)
+{
+}
+
+static inline void
+trace_xe_bo_cpu_fault(struct xe_bo *bo)
+{
+}
+
+static inline void
+trace_xe_bo_move(struct xe_bo *bo)
+{
+}
+
+static inline void
+trace_xe_exec_queue_create(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_supress_resume(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_submit(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_scheduling_enable(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_scheduling_disable(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_scheduling_done(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_register(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_deregister(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_deregister_done(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_close(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_kill(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_cleanup_entity(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_destroy(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_reset(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_memory_cat_error(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_stop(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_resubmit(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_exec_queue_lr_cleanup(struct xe_exec_queue *q)
+{
+}
+
+static inline void
+trace_xe_sched_job_create(struct xe_sched_job *job)
+{
+}
+
+static inline void
+trace_xe_sched_job_exec(struct xe_sched_job *job)
+{
+}
+
+static inline void
+trace_xe_sched_job_run(struct xe_sched_job *job)
+{
+}
+
+static inline void
+trace_xe_sched_job_free(struct xe_sched_job *job)
+{
+}
+
+static inline void
+trace_xe_sched_job_timedout(struct xe_sched_job *job)
+{
+}
+
+static inline void
+trace_xe_sched_job_set_error(struct xe_sched_job *job)
+{
+}
+
+static inline void
+trace_xe_sched_job_ban(struct xe_sched_job *job)
+{
+}
+
+static inline void
+trace_xe_sched_msg_add(struct xe_sched_msg *msg)
+{
+}
+
+static inline void
+trace_xe_sched_msg_recv(struct xe_sched_msg *msg)
+{
+}
+
+static inline void
+trace_xe_hw_fence_create(struct xe_hw_fence *fence)
+{
+}
+
+static inline void
+trace_xe_hw_fence_signal(struct xe_hw_fence *fence)
+{
+}
+
+static inline void
+trace_xe_hw_fence_try_signal(struct xe_hw_fence *fence)
+{
+}
+
+static inline void
+trace_xe_hw_fence_free(struct xe_hw_fence *fence)
+{
+}
+
+static inline void
+trace_xe_vma_flush(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_pagefault(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_acc(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_fail(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_bind(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_pf_bind(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_unbind(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_userptr_rebind_worker(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_userptr_rebind_exec(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_rebind_worker(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_rebind_exec(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_userptr_invalidate(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_usm_invalidate(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_evict(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vma_userptr_invalidate_complete(struct xe_vma *vma)
+{
+}
+
+static inline void
+trace_xe_vm_kill(struct xe_vm *vm)
+{
+}
+
+static inline void
+trace_xe_vm_create(struct xe_vm *vm)
+{
+}
+
+static inline void
+trace_xe_vm_free(struct xe_vm *vm)
+{
+}
+
+static inline void
+trace_xe_vm_cpu_bind(struct xe_vm *vm)
+{
+}
+
+static inline void
+trace_xe_vm_restart(struct xe_vm *vm)
+{
+}
+
+static inline void
+trace_xe_vm_rebind_worker_enter(struct xe_vm *vm)
+{
+}
+
+static inline void
+trace_xe_vm_rebind_worker_retry(struct xe_vm *vm)
+{
+}
+
+static inline void
+trace_xe_vm_rebind_worker_exit(struct xe_vm *vm)
+{
+}
+
+static inline void
+trace_xe_guc_ct_h2g_flow_control(u32 _head, u32 _tail, u32 size, u32 space, u32 len)
+{
+}
+
+static inline void
+trace_xe_guc_ct_g2h_flow_control(u32 _head, u32 _tail, u32 size, u32 space, u32 len)
+{
+}
+
+static inline void
+trace_xe_guc_ctb_h2g(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
+{
+}
+
+static inline void
+trace_xe_guc_ctb_g2h(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
+{
+}
+#endif
+#endif
 
 #endif
 
-- 
2.34.1

