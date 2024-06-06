Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510B5C27C53
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 00:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA9F10E459;
	Thu,  6 Jun 2024 00:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYJs179z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210D010E469
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717633186; x=1749169186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PBLIe8G4PKYVguO69dKW4Q4LVR0YJt/lBnQUNFxCUfg=;
 b=MYJs179zXyEHn6p93uPVudkbQo5NWNO/MQCYnb+VB02ThJRFhioeOu6r
 m7yOv698OHEhMz2coq1p9Rk4CkQ0eFvkedV1UnyaMaU1G5MEBIeeTaxI9
 AK82azxh5QDScD47lPYz3Up7+fSypXa02/Vg9QUZIa6nEfaIf6q0FzMnA
 dlmwdNrNaIHWgZ5EoPiiaafk1deXf614PWJIFPL838E4AGA2XVeUjJlFc
 DEJnW8CLFMKGScn85gwVP3324x3gYFlbQEVl4RjGE3JTBIPkdidMQCdMw
 75Fb2K6+pqfmJ1Gq1hZUuWJOOioD1auPhCCRjy8QiuST5GqqRIHtV+Dk4 Q==;
X-CSE-ConnectionGUID: pz6OufZcR1uvZNOIljjGLQ==
X-CSE-MsgGUID: PF1pdXHvTJWduG0xdZCHNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31820035"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="31820035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:46 -0700
X-CSE-ConnectionGUID: rZRwz0EmR1qhO2rFxIIM7A==
X-CSE-MsgGUID: CtaUvu/VQyeBBei/mtfb4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="38328625"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:45 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 1/6] drm/xe/trace: Extract bo, vm, vma traces
Date: Wed,  5 Jun 2024 17:18:09 -0700
Message-Id: <20240606001814.3460974-2-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
References: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
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

xe_trace.h is starting to get over crowded. Move the traces
related to bo, vm, vma's to its own file.

v2: Update year in License(Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c      |   2 +-
 drivers/gpu/drm/xe/xe_trace.h        | 212 ------------------------
 drivers/gpu/drm/xe/xe_trace_bo.c     |   9 +
 drivers/gpu/drm/xe/xe_trace_bo.h     | 236 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c           |   2 +-
 8 files changed, 250 insertions(+), 216 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0c3e3adabb27..7c5e77fbfc1e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -112,6 +112,7 @@ xe-y += xe_bb.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
 	xe_trace.o \
+	xe_trace_bo.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
 	xe_ttm_vram_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bae01ce4e5b..74294f1b05bc 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -25,7 +25,7 @@
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
-#include "xe_trace.h"
+#include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 040dd142c49c..dead920de5f1 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -19,7 +19,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
-#include "xe_trace.h"
+#include "xe_trace_bo.h"
 #include "xe_vm.h"
 
 struct pagefault {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cccffaf3db06..da3305834448 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -32,7 +32,7 @@
 #include "xe_res_cursor.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
-#include "xe_trace.h"
+#include "xe_trace_bo.h"
 #include "xe_vm.h"
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 450f407c66e8..9493cc3d6d82 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -12,8 +12,6 @@
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
-#include "xe_bo.h"
-#include "xe_bo_types.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gpu_scheduler_types.h"
 #include "xe_gt_tlb_invalidation_types.h"
@@ -76,58 +74,6 @@ DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_timeout,
 	     TP_ARGS(fence)
 );
 
-DECLARE_EVENT_CLASS(xe_bo,
-		    TP_PROTO(struct xe_bo *bo),
-		    TP_ARGS(bo),
-
-		    TP_STRUCT__entry(
-			     __field(size_t, size)
-			     __field(u32, flags)
-			     __field(struct xe_vm *, vm)
-			     ),
-
-		    TP_fast_assign(
-			   __entry->size = bo->size;
-			   __entry->flags = bo->flags;
-			   __entry->vm = bo->vm;
-			   ),
-
-		    TP_printk("size=%zu, flags=0x%02x, vm=%p",
-			      __entry->size, __entry->flags, __entry->vm)
-);
-
-DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
-	     TP_PROTO(struct xe_bo *bo),
-	     TP_ARGS(bo)
-);
-
-TRACE_EVENT(xe_bo_move,
-	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t old_placement,
-		     bool move_lacks_source),
-	    TP_ARGS(bo, new_placement, old_placement, move_lacks_source),
-	    TP_STRUCT__entry(
-		     __field(struct xe_bo *, bo)
-		     __field(size_t, size)
-		     __field(u32, new_placement)
-		     __field(u32, old_placement)
-		     __array(char, device_id, 12)
-		     __field(bool, move_lacks_source)
-			),
-
-	    TP_fast_assign(
-		   __entry->bo      = bo;
-		   __entry->size = bo->size;
-		   __entry->new_placement = new_placement;
-		   __entry->old_placement = old_placement;
-		   strscpy(__entry->device_id, dev_name(xe_bo_device(__entry->bo)->drm.dev), 12);
-		   __entry->move_lacks_source = move_lacks_source;
-		   ),
-	    TP_printk("move_lacks_source:%s, migrate object %p [size %zu] from %s to %s device_id:%s",
-		      __entry->move_lacks_source ? "yes" : "no", __entry->bo, __entry->size,
-		      xe_mem_type_to_name[__entry->old_placement],
-		      xe_mem_type_to_name[__entry->new_placement], __entry->device_id)
-);
-
 DECLARE_EVENT_CLASS(xe_exec_queue,
 		    TP_PROTO(struct xe_exec_queue *q),
 		    TP_ARGS(q),
@@ -386,164 +332,6 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
 	     TP_ARGS(fence)
 );
 
