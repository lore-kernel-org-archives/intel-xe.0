Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982AAC3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F3D10E457;
	Mon, 12 May 2025 16:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSbVBuYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CEC10E457
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066951; x=1778602951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wZSXM+sj+yK3/4tie+g5cd21hFH+Dfdfxwn15BTndys=;
 b=LSbVBuYus41QLz4w0lhuvFyn3pdU+QuH87Ky3y6FcwN54hXPhMGm8WEO
 HuUMg9+XJarlwNh7kKQLiIhNYWt+2YRoD2VPDTrPuo+ylpOpGqkbGjP6a
 gb0lH+MiNLzePvU29CLenTxtA+K4AUHNbKoM6RFGOG9x5meQSXZISHkxO
 xab2i+eweqnAmio4bIRmzqXxlNC0nSdilUr4P+vagCYq22zpfTOCm6ddd
 b3x+j8iB4VnlVzOcF93tLn0LRWvLA9inKkZ2u4MNxC1jeAUwIFUL2s7+6
 HN/SxcvvIBx4tq7//peepxBML0Cjo9xJPXoSH5DtkBGFwzsiJ4WkAh6XU w==;
X-CSE-ConnectionGUID: Am/QaXe6Q0WVd5Oo6iNJCQ==
X-CSE-MsgGUID: o6YtgCqhSqGrNh28qKrvBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59508094"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59508094"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:22:30 -0700
X-CSE-ConnectionGUID: HW3gbk1LRkSuudQuyA2snw==
X-CSE-MsgGUID: tSdjWH0rR0aeTdup3B4zOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142532713"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 09:22:29 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 07/20] drm/xe: Make xe_svm_alloc_vram public
Date: Mon, 12 May 2025 22:17:27 +0530
Message-Id: <20250512164740.466852-8-himal.prasad.ghimiray@intel.com>
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

This function will be used in prefetch too, hence make it public.

v2:
  - Add kernel-doc (Matthew Brost)
  - Rebase

v3:
 - Move CONFIG_DRM_XE_DEVMEM_MIRROR stub out to xe_svm.c (Matthew Brost)

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ab88b4194e57..875376bddc88 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -677,9 +677,19 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
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
@@ -733,13 +743,6 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 
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
@@ -1025,6 +1028,13 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
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
index 30fc78b85b30..36e245ec6422 100644
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
@@ -97,6 +100,7 @@ void xe_svm_flush(struct xe_vm *vm);
 #include <linux/interval_tree.h>
 
 struct drm_pagemap_device_addr;
+struct drm_gpusvm_ctx;
 struct xe_bo;
 struct xe_gt;
 struct xe_vm;
@@ -167,6 +171,14 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
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

