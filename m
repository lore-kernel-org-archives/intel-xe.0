Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B8FC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 23:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547C010F494;
	Wed, 24 Jan 2024 23:36:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41CD10F7F6
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706139396; x=1737675396;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=It3GpdfrQUXTrLdlErF+FdCDydzViVcOSGAOjZotdDQ=;
 b=iyoN8Jk5fXX7KNQq4tVvm3CG1hdZv0C9cjQTpJS6f3/B21Lv7IkJh2aX
 SyoG/TBUv9FTiIIM2oZqL90me5/Exp8+j2bt00S2iBDEPxMSB04utTLmL
 kdwJsiIsgCJ3xiwWm0NY4spLjwkC7yBZW68+MyjNw3Efa9v6lbekxZyH9
 hFYLah+rr7yP1uXjlxg3n4ee76Dfuyb4a7n7zwuXrcf34ca029aWenTw7
 t4QSI65Qqnk4qIOThLGuuNj6N8CIajOfWCSnI3UcE0fGAfBR9xjnMnQFq
 PyRDXqP02CDbNmmCSySsRmJpiMVQMUkqSS2iepYYCejAUQhtTwlqzvQv2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8682940"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8682940"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 15:36:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28289001"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 15:36:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2] drm/xe: Add DRM_XE_LOW_LEVEL_TRACEPOINTS
Date: Wed, 24 Jan 2024 15:37:12 -0800
Message-Id: <20240124233712.1640409-1-matthew.brost@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hide all Xe tracepoints behind DRM_XE_LOW_LEVEL_TRACEPOINTS as these can
be considered uABI. In Xe these are subject to change so hide these
behind Kconfig option DRM_XE_LOW_LEVEL_TRACEPOINTS. In addition to
possible uABI considerations these are low level developer tracepoints
only needed in debug kernel builds.

v2:
- Reword commit message (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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
index abb2be8268d0..9e591571b2ff 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -130,7 +130,6 @@ xe-y += xe_bb.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
-	xe_trace.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
 	xe_ttm_vram_mgr.o \
@@ -144,6 +143,9 @@ xe-y += xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
 
+# trace support
+xe-$(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS) += xe_trace.o
+
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index e4e7262191ad..831925a3204b 100644
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

