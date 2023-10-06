Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92180E92FDE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E1810E1E1;
	Fri,  6 Oct 2023 10:00:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4B710E4D6
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586417; x=1728122417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kHFW9hmIM1vfMaQ+dUk11ouLkKWW9dvi5bJOcBnaj/s=;
 b=EciFKQ/cE/luup2+pXoQDEwJLnm7ePetdET0pLu0r0RA7hVvWupXG1++
 An6msj2h/f+aNHYaRMqQzpCSJg0c3u1jRu+7Uo7aRD64Ja+ZHnxPRU8YH
 ZII449hyp7Hu4LGo9SzvXP0XO/ZSWsRFumIBUs3AK1jPQJa+gOP5865t6
 Gy5FcNtdur8L1q3CZhEiNFDnPkK4l1tSV8d9wNqUVSQnDQ3b5ugVa6ZiZ
 w6gyv0RorVZEFZnKvMbSJnt2IhXxRiaPhCbvY0hu7K32AIXZszVwUy3vv
 zxo7AnkzSZPVCaOCrKAe5akFS3ZiyZPsWNpNI3ZGG6QL6H4z3ycNAZG9u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907192"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907192"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815929"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815929"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:09 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:35 +0000
Message-Id: <20231006095943.7-13-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 12/20] drm/xe: Kill
 XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

This extension is currently not used and it is not aligned with
the error handling on async VM_BIND. Let's remove it and along with
that, since it was the only extension for the vm_create, remove VM
extension entirely.

v2: rebase on top of the removal of drm_xe_ext_exec_queue_set_property

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 129 +------------------------------------
 include/uapi/drm/xe_drm.h  |  23 +------
 2 files changed, 4 insertions(+), 148 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9e224b1442fa..ffc56d7ce8ac 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1517,37 +1517,6 @@ static void flush_async_ops(struct xe_vm *vm)
 	flush_work(&vm->async_ops.work);
 }
 
-static void vm_error_capture(struct xe_vm *vm, int err,
-			     u32 op, u64 addr, u64 size)
-{
-	struct drm_xe_vm_bind_op_error_capture capture;
-	u64 __user *address =
-		u64_to_user_ptr(vm->async_ops.error_capture.addr);
-	bool in_kthread = !current->mm;
-
-	capture.error = err;
-	capture.op = op;
-	capture.addr = addr;
-	capture.size = size;
-
-	if (in_kthread) {
-		if (!mmget_not_zero(vm->async_ops.error_capture.mm))
-			goto mm_closed;
-		kthread_use_mm(vm->async_ops.error_capture.mm);
-	}
-
-	if (copy_to_user(address, &capture, sizeof(capture)))
-		drm_warn(&vm->xe->drm, "Copy to user failed");
-
-	if (in_kthread) {
-		kthread_unuse_mm(vm->async_ops.error_capture.mm);
-		mmput(vm->async_ops.error_capture.mm);
-	}
-
-mm_closed:
-	wake_up_all(&vm->async_ops.error_capture.wq);
-}
-
 static void xe_vm_close(struct xe_vm *vm)
 {
 	down_write(&vm->lock);
@@ -2032,91 +2001,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
-					u64 value)
-{
-	if (XE_IOCTL_DBG(xe, !value))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-		return -EOPNOTSUPP;
-
-	if (XE_IOCTL_DBG(xe, vm->async_ops.error_capture.addr))
-		return -EOPNOTSUPP;
-
-	vm->async_ops.error_capture.mm = current->mm;
-	vm->async_ops.error_capture.addr = value;
-	init_waitqueue_head(&vm->async_ops.error_capture.wq);
-
-	return 0;
-}
-
-typedef int (*xe_vm_set_property_fn)(struct xe_device *xe, struct xe_vm *vm,
-				     u64 value);
-
-static const xe_vm_set_property_fn vm_set_property_funcs[] = {
-	[XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS] =
-		vm_set_error_capture_address,
-};
-
-static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
-				    u64 extension)
-{
-	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_set_property ext;
-	int err;
-
-	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_DBG(xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(xe, ext.property >=
-			 ARRAY_SIZE(vm_set_property_funcs)) ||
-	    XE_IOCTL_DBG(xe, ext.pad) ||
-	    XE_IOCTL_DBG(xe, ext.reserved[0] || ext.reserved[1]))
-		return -EINVAL;
-
-	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
-}
-
-typedef int (*xe_vm_user_extension_fn)(struct xe_device *xe, struct xe_vm *vm,
-				       u64 extension);
-
-static const xe_vm_set_property_fn vm_user_extension_funcs[] = {
-	[XE_VM_EXTENSION_SET_PROPERTY] = vm_user_ext_set_property,
-};
-
-#define MAX_USER_EXTENSIONS	16
-static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
-			      u64 extensions, int ext_number)
-{
-	u64 __user *address = u64_to_user_ptr(extensions);
-	struct xe_user_extension ext;
-	int err;
-
-	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
-		return -E2BIG;
-
-	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_DBG(xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(xe, ext.pad) ||
-	    XE_IOCTL_DBG(xe, ext.name >=
-			 ARRAY_SIZE(vm_user_extension_funcs)))
-		return -EINVAL;
-
-	err = vm_user_extension_funcs[ext.name](xe, vm, extensions);
-	if (XE_IOCTL_DBG(xe, err))
-		return err;
-
-	if (ext.next_extension)
-		return vm_user_extensions(xe, vm, ext.next_extension,
-					  ++ext_number);
-
-	return 0;
-}
-
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
 				    DRM_XE_VM_CREATE_ASYNC_BIND_OPS | \
