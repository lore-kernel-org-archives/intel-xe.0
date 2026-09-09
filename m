Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD90BC79FB9
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D9C10F119;
	Wed,  9 Sep 2026 12:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gD3+Xs8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF0110F121
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957739; x=1820493739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fv52Fj9H4m7bL/9Xy8C6U5bZpFia5ahg/X9ymYdIsmw=;
 b=gD3+Xs8unowfN6OLWxa47lYZPNvoQ7Lao9PM5h+Q0pr97xDsx+aaByBi
 lx87FchudTn8f1eTIB/0vfoBiRe0gj4qAVu3agV/P096aSJ5NUrXbzimX
 kqp2VhWpEJyjHqKCXmQZk1d5Rji4+aPCswPXeYJ5Ql+8q8K4E9/zRNsat
 8u1DtrXIVapowBwTXYimzo5c1bp1KxRKptbdDbiS7PwcMk+tzjlfGiL8m
 D82xCXD5MubJt4wPD2dlFzG5NOBJD095IEoLLVqCoF7TyMspUVdiJ1ES1
 k8F+sJBT445hhud1lyiqvFjtyP8WHkzAxwV/zbYPNpwAY27yL8qmBbWd4 w==;
X-CSE-ConnectionGUID: te7Pg9d9QKeobYAY9Lz7zg==
X-CSE-MsgGUID: pPbzxR9cSia/BhUpl45LsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715580"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715580"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:19 -0700
X-CSE-ConnectionGUID: WcMEL9vKQweTJ12JEA4KGw==
X-CSE-MsgGUID: TQ23VZ/zTAK38lcBdMhxRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246667"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:17 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 19/21] drm/xe/svm: Add MIGRATE_ON_ACCESS_COUNTER bind flag
Date: Wed,  9 Sep 2026 18:15:13 +0530
Message-ID: <20260909124457.1610890-42-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The default SVM placement policy for a range with no explicit preferred
location is first-touch: the first GPU to fault the range eagerly
migrates it to that GPU's local VRAM. For workloads that only touch a
range briefly, or where the hot GPU is not the first one to fault, this
eager migration is wasted work.

Add DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER, an opt-in bind flag
(valid only together with DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR on a MAP
op) that defers first placement to access counters: the range stays
where the CPU placed it on the initial GPU page fault and is migrated to
a GPU's local VRAM only once that GPU's access counter reports it hot.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      | 15 ++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c       | 10 ++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  1 +
 include/uapi/drm/xe_drm.h        | 10 ++++++++++
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6e0fc0c80905..9fc02d2fb346 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -57,9 +57,12 @@
  *      hot the range is migrated to that GPU's local VRAM.
  *    - The GPU that fires the AC event wins placement.
  *
- * 3. TODO: "Migrate only once hot" — skip migration on the initial GPU page
- *    fault entirely and rely solely on AC events for first placement, avoiding
- *    unnecessary early migrations.  Addressed by a later patch in this series.
+ * 3. Migrate only once hot (opt-in via DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER):
+ *
+ *    Like policy 2, but the eager first-touch migration is skipped: the range
+ *    stays where the CPU placed it on the initial GPU page fault and is
+ *    migrated to a GPU's local VRAM only once that GPU's access counter
+ *    reports it hot, avoiding unnecessary early migrations.
  */
 
 /**
@@ -1381,7 +1384,13 @@ static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
 	if (acc_ctr_trigger && !range_flags.migrate_devmem)
 		goto out;
 
+	/*
+	 * With MIGRATE_ON_ACCESS_COUNTER, defer first placement to access
+	 * counters: skip the eager migrate on a normal page fault, but still
+	 * migrate when this setup was itself triggered by an AC event.
+	 */
 	if (--migrate_try_count >= 0 &&
+	    (acc_ctr_trigger || !(vma->gpuva.flags & XE_VMA_MIGRATE_ON_ACC)) &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
 		ktime_t migrate_start = xe_gt_stats_ktime_get();
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c60de5ad76c5..c78df5f57a8b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -752,7 +752,8 @@ static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask,
 	XE_VMA_DUMPABLE |		    \
 	XE_VMA_SYSTEM_ALLOCATOR |           \
 	DRM_GPUVA_SPARSE |		    \
-	XE_VMA_MADV_AUTORESET)
+	XE_VMA_MADV_AUTORESET |		    \
+	XE_VMA_MIGRATE_ON_ACC)
 
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 				  u8 tile_mask)
@@ -2563,6 +2564,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				op->map.vma_flags |= XE_VMA_DUMPABLE;
 			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
 				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
+			if (flags & DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER)
+				op->map.vma_flags |= XE_VMA_MIGRATE_ON_ACC;
 			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
@@ -3785,7 +3788,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
 	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
 	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET | \
-	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
+	 DRM_XE_VM_BIND_FLAG_DECOMPRESS | \
+	 DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -3919,6 +3923,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP) ||
 		    XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) &&
+				 (!is_cpu_addr_mirror || op != DRM_XE_VM_BIND_OP_MAP)) ||
+		    XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER) &&
 				 (!is_cpu_addr_mirror || op != DRM_XE_VM_BIND_OP_MAP))) {
 			err = -EINVAL;
 			goto free_bind_ops;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index a21f73f23c59..a88e20329e9f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -52,6 +52,7 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
 #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
 #define XE_VMA_MADV_AUTORESET	(DRM_GPUVA_USERBITS << 10)
+#define XE_VMA_MIGRATE_ON_ACC	(DRM_GPUVA_USERBITS << 11)
 
 /**
  * struct xe_vma_mem_attr - memory attributes associated with vma
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c68e88d4d490..5f37415239b9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1073,6 +1073,15 @@ struct drm_xe_vm_destroy {
  *    "no-compression" PAT. Only meaningful for VRAM-backed BOs on devices that
  *    support Flat CCS and the required HW generation XE2+.
  *
+ *  - %DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER - Can be used in combination
+ *    with %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to defer device placement to
+ *    access counters: skip the eager first-touch migration on the initial GPU
+ *    page fault and migrate the range to a GPU's local VRAM only once that
+ *    GPU's access counter reports it hot. Ignored when madvise has set an
+ *    explicit preferred device location (placement is already pinned) and never
+ *    overrides migrations required for correctness, such as device atomics.
+ *    Only valid for DRM_XE_VM_BIND_OP_MAP.
+ *
  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
  *    the memory region advised by madvise.
@@ -1182,6 +1191,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
 #define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
 #define DRM_XE_VM_BIND_FLAG_DECOMPRESS (1 << 7)
+#define DRM_XE_VM_BIND_FLAG_MIGRATE_ON_ACCESS_COUNTER	(1 << 8)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.43.0

