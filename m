Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B89C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 12:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E034810E196;
	Wed, 24 May 2023 12:37:23 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BD410E196
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684931842; x=1716467842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=03cgivhd6k47DgTUD/g1dqN6aqloy71HIJrPBd7qJcs=;
 b=bDYa7ytCpsbjE+OmVQhbj+S6dwnl2NDBT9d15XMbl3TXQkO4Nq4+63nj
 RK9aHtMNREnkZ51SG2uuKP4KDWU9upHPvSKm3AHyl1UNZB7GiQsMQPvOo
 W92xTc+NPTraGjpIGxIgelzvRUuPeEJlpYbKcbRci3N4C6PG5kKQfMWGg
 siKDrE24xkyG+DTLR+AoDlS2cKT53NxIXGvvRm1d3wFhxbsMxUZLrARr+
 uvVpnrCeKn2vCkPsIRp5Y2MW/ipQdVs2cQj7U0mE+QRnOPTRqM4xNHkXa
 rUB4k1dc2yUSuplXnXyeAfEIllYTuS8MMa3ZXW2mgjGUrl5B7CTWe4GFM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343010789"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="343010789"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="735186111"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="735186111"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:37:21 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 14:36:47 +0200
Message-Id: <20230524123648.29955-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230524123648.29955-1-nirmoy.das@intel.com>
References: <20230524123648.29955-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 1/2] drm/xe: Expose vma bind-unbind functions
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expose vma bind and unbind functionality which is
needed to implement vma madvise.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 52 ++++++++++++++++++--------------------
 drivers/gpu/drm/xe/xe_vm.h |  3 +++
 2 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a0306526b269..ae53f08923f5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -668,10 +668,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 }
 
 struct async_op_fence;
-static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
-			struct xe_engine *e, struct xe_sync_entry *syncs,
-			u32 num_syncs, struct async_op_fence *afence);
-
 static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 				   const struct mmu_notifier_range *range,
 				   unsigned long cur_seq)
@@ -1704,13 +1700,21 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence)
 }
 
 static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
-			struct xe_engine *e, struct xe_sync_entry *syncs,
+			struct xe_engine *e, struct xe_bo *bo,
+			struct xe_sync_entry *syncs,
 			u32 num_syncs, struct async_op_fence *afence)
 {
 	struct dma_fence *fence;
+	int err;
 
 	xe_vm_assert_held(vm);
+	xe_bo_assert_held(bo);
 
+	if (bo) {
+		err = xe_bo_validate(bo, vm, true);
+		if (err)
+			return err;
+	}
 	fence = xe_vm_bind_vma(vma, e, syncs, num_syncs);
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
@@ -1721,27 +1725,14 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_engine *e,
-		      struct xe_bo *bo, struct xe_sync_entry *syncs,
-		      u32 num_syncs, struct async_op_fence *afence)
+int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma)
 {
-	int err;
-
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(bo);
-
-	if (bo) {
-		err = xe_bo_validate(bo, vm, true);
-		if (err)
-			return err;
-	}
-
-	return __xe_vm_bind(vm, vma, e, syncs, num_syncs, afence);
+	return __xe_vm_bind(vm, vma, NULL, vma->bo, NULL, 0, NULL);
 }
 
-static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
-			struct xe_engine *e, struct xe_sync_entry *syncs,
-			u32 num_syncs, struct async_op_fence *afence)
+int __xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
+		   struct xe_engine *e, struct xe_sync_entry *syncs,
+		   u32 num_syncs, struct async_op_fence *afence)
 {
 	struct dma_fence *fence;
 
@@ -1760,6 +1751,11 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
+int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma)
+{
+	return __xe_vm_unbind(vm, vma, NULL, NULL, 0, NULL);
+}
+
 static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
 					u64 value)
 {
@@ -1984,8 +1980,8 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	}
 
 	if (vma->gt_mask != (vma->gt_present & ~vma->usm.gt_invalidated)) {
-		return xe_vm_bind(vm, vma, e, vma->bo, syncs, num_syncs,
-				  afence);
+		return __xe_vm_bind(vm, vma, e, vma->bo, syncs, num_syncs,
+				    afence);
 	} else {
 		int i;
 
@@ -2008,12 +2004,12 @@ static int __vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 {
 	switch (VM_BIND_OP(op)) {
 	case XE_VM_BIND_OP_MAP:
-		return xe_vm_bind(vm, vma, e, bo, syncs, num_syncs, afence);
+		return __xe_vm_bind(vm, vma, e, bo, syncs, num_syncs, afence);
 	case XE_VM_BIND_OP_UNMAP:
 	case XE_VM_BIND_OP_UNMAP_ALL:
-		return xe_vm_unbind(vm, vma, e, syncs, num_syncs, afence);
+		return __xe_vm_unbind(vm, vma, e, syncs, num_syncs, afence);
 	case XE_VM_BIND_OP_MAP_USERPTR:
-		return xe_vm_bind(vm, vma, e, NULL, syncs, num_syncs, afence);
+		return __xe_vm_bind(vm, vma, e, NULL, syncs, num_syncs, afence);
 	case XE_VM_BIND_OP_PREFETCH:
 		return xe_vm_prefetch(vm, vma, e, region, syncs, num_syncs,
 				      afence);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 748dc16ebed9..c8be6d7ec526 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -147,6 +147,9 @@ void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
 
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 
+int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma);
+int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
-- 
2.39.0