@@ -2134,6 +2018,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	int err;
 	u32 flags = 0;
 
+	if (XE_IOCTL_DBG(xe, args->extensions))
+		return -EINVAL;
+
 	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
 		args->flags |= DRM_XE_VM_CREATE_SCRATCH_PAGE;
 
@@ -2176,14 +2063,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	if (args->extensions) {
-		err = vm_user_extensions(xe, vm, args->extensions, 0);
-		if (XE_IOCTL_DBG(xe, err)) {
-			xe_vm_close_and_put(vm);
-			return err;
-		}
-	}
-
 	mutex_lock(&xef->vm.lock);
 	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->vm.lock);
@@ -3085,8 +2964,6 @@ static void xe_vma_op_work_func(struct work_struct *w)
 				vm_set_async_error(vm, err);
 				up_write(&vm->lock);
 
-				if (vm->async_ops.error_capture.addr)
-					vm_error_capture(vm, err, 0, 0, 0);
 				break;
 			}
 			up_write(&vm->lock);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4987a634afc7..e7cf42c7234b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -552,23 +552,6 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
- */
-struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occurred */
-	__s32 error;
-
-	/** @op: operation that encounter an error */
-	__u32 op;
-
-	/** @addr: address of bind op */
-	__u64 addr;
-
-	/** @size: size of bind */
-	__u64 size;
-};
-
 /** struct drm_xe_ext_set_property - XE set property extension */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
@@ -589,7 +572,6 @@ struct drm_xe_ext_set_property {
 
 struct drm_xe_vm_create {
 #define XE_VM_EXTENSION_SET_PROPERTY	0
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -674,10 +656,7 @@ struct drm_xe_vm_bind_op {
 	 * practice the bind op is good and will complete.
 	 *
 	 * If this flag is set and doesn't return an error, the bind op can
-	 * still fail and recovery is needed. If configured, the bind op that
-	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
-	 * Once the user sees the error (via a ufence +
-	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
+	 * still fail and recovery is needed. It should free memory
 	 * via non-async unbinds, and then restart all queued async binds op via
 	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
 	 * VM.
-- 
2.34.1

