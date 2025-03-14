Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1CEC28B2F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B060710E985;
	Fri, 14 Mar 2025 07:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDJSDIvw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1096D10E985
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937937; x=1773473937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gw9swhOSQOUn6/5yk/+N4oRetsxao5xXTI7AmirGWrU=;
 b=GDJSDIvwbd+c+YDuONLPrEE1St7fiexv155ZwTuDqaJ9OZPNzK1v9Ger
 DTVNzslYbjGMQDcOYlFdT/DyVzMFb4fjmGB6wRIJj0kXHVH4wVk4xMrKe
 rOxY2Ty9MbfPMwDyJ/CuFuufOxVZ99L2Sn+aOgpAogAZOPIeFxZ2GmeM4
 BhtIcbA3KwE6KOFEGO+zWvlRESOgdgsCA5nOinKtJn74lJcWBYExSWA2t
 EtHf5kCL4Md8LF6aHSvb6wSdulMPJZSHXPiNrH+7t4nxz9uUevQmxEGJx
 uGGpYXSHRfOhoLzpZY6av4TF1avJp/5nm+GGShwCE99PjYMfcvW+Lx81h w==;
X-CSE-ConnectionGUID: maRfAlfvQT6ORrws8L0OVQ==
X-CSE-MsgGUID: dhqkgBFBTM2ceAZdwSQE/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446102"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446102"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:57 -0700
X-CSE-ConnectionGUID: i4h3lXB0Riexcw8Xd+WyDQ==
X-CSE-MsgGUID: w4HZy5QCTGyul6pgQrMG2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043862"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:55 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 22/29] drm/xe/svm : Add svm ranges migration policy on atomic
 access
Date: Fri, 14 Mar 2025 13:32:19 +0530
Message-Id: <20250314080226.2059819-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

If the platform does not support atomic access on system memory, and the
ranges are in system memory, but the user requires atomic accesses on
the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
operations as well.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c         |  3 +-
 drivers/gpu/drm/xe/xe_svm.c        | 85 ++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_svm.h        | 10 ++++
 drivers/gpu/drm/xe/xe_vm.c         |  5 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 11 +++-
 5 files changed, 101 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d51f7d1c86cf..88ceff3250e3 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -700,7 +700,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			 * gets migrated to LMEM, bind such allocations with
 			 * device atomics enabled.
 			 */
-			else if (is_devmem)
+			else if (is_devmem || (xe->info.has_device_atomics_on_smem &&
+					       vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
 				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
 		} else {
 			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index b181b9bbfa5e..cb876000411f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -689,6 +689,62 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	return err;
 }
 
+static bool migrate_to_support_atomic(struct xe_device *xe, struct xe_vma *vma)
+{
+	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_UNDEFINED ||
+	    (xe->info.has_device_atomics_on_smem &&
+	     vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
+		return false;
+
+	return true;
+}
+
+static bool supports_4K_migration(struct xe_device *xe)
+{
+	if (xe->info.platform == XE_BATTLEMAGE)
+		return true;
+
+	return false;
+}
+
+/**
+ * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
+ * @range: SVM range for which migration needs to be decided
+ * @vma: vma which has range
+ * @region: default placement for range
+ *
+ * Return: True for range needing migration and migration is supported else false
+ */
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					u32 region)
+{
+	struct xe_vm *vm = range_to_vm(&range->base);
+	u64 range_size = xe_svm_range_size(range);
+	bool needs_migrate = false;
+
+	if (!range->base.flags.migrate_devmem)
+		return false;
+
+	needs_migrate = migrate_to_support_atomic(vm->xe, vma) || region;
+
+	if (needs_migrate && !IS_DGFX(vm->xe)) {
+		drm_warn(&vm->xe->drm, "Platform doesn't support VRAM\n");
+		return false;
+	}
+
+	if (needs_migrate && xe_svm_range_in_vram(range)) {
+		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
+		return false;
+	}
+
+	if (needs_migrate && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
+		drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
+		return false;
+	}
+
+	return needs_migrate;
+}
+
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
  * @vm: The VM.
@@ -718,6 +774,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct dma_fence *fence;
 	ktime_t end = 0;
 	int err;
+	int migrate_try_count = 3;
+	u32 region;
 
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
@@ -738,18 +796,27 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
-	/* XXX: Add migration policy, for now migrate range once */
-	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
-	    xe_svm_range_size(range) >= SZ_64K) {
-		range->skip_migrate = true;
+	/* for gpu pagefault always migrate to local vram unless
+	 * preferred location provided by madvise
+	 */
+	region = 1;
+
+	if (xe_svm_range_needs_migrate_to_vram(range, vma, region)) {
+		migrate_try_count--;
 
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
 		if (err) {
-			drm_dbg(&vm->xe->drm,
-				"VRAM allocation failed, falling back to "
-				"retrying fault, asid=%u, errno=%pe\n",
-				vm->usm.asid, ERR_PTR(err));
-			goto retry;
+			if (migrate_try_count) {
+				drm_dbg(&vm->xe->drm,
+					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				goto retry;
+			} else {
+				drm_err(&vm->xe->drm,
+					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				return err;
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index d57d7cc851ee..da14a0e2344c 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -84,6 +84,9 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 			   struct drm_gpusvm_ctx *ctx);
 
 void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
+
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					u32 prefetch_region);
 #else
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
@@ -164,6 +167,13 @@ void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
 {
 }
 
+static inline
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					u32 prefetch_region)
+{
+	return false;
+}
+
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f3e9c3f31fe7..5e36975258a3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2895,8 +2895,9 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 		/* TODO: Threading the migration */
 		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
 			svm_range = xa_load(&op->prefetch_range.range, i);
-			if (region && svm_range->base.flags.migrate_devmem &&
-			    xe_svm_range_size(svm_range) >= SZ_64K) {
+
+			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
+				region = region ? region : 1;
 				tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 				err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
 				if (err) {
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index ef50031649e0..7e1a95106cb9 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -69,7 +69,16 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			  struct xe_vma **vmas, int num_vmas,
 			  struct drm_xe_madvise_ops ops)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
+	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
+		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
+	vm_dbg(&xe->drm, "attr_value = %d", ops.atomic.val);
+
+	for (i = 0; i < num_vmas; i++)
+		vmas[i]->attr.atomic_access = ops.atomic.val;
+	/*TODO: handle bo backed vmas */
 	return 0;
 }
 
-- 
2.34.1

