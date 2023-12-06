Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4200FC10DC1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 12:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C9910E72C;
	Wed,  6 Dec 2023 12:58:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6706010E72B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701867521; x=1733403521;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B+WL/1MWMh8ksViF+QdG/juNcIvprORq/xUabFlrGlc=;
 b=OaZ3tayPY75Zw2i/gFTNBEr2Iq3+nHGCaIgAumU3HPIibZSp3Zj3CTrm
 p8YWpwNUl7RdTKcsUcGkyJ61uSHLFaWhqVCA1OReIxYCCiX1wLxZXlzWS
 /qCbE8aMlFw7KlFPWgg8+73Xecc4ocYG4nUVHOtR9jOJovpCFCWbyeKjT
 zkDkTcwRqU9tVATKuHD6AQBJ0MqF62Hxb9iPsLO+KMlmIuQ2k2hrH80pq
 72BCC9kixDiM3+0brUh4E7ltMiMP8NcM7DcNN6HTgVcTdZOHcUIEcQbSD
 dSxntWuUjfK00OuE6+f4TyPucvUDIThKs2qtNxQTwYCarsQ635qH3IK6t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1123964"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1123964"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018565117"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="1018565117"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.121])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:58:39 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 13:58:15 +0100
Message-ID: <20231206125818.4164-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
References: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 15/17] drm/xe: Adjust to commit "drm/gpuvm: add an
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
 drivers/gpu/drm/xe/xe_vm.c | 32 +++++++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ad9d8793db3e..7e25c8b7a01a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -470,6 +470,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 	struct dma_fence *fence;
 	struct drm_gpuva *gpuva;
 	struct drm_gem_object *obj = &bo->ttm.base;
+	struct drm_gpuvm_bo *vm_bo;
 	int ret = 0;
 
 	dma_resv_assert_held(bo->ttm.base.resv);
@@ -482,11 +483,12 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
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
@@ -540,6 +542,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			if (vm_resv_locked)
 				dma_resv_unlock(xe_vm_resv(vm));
 		}
+		}
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6c8a84026af4..536609365e7c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -911,12 +911,21 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	vma->pat_index = pat_index;
 
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
@@ -2156,6 +2168,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct xe_vma_op *op;
+	struct drm_gpuvm_bo *vm_bo;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -2183,7 +2196,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
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
 		break;
 	default:
-- 
2.42.0

