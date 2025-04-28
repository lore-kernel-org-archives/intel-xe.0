Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16059C369D3
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 07:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E6510E399;
	Mon, 28 Apr 2025 07:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsnPap5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B23710E399
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 07:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745825012; x=1777361012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JeNcRivctuZQQZ2lYFzKMpwLsTnCV7YpkIb11GCLlw8=;
 b=hsnPap5ORjH0wcWYnYXCcuQgPGlCbpfRvSkHsZHI3MLMUnWGwUr/37XZ
 EOVUvCJ1uIRzvdP9WkYVUAunrqC0aHm/ri0ifA8Y0hPJ9amyXyx7YwHAP
 7ffGhIyarnZWsCOk/Oh45uE59a7WQljsRQoJSDGol+mutBmnOSLEw7M0X
 M1QsMRdmTSMXJ6Io4p4abxc0C3Vi3Od2oXRESo2pT+nPRDyi4dd8GCNnY
 oez8UQlCS8PDnZVl3NQkv6duHmftY4R26+Ss5BGptfYcywiE9obYRyCGg
 IOBkZ1VQaojGSKAmgUyxMb3DPndlqAsTE2sTz1MYBmOY0/FYD3OZVFREt w==;
X-CSE-ConnectionGUID: 2qcV6e20RreiOIccTDmM5w==
X-CSE-MsgGUID: iZJaeeyAR3mkyHkwwXaJhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50056939"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="50056939"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 00:23:32 -0700
X-CSE-ConnectionGUID: LZb3JDboT/yirSb72MeyJw==
X-CSE-MsgGUID: QUtP37pLRUa25uD8EpRNfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133408730"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 28 Apr 2025 00:23:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 07/18] drm/xe: Make xe_svm_alloc_vram public
Date: Mon, 28 Apr 2025 13:18:18 +0530
Message-Id: <20250428074829.4125547-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428074829.4125547-1-himal.prasad.ghimiray@intel.com>
References: <20250428074829.4125547-1-himal.prasad.ghimiray@intel.com>
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

This function will be used in prefetch too, hence make it public.

v2:
  - Add kernel-doc (Matthew Brost)
  - Rebase

v3:
 - Move CONFIG_DRM_XE_DEVMEM_MIRROR stub out to xe_svm.c (Matthew Brost)

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index de4eb04fc78e..d30b36763240 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -663,9 +663,19 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 	return &tile->mem.vram;
 }
 
-static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-			     struct xe_svm_range *range,
-			     const struct drm_gpusvm_ctx *ctx)
+/**
+ * xe_svm_alloc_vram()- Allocate device memory pages for range,
+ * migrating existing data.
+ * @vm: The VM.
+ * @tile: tile to allocate vram from
+ * @range: SVM range
+ * @ctx: DRM GPU SVM context
+ *
+ * Return: 0 on success, error code on failure.
+ */
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
 {
 	struct mm_struct *mm = vm->svm.gpusvm.mm;
 	struct xe_vram_region *vr = tile_to_vr(tile);
@@ -719,13 +729,6 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 
 	return err;
 }
-#else
-static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-			     struct xe_svm_range *range,
-			     const struct drm_gpusvm_ctx *ctx)
-{
-	return -EOPNOTSUPP;
-}
 #endif
 
 static bool supports_4K_migration(struct xe_device *xe)
@@ -1006,6 +1009,13 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 	return 0;
 }
 #else
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
+{
+	return -EOPNOTSUPP;
+}
+
 int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 {
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 0e1f376a7471..55695097a8d1 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -70,6 +70,9 @@ int xe_svm_bo_evict(struct xe_bo *bo);
 
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
 
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx);
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -95,6 +98,7 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 #include <linux/interval_tree.h>
 
 struct drm_pagemap_device_addr;
+struct drm_gpusvm_ctx;
 struct xe_bo;
 struct xe_gt;
 struct xe_vm;
@@ -165,6 +169,14 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 {
 }
 
+static inline
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
+{
+	return -EOPNOTSUPP;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
-- 
2.34.1

