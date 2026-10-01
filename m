Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7136ECA5FC1
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 03:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C5110E2E3;
	Thu,  1 Oct 2026 03:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJvDVUD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818DB10F563
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 03:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790825551; x=1822361551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qg5QFVMvw6ZL+iyFx/jwo4E+cB5fp8w/XcQQsJYZxaQ=;
 b=cJvDVUD5hTjOix3wSOTB9BC9AQe6rbovQHO/uq7QA1pEw3priJBPjsBX
 0o9RAd1558L4UVvtJRParZO00Uqedfn2oZnQzMKpUFosltEid3JpZJBzS
 XM/YQTeOLu189Dmjxtp/PACbl3IWC6HLTyLNVmwsHWMD+FjLcgxuYS8/s
 wAVMB1GxPBYGbZsCwPFtwo0crBeXhbDk6NqTJKAb7HMCnJX4FkyLH5PTM
 TXqRxUn4TQRB0ltNYLagXt2StsjmDFJutM67CTjlbCZutRiz0eQjcuOxg
 qDpnRQbjhv1YwPCogeyhtXNn282YKV1Jq1LkwpEb+cMmoOJx+O/XbdWK5 w==;
X-CSE-ConnectionGUID: W5bWfMEJT5u3/FMCZpbHDw==
X-CSE-MsgGUID: eBQHMKNeTd+2syTtU9gnQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113362886"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="113362886"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 20:32:31 -0700
X-CSE-ConnectionGUID: 2ZMiq/w9RS2n/v4xcy/qJw==
X-CSE-MsgGUID: ggFBCLGJS86IT/2teSfATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="275909713"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa009.jf.intel.com with ESMTP; 30 Sep 2026 20:32:30 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 4/4] drm/xe: Bump prefetch BO LRU for already-valid ranges
Date: Thu,  1 Oct 2026 09:06:07 +0530
Message-ID: <20261001033602.3166274-10-himal.prasad.ghimiray@intel.com>
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

A valid prefetch range skips migration and binding, so nothing refreshes
its backing BOs on the LRU. Add xe_svm_range_prefetch_lru_bump(), which
re-faults with no_dma_map and bumps each backing BO, and call it on the
valid path.

v2
- Make function failsafe (Matt/Sashiko AI comment)
- Add stub for function

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h | 11 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c  |  5 +++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d07dd95ab451..909a602d091e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1659,6 +1659,40 @@ void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
 #endif
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
index 986e0ebfdacd..3842a5f332ab 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2570,6 +2570,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
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

