Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4A6C10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 04:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF83911A0E6;
	Thu, 25 Apr 2024 04:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCnmTKdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EB211A0E7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 04:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714020884; x=1745556884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vSkf5B2nfnCMCQ4B+ZVF6+rvflj78duSLykKGpPw+iA=;
 b=lCnmTKdUQa1ntEo9HdiAwqkC+x5QZcutp1u48NOqCRZetiUBOsHD9XJm
 WEwPrrPGFRtHDW7JVa78sAbS39ZdM+Ie6e/q1ygbaoyc86q1ezE2npTfM
 QRaPc5BAEcOyeSwT0MBtXg23wBAbFXwnr6r1T6XvEzBKPKdsZk0Grb3uk
 AzMIDArM0/nbNj3n/YVlvbH8TBdLuyRlvrKXaYqae1UtjRZkzcpI2lzdJ
 XIl8+i80GO0bknlq7yUWM5D6rgvgMPEVV+pWDFtGu9nQdN4VQPkq3cDg3
 oI1ZkaHGjMZIRMQFEPOn4sfd2p8rp3Qe7eBIo+escTzKlnSfcHK+xQ8W8 w==;
X-CSE-ConnectionGUID: thLEzg9rSMquJEdM2isYkg==
X-CSE-MsgGUID: I7xYv42DQZa0svktghFSzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20374875"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="20374875"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:43 -0700
X-CSE-ConnectionGUID: HTUEq8lxSlWgzrj9bR2iJA==
X-CSE-MsgGUID: sNXZ8t5nS/aGJvBYjBn45w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24996488"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v3 05/13] drm/xe: Use xe_vma_ops to implement xe_vm_rebind
Date: Wed, 24 Apr 2024 21:55:05 -0700
Message-Id: <20240425045513.1913039-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425045513.1913039-1-matthew.brost@intel.com>
References: <20240425045513.1913039-1-matthew.brost@intel.com>
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

All page tables updates are moving to a xe_vma_ops interface to
implement 1 job per VM bind IOCTL. Convert xe_vm_rebind to use a
xe_vma_ops based interface.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 78 +++++++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7d878d1234cf..d44234dc25b2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -712,37 +712,87 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
-static struct dma_fence *
-xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
-	       struct xe_sync_entry *syncs, u32 num_syncs,
-	       bool first_op, bool last_op);
+static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
+				  u8 tile_mask)
+{
+	INIT_LIST_HEAD(&op->link);
+	op->base.op = DRM_GPUVA_OP_MAP;
+	op->base.map.va.addr = vma->gpuva.va.addr;
+	op->base.map.va.range = vma->gpuva.va.range;
+	op->base.map.gem.obj = vma->gpuva.gem.obj;
+	op->base.map.gem.offset = vma->gpuva.gem.offset;
+	op->map.vma = vma;
+	op->map.immediate = true;
+	op->map.dumpable = vma->gpuva.flags & XE_VMA_DUMPABLE;
+	op->map.is_null = xe_vma_is_null(vma);
+}
+
+static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
+				u8 tile_mask)
+{
+	struct xe_vma_op *op;
+
+	op = kzalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
+	xe_vm_populate_rebind(op, vma, tile_mask);
+	list_add_tail(&op->link, &vops->list);
+
+	return 0;
+}
+
+static struct dma_fence *ops_execute(struct xe_vm *vm,
+				     struct xe_vma_ops *vops,
+				     bool cleanup);
+static void xe_vma_ops_init(struct xe_vma_ops *vops);
 
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
 	struct dma_fence *fence;
 	struct xe_vma *vma, *next;
+	struct xe_vma_ops vops;
+	struct xe_vma_op *op, *next_op;
+	int err;
 
 	lockdep_assert_held(&vm->lock);
-	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
+	if ((xe_vm_in_lr_mode(vm) && !rebind_worker) ||
+	    list_empty(&vm->rebind_list))
 		return 0;
 
+	xe_vma_ops_init(&vops);
+
 	xe_vm_assert_held(vm);
-	list_for_each_entry_safe(vma, next, &vm->rebind_list,
-				 combined_links.rebind) {
+	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
 		xe_assert(vm->xe, vma->tile_present);
 
-		list_del_init(&vma->combined_links.rebind);
 		if (rebind_worker)
 			trace_xe_vma_rebind_worker(vma);
 		else
 			trace_xe_vma_rebind_exec(vma);
-		fence = xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
-		if (IS_ERR(fence))
-			return PTR_ERR(fence);
+
+		err = xe_vm_ops_add_rebind(&vops, vma,
+					   vma->tile_present);
+		if (err)
+			goto free_ops;
+	}
+
+	fence = ops_execute(vm, &vops, false);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+	} else {
 		dma_fence_put(fence);
+		list_for_each_entry_safe(vma, next, &vm->rebind_list,
+					 combined_links.rebind)
+			list_del_init(&vma->combined_links.rebind);
+	}
+free_ops:
+	list_for_each_entry_safe(op, next_op, &vops.list, link) {
+		list_del(&op->link);
+		kfree(op);
 	}
 
-	return 0;
+	return err;
 }
 
 static void xe_vma_free(struct xe_vma *vma)
@@ -2398,7 +2448,7 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 {
 	struct dma_fence *fence = NULL;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -2517,7 +2567,7 @@ xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	struct dma_fence *fence = ERR_PTR(-ENOMEM);
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-- 
2.34.1

