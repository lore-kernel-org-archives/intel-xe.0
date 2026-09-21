Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F92C982F6
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F20010E5C2;
	Mon, 21 Sep 2026 09:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4g79D8o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D0710E5C1
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789983236; x=1821519236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5eM02xpzcDBznOwH32NWR6Nycl3wagcYxuDD/nlNWDc=;
 b=Q4g79D8o4kId54McGCgvL1+9g4z5TQvf7nFmNt1SQc85DP5Zvr2uYY7H
 yPs9K4AXy4ZWNGK2HQ9HyVPaUTWxgYGj08+a/SFnDxASyl+VB2HQU8TNV
 QOfJjMYpXZ9t1eqZk4l+5xAlhSwKAn3uf57QfS5agSG4U4fqTRPVUyr2d
 yrnnhPl1EWtrgkW7GdWST2/MpempMm3U4p5DHlJev8HvyOLGgkJpZKuj8
 13rWrnLLpI+agwJjJz/MCKWNXOBlh9GUj3e3Jj+WHwugvx3pnZRXXLIJD
 PmZKTn6cX6IG//XwENHni2buqXgCFRaFWOZ/fPW9nvWsDizGn4QiODag0 g==;
X-CSE-ConnectionGUID: 8H7VN5wORfuQnKhwNNVJeg==
X-CSE-MsgGUID: TQR0SmjPSkOhC3VbthTypQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="988891"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="988891"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:33:55 -0700
X-CSE-ConnectionGUID: EUnuz+xwT4iOupKqasMygA==
X-CSE-MsgGUID: qfrDs65vS4mo4acaRg3h1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272734487"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa008.fm.intel.com with ESMTP; 21 Sep 2026 02:33:29 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback
Date: Mon, 21 Sep 2026 15:06:55 +0530
Message-ID: <20260921093651.2995928-9-himal.prasad.ghimiray@intel.com>
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

Add xe_svm_devmem_lru_bump() and set it as drm_gpusvm_ctx.devmem_fn in
the prefetch worker so each backing BO is moved to the LRU tail during
get_pages.

v2:
- Guard xe_svm_devmem_lru_bump() against foreign device-memory
  allocations before casting to xe_bo: return early when
  devmem_allocation->ops != &dpagemap_devmem_ops. A shared
  device_private_page_owner can hand us another driver's allocation.
  (Matthew Brost / Sashiko AI review)
- Add stub for function (CI)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
 drivers/gpu/drm/xe/xe_vm.c  |  1 +
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index f39e647512ad..56c82ff9b39e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap.h>
 #include <drm/drm_pagemap_util.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
@@ -1625,6 +1626,33 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 	return err;
 }
 
+/**
+ * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
+ * @devmem_allocation: The device-memory allocation backing the range's pages
+ *
+ * Intended as a &drm_gpusvm_ctx.devmem_fn. Runs under the GPUSVM notifier lock;
+ * the dma-resv trylock avoids inverting against eviction/shrinker, which take
+ * dma-resv before the notifier lock. A contended BO is simply skipped.
+ *
+ * A shared device_private_page_owner can hand us allocations backed by a
+ * foreign driver; skip anything that is not an xe BO before casting.
+ */
+void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
+{
+	struct xe_bo *bo;
+
+	if (devmem_allocation->ops != &dpagemap_devmem_ops)
+		return;
+
+	bo = to_xe_bo(devmem_allocation);
+
+	if (!dma_resv_trylock(bo->ttm.base.resv))
+		return;
+
+	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+	dma_resv_unlock(bo->ttm.base.resv);
+}
+
 /**
  * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
  * @vm: Pointer to the xe_vm structure
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 2ef4ef026ccd..585ad64b672b 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -128,6 +128,8 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
 int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 			   struct drm_gpusvm_ctx *ctx);
 
+void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
+
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
 					const struct drm_pagemap *dpagemap);
 
@@ -356,6 +358,11 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 	return -EINVAL;
 }
 
+static inline
+void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
+{
+}
+
 static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
 {
 	return NULL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6b793ef31537..0fdc740f1a41 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3260,6 +3260,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
 	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
+	ctx.devmem_fn = xe_svm_devmem_lru_bump;
 
 	skip_threads =  op->prefetch_range.ranges_count == 1 ||
 		(!dpagemap && !(vops->flags &
-- 
2.43.0

