Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E23C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3D810E465;
	Mon, 12 May 2025 16:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0LPonBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A172E10E465
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066964; x=1778602964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8WrdH3NuIOciIBIK1/1fKPbf85ARXobnbD3PAC5nrQA=;
 b=N0LPonBaTph08b1qrLVP3mFJdQ/HQxGoCDppp7RHgvYTl6lPhtqUrCb7
 pxgzqQXO+E1iEJyMf4iB+Z9PtYsIast8769hnvBuolZPWW0Ts/L3QXhKU
 qDxxLGnrNEVUWCqWCJNH8YTyUJ5PCcPC9Jsu8ExzKxCihFybFYyhlOtQd
 kHgLfoJmMNoHbFiK7lD0flHZGVcxmcqVEr3elVEzc193D0CVtp8SW3KCg
 WuQbAVsX2lD6D9YtElM6DaQhNPI3H3k2OaECmsDVQpE9CShfycLzmBl+g
 dVVzMqUFO0A3AvvSm+cZL42eIbiyUJWS425SLWWL1mcLjuqpF45TlO3qW w==;
X-CSE-ConnectionGUID: pc/XOkKuRsmUBUy4W98+DA==
X-CSE-MsgGUID: Fv1MRA8WQlexiFE/OXpUMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59508121"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59508121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:22:44 -0700
X-CSE-ConnectionGUID: H5u0cEUVQQ+35bX4W6V5kA==
X-CSE-MsgGUID: tUNaqay5Tw6nEE7TBn6gRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142532786"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 09:22:42 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 14/20] drm/xe/svm: Refactor usage of drm_gpusvm* function
 in xe_svm
Date: Mon, 12 May 2025 22:17:34 +0530
Message-Id: <20250512164740.466852-15-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
References: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
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

-v2 pass pagefault defined drm_gpu_svm context as parameter
in xe_svm_range_find_or_insert(Matthew Brost)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 65 ++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_svm.h | 21 ++++++++++++
 2 files changed, 77 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6cfe92b8adbe..6e593733d473 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -785,7 +785,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
 	struct xe_svm_range *range;
-	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -804,16 +803,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
-					    xe_vma_start(vma), xe_vma_end(vma),
-					    &ctx);
-	if (IS_ERR(r))
-		return PTR_ERR(r);
+	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
 
-	if (ctx.devmem_only && !r->flags.migrate_devmem)
+	if (IS_ERR(range))
+		return PTR_ERR(range);
+
+	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
 		return -EACCES;
 
-	range = to_xe_range(r);
 	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
 		return 0;
 
@@ -839,7 +836,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 
 	range_debug(range, "GET PAGES");
-	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
+	err = xe_svm_range_get_pages(vm, range, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
@@ -930,6 +927,56 @@ int xe_svm_bo_evict(struct xe_bo *bo)
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
index a69bbdc73608..e304d147d309 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -73,6 +73,13 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
 int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 		      struct xe_svm_range *range,
 		      const struct drm_gpusvm_ctx *ctx);
+
+struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
+						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx);
+
+int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
+			   struct drm_gpusvm_ctx *ctx);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -227,6 +234,20 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
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

