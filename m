Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A8DCCD187
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 11:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BCC10E21C;
	Thu,  9 Oct 2025 11:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7C3sHdW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9921E10E21C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 11:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760007983; x=1791543983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8SPtjt3RiQd2Da55NICybvDJNn4ur480L5GWpuO6B68=;
 b=f7C3sHdWYhc4d2wViJO2mGmaeiNhVdn/6S2xnijOmHMk7dpRiX0p6nNh
 HU3X1HDsxSeXk2q1O+LXj89LrSC3tHQGgoNGnh5vbZxPGEeoE1G8j/5o2
 LZHkUk34zqJyVOkMj2a516rZzwcUWtEadIQ4GLnbmg7FxbQFRRUlcVBSJ
 /d8KOG1Zo4pWMKtrhL0D5YItpPwT81GTaV187Zm08TSHpLltf9rtArplb
 Xr/uhtX7Z/8gf01JyYSP9MdrKCCsqVPvjw1qpTuUPQ0HbjFw2jz2QwYU6
 gIdm83r2itI8vW6qZw76FJRhhHBWYqp9lhMTcRviRb0m1xSu+TixOn6bQ w==;
X-CSE-ConnectionGUID: IVGkFKYBR2KPG7kKwUQCLQ==
X-CSE-MsgGUID: g6enxcvKQBuBjRjxx8f7tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="72895742"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="72895742"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 04:06:23 -0700
X-CSE-ConnectionGUID: zxP6rfO7QsePrIX94XeAbw==
X-CSE-MsgGUID: s2Fu7O5HTSi/IUN0AqGzNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="179800014"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 04:06:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	paulo.r.zanoni@intel.com
Subject: [PATCH v2] drm/xe: Don't allow evicting of BOs in same VM in array of
 VM binds
Date: Thu,  9 Oct 2025 04:06:18 -0700
Message-Id: <20251009110618.3481870-1-matthew.brost@intel.com>
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

v2:
 - Invert polarity of no_res_evict (Thomas)
 - Add comment in code explaining issue (Thomas)

Cc: stable@vger.kernel.org
Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6268
Fixes: 774b5fa509a9 ("drm/xe: Avoid evicting object of the same vm in none fault mode")
Fixes: 77f2ef3f16f5 ("drm/xe: Lock all gpuva ops during VM bind IOCTL")
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 33 +++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm_types.h |  1 +
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index faca626702b8..ede9cc6ff079 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2858,7 +2858,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 }
 
 static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
-				 bool validate)
+				 bool res_evict, bool validate)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -2869,7 +2869,8 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
 			err = xe_bo_validate(bo, vm,
-					     !xe_vm_in_preempt_fence_mode(vm), exec);
+					     !xe_vm_in_preempt_fence_mode(vm) &&
+					     res_evict, exec);
 	}
 
 	return err;
@@ -2939,14 +2940,24 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 }
 
 static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
-			    struct xe_vma_op *op)
+			    struct xe_vma_ops *vops, struct xe_vma_op *op)
 {
 	int err = 0;
+	bool res_evict;
+
+
+	/*
+	 * We only allow evicting a BO within the VM if it is not part of an
+	 * array of binds, as an array of binds can evict another BO within the
+	 * bind.
+	 */
+	res_evict = !(vops->flags & XE_VMA_OPS_ARRAY_OF_BINDS);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		if (!op->map.invalidate_on_bind)
 			err = vma_lock_and_validate(exec, op->map.vma,
+						    res_evict,
 						    !xe_vm_in_fault_mode(vm) ||
 						    op->map.immediate);
 		break;
@@ -2957,11 +2968,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.remap.unmap->va),
-					    false);
+					    res_evict, false);
 		if (!err && op->remap.prev)
-			err = vma_lock_and_validate(exec, op->remap.prev, true);
+			err = vma_lock_and_validate(exec, op->remap.prev,
+						    res_evict, true);
 		if (!err && op->remap.next)
-			err = vma_lock_and_validate(exec, op->remap.next, true);
+			err = vma_lock_and_validate(exec, op->remap.next,
+						    res_evict, true);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
@@ -2970,7 +2983,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.unmap.va),
-					    false);
+					    res_evict, false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 	{
@@ -2985,7 +2998,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
-					    false);
+					    res_evict, false);
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
 					    region_to_mem_type[region],
@@ -3031,7 +3044,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 		return err;
 
 	list_for_each_entry(op, &vops->list, link) {
-		err = op_lock_and_prep(exec, vm, op);
+		err = op_lock_and_prep(exec, vm, vops, op);
 		if (err)
 			return err;
 	}
@@ -3664,6 +3677,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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

