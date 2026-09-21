Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4B2C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F3710E5C1;
	Mon, 21 Sep 2026 09:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKzEhlGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECC910E5C2
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789983236; x=1821519236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wA5OOTUFF34tEta42XSjT1fiXzpYkPjoJi19CauZboo=;
 b=YKzEhlGU7IIWN8AG6umm+9IdTHuy3KiVNpmupha/ZoQATL56ElBlqUmC
 fF0wb7+BZU6oqGODrAu15m9OAx2FejCLnjjFYkJ3FcUkk756qNq1/wLdE
 NkJu7o6hJQ4loOK4LJWWjeAYoovlrSF0zP/CnlchMwcIQ4fqVo7ydNaS2
 xFJrcVaY8Mdqbidfj2WTpsSaViS/Rgj1LofcyjZ/VH4MP/XumoJkwTl3N
 c/HcGR+1/PgPq+Mv+GR6DboUo7OS2YXDwQtW11AHDimAVbDi6wOovzVxF
 VG4kAUHvTy02zgKYn5zDgHH6IeIoNc0kY+61W7I1vGwQzy3Yas9bEnaN1 w==;
X-CSE-ConnectionGUID: 8oqsHcGrThmIHDua5mUCcQ==
X-CSE-MsgGUID: fmRwCfN0Tn+0ANPnAUA52g==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="988893"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="988893"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:33:55 -0700
X-CSE-ConnectionGUID: 9LExUqtkRvWwvIppluaEtg==
X-CSE-MsgGUID: 2nB/E3XZRMW7Bow2bYhrkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272734489"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa008.fm.intel.com with ESMTP; 21 Sep 2026 02:33:30 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/4] drm/xe: Bump prefetch BO LRU for already-valid ranges
Date: Mon, 21 Sep 2026 15:06:56 +0530
Message-ID: <20260921093651.2995928-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921093651.2995928-6-himal.prasad.ghimiray@intel.com>
References: <20260921093651.2995928-6-himal.prasad.ghimiray@intel.com>
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

A valid prefetch range skips migration and binding, so nothing refreshes
its backing BOs on the LRU. Add xe_svm_range_prefetch_lru_bump(), which
re-faults with no_dma_map and bumps each backing BO, and call it on the
valid path.

v2
- Make function failsafe (Matt/Sashiko AI comment)
- Add stub for function

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h | 11 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c  |  5 +++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 56c82ff9b39e..83a7c403187a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1653,6 +1653,40 @@ void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
 	dma_resv_unlock(bo->ttm.base.resv);
 }
 
+/**
+ * xe_svm_range_prefetch_lru_bump() - Bump the TTM LRU for an already-valid range
+ * @vm: Pointer to the struct xe_vm
+ * @vma: Pointer to the VMA covering the range
+ * @range: Pointer to the xe SVM range structure
+ * @dpagemap: Target pagemap of the prefetch, or %NULL for system memory
+ *
+ * A valid range skips migration and binding, so nothing else refreshes its
+ * backing BOs on the LRU. Re-fault the CPU pages without touching the DMA
+ * mappings (@no_dma_map) and move each backing BO to the LRU tail.
+ *
+ * Prefetching is a best-effort optimization, so any failure is ignored; a
+ * later fault will refault the range.
+ */
+void xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
+				    struct xe_svm_range *range,
+				    struct drm_pagemap *dpagemap)
+{
+	struct drm_gpusvm_ctx ctx = {
+		.read_only = xe_vma_read_only(vma),
+		.device_private_page_owner =
+			xe_svm_private_page_owner(vm, !dpagemap),
+		.no_dma_map = 1,
+		.devmem_fn = xe_svm_devmem_lru_bump,
+	};
+
+	guard(mutex)(&range->lock);
+
+	if (xe_svm_range_is_removed(range))
+		return;
+
+	xe_svm_range_get_pages(vm, range, &ctx);
+}
+
 /**
  * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
  * @vm: Pointer to the xe_vm structure
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 585ad64b672b..ffc1cc808102 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -130,6 +130,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 
 void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
 
+void xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
+				    struct xe_svm_range *range,
+				    struct drm_pagemap *dpagemap);
+
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
 					const struct drm_pagemap *dpagemap);
 
@@ -363,6 +367,13 @@ void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
 {
 }
 
+static inline
+void xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
+				    struct xe_svm_range *range,
+				    struct drm_pagemap *dpagemap)
+{
+}
+
 static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
 {
 	return NULL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0fdc740f1a41..3d5c5f3788bd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2584,6 +2584,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 						  dpagemap, &valid_pages)) {
 				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
 				xe_assert(vm->xe, valid_pages);
+
+				if (dpagemap)
+					xe_svm_range_prefetch_lru_bump(vm, vma, svm_range,
+								       dpagemap);
+
 				need_put = true;
 				goto check_next_range;
 			}
-- 
2.43.0

