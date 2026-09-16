Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E99C88E7D
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 11:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB9C10E8FA;
	Wed, 16 Sep 2026 11:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBJeNJQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDDC10E8FA
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557912; x=1821093912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=THowO/Jf15Sgzy8m+3lfX0AwAAkeXGjkBqozqk0JHOc=;
 b=UBJeNJQNM0LdqDzNWt9b8TocZTLTKCnctc3p5WRGfP9LyKGJLHv1XQJI
 0AzmGJkd/CWxzzU82vuuzBVzb5LznRhbKCeppFa3rpgg5E0SVCVVIYNyq
 1tQ58wMgRWdIM4d6S8rPw3HYXLqg9OgDN2xethMJ406AH/CJ58m5nc7je
 dXs0i6wklTnc7unC5+e1U7QhEnNYk7nuYZqpXUriCexVZCv/iplf+rRuH
 amRQ8q586lZ2fnvzz1BEzE6qzbGkRCFBKONmFYKQuZzDfi0hJnzim//XR
 LA9EV4CHN2c8QD6ma4pUfONAZ9O5nrZxBaAalX4MYfVNtLRJJHU5iviHS Q==;
X-CSE-ConnectionGUID: ZygFQH/ZQm6M1ArVLt8wCg==
X-CSE-MsgGUID: waPUPUPFR/eT55g94Pi4GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89067450"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89067450"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:25:12 -0700
X-CSE-ConnectionGUID: LuVhO8hxQpqIhgs8Y6HKfw==
X-CSE-MsgGUID: URx8vvLqRlmd8p+sskfXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275276317"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2026 04:25:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback
Date: Wed, 16 Sep 2026 16:58:32 +0530
Message-ID: <20260916112828.2528881-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  2 ++
 drivers/gpu/drm/xe/xe_vm.c  |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6c3033fc4db7..7de6ed818d45 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap.h>
 #include <drm/drm_pagemap_util.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
@@ -1612,6 +1613,25 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 	return err;
 }
 
+/**
+ * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
+ * @devmem_allocation: The device-memory allocation backing the range's pages
+ *
+ * Intended as a &drm_gpusvm_ctx.devmem_fn. Runs under the GPUSVM notifier lock;
+ * the dma-resv trylock avoids inverting against eviction/shrinker, which take
+ * dma-resv before the notifier lock. A contended BO is simply skipped.
+ */
+void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
+{
+	struct xe_bo *bo = to_xe_bo(devmem_allocation);
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
index 2ef4ef026ccd..74566094b026 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -128,6 +128,8 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
 int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 			   struct drm_gpusvm_ctx *ctx);
 
+void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
+
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
 					const struct drm_pagemap *dpagemap);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cc96e2b7f3a7..4243825228d9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3259,6 +3259,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
 	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
+	ctx.devmem_fn = xe_svm_devmem_lru_bump;
 
 	skip_threads =  op->prefetch_range.ranges_count == 1 ||
 		(!dpagemap && !(vops->flags &
-- 
2.43.0

