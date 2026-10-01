Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EFACA5FC4
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 03:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DD610F562;
	Thu,  1 Oct 2026 03:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcIOlaS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE2F10E2E3
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 03:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790825550; x=1822361550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2r0N0SHCFpHIx6HbsNTPA6OmQbGnwLeTm3deZzw36/M=;
 b=LcIOlaS6vawFDRRTi9r/Awm1f7QdNfMPWvZ6T37ke/2tlJ40fDa0TRvE
 ijNOgP2qnqZgQX+PnPAEtoxPW4OB5saHrjMYcRmK7/OtDHfn4Femor9Nr
 C5iZ3ru5zP39hwAy7i/orCjlHPy/zsU3YPTnbK+M5se8PXm0Dwdu0Kl3w
 C3DIvJid6jXu69rXX7QyDcwWsD4mX5jU41CB57wm7QoWx8/n0yOVjL6PG
 42jtG7pgL8rHPZKc0U8Ngba8+NymHIPZSDD/XlBcLLx3QQnPba0BF5/P6
 comswSakziQc6GacEuo5wKs8tJRW5fhSiGDOoJPk2//+snnP54dR/bm63 g==;
X-CSE-ConnectionGUID: dL0Z7FIwTGWTaDbUleBF3g==
X-CSE-MsgGUID: 0Vj9U6UuT86i9SbHJUAT7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113362885"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="113362885"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 20:32:30 -0700
X-CSE-ConnectionGUID: t9Vf4u+1TBuqMiJ5x5/ttg==
X-CSE-MsgGUID: 1Obxh9iRRVipoITaMBz57Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="275909708"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa009.jf.intel.com with ESMTP; 30 Sep 2026 20:32:28 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback
Date: Thu,  1 Oct 2026 09:06:06 +0530
Message-ID: <20261001033602.3166274-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
References: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
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

v3:
- Guard xe_svm_devmem_lru_bump() body with CONFIG_DRM_XE_PAGEMAP; it
  references dpagemap_devmem_ops and to_xe_bo(), which only exist when
  PAGEMAP is enabled. Fixes the build with GPUSVM=y, PAGEMAP=n.
  (Sashiko AI review)

v4:
- Fix xe_svm_devmem_lru_bump() kernel-doc to explain the locking (Matt)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
 drivers/gpu/drm/xe/xe_vm.c  |  1 +
 3 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index f39e647512ad..d07dd95ab451 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap.h>
 #include <drm/drm_pagemap_util.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
@@ -1625,6 +1626,39 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 	return err;
 }
 
+/**
+ * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
+ * @devmem_allocation: The device-memory allocation backing the range's pages
+ *
+ * Intended as a &drm_gpusvm_ctx.devmem_fn, so drm_gpusvm_get_pages() calls it
+ * under the GPUSVM notifier lock. That lock sits in the reclaim path, so
+ * dma-resv cannot be acquired blocking beneath it; dma-resv is also the outer
+ * lock of the notifier when memory is allocated and migrated, so a blocking
+ * acquire here would invert that order. Hence the trylock. The BO is private
+ * (dedicated dma-resv), so the trylock succeeds unless the BO is being moved
+ * elsewhere (e.g. eviction); a contended BO is simply skipped.
+ *
+ * A shared device_private_page_owner can hand us allocations backed by a
+ * foreign driver; skip anything that is not an Xe BO before casting.
+ */
+void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
+{
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
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
+#endif
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
index ea5bfb307db1..986e0ebfdacd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3246,6 +3246,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
 	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
+	ctx.devmem_fn = xe_svm_devmem_lru_bump;
 
 	skip_threads =  op->prefetch_range.ranges_count == 1 ||
 		(!dpagemap && !(vops->flags &
-- 
2.43.0

