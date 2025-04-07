Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F158C369A1
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59D910E3F2;
	Mon,  7 Apr 2025 09:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTCWoM4v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B7810E3EC
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019581; x=1775555581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=arFCYiZ7LqU7vP/aX6rYOXgF1ini53kmPVfD8X9EQa8=;
 b=nTCWoM4vRqKyFgMdgPfBpER6AsRltQ206/52S34zQTrD/DbQ9ogVQ41U
 /YmBFoVmRMdZ0QhB7OnqVHyHZOfmy/QDgND44fiLBNiWpFUoLtMqLiIRa
 7YAA5G2FdRHv/QMBKXcww6LUp+BTqkVt/8QrAa6A8qehdgkvV05ymELaG
 4U3WIrL4b2gf69xPs3Umkc5s1XvdTr7Yn0HjroG5zu6ieXc1vaRrJc6G6
 EbaFqTiQM4u2+2TpqB/OJKZQPjTckPtOFuGEmVgZUEHyHPcK+BB6jusYm
 LHWV1v0XB47qORJuMYDTYLODMOKtryhV9cTpuvd7qKjokkac0lBrnmOcb w==;
X-CSE-ConnectionGUID: ubHcyIg/SU+g80yqKoV+jQ==
X-CSE-MsgGUID: 8IAz3idBR62g0NFgKTdmng==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029395"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029395"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:01 -0700
X-CSE-ConnectionGUID: r1ppnMSnRQ2X0NGKd9laxg==
X-CSE-MsgGUID: 7+teXkXXTMeLF2OH/EkLog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778678"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:52:59 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 10/32] drm/xe/svm: Refactor usage of drm_gpusvm* function
 in xe_svm
Date: Mon,  7 Apr 2025 15:46:57 +0530
Message-Id: <20250407101719.3350996-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

Define xe_svm_range_find_or_insert function wrapping
drm_gpusvm_range_find_or_insert for reusing in prefetch.

Define xe_svm_range_get_pages function wrapping
drm_gpusvm_range_get_pages for reusing in prefetch.

-v2 pass pagefault defined  drm_gpu_svm context as parameter
in xe_svm_range_find_or_insert(Matthew Brost)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 67 ++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h | 20 +++++++++++
 2 files changed, 75 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6648b4da0bca..8cd35553a927 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -735,7 +735,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
 	};
 	struct xe_svm_range *range;
-	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -753,13 +752,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
-					    xe_vma_start(vma), xe_vma_end(vma),
-					    &ctx);
-	if (IS_ERR(r))
-		return PTR_ERR(r);
+	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
+
+	if (IS_ERR(range))
+		return PTR_ERR(range);
 
-	range = to_xe_range(r);
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
@@ -781,13 +778,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 
 	range_debug(range, "GET PAGES");
-	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
+	err = xe_svm_range_get_pages(vm, range, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
-		if (err == -EOPNOTSUPP) {
-			range_debug(range, "PAGE FAULT - EVICT PAGES");
-			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
-		}
 		drm_dbg(&vm->xe->drm,
 			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
 			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
@@ -866,6 +859,56 @@ int xe_svm_bo_evict(struct xe_bo *bo)
 	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
 }
 
+/**
+ * xe_svm_range_find_or_insert- Find or insert GPU SVM range
+ * @vm: xe_vm pointer
+ * @addr: address for which range needs to be found/inserted
+ * @vma:  Pointer to struct xe_vma which mirrors CPU
+ * @ctx: GPU SVM context
+ *
+ * This function finds or inserts a newly allocated a SVM range based on the
+ * address.
+ *
+ * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
+ */
+struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
+						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx)
+{
+	struct drm_gpusvm_range *r;
+
+	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, xe_vma_start(vma)),
+					    xe_vma_start(vma), xe_vma_end(vma), ctx);
+	if (IS_ERR(r))
+		return ERR_PTR(PTR_ERR(r));
+
+	return to_xe_range(r);
+}
+
+/**
+ * xe_svm_range_get_pages() - Get pages for a SVM range
+ * @vm: Pointer to the struct xe_vm
+ * @range: Pointer to the xe SVM range structure
+ * @ctx: GPU SVM context
+ *
+ * This function gets pages for a SVM range and ensures they are mapped for
+ * DMA access. In case of failure with -EOPNOTSUPP, it evicts the range.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
+			   struct drm_gpusvm_ctx *ctx)
+{
+	int err = 0;
+
+	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, &range->base, ctx);
+	if (err == -EOPNOTSUPP) {
+		range_debug(range, "PAGE FAULT - EVICT PAGES");
+		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+	}
+
+	return err;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 
 static struct drm_pagemap_device_addr
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 1ec90d9bc749..9c4c3aeacc6c 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -89,6 +89,12 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 }
 #endif
 
+struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
+						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx);
+
+int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
+			   struct drm_gpusvm_ctx *ctx);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -241,6 +247,20 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	return -EOPNOTSUPP;
 }
 
+static inline
+struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
+						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline
+int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
+			   struct drm_gpusvm_ctx *ctx)
+{
+	return -EINVAL;
+}
+
 static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
 {
 	return NULL;
-- 
2.34.1

