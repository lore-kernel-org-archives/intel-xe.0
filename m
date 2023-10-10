Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A0ACD80A8
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 11:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D94A10E1E0;
	Tue, 10 Oct 2023 11:07:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E77E10E1E5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696936045; x=1728472045;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VBeqyj7I/Q9rE+R5sw4yW/gUHp0U+Ug/iCN5ITwnCVg=;
 b=JVCyPlm5JUyYT83/8S5oyQqk5yq3/wOpp1lZ8Urd48R4EZxCZrlos2tH
 MvM7MqnCRPWpTZCJpYmTaqbtukXYJGeLpagkqGscC9mw8ljSf+KsiiftU
 cSbUBTubxU1DAaoPPDorsGdUlBFOsb0TyRUTMtObFzR4/AISMzkINfCIJ
 D/gy85dWPnt7jHrjZqqNijAZp98Lw8IBcb+GUKncNp8bOx25YCdndH0U+
 D6CrMmnnPMCM4tPTPecd7kgXlbWt+hMNxDqSAoauAP5QLD4EshL7iAOEt
 eO3jmsBQ5WIFB5qk9lkIjewuagZ3Jkh8mM+uA/M2wQvLLRoCVvkLs8o7t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387204030"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="387204030"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 04:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="757074799"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="757074799"
Received: from agargas-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.164])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 04:07:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 13:07:06 +0200
Message-ID: <20231010110711.25616-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010110711.25616-1-thomas.hellstrom@linux.intel.com>
References: <20231010110711.25616-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 06/11] drm/xe: Adjust to commit "drm/gpuvm: add an
 abstraction for a VM/BO combination"
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
 drivers/gpu/drm/xe/xe_vm.c | 34 ++++++++++++++++++++++++++--------
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 772ffcd94101..82381de4876b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -452,6 +452,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 	struct dma_fence *fence;
 	struct drm_gpuva *gpuva;
 	struct drm_gem_object *obj = &bo->ttm.base;
+	struct drm_gpuvm_bo *vm_bo;
 	int ret = 0;
 
 	dma_resv_assert_held(bo->ttm.base.resv);
@@ -464,11 +465,12 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
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
@@ -522,6 +524,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			if (vm_resv_locked)
 				dma_resv_unlock(xe_vm_resv(vm));
 		}
+		}
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 70bd36912720..ded2a3e07caf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -906,12 +906,21 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
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
@@ -993,16 +1002,19 @@ static struct xe_vma *
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
-
-		if (vma != ignore && xe_vma_vm(vma) == vm)
-			return vma;
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
+			struct xe_vma *vma = gpuva_to_vma(va);
+			
+			if (vma != ignore && xe_vma_vm(vma) == vm)
+				return vma;
+		}
 	}
 
 	return NULL;
@@ -2403,6 +2415,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct xe_vma_op *op;
+	struct drm_gpuvm_bo *vm_bo;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -2460,7 +2473,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
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

