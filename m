Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8546C27C43
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 01:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC87112C84;
	Wed, 29 May 2024 01:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P90+mFk6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDD9112C86
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 01:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716944718; x=1748480718;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9m8zwYxMAPaGutNbhq15QE7WZofEHQowiwNzYkzJBkI=;
 b=P90+mFk6ik+RqCqmoSddik/j4S80ZVYFFWh1fUmx2lIq6yj6jUPXKH5D
 Jy82V8FptMtjNJVILdQaWzZMWyd0Q2fizQZnLyAjx8c1xSwjBN7RAReY3
 GJTAABBfymGz883PdS4Dpsp7jep19F5iyyAI9WpcueujcmgTeI80eMc92
 +ttVeoLVCgWvOLoa3lE7AWV3iqFoDVmbf39T0GlV72p1RGINlFQ9E1Lh2
 +m4yJc37sE9kyHTopAM7jY3aV6hb+VGZEGTpTmHT/XkSyuD4M5sfPvV3m
 yO2WFyuXcsWKbuoGZo6+LoK6zh3r3auHMzwtD7dKh3vZqdc0xMB4Ilgfj A==;
X-CSE-ConnectionGUID: CyY4Id+NQGueRB5aaKXjrg==
X-CSE-MsgGUID: hnSFnUCLQFS+28f3zfMiaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30849782"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="30849782"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
X-CSE-ConnectionGUID: 7onGpEtHQhmfAzInlZPGjw==
X-CSE-MsgGUID: 3JNG7xS6TdS2LnLR8ygZ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="72700487"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 02/26] dma-mapping: provide an interface to allocate IOVA
Date: Tue, 28 May 2024 21:19:00 -0400
Message-Id: <20240529011924.4125173-2-oak.zeng@intel.com>
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

Existing .map_page() callback provides two things at the same time:
allocates IOVA and links DMA pages. That combination works great for
most of the callers who use it in control paths, but less effective
in fast paths.

These advanced callers already manage their data in some sort of
database and can perform IOVA allocation in advance, leaving range
linkage operation to be in fast path.

Provide an interface to allocate/deallocate IOVA and next patch
link/unlink DMA ranges to that specific IOVA.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h |  3 +++
 include/linux/dma-mapping.h | 20 ++++++++++++++++++++
 kernel/dma/mapping.c        | 30 ++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 4abc60f04209..bd605b44bb57 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -83,6 +83,9 @@ struct dma_map_ops {
 	size_t (*max_mapping_size)(struct device *dev);
 	size_t (*opt_mapping_size)(void);
 	unsigned long (*get_merge_boundary)(struct device *dev);
+
+	dma_addr_t (*alloc_iova)(struct device *dev, size_t size);
+	void (*free_iova)(struct device *dev, dma_addr_t dma_addr, size_t size);
 };
 
 #ifdef CONFIG_DMA_OPS
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 4a658de44ee9..176fb8a86d63 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -91,6 +91,16 @@ static inline void debug_dma_map_single(struct device *dev, const void *addr,
 }
 #endif /* CONFIG_DMA_API_DEBUG */
 
+struct dma_iova_attrs {
+	/* OUT field */
+	dma_addr_t addr;
+	/* IN fields */
+	struct device *dev;
+	size_t size;
+	enum dma_data_direction dir;
+	unsigned long attrs;
+};
+
 #ifdef CONFIG_HAS_DMA
 static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
 {
@@ -101,6 +111,9 @@ static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
+int dma_alloc_iova(struct dma_iova_attrs *iova);
+void dma_free_iova(struct dma_iova_attrs *iova);
+
 dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 		size_t offset, size_t size, enum dma_data_direction dir,
 		unsigned long attrs);
@@ -159,6 +172,13 @@ void dma_vunmap_noncontiguous(struct device *dev, void *vaddr);
 int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
 		size_t size, struct sg_table *sgt);
 #else /* CONFIG_HAS_DMA */
+static inline int dma_alloc_iova(struct dma_iova_attrs *iova)
+{
+	return -EOPNOTSUPP;
+}
+static inline void dma_free_iova(struct dma_iova_attrs *iova)
+{
+}
 static inline dma_addr_t dma_map_page_attrs(struct device *dev,
 		struct page *page, size_t offset, size_t size,
 		enum dma_data_direction dir, unsigned long attrs)
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 58db8fd70471..b6b27bab90f3 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -183,6 +183,36 @@ void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
 }
 EXPORT_SYMBOL(dma_unmap_page_attrs);
 
+int dma_alloc_iova(struct dma_iova_attrs *iova)
+{
+	struct device *dev = iova->dev;
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (dma_map_direct(dev, ops) || !ops->alloc_iova) {
+		iova->addr = 0;
+		return 0;
+	}
+
+	iova->addr = ops->alloc_iova(dev, iova->size);
+	if (dma_mapping_error(dev, iova->addr))
+		return -ENOMEM;
+
+	return 0;
+}
+EXPORT_SYMBOL(dma_alloc_iova);
+
+void dma_free_iova(struct dma_iova_attrs *iova)
+{
+	struct device *dev = iova->dev;
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (dma_map_direct(dev, ops) || !ops->free_iova)
+		return;
+
+	ops->free_iova(dev, iova->addr, iova->size);
+}
+EXPORT_SYMBOL(dma_free_iova);
+
 static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
 	 int nents, enum dma_data_direction dir, unsigned long attrs)
 {
-- 
2.26.3

