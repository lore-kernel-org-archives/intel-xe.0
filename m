Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7D5C25B70
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBA710E761;
	Thu, 26 Oct 2023 04:02:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D82410E74F
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292912; x=1729828912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fP2oV3R7yG/qfhYYh2zxrVtXCrqbR9W0WSZkMkVQo/0=;
 b=C10v+RaSklwK1NFFHzVYbRI6vaMnxm0SEsIJuwHkeL/BxnSCWzBXROPn
 J8rTJ38XXT9nY7AUzjJs9EeeYlOCmNycM99CV5NHbCgOD5Hp7wN6whM2x
 IAvLxH7JkwzvFC7TQxBNB7WBfcsN87wjOHPXj92tAJKUyyCF2r5EsAxpX
 VH6cS7Pl4BWyUbzYmndhAC/sTCKihd3nehs+bAEwQ3996NvFWoe+SdqsA
 w3jObK68QvTHR0wNIHLoLQBtL99atrOMifjnC4YiKkrG7vwDZMtSd5YzP
 U0WqbNqsvuugY0kr34qGth86jXWa2jTDfI/JhE8M48CfoVy6ivlC4U9xN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377821999"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377821999"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682357"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682357"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:01:57 -0700
Message-Id: <20231026040213.1272993-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/26] drm/xe: Convert pagefault rebind to use
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
index 2ec0db7a4b29..0c87e590a9d8 100644
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
index c1c23db19d9b..d07b82337ce0 100644
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
@@ -2830,8 +2827,7 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 	return 0;
 }
 
-static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops)
+struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op, *next;
 	struct dma_fence *fence = NULL;
@@ -2864,7 +2860,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
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

