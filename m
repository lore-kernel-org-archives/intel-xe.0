Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEB0C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8636510E67B;
	Tue, 22 Jul 2025 13:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPkIw40a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F2310E67B
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189749; x=1784725749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m24Aysoa+KVKjGNe8w+XEs1r5Uuc3PwVj8rLmZVzCI4=;
 b=LPkIw40aPKHcOb7k0i7pjJzBTZ4NMghQWQAndrCDOgd0/aSexSG5Cm/8
 g4oaCGUKwCiVZmUmA4bpNSJ6ZYnGhupgKuoa1GQsK8ffSYnH9G9gqgtfx
 ZBv3L/2qmCTYQsLziL/UBxRDMifVwGdkphxPAaM5HWmfIPMlzBrQ9V8QB
 EUIbIEOWSZqge3pKTGwfTbE3jpWdyRsJ98C7exAooXg8H1p4/L0fj2aw3
 fQrlNmRc6c8TS8Sy5EhZalz3DJ5YUq1Xt37AtSxes7Hm3ym3j/qFp6Amc
 YdMFibYB6y8JDK43xvoV426JwWNurd7yk6hr6VoONsDX0xc465IFR4xXh Q==;
X-CSE-ConnectionGUID: 7Cfj+ymCQG6famZJMZZ77g==
X-CSE-MsgGUID: 0q/b9uxYTbiMB9fVZAHBqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530389"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530389"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:09 -0700
X-CSE-ConnectionGUID: Zf8B6jj/T+i11YO0as4pJA==
X-CSE-MsgGUID: C0RDCBk2Qni52qlcEI79Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420660"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:07 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 15/23] drm/xe/svm: Consult madvise preferred location in
 prefetch
Date: Tue, 22 Jul 2025 19:05:18 +0530
Message-Id: <20250722133526.3550547-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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

When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, prefetch svm
ranges to preferred location provided by madvise.

v2 (Matthew Brost)
- Fix region, devmem_fd usages
- consult madvise is applicable for other vma's too.

v3
- Fix atomic handling

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.h  |  1 -
 drivers/gpu/drm/xe/xe_tile.h | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c   | 26 ++++++++++++++++++--------
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 494823afaa98..7cf83f59ea48 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -325,7 +325,6 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 {
 	return NULL;
 }
-
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 066a3d0cea79..fb657f5364f3 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -10,6 +10,24 @@
 
 struct xe_tile;
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+/**
+ * xe_tile_from_dpagemap - Find xe_tile from drm_pagemap
+ * @dpagemap: pointer to struct drm_pagemap
+ *
+ * Return: Pointer to xe_tile
+ */
+static inline struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
+{
+	return container_of(dpagemap, struct xe_tile, mem.vram.dpagemap);
+}
+
+#else
+static inline  struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
+{
+	return NULL;
+}
+#endif
 int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 int xe_tile_init(struct xe_tile *tile);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index be51fcf322ec..2226b1eb46f1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -38,6 +38,7 @@
 #include "xe_res_cursor.h"
 #include "xe_svm.h"
 #include "xe_sync.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
 #include "xe_hmm.h"
@@ -2907,15 +2908,24 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 	int err = 0;
 
 	struct xe_svm_range *svm_range;
+	struct drm_pagemap *dpagemap;
 	struct drm_gpusvm_ctx ctx = {};
-	struct xe_tile *tile;
+	struct xe_tile *tile = NULL;
 	unsigned long i;
 	u32 region;
 
 	if (!xe_vma_is_cpu_addr_mirror(vma))
 		return 0;
 
-	region = op->prefetch_range.region;
+	if (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
+		dpagemap = xe_vma_resolve_pagemap(vma, xe_device_get_root_tile(vm->xe));
+		if (dpagemap)
+			tile = xe_tile_from_dpagemap(dpagemap);
+	} else {
+		region = op->prefetch_range.region;
+		if (region)
+			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+	}
 
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
@@ -2923,11 +2933,10 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		if (!region)
+		if (!tile)
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
-			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile)) {
 			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
 			if (err) {
 				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
@@ -2995,7 +3004,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		else
 			region = op->prefetch.region;
 
-		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
+			  region <= ARRAY_SIZE(region_to_mem_type));
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
@@ -3413,8 +3423,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
 				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
-				       xe->info.mem_region_mask)) ||
+		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
+				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
-- 
2.34.1

