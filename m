Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4E8C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EA510E4B9;
	Tue,  7 Nov 2023 05:26:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6095110E02D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I+gJYx9hrsdMjsSad2od9h1FkkCUEQqnGk+iYjTwUnA=;
 b=IYiEzrZQ1Vi9R2ue1pJKxVSenDmeR2m6RSWhPQj1856sATWaZt/y1nwm
 xL/zkBnT4P1Btgczjz2Y3VB2ZWSKuwbZVTkc+NYJV+MhgOV2+kI25N+Ah
 +mctcxV1kK/NsDXI5SnK70qTDnJHuD02ul+ANKGDvqx20W4HpmimsFchI
 BLFRcBsBlDWlH5Y26I/YoIIFkinlgNfp0003LmPaBp8NrSQ9Uf/TDpiG+
 a4cGkKUgim7xPzwLVL5u/jH3CZAPMYB2zqPOJqrxQTXJpsd6sgnxlD7Wm
 0GS04oEbCsF9/whqEkxGQrKK4zzK3mlWokxfICkytScnhI+LpHj4df+FQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769523"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769523"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689848"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689848"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:47 -0800
Message-Id: <20231107052603.124361-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 11/27] drm/xe: Convert pagefault rebind to use
 ops interface
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

Calling into the VM layer is correct not the PT layer. Also all bind
moving towards VMA operations interfaces.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  7 ++++---
 drivers/gpu/drm/xe/xe_vm.c           | 12 ++++--------
 drivers/gpu/drm/xe/xe_vm.h           |  3 +++
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 5b3585e2c125..27845a6b0b23 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -18,7 +18,6 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
-#include "xe_pt.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 
@@ -204,8 +203,10 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	/* Bind VMA only to the GT that has faulted */
 	trace_xe_vma_pf_bind(vma);
-	fence = __xe_pt_bind_vma(tile, vma, xe_tile_migrate_engine(tile), NULL, 0,
-				 vma->tile_present & BIT(tile->id));
+	xe_vm_populate_dummy_rebind(vm, vma);
+	vm->dummy_ops.op.tile_mask = BIT(tile->id);
+	vm->dummy_ops.op.q = xe_tile_migrate_engine(tile);
+	fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
 		goto unlock_dma_resv;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 20866d7ddb9b..085acd083ec2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -829,7 +829,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
-static void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma)
+void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma)
 {
 	vm->dummy_ops.op.base.op = DRM_GPUVA_OP_MAP;
 	vm->dummy_ops.op.base.map.va.addr = vma->gpuva.va.addr;
@@ -843,9 +843,6 @@ static void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma)
 	vm->dummy_ops.op.map.is_null = xe_vma_is_null(vma);
 }
 
-static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops);
-
 struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
 	struct dma_fence *fence = NULL;
@@ -868,7 +865,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			trace_xe_vma_rebind_exec(vma);
 
 		xe_vm_populate_dummy_rebind(vm, vma);
-		fence = ops_execute(vm, &vm->dummy_ops.vops);
+		fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 		if (IS_ERR(fence))
 			return fence;
 	}
@@ -2841,8 +2838,7 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 	return 0;
 }
 
-static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops)
+struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op, *next;
 	struct dma_fence *fence = NULL;
@@ -2875,7 +2871,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		if (err)
 			return err;
 
-		fence = ops_execute(vm, vops);
+		fence = xe_vm_ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b08c75fbd8a1..7cbb512bcb10 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -224,6 +224,9 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
 		      unsigned int num_shared);
 
+void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma);
+struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
-- 
2.34.1

