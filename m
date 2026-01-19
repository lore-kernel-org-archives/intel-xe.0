Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23699D29C33
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 15:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DE110E48D;
	Mon, 19 Jan 2026 15:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2jkikh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4526410E48D
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768835027; x=1800371027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VPuUJXznClKopUQuVa78/ijjNY46cQs7U4JdxrvVf6Y=;
 b=h2jkikh9BllkCxWLlSbLAcR2R+M7aDoT02oNyV+vFfrouQabtqs236bZ
 aALyLOvCT1QZo4EYZrWt4zG4ai5VXXlSPlnj2emIxJ9rfuG4YXajJNNMv
 yFomT840FeaLg8t35pVLQJ5MJamhnYmUjr2vUlKW6/gJLenbdahfsQmoL
 KiaZub209Qis8bv2Pb1hYdF//qIOl4bLJEfC1D5Bfccl1lxvg14ojYq8L
 HpdzAJ9ErHlBquUNLRBRW7OY23twBJgh16vTY9MuMNgKobYotXRQwmFgU
 SCByeo/aO/bgf+CIBLA6z1TjDB7tcG34QQsxM+C5U908cwKSd5o7b5/EX g==;
X-CSE-ConnectionGUID: qQPOvU8lTj6m9SCpPSh2ZA==
X-CSE-MsgGUID: XO6wM+FmQ4Kuw9rzUkn7Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81488290"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="81488290"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:03:46 -0800
X-CSE-ConnectionGUID: rHM/xe71Rzi9BwCMS2T5+w==
X-CSE-MsgGUID: UN5l+ByERoeWwMJmi0EBUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="237162230"
Received: from jtuanzol-mobl2.amr.corp.intel.com (HELO
 soc-PF53RESW.clients.intel.com) ([10.246.46.46])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:03:45 -0800
From: Farah Kassabri <farah.kassabri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	ilia.levi@intel.com
Subject: [PATCH v2 2/2] drm/xe: add kernel VM BO unbind helper
Date: Mon, 19 Jan 2026 17:03:30 +0200
Message-Id: <20260119150330.6537-2-farah.kassabri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119150330.6537-1-farah.kassabri@intel.com>
References: <20260119150330.6537-1-farah.kassabri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Add xe_kernel_vm_unbind_bo() as the counterpart to
xe_kernel_vm_bind_bo() to provide symmetry in the kernel VM BO
lifecycle.

The new helper allows explicit unbinding of buffer objects from
the kernel VM, enabling proper cleanup and preventing stale
kernel VM mappings when BOs are no longer needed.

Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>

Changes in v2:
pass cache_lvl argument to the map operation instead of 0.
---
 drivers/gpu/drm/xe/xe_vm.c | 59 ++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_vm.h |  3 ++
 2 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a27145a4137e..425f406712b8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3830,21 +3830,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 }
 
 /**
- * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM
+ *  __xe_kernel_vm_bind_bo - internal helper to bind/unbind a BO to/from kernel owned VM
  * @vm: VM to bind the BO to
  * @bo: BO to bind
  * @q: exec queue to use for the bind (optional)
  * @addr: address at which to bind the BO
  * @cache_lvl: PAT cache level to use
+ * @do_bind: true for bind, false for unbind
  *
- * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
+ * Common code for binding and un-binding a BO.
  *
  * Returns a dma_fence to track the binding completion if the job to do so was
  * successfully submitted, an error pointer otherwise.
  */
-struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
-				       struct xe_exec_queue *q, u64 addr,
-				       enum xe_cache_level cache_lvl)
+static struct dma_fence *__xe_kernel_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
+						struct xe_exec_queue *q, u64 addr,
+						enum xe_cache_level cache_lvl, bool do_bind)
 {
 	struct xe_vma_ops vops;
 	struct drm_gpuva_ops *ops = NULL;
@@ -3860,9 +3861,13 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 	xe_vma_ops_init(&vops, vm, q, NULL, 0);
 
-	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
-				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
-				       vm->xe->pat.idx[cache_lvl]);
+	if (do_bind)
+		ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
+					       DRM_XE_VM_BIND_OP_MAP, 0, 0,
+					       vm->xe->pat.idx[cache_lvl]);
+	else
+		ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
+					       DRM_XE_VM_BIND_OP_UNMAP, 0, 0, 0);
 	if (IS_ERR(ops)) {
 		err = PTR_ERR(ops);
 		goto release_vm_lock;
@@ -3903,6 +3908,44 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
 	return fence;
 }
 
+/**
+ * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM
+ * @vm: VM to bind the BO to
+ * @bo: BO to bind
+ * @q: exec queue to use for the bind (optional)
+ * @addr: address at which to bind the BO
+ * @cache_lvl: PAT cache level to use
+ *
+ * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
+ *
+ * Returns a dma_fence to track the binding completion if the job to do so was
+ * successfully submitted, an error pointer otherwise.
+ */
+struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
+				       struct xe_exec_queue *q, u64 addr,
+				       enum xe_cache_level cache_lvl)
+{
+	return __xe_kernel_vm_bind_bo(vm, bo, q, addr, cache_lvl, true);
+}
+
+/**
+ * xe_vm_kernel_unbind_bo - unbind a BO from a kernel owned VM
+ * @vm: VM to unbind the BO from
+ * @bo: BO to unbind
+ * @q: exec queue to use for the unbind (optional)
+ * @addr: address at which the BO was bound
+ *
+ * Execute a VM bind unmap operation on a BO to remove it from a kernel-owned VM.
+ *
+ * Returns a dma_fence to track the unbinding completion if the job to do so was
+ * successfully submitted, an error pointer otherwise.
+ */
+struct dma_fence *xe_vm_kernel_unbind_bo(struct xe_vm *vm, struct xe_bo *bo,
+					 struct xe_exec_queue *q, u64 addr)
+{
+	return __xe_kernel_vm_bind_bo(vm, bo, q, addr, 0, false);
+}
+
 /**
  * xe_vm_lock() - Lock the vm's dma_resv object
  * @vm: The struct xe_vm whose lock is to be locked
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index ff32f43aa1d8..b87e80227c79 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -272,6 +272,9 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
 				       struct xe_exec_queue *q, u64 addr,
 				       enum xe_cache_level cache_lvl);
 
+struct dma_fence *xe_vm_kernel_unbind_bo(struct xe_vm *vm, struct xe_bo *bo,
+					 struct xe_exec_queue *q, u64 addr);
+
 void xe_vm_resume_rebind_worker(struct xe_vm *vm);
 
 /**
-- 
2.43.0

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

