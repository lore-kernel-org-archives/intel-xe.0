Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E006C4332F
	for <intel-xe@archiver.kernel.org>; Sun, 12 Nov 2023 22:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766BF10E013;
	Sun, 12 Nov 2023 22:10:35 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736B610E013
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Nov 2023 22:10:32 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1699826788; bh=tpQ+b+KpLJe8NQmEt8BNBvDEPPxxdEIHr3aH7aR427Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N0TWU3SOhBbLaacDN5NsiYGWYXFo2+DxkJxLpIfwdB+j/TDDsu7ZoJCHtknLUqVRG
 EKB5mAY0b//lfLzAE/uzKAdWDhd9heQtTKt+BgVAyG63j4cfhnyCdjOZhZurYci5cm
 EGzx6isIl9z8vyMg25wxzpwmf2dPAW0nMdW5m3iXE9sL8UDbXrJrphYUz0eZxyMJbB
 4uDFDEVa4kK+b+MlB0EgsJ8iicPMW9VAj9nZenypFCW2Z/S+RAzOHzquXwwvB8S7HZ
 P+okK/uj48z5RAhMdbpVfiDo3AuGkSo79iy2+V1qBKnPgBBKzud8shTDYYdfD2li2N
 mP2a4HLxzPCTQ==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 3ACM6Mn41472215; Mon, 13 Nov 2023 00:06:22 +0200
Date: Mon, 13 Nov 2023 00:06:22 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <jrwua7ckbiozfcaodx4gg2h4taiuxs53j5zlpf3qzvyhyiyl2d@pbs3plurokrj>
References: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
 <20231103153234.30407-14-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231103153234.30407-14-thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [CI v8 14/18] drm/xe: Adjust to commit "drm/gpuvm:
 add an abstraction for a VM/BO combination"
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 03.11.2023 16:32, Thomas Hellström wrote:
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c | 11 +++++++----
> drivers/gpu/drm/xe/xe_vm.c | 32 +++++++++++++++++++++++++-------
> 2 files changed, 32 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 6212e004c0cf..c23a5694a788 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -453,6 +453,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> 	struct dma_fence *fence;
> 	struct drm_gpuva *gpuva;
> 	struct drm_gem_object *obj = &bo->ttm.base;
>+	struct drm_gpuvm_bo *vm_bo;
> 	int ret = 0;
>
> 	dma_resv_assert_held(bo->ttm.base.resv);
>@@ -465,11 +466,12 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> 		dma_resv_iter_end(&cursor);
> 	}
>
>-	drm_gem_for_each_gpuva(gpuva, obj) {
>-		struct xe_vma *vma = gpuva_to_vma(gpuva);
>-		struct xe_vm *vm = xe_vma_vm(vma);
>+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>+		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>+			struct xe_vma *vma = gpuva_to_vma(gpuva);
>+			struct xe_vm *vm = xe_vma_vm(vma);
>
>-		trace_xe_vma_evict(vma);
>+			trace_xe_vma_evict(vma);
>
> 		if (xe_vm_in_fault_mode(vm)) {
> 			/* Wait for pending binds / unbinds. */
>@@ -523,6 +525,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> 			if (vm_resv_locked)
> 				dma_resv_unlock(xe_vm_resv(vm));
> 		}
>+		}

miss identation here

> 	}
>
> 	return ret;
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index bb44e5ca224a..db5810f72911 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -911,12 +911,21 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>
> 	if (bo) {
>+		struct drm_gpuvm_bo *vm_bo;
>+
> 		xe_bo_assert_held(bo);
>
>+		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>+		if (IS_ERR(vm_bo)) {
>+			kfree(vma);
>+			return ERR_CAST(vm_bo);
>+		}
>+
> 		drm_gem_object_get(&bo->ttm.base);
> 		vma->gpuva.gem.obj = &bo->ttm.base;
> 		vma->gpuva.gem.offset = bo_offset_or_userptr;
>-		drm_gpuva_link(&vma->gpuva);
>+		drm_gpuva_link(&vma->gpuva, vm_bo);
>+		drm_gpuvm_bo_put(vm_bo);
> 	} else /* userptr or null */ {
> 		if (!is_null) {
> 			u64 size = end - start + 1;
>@@ -998,16 +1007,19 @@ static struct xe_vma *
> bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
> 			    struct xe_vma *ignore)
> {
>-	struct drm_gpuva *gpuva;
>+	struct drm_gpuvm_bo *vm_bo;
>+	struct drm_gpuva *va;
> 	struct drm_gem_object *obj = &bo->ttm.base;
>
> 	xe_bo_assert_held(bo);
>
>-	drm_gem_for_each_gpuva(gpuva, obj) {
>-		struct xe_vma *vma = gpuva_to_vma(gpuva);
>+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
>+			struct xe_vma *vma = gpuva_to_vma(va);
>
>-		if (vma != ignore && xe_vma_vm(vma) == vm)
>-			return vma;
>+			if (vma != ignore && xe_vma_vm(vma) == vm)
>+				return vma;
>+		}
> 	}
>
> 	return NULL;
>@@ -2169,6 +2181,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> 	struct drm_gpuva_ops *ops;
> 	struct drm_gpuva_op *__op;
> 	struct xe_vma_op *op;
>+	struct drm_gpuvm_bo *vm_bo;
> 	int err;
>
> 	lockdep_assert_held_write(&vm->lock);
>@@ -2226,7 +2239,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> 		err = xe_bo_lock(bo, true);
> 		if (err)
> 			return ERR_PTR(err);
>-		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
>+
>+		vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
>+		if (!vm_bo)
>+			break;

I think compiler suppose to fail here since ops is not initialized.
Maybe use drm_gpuvm_bo_obtain instead of drm_gpuvm_bo_find so if no
vm_bo is there, it creates it and ops will have an empty list.

Thanks,
Dafna

>+
>+		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
> 		xe_bo_unlock(bo);
> 		if (IS_ERR(ops))
> 			return ops;
>-- 
>2.41.0
>
