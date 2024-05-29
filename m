Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA15C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 01:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6DA112C89;
	Wed, 29 May 2024 01:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3Jqtal0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2459112C90
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716944728; x=1748480728;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wmqRcJA38yd6X/2uJdPmmxv0kbakPKuzNyRN2m9ykvc=;
 b=H3Jqtal0d3x3QNSDPaqyzKNRSAAb734cx4RbgERZ3NcY38TQVY16Gq4w
 qL4TgJSr6jNLkpEvbx1CMZF5jA9hSil6Q90JNdBs+Hs6JY9zPw5A5uCZp
 m9Z3c3ulP9xbU8m9cRCz1mARGiTs+YxH33X1xCovxAVXZZb8ecm/RFjLx
 e5azvdqDw6nr1quzFrK12v5jAigvxcJqdRKf78TYEL2C++i6oJfic1thv
 FV7U9V0Ck7qmCzJrUuztoe0sbc5/krZPVy1Sw1j64ijSe8LChacBKUj7X
 oB382Mou3wg7HaVFtYlopJnOr4q0qbxZzAwM0Tnc3Dq447BOqt0IGA/VJ g==;
X-CSE-ConnectionGUID: jwVK90zkRteN1qUVYgJdMQ==
X-CSE-MsgGUID: g13naagGS8G3oS1Cu9Vw6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30849788"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="30849788"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
X-CSE-ConnectionGUID: 0QXynEOjSzCtcEMgjMa2eQ==
X-CSE-MsgGUID: zT3H+JQpQICiX6i2goUxjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="72700488"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 03/26] dma-mapping: provide callbacks to link/unlink pages to
 specific IOVA
Date: Tue, 28 May 2024 21:19:01 -0400
Message-Id: <20240529011924.4125173-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240529011924.4125173-1-oak.zeng@intel.com>
References: <20240529011924.4125173-1-oak.zeng@intel.com>
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

From: Leon Romanovsky <leonro@nvidia.com>

Introduce new DMA link/unlink API to provide a way for advanced users
to directly map/unmap pages without ned to allocate IOVA on every map
call.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h | 10 +++++++
 include/linux/dma-mapping.h | 13 +++++++++
 kernel/dma/debug.h          |  2 ++
 kernel/dma/direct.h         |  3 ++
 kernel/dma/mapping.c        | 57 +++++++++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index bd605b44bb57..fd03a080df1e 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -86,6 +86,13 @@ struct dma_map_ops {
 
 	dma_addr_t (*alloc_iova)(struct device *dev, size_t size);
 	void (*free_iova)(struct device *dev, dma_addr_t dma_addr, size_t size);
+	dma_addr_t (*link_range)(struct device *dev, struct page *page,
+				 unsigned long offset, dma_addr_t addr,
+				 size_t size, enum dma_data_direction dir,
+				 unsigned long attrs);
+	void (*unlink_range)(struct device *dev, dma_addr_t dma_handle,
+			     size_t size, enum dma_data_direction dir,
+			     unsigned long attrs);
 };
 
 #ifdef CONFIG_DMA_OPS
@@ -428,6 +435,9 @@ bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
 #define arch_dma_unmap_sg_direct(d, s, n)	(false)
 #endif
 
+#define arch_dma_link_range_direct arch_dma_map_page_direct
+#define arch_dma_unlink_range_direct arch_dma_unmap_page_direct
+
 #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		bool coherent);
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 176fb8a86d63..91cc084adb53 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -113,6 +113,9 @@ static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
 
 int dma_alloc_iova(struct dma_iova_attrs *iova);
 void dma_free_iova(struct dma_iova_attrs *iova);
+dma_addr_t dma_link_range(struct page *page, unsigned long offset,
+			  struct dma_iova_attrs *iova, dma_addr_t dma_offset);
+void dma_unlink_range(struct dma_iova_attrs *iova, dma_addr_t dma_offset);
 
 dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 		size_t offset, size_t size, enum dma_data_direction dir,
@@ -179,6 +182,16 @@ static inline int dma_alloc_iova(struct dma_iova_attrs *iova)
 static inline void dma_free_iova(struct dma_iova_attrs *iova)
 {
 }
