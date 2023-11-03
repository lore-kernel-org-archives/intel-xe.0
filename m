Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034B1C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA80D10EA14;
	Fri,  3 Nov 2023 15:33:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9229310E175
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699025581; x=1730561581;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tW6aimCZNCufgijhLs0q7eXjsq27VUAes/6LPKjLNyg=;
 b=bOqtKKj/Y0MhBLR8T1ERNtS0AXqxYaJTKSqj7KQhOMaaeM2q6FtBhKcu
 1epydqSUItric02E60e1+Qykiu7ZNXSPRccM+jvXNvbjoNSTh9mfJjGNV
 keIjhrT1g+OJNpHB9YK4UjMazGW+gRk2yeeA9w4UkbwyUX3ZVsYz84NBB
 Yb6sQFzN/6nIpiHIqMA+ZQUqUZk3MBsD/6ySI91dmzkYwdEUgiWZA33Vt
 7NrnPmG2UPnscj+RG2ieylCpm91c+/OxoVwDs/OngOJCYcKwdpACOK/00
 YbdRyoQXtTypynMbRD6ZdpKe4jEOn8Vs7/0AnCRIL4HIhUz8GmK4OMan0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387853754"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387853754"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765272654"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="765272654"
Received: from shouweis-mobl1.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.68])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:33:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 16:32:30 +0100
Message-ID: <20231103153234.30407-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
References: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI v8 14/18] drm/xe: Adjust to commit "drm/gpuvm: add
 an abstraction for a VM/BO combination"
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 11 +++++++----
 drivers/gpu/drm/xe/xe_vm.c | 32 +++++++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6212e004c0cf..c23a5694a788 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -453,6 +453,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 	struct dma_fence *fence;
 	struct drm_gpuva *gpuva;
 	struct drm_gem_object *obj = &bo->ttm.base;
+	struct drm_gpuvm_bo *vm_bo;
 	int ret = 0;
 
 	dma_resv_assert_held(bo->ttm.base.resv);
@@ -465,11 +466,12 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 		dma_resv_iter_end(&cursor);
 	}
 
-	drm_gem_for_each_gpuva(gpuva, obj) {
-		struct xe_vma *vma = gpuva_to_vma(gpuva);
-		struct xe_vm *vm = xe_vma_vm(vma);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
+			struct xe_vma *vma = gpuva_to_vma(gpuva);
+			struct xe_vm *vm = xe_vma_vm(vma);
 
-		trace_xe_vma_evict(vma);
+			trace_xe_vma_evict(vma);
 
 		if (xe_vm_in_fault_mode(vm)) {
 			/* Wait for pending binds / unbinds. */
@@ -523,6 +525,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			if (vm_resv_locked)
 				dma_resv_unlock(xe_vm_resv(vm));
 		}
+		}
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bb44e5ca224a..db5810f72911 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -911,12 +911,21 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 	if (bo) {
+		struct drm_gpuvm_bo *vm_bo;
+
 		xe_bo_assert_held(bo);
 
+		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
+		if (IS_ERR(vm_bo)) {
+			kfree(vma);
+			return ERR_CAST(vm_bo);
+		}
+
 		drm_gem_object_get(&bo->ttm.base);
 		vma->gpuva.gem.obj = &bo->ttm.base;
 		vma->gpuva.gem.offset = bo_offset_or_userptr;
-		drm_gpuva_link(&vma->gpuva);
+		drm_gpuva_link(&vma->gpuva, vm_bo);
+		drm_gpuvm_bo_put(vm_bo);
 	} else /* userptr or null */ {
 		if (!is_null) {
 			u64 size = end - start + 1;
@@ -998,16 +1007,19 @@ static struct xe_vma *
 bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
 			    struct xe_vma *ignore)
 {
-	struct drm_gpuva *gpuva;
+	struct drm_gpuvm_bo *vm_bo;
+	struct drm_gpuva *va;
 	struct drm_gem_object *obj = &bo->ttm.base;
 
 	xe_bo_assert_held(bo);
 
-	drm_gem_for_each_gpuva(gpuva, obj) {
-		struct xe_vma *vma = gpuva_to_vma(gpuva);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
+			struct xe_vma *vma = gpuva_to_vma(va);
 
-		if (vma != ignore && xe_vma_vm(vma) == vm)
-			return vma;
+			if (vma != ignore && xe_vma_vm(vma) == vm)
+				return vma;
+		}
 	}
 
 	return NULL;
@@ -2169,6 +2181,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct xe_vma_op *op;
+	struct drm_gpuvm_bo *vm_bo;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -2226,7 +2239,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		err = xe_bo_lock(bo, true);
 		if (err)
 			return ERR_PTR(err);
-		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
+
+		vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
+		if (!vm_bo)
+			break;
+
+		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
 		xe_bo_unlock(bo);
 		if (IS_ERR(ops))
 			return ops;
-- 
2.41.0

