Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81387C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 15:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FBA10E9EA;
	Fri, 25 Jul 2025 15:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPH3FVuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425D810E20E
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753458034; x=1784994034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vGDBJcKr6QyGVKJlJ+y74yxTILo+74pqQf0E7JDiLCQ=;
 b=PPH3FVuIBihyRQzkuyld9z/9CzqRWyfG5MfCm+++PVoXrxfbTC5jKuVh
 cGVcx9xoUQkF4ZkufP+D/EVVSIxjGevpZkk47rZvf4Fz7Jb4LXS6euXs8
 QowodVQd256hmRtJCbHDJX19j+MIIhFhzKoCnOnx4wPZZ7NvwAlvEy/xv
 +QdzchfgUySxCKigXHmuBnTO//iKEUiQu3OqQgapwLL+4E9wX2uLmKe1g
 5T1+XVj1M3SfzT9ykTWpbgmIF5vEzPyMagNXu8MlK30IxXjB+JmSTkOG+
 Ml//1L73g4slYw4+yH8OvtOGT8IU+eBOUuaaTG/qx1gasifznheES1UI0 Q==;
X-CSE-ConnectionGUID: Srx7biTSSa+aU4cKU01opg==
X-CSE-MsgGUID: rrQjVLcDSgyx6OS1fy1rww==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="54879412"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="54879412"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:34 -0700
X-CSE-ConnectionGUID: aG7pwU9MQASL9jD1g8rFfA==
X-CSE-MsgGUID: bQvpGqcrSc2zGkixV60R3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165503664"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.200])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:33 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 1/6] drm/pagemap: Rename drm_pagemap_device_addr to
 drm_pagemap_addr
Date: Fri, 25 Jul 2025 17:39:25 +0200
Message-ID: <20250725154011.2807655-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725154011.2807655-1-francois.dugast@intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
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