+static inline dma_addr_t dma_link_range(struct page *page, unsigned long offset,
+					struct dma_iova_attrs *iova,
+					dma_addr_t dma_offset)
+{
+	return DMA_MAPPING_ERROR;
+}
+static inline void dma_unlink_range(struct dma_iova_attrs *iova,
+				    dma_addr_t dma_offset)
+{
+}
 static inline dma_addr_t dma_map_page_attrs(struct device *dev,
 		struct page *page, size_t offset, size_t size,
 		enum dma_data_direction dir, unsigned long attrs)
diff --git a/kernel/dma/debug.h b/kernel/dma/debug.h
index f525197d3cae..3d529f355c6d 100644
--- a/kernel/dma/debug.h
+++ b/kernel/dma/debug.h
@@ -127,4 +127,6 @@ static inline void debug_dma_sync_sg_for_device(struct device *dev,
 {
 }
 #endif /* CONFIG_DMA_API_DEBUG */
+#define debug_dma_link_range debug_dma_map_page
+#define debug_dma_unlink_range debug_dma_unmap_page
 #endif /* _KERNEL_DMA_DEBUG_H */
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 18d346118fe8..1c30e1cd607a 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -125,4 +125,7 @@ static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
 		swiotlb_tbl_unmap_single(dev, phys, size, dir,
 					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
 }
+
+#define dma_direct_link_range dma_direct_map_page
+#define dma_direct_unlink_range dma_direct_unmap_page
 #endif /* _KERNEL_DMA_DIRECT_H */
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index b6b27bab90f3..f989c64622c2 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -213,6 +213,63 @@ void dma_free_iova(struct dma_iova_attrs *iova)
 }
 EXPORT_SYMBOL(dma_free_iova);
 
+/**
+ * dma_link_range - Link a physical page to DMA address
+ * @page: The page to be mapped
+ * @offset: The offset within the page
+ * @iova: Preallocated IOVA attributes
+ * @dma_offset: DMA offset form which this page needs to be linked
+ *
+ * dma_alloc_iova() allocates IOVA based on the size specified by ther user in
+ * iova->size. Call this function after IOVA allocation to link @page from
+ * @offset to get the DMA address. Note that very first call to this function
+ * will have @dma_offset set to 0 in the IOVA space allocated from
+ * dma_alloc_iova(). For subsequent calls to this function on same @iova,
+ * @dma_offset needs to be advanced by the caller with the size of previous
+ * page that was linked + DMA address returned for the previous page that was
+ * linked by this function.
+ */
+dma_addr_t dma_link_range(struct page *page, unsigned long offset,
+			  struct dma_iova_attrs *iova, dma_addr_t dma_offset)
+{
+	struct device *dev = iova->dev;
+	size_t size = iova->size;
+	enum dma_data_direction dir = iova->dir;
+	unsigned long attrs = iova->attrs;
+	dma_addr_t addr = iova->addr + dma_offset;
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (dma_map_direct(dev, ops) ||
+	    arch_dma_link_range_direct(dev, page_to_phys(page) + offset + size))
+		addr = dma_direct_link_range(dev, page, offset, size, dir, attrs);
+	else if (ops->link_range)
+		addr = ops->link_range(dev, page, offset, addr, size, dir, attrs);
+
+	kmsan_handle_dma(page, offset, size, dir);
+	debug_dma_link_range(dev, page, offset, size, dir, addr, attrs);
+	return addr;
+}
+EXPORT_SYMBOL(dma_link_range);
+
+void dma_unlink_range(struct dma_iova_attrs *iova, dma_addr_t dma_offset)
+{
+	struct device *dev = iova->dev;
+	size_t size = iova->size;
+	enum dma_data_direction dir = iova->dir;
+	unsigned long attrs = iova->attrs;
+	dma_addr_t addr = iova->addr + dma_offset;
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (dma_map_direct(dev, ops) ||
+	    arch_dma_unlink_range_direct(dev, addr + size))
+		dma_direct_unlink_range(dev, addr, size, dir, attrs);
+	else if (ops->unlink_range)
+		ops->unlink_range(dev, addr, size, dir, attrs);
+
+	debug_dma_unlink_range(dev, addr, size, dir);
+}
+EXPORT_SYMBOL(dma_unlink_range);
+
 static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
 	 int nents, enum dma_data_direction dir, unsigned long attrs)
 {
-- 
2.26.3