-DECLARE_EVENT_CLASS(xe_vma,
-		    TP_PROTO(struct xe_vma *vma),
-		    TP_ARGS(vma),
-
-		    TP_STRUCT__entry(
-			     __field(struct xe_vma *, vma)
-			     __field(u32, asid)
-			     __field(u64, start)
-			     __field(u64, end)
-			     __field(u64, ptr)
-			     ),
-
-		    TP_fast_assign(
-			   __entry->vma = vma;
-			   __entry->asid = xe_vma_vm(vma)->usm.asid;
-			   __entry->start = xe_vma_start(vma);
-			   __entry->end = xe_vma_end(vma) - 1;
-			   __entry->ptr = xe_vma_userptr(vma);
-			   ),
-
-		    TP_printk("vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
-			      __entry->vma, __entry->asid, __entry->start,
-			      __entry->end, __entry->ptr)
-)
-
-DEFINE_EVENT(xe_vma, xe_vma_flush,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_pagefault,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_acc,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_fail,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_bind,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_pf_bind,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_unbind,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_worker,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_exec,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_rebind_worker,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_rebind_exec,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_invalidate,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_evict,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate_complete,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DECLARE_EVENT_CLASS(xe_vm,
-		    TP_PROTO(struct xe_vm *vm),
-		    TP_ARGS(vm),
-
-		    TP_STRUCT__entry(
-			     __field(struct xe_vm *, vm)
-			     __field(u32, asid)
-			     ),
-
-		    TP_fast_assign(
-			   __entry->vm = vm;
-			   __entry->asid = vm->usm.asid;
-			   ),
-
-		    TP_printk("vm=%p, asid=0x%05x",  __entry->vm,
-			      __entry->asid)
-);
-
-DEFINE_EVENT(xe_vm, xe_vm_kill,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
-DEFINE_EVENT(xe_vm, xe_vm_create,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
-DEFINE_EVENT(xe_vm, xe_vm_free,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
-DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
-DEFINE_EVENT(xe_vm, xe_vm_restart,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
-DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_enter,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
-DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_retry,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
-DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
 /* GuC */
 DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
 		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.c b/drivers/gpu/drm/xe/xe_trace_bo.c
new file mode 100644
index 000000000000..6d5e66ce4c50
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_bo.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __CHECKER__
+#define CREATE_TRACE_POINTS
+#include "xe_trace_bo.h"
+#endif
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
new file mode 100644
index 000000000000..c8bd746d9d41
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -0,0 +1,236 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM xe
+
+#if !defined(_XE_TRACE_BO_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _XE_TRACE_BO_H_
+
+#include <linux/tracepoint.h>
+#include <linux/types.h>
+
+#include "xe_bo.h"
+#include "xe_bo_types.h"
+#include "xe_vm.h"
+
+DECLARE_EVENT_CLASS(xe_bo,
+		    TP_PROTO(struct xe_bo *bo),
+		    TP_ARGS(bo),
+
+		    TP_STRUCT__entry(
+			     __field(size_t, size)
+			     __field(u32, flags)
+			     __field(struct xe_vm *, vm)
+			     ),
+
+		    TP_fast_assign(
+			   __entry->size = bo->size;
+			   __entry->flags = bo->flags;
+			   __entry->vm = bo->vm;
+			   ),
+
+		    TP_printk("size=%zu, flags=0x%02x, vm=%p",
+			      __entry->size, __entry->flags, __entry->vm)
+);
+
+DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
+	     TP_PROTO(struct xe_bo *bo),
+	     TP_ARGS(bo)
+);
+
+TRACE_EVENT(xe_bo_move,
+	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t old_placement,
+		     bool move_lacks_source),
+	    TP_ARGS(bo, new_placement, old_placement, move_lacks_source),
+	    TP_STRUCT__entry(
+		     __field(struct xe_bo *, bo)
+		     __field(size_t, size)
+		     __field(u32, new_placement)
+		     __field(u32, old_placement)
+		     __array(char, device_id, 12)
+		     __field(bool, move_lacks_source)
+			),
+
+	    TP_fast_assign(
+		   __entry->bo      = bo;
+		   __entry->size = bo->size;
+		   __entry->new_placement = new_placement;
+		   __entry->old_placement = old_placement;
+		   strscpy(__entry->device_id, dev_name(xe_bo_device(__entry->bo)->drm.dev), 12);
+		   __entry->move_lacks_source = move_lacks_source;
+		   ),
+	    TP_printk("move_lacks_source:%s, migrate object %p [size %zu] from %s to %s device_id:%s",
+		      __entry->move_lacks_source ? "yes" : "no", __entry->bo, __entry->size,
+		      xe_mem_type_to_name[__entry->old_placement],
+		      xe_mem_type_to_name[__entry->new_placement], __entry->device_id)
+);
+
+DECLARE_EVENT_CLASS(xe_vma,
+		    TP_PROTO(struct xe_vma *vma),
+		    TP_ARGS(vma),
+
+		    TP_STRUCT__entry(
+			     __field(struct xe_vma *, vma)
+			     __field(u32, asid)
+			     __field(u64, start)
+			     __field(u64, end)
+			     __field(u64, ptr)
+			     ),
+
+		    TP_fast_assign(
+			   __entry->vma = vma;
+			   __entry->asid = xe_vma_vm(vma)->usm.asid;
+			   __entry->start = xe_vma_start(vma);
+			   __entry->end = xe_vma_end(vma) - 1;
+			   __entry->ptr = xe_vma_userptr(vma);
+			   ),
+
+		    TP_printk("vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
+			      __entry->vma, __entry->asid, __entry->start,
+			      __entry->end, __entry->ptr)
+)
+
+DEFINE_EVENT(xe_vma, xe_vma_flush,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_pagefault,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_acc,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_fail,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_bind,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_pf_bind,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_unbind,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_worker,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_exec,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_rebind_worker,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_rebind_exec,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_invalidate,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_evict,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate_complete,
+	     TP_PROTO(struct xe_vma *vma),
+	     TP_ARGS(vma)
+);
+
+DECLARE_EVENT_CLASS(xe_vm,
+		    TP_PROTO(struct xe_vm *vm),
+		    TP_ARGS(vm),
+
+		    TP_STRUCT__entry(
+			     __field(struct xe_vm *, vm)
+			     __field(u32, asid)
+			     ),
+
+		    TP_fast_assign(
+			   __entry->vm = vm;
+			   __entry->asid = vm->usm.asid;
+			   ),
+
+		    TP_printk("vm=%p, asid=0x%05x",  __entry->vm,
+			      __entry->asid)
+);
+
+DEFINE_EVENT(xe_vm, xe_vm_kill,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
+DEFINE_EVENT(xe_vm, xe_vm_create,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
+DEFINE_EVENT(xe_vm, xe_vm_free,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
+DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
+DEFINE_EVENT(xe_vm, xe_vm_restart,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
+DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_enter,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
+DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_retry,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
+DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
+#endif
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
+#define TRACE_INCLUDE_FILE xe_trace_bo
+#include <trace/define_trace.h>
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 26b409e1b0f0..c2100d26b4e3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -36,7 +36,7 @@
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
 #include "xe_sync.h"
-#include "xe_trace.h"
+#include "xe_trace_bo.h"
 #include "xe_wa.h"
 #include "xe_hmm.h"
 
-- 
2.34.1