Rename this struct to the more generic name drm_pagemap_addr so it can be
used in a broader context, such as DMA mappings of CPU memory.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c       |  4 ++--
 drivers/gpu/drm/xe/xe_res_cursor.h | 10 +++++-----
 drivers/gpu/drm/xe/xe_svm.c        |  4 ++--
 drivers/gpu/drm/xe/xe_svm.h        |  4 ++--
 include/drm/drm_gpusvm.h           |  4 ++--
 include/drm/drm_pagemap.h          | 32 +++++++++++++++---------------
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 5bb4c77db2c3..661306da6b2d 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1048,7 +1048,7 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 		};
 
 		for (i = 0, j = 0; i < npages; j++) {
-			struct drm_pagemap_device_addr *addr = &range->dma_addr[j];
+			struct drm_pagemap_addr *addr = &range->dma_addr[j];
 
 			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
 				dma_unmap_page(dev,
@@ -1400,7 +1400,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				goto err_unmap;
 			}
 
-			range->dma_addr[j] = drm_pagemap_device_addr_encode
+			range->dma_addr[j] = drm_pagemap_addr_encode
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
 				 DMA_BIDIRECTIONAL);
 		}
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index d1a403cfb628..4e00008b7081 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -55,8 +55,8 @@ struct xe_res_cursor {
 	u32 mem_type;
 	/** @sgl: Scatterlist for cursor */
 	struct scatterlist *sgl;
-	/** @dma_addr: Current element in a struct drm_pagemap_device_addr array */
-	const struct drm_pagemap_device_addr *dma_addr;
+	/** @dma_addr: Current element in a struct drm_pagemap_addr array */
+	const struct drm_pagemap_addr *dma_addr;
 	/** @mm: Buddy allocator for VRAM cursor */
 	struct drm_buddy *mm;
 	/**
@@ -170,7 +170,7 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
  */
 static inline void __xe_res_dma_next(struct xe_res_cursor *cur)
 {
-	const struct drm_pagemap_device_addr *addr = cur->dma_addr;
+	const struct drm_pagemap_addr *addr = cur->dma_addr;
 	u64 start = cur->start;
 
 	while (start >= cur->dma_seg_size) {
@@ -222,14 +222,14 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 /**
  * xe_res_first_dma - initialize a xe_res_cursor with dma_addr array
  *
- * @dma_addr: struct drm_pagemap_device_addr array to walk
+ * @dma_addr: struct drm_pagemap_addr array to walk
  * @start: Start of the range
  * @size: Size of the range
  * @cur: cursor object to initialize
  *
  * Start walking over the range of allocations between @start and @size.
  */
-static inline void xe_res_first_dma(const struct drm_pagemap_device_addr *dma_addr,
+static inline void xe_res_first_dma(const struct drm_pagemap_addr *dma_addr,
 				    u64 start, u64 size,
 				    struct xe_res_cursor *cur)
 {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 10c8a1bcb86e..3e4f4a8760ee 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1014,7 +1014,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 				       ctx->timeslice_ms);
 }
 
-static struct drm_pagemap_device_addr
+static struct drm_pagemap_addr
 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 			  struct device *dev,
 			  struct page *page,
@@ -1033,7 +1033,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 		prot = 0;
 	}
 
-	return drm_pagemap_device_addr_encode(addr, prot, order, dir);
+	return drm_pagemap_addr_encode(addr, prot, order, dir);
 }
 
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index da9a69ea0bb1..4bdccb56d25f 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -163,7 +163,7 @@ void xe_svm_flush(struct xe_vm *vm);
 #else
 #include <linux/interval_tree.h>
 
-struct drm_pagemap_device_addr;
+struct drm_pagemap_addr;
 struct drm_gpusvm_ctx;
 struct drm_gpusvm_range;
 struct xe_bo;
@@ -178,7 +178,7 @@ struct xe_vram_region;
 struct xe_svm_range {
 	struct {
 		struct interval_tree_node itree;
-		const struct drm_pagemap_device_addr *dma_addr;
+		const struct drm_pagemap_addr *dma_addr;
 	} base;
 	u32 tile_present;
 	u32 tile_invalidated;
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 4aedc5423aff..8d613e9b2690 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -17,7 +17,7 @@ struct drm_gpusvm_notifier;
 struct drm_gpusvm_ops;
 struct drm_gpusvm_range;
 struct drm_pagemap;
-struct drm_pagemap_device_addr;
+struct drm_pagemap_addr;
 
 /**
  * struct drm_gpusvm_ops - Operations structure for GPU SVM
@@ -154,7 +154,7 @@ struct drm_gpusvm_range {
 	struct interval_tree_node itree;
 	struct list_head entry;
 	unsigned long notifier_seq;
-	struct drm_pagemap_device_addr *dma_addr;
+	struct drm_pagemap_addr *dma_addr;
 	struct drm_pagemap *dpagemap;
 	struct drm_gpusvm_range_flags flags;
 };
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index e5f20a1235be..69d6ee49a3de 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -23,7 +23,7 @@ enum drm_interconnect_protocol {
 };
 
 /**
- * struct drm_pagemap_device_addr - Device address representation.
+ * struct drm_pagemap_addr - Address representation.
  * @addr: The dma address or driver-defined address for driver private interconnects.
  * @proto: The interconnect protocol.
  * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
@@ -32,7 +32,7 @@ enum drm_interconnect_protocol {
  * Note: There is room for improvement here. We should be able to pack into
  * 64 bits.
  */
-struct drm_pagemap_device_addr {
+struct drm_pagemap_addr {
 	dma_addr_t addr;
 	u64 proto : 54;
 	u64 order : 8;
@@ -40,21 +40,21 @@ struct drm_pagemap_device_addr {
 };
 
 /**
- * drm_pagemap_device_addr_encode() - Encode a dma address with metadata
+ * drm_pagemap_addr_encode() - Encode a dma address with metadata
  * @addr: The dma address or driver-defined address for driver private interconnects.
  * @proto: The interconnect protocol.
  * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
  * @dir: The DMA direction.
  *
- * Return: A struct drm_pagemap_device_addr encoding the above information.
+ * Return: A struct drm_pagemap_addr encoding the above information.
  */
-static inline struct drm_pagemap_device_addr
-drm_pagemap_device_addr_encode(dma_addr_t addr,
-			       enum drm_interconnect_protocol proto,
-			       unsigned int order,
-			       enum dma_data_direction dir)
+static inline struct drm_pagemap_addr
+drm_pagemap_addr_encode(dma_addr_t addr,
+			enum drm_interconnect_protocol proto,
+			unsigned int order,
+			enum dma_data_direction dir)
 {
-	return (struct drm_pagemap_device_addr) {
+	return (struct drm_pagemap_addr) {
 		.addr = addr,
 		.proto = proto,
 		.order = order,
@@ -75,11 +75,11 @@ struct drm_pagemap_ops {
 	 * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
 	 * @dir: The transfer direction.
 	 */
-	struct drm_pagemap_device_addr (*device_map)(struct drm_pagemap *dpagemap,
-						     struct device *dev,
-						     struct page *page,
-						     unsigned int order,
-						     enum dma_data_direction dir);
+	struct drm_pagemap_addr (*device_map)(struct drm_pagemap *dpagemap,
+					      struct device *dev,
+					      struct page *page,
+					      unsigned int order,
+					      enum dma_data_direction dir);
 
 	/**
 	 * @device_unmap: Unmap a device address previously obtained using @device_map.
@@ -90,7 +90,7 @@ struct drm_pagemap_ops {
 	 */
 	void (*device_unmap)(struct drm_pagemap *dpagemap,
 			     struct device *dev,
-			     struct drm_pagemap_device_addr addr);
+			     struct drm_pagemap_addr addr);
 
 	/**
 	 * @populate_mm: Populate part of the mm with @dpagemap memory,
-- 
2.43.0

