Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B93CC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7B710F01D;
	Thu, 30 May 2024 00:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjSg/IL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1398510ED68
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 00:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717029208; x=1748565208;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=79hCEqXW6kA5GkI/GVs0qfwzN71FFVwxUiqc/5sw8hI=;
 b=KjSg/IL0kfS8TDKURNYJOmr2FfP3S8C+HtJ33xOioia2yjcp5xSzGzu1
 ++JqWOAY/CSEHoDePlmj4L/TR4BYY00k2ndkNOd44WbDE5Rju1KvaRKD9
 baVW4FNtcG/JWBn3CP1oE+kn5zPKnsbAEAQ9+AtJLQU2ZjBjisvLFUdc9
 wraU8OWNBBgS23yMkXaPmLxqITRmKoTC0iAE8moWurJbY7/Ko31XJHbcx
 WIOhdbjPuwYwb7UiocD/1nj11LV41vQcZbbOdzRkGGVnB/VS6Z1KhqLcf
 +NtEzmk5jOBH0q8du0nyCId+tiFI2iv2eT3MLkRRbpWmJCWW3lHSCbe5E w==;
X-CSE-ConnectionGUID: +NRuWGlXRBSOBWI+ZRDVUw==
X-CSE-MsgGUID: cnZDHzBNQZaUz7KHz09MfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30975371"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30975371"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:21 -0700
X-CSE-ConnectionGUID: dGeiHw3UR42I6sTKJnLPbA==
X-CSE-MsgGUID: H0KPnnCQTdejSjhnjks+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40088723"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:21 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 02/26] dma-mapping: provide an interface to allocate IOVA
Date: Wed, 29 May 2024 20:47:08 -0400
Message-Id: <20240530004732.84898-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240530004732.84898-1-oak.zeng@intel.com>
References: <20240530004732.84898-1-oak.zeng@intel.com>
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
index 02a1c825896b..23e5e2f63a1c 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -86,6 +86,9 @@ struct dma_map_ops {
 	size_t (*max_mapping_size)(struct device *dev);
 	size_t (*opt_mapping_size)(void);
 	unsigned long (*get_merge_boundary)(struct device *dev);
+
+	dma_addr_t (*alloc_iova)(struct device *dev, size_t size);
+	void (*free_iova)(struct device *dev, dma_addr_t dma_addr, size_t size);
 };
 
 #ifdef CONFIG_DMA_OPS
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index f693aafe221f..34a3b6420606 100644
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
@@ -150,6 +163,13 @@ void dma_vunmap_noncontiguous(struct device *dev, void *vaddr);
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
index 81de84318ccc..4d14637d186b 100644
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

