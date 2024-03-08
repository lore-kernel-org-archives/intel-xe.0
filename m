Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B639DC54E41
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7667310FB99;
	Fri,  8 Mar 2024 05:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTyLOD2R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8FE10F966
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874474; x=1741410474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RBNMJx4SkWJoYfgVQq3ioh8VWzLQ6AMVrjuPIdOFfn0=;
 b=LTyLOD2RJ4m/p4M6ylF18MBS7R8RNVnE+qB7W9/EwcFTgWRrPff6dISP
 hmFUV7lvGTttJdNcSdve7OA1F3z3JB8X2LBzYycAp/aI7rxIs9PEszQBe
 Xe12+r3BnnmAqIEvLDCTjoBWOqfu4DW9i9r/SHKVIxSWQZrvBWq6o7/Qm
 MtK9ein8MoQiv6r7PV62c4wcXfsImOVMt4QL8hIlnanKhkPTgpF2Dlz9c
 TBCSW9tlbBObQjcCXCcvU8oe8CacAOaGqcNEIHCbe5MC1N2A0qwKhN5uC
 xI3trgsvgo7EPRLOhEYOktdFlDoCLrxTFYfjdaICnRDzkuoml7oMXhP4h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761967"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403004"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 13/30] drm/xe: Move ufence add to
 vm_bind_ioctl_ops_install_fences
Date: Thu,  7 Mar 2024 21:07:49 -0800
Message-Id: <20240308050806.577176-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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

Rather than adding a ufence to a VMA in the bind function, add the
ufence to all VMAs in the IOCTL that require binds in
vm_bind_ioctl_ops_install_fences. This will help with the transition to
job 1 per VM bind IOCTL.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 15 ++++++++++++
 drivers/gpu/drm/xe/xe_sync.h |  1 +
 drivers/gpu/drm/xe/xe_vm.c   | 44 ++++++++++++++++++++++++++++++------
 3 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 02c9577fe418..07aa65d9bcab 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -343,6 +343,21 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 	return ERR_PTR(-ENOMEM);
 }
 
+/**
+ * __xe_sync_ufence_get() - Get user fence from user fence
+ * @ufence: input user fence
+ *
+ * Get a user fence reference from user fence
+ *
+ * Return: xe_user_fence pointer with reference
+ */
+struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence)
+{
+	user_fence_get(ufence);
+
+	return ufence;
+}
+
 /**
  * xe_sync_ufence_get() - Get user fence from sync
  * @sync: input sync
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 0fd0d51208e6..26e9ec9de1a8 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -38,6 +38,7 @@ static inline bool xe_sync_is_ufence(struct xe_sync_entry *sync)
 	return !!sync->ufence;
 }
 
+struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
 struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
 void xe_sync_ufence_put(struct xe_user_fence *ufence);
 int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5767955529dd..5b93c71fc5e9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1810,17 +1810,10 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 {
 	struct dma_fence *fence;
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-	struct xe_user_fence *ufence;
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(bo);
 
-	ufence = find_ufence_get(syncs, num_syncs);
-	if (vma->ufence && ufence)
-		xe_sync_ufence_put(vma->ufence);
-
-	vma->ufence = ufence ?: vma->ufence;
-
 	if (immediate) {
 		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, tile_mask,
 				       first_op, last_op);
@@ -2822,21 +2815,58 @@ struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
 	return fence;
 }
 
+static void vma_add_ufence(struct xe_vma *vma, struct xe_user_fence *ufence)
+{
+	if (vma->ufence)
+		xe_sync_ufence_put(vma->ufence);
+	vma->ufence = __xe_sync_ufence_get(ufence);
+}
+
+static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
+			  struct xe_user_fence *ufence)
+{
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		vma_add_ufence(op->map.vma, ufence);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.prev)
+			vma_add_ufence(op->remap.prev, ufence);
+		if (op->remap.next)
+			vma_add_ufence(op->remap.next, ufence);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va), ufence);
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+}
+
 static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
 					     struct xe_vma_ops *vops,
 					     struct dma_fence *fence)
 {
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
+	struct xe_user_fence *ufence;
 	struct xe_vma_op *op;
 	int i;
 
+	ufence = find_ufence_get(vops->syncs, vops->num_syncs);
 	list_for_each_entry(op, &vops->list, link) {
+		if (ufence)
+			op_add_ufence(vm, op, ufence);
+
 		if (op->base.op == DRM_GPUVA_OP_UNMAP)
 			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), fence);
 		else if (op->base.op == DRM_GPUVA_OP_REMAP)
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va),
 				       fence);
 	}
+	if (ufence)
+		xe_sync_ufence_put(ufence);
 	for (i = 0; i < vops->num_syncs; i++)
 		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
 	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-- 
2.34.1

