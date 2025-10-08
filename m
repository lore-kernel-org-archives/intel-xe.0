Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C07CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 20:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711AF10E898;
	Wed,  8 Oct 2025 20:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkXemFa3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6194B10E898
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 20:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759953657; x=1791489657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1QWVn1Cgbl8iIFx7r6/AmA6gSmHrHmCGhPhlNuR3w40=;
 b=kkXemFa3G0Q3Ovot66BsKLL+liPGP5aX7esrPSrQmEo9xw3ud1iZFpi/
 Lb+VH0kZDufagsuWj0S6db5kghgNhsVWKCDmfWI9IZnjBMr+kee0PadLN
 Vy+ZafP5miLBGgaXvedtc8Iz7x/P8W6o/utBkWNLAAXElIycGHJeBBNXN
 aa/QX3ZuVSIEyyafN3GOTWQJqGccA/siUDSnRmcermOztO1J8D/XiKC+w
 XSzRnNmzTB6MSVLBOZ+XBMRFkLgnErG1WCPHTaF8LeIxdJrAL73CjqW4j
 0/300p9JfnLmpuwaCC6ih4i1W3nPy9WKB4f1vkTXWKWNk+9Ttx1+OfuB4 A==;
X-CSE-ConnectionGUID: wzuzul94T36ojrH2zva2Yg==
X-CSE-MsgGUID: 79ZPHCrLRkC9VMnoFMs7Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61362632"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61362632"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 13:00:56 -0700
X-CSE-ConnectionGUID: MvDTCRgpSU+z7abOAQwOdQ==
X-CSE-MsgGUID: G6x///5QQ5eZbt6g6CarKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="211178224"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 13:00:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	paulo.r.zanoni@intel.com
Subject: [PATCH] drm/xe: Don't allow evicting of BOs in same VM in array of VM
 binds
Date: Wed,  8 Oct 2025 13:00:51 -0700
Message-Id: <20251008200051.3423684-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

An array of VM binds can potentially evict other buffer objects (BOs)
within the same VM under certain conditions, which may lead to NULL
pointer dereferences later in the bind pipeline. To prevent this, clear
the allow_res_evict flag in the xe_bo_validate call.

Cc: stable@vger.kernel.org
Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6268
Fixes: 774b5fa509a9 ("drm/xe: Avoid evicting object of the same vm in none fault mode")
Fixes: 77f2ef3f16f5 ("drm/xe: Lock all gpuva ops during VM bind IOCTL")
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 25 ++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm_types.h |  1 +
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4e914928e0a9..468176cf901e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2834,7 +2834,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 }
 
 static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
-				 bool validate)
+				 bool no_res_evict, bool validate)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -2845,7 +2845,8 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
 			err = xe_bo_validate(bo, vm,
-					     !xe_vm_in_preempt_fence_mode(vm), exec);
+					     !xe_vm_in_preempt_fence_mode(vm) &&
+					     !no_res_evict, exec);
 	}
 
 	return err;
@@ -2915,14 +2916,16 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 }
 
 static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
-			    struct xe_vma_op *op)
+			    struct xe_vma_ops *vops, struct xe_vma_op *op)
 {
 	int err = 0;
+	bool no_res_evict = vops->flags & XE_VMA_OPS_ARRAY_OF_BINDS;
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		if (!op->map.invalidate_on_bind)
 			err = vma_lock_and_validate(exec, op->map.vma,
+						    no_res_evict,
 						    !xe_vm_in_fault_mode(vm) ||
 						    op->map.immediate);
 		break;
@@ -2933,11 +2936,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.remap.unmap->va),
-					    false);
+					    no_res_evict, false);
 		if (!err && op->remap.prev)
-			err = vma_lock_and_validate(exec, op->remap.prev, true);
+			err = vma_lock_and_validate(exec, op->remap.prev,
+						    no_res_evict, true);
 		if (!err && op->remap.next)
-			err = vma_lock_and_validate(exec, op->remap.next, true);
+			err = vma_lock_and_validate(exec, op->remap.next,
+						    no_res_evict, true);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
@@ -2946,7 +2951,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.unmap.va),
-					    false);
+					    no_res_evict, false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 	{
@@ -2961,7 +2966,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
-					    false);
+					    no_res_evict, false);
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
 					    region_to_mem_type[region],
@@ -3007,7 +3012,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 		return err;
 
 	list_for_each_entry(op, &vops->list, link) {
-		err = op_lock_and_prep(exec, vm, op);
+		err = op_lock_and_prep(exec, vm, vops, op);
 		if (err)
 			return err;
 	}
@@ -3640,6 +3645,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
+	if (args->num_binds > 1)
+		vops.flags |= XE_VMA_OPS_ARRAY_OF_BINDS;
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index da39940501d8..413353e1c225 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -476,6 +476,7 @@ struct xe_vma_ops {
 	/** @flag: signify the properties within xe_vma_ops*/
 #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
 #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
+#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

