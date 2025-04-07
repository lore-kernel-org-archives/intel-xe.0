Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04700C3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC8710E3EC;
	Mon,  7 Apr 2025 09:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FowzeEOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8599810E3EC
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019567; x=1775555567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AF5NW8NAFAZFU4I5fZQnYQ31shxsK5apPwoBYWJVPfQ=;
 b=FowzeEOlD1Wv76IXXxlH08y0mJdxN8tPdYO5LWx6JnD6nfz2OFhNPzTj
 639HhGjSc0CMG6su/1xrAKtMUpT5oR9zBP0ARpu8xINRxgfgaIPEyw7sC
 lIHfo6mlmOd6reqk5HBJmNEMdJmIBdn/ASeYT0tHAq9g4gLaf2M6JpW93
 DJA0DQacDDLTXVnutpS7BY9ehdVWGGYRILOJBrJ73P3MwBQ+pBVWI2JEZ
 RAuzVYBImH93jU9622SkYVQBu0Fteui8TBPNQic/laqaqqjZSpZJmk9/g
 zqNK2qWQua32ouUbcnA8bQbAjqwIqxjS79X5QhZd3WmWpcSwzTZKSXoAJ A==;
X-CSE-ConnectionGUID: BFQKo6ZxRQGX+/pCy63gRg==
X-CSE-MsgGUID: nadBN6/cSQCl5CdFeNGl4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029363"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029363"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:52:47 -0700
X-CSE-ConnectionGUID: GU33MdvUQJmAIl878gHpyA==
X-CSE-MsgGUID: DilyMaCKQN27oUWf8OpTuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778539"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:52:46 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 02/32] drm/xe: Make xe_svm_alloc_vram public
Date: Mon,  7 Apr 2025 15:46:49 +0530
Message-Id: <20250407101719.3350996-3-himal.prasad.ghimiray@intel.com>
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

This function will be used in prefetch too, hence make it public.

v2:
  - Add kernel-doc (Matthew Brost)
  - Rebase

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 23 +++++++++++++----------
 drivers/gpu/drm/xe/xe_svm.h | 23 +++++++++++++++++++++++
 2 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c7424c824a14..de19ad056287 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -661,9 +661,19 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
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
@@ -717,13 +727,6 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 
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
 
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 3d441eb1f7ea..d8772f841ab7 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -75,6 +75,20 @@ int xe_svm_bo_evict(struct xe_bo *bo);
 
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx);
+#else
+static inline
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -100,6 +114,7 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 #include <linux/interval_tree.h>
 
 struct drm_pagemap_device_addr;
+struct drm_gpusvm_ctx;
 struct xe_bo;
 struct xe_gt;
 struct xe_vm;
@@ -170,6 +185,14 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
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

