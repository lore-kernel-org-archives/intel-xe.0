Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE02AC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325C510E1F0;
	Thu, 13 Jun 2024 04:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DE15eDmN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A4A10E169
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252030; x=1749788030;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=AXT7CM30nC4cTZ9KF+5ZpQuVJnFCt5crLQ5CX1WSUAg=;
 b=DE15eDmNBPgTZx3/5B+DAwt5Fmlo38NGJchKPEDKzlcedbTQLhnugoSK
 FdxlnPpCnVP/wLm6CN2bJLjONlY+2+LTfk8bXWiTX29prR6ZYiXCdlbBP
 54d+Uc8FTqreQ+R9nl9621GATCGg9MkF01s9ZbIAbmIFwnh3yUqxoa21/
 40yXo21olneizadHqRgoJ+tzykEW0bOZuBKwxQUD9e5RU0abqkiFIXVZO
 vo6e8SNU852y6O/OvfZfb4Pr4vJCtbIF8ERQumSmw9dS7xQqXI2jXXXD5
 hE3+3gOO+xxdzuFtVOUIrHJNlUz0iWmblGwZhyVWD4AFyyGl8CBfP/wk6 A==;
X-CSE-ConnectionGUID: Wmb78IaSTQqiXxaKlghTzQ==
X-CSE-MsgGUID: yFOgtZxDR/mKezvv+9XLqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847969"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847969"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
X-CSE-ConnectionGUID: MtuxMainRAm7ZWbuvKTiOw==
X-CSE-MsgGUID: 2GccX9E2Rpq893nx2kyjGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476319"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:47 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 04/42] iommu/dma: Provide an interface to allow preallocate IOVA
Date: Thu, 13 Jun 2024 00:23:51 -0400
Message-Id: <20240613042429.637281-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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

Separate IOVA allocation to dedicated callback so it will allow
cache of IOVA and reuse it in fast paths for devices which support
ODP (on-demand-paging) mechanism.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 50 +++++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 43520e7275cc..9ce8298047f5 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -357,7 +357,7 @@ int iommu_dma_init_fq(struct iommu_domain *domain)
 	atomic_set(&cookie->fq_timer_on, 0);
 	/*
 	 * Prevent incomplete fq state being observable. Pairs with path from
-	 * __iommu_dma_unmap() through iommu_dma_free_iova() to queue_iova()
+	 * __iommu_dma_unmap() through __iommu_dma_free_iova() to queue_iova()
 	 */
 	smp_wmb();
 	WRITE_ONCE(cookie->fq_domain, domain);
@@ -758,7 +758,7 @@ static int dma_info_to_prot(enum dma_data_direction dir, bool coherent,
 	}
 }
 
-static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
+static dma_addr_t __iommu_dma_alloc_iova(struct iommu_domain *domain,
 		size_t size, u64 dma_limit, struct device *dev)
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -804,7 +804,7 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 	return (dma_addr_t)iova << shift;
 }
 
-static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
+static void __iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 		dma_addr_t iova, size_t size, struct iommu_iotlb_gather *gather)
 {
 	struct iova_domain *iovad = &cookie->iovad;
@@ -841,7 +841,7 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 
 	if (!iotlb_gather.queued)
 		iommu_iotlb_sync(domain, &iotlb_gather);
-	iommu_dma_free_iova(cookie, dma_addr, size, &iotlb_gather);
+	__iommu_dma_free_iova(cookie, dma_addr, size, &iotlb_gather);
 }
 
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
@@ -864,12 +864,12 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 
 	size = iova_align(iovad, size + iova_off);
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_mask, dev);
+	iova = __iommu_dma_alloc_iova(domain, size, dma_mask, dev);
 	if (!iova)
 		return DMA_MAPPING_ERROR;
 
 	if (iommu_map(domain, iova, phys - iova_off, size, prot, GFP_ATOMIC)) {
-		iommu_dma_free_iova(cookie, iova, size, NULL);
+		__iommu_dma_free_iova(cookie, iova, size, NULL);
 		return DMA_MAPPING_ERROR;
 	}
 	return iova + iova_off;
@@ -973,7 +973,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
 		return NULL;
 
 	size = iova_align(iovad, size);
-	iova = iommu_dma_alloc_iova(domain, size, dev->coherent_dma_mask, dev);
+	iova = __iommu_dma_alloc_iova(domain, size, dev->coherent_dma_mask, dev);
 	if (!iova)
 		goto out_free_pages;
 
@@ -1007,7 +1007,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
 out_free_sg:
 	sg_free_table(sgt);
 out_free_iova:
-	iommu_dma_free_iova(cookie, iova, size, NULL);
+	__iommu_dma_free_iova(cookie, iova, size, NULL);
 out_free_pages:
 	__iommu_dma_free_pages(pages, count);
 	return NULL;
@@ -1442,7 +1442,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	if (!iova_len)
 		return __finalise_sg(dev, sg, nents, 0);
 
-	iova = iommu_dma_alloc_iova(domain, iova_len, dma_get_mask(dev), dev);
+	iova = __iommu_dma_alloc_iova(domain, iova_len, dma_get_mask(dev), dev);
 	if (!iova) {
 		ret = -ENOMEM;
 		goto out_restore_sg;
@@ -1459,7 +1459,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	return __finalise_sg(dev, sg, nents, iova);
 
 out_free_iova:
-	iommu_dma_free_iova(cookie, iova, iova_len, NULL);
+	__iommu_dma_free_iova(cookie, iova, iova_len, NULL);
 out_restore_sg:
 	__invalidate_sg(sg, nents);
 out:
@@ -1720,6 +1720,30 @@ static size_t iommu_dma_max_mapping_size(struct device *dev)
 	return SIZE_MAX;
 }
 
+static dma_addr_t iommu_dma_alloc_iova(struct device *dev, size_t size)
+{
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
+	struct iova_domain *iovad = &cookie->iovad;
+	dma_addr_t dma_mask = dma_get_mask(dev);
+
+	size = iova_align(iovad, size);
+	return __iommu_dma_alloc_iova(domain, size, dma_mask, dev);
+}
+
+static void iommu_dma_free_iova(struct device *dev, dma_addr_t iova,
+				size_t size)
+{
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
+	struct iova_domain *iovad = &cookie->iovad;
+	struct iommu_iotlb_gather iotlb_gather;
+
+	size = iova_align(iovad, size);
+	iommu_iotlb_gather_init(&iotlb_gather);
+	__iommu_dma_free_iova(cookie, iova, size, &iotlb_gather);
+}
+
 static const struct dma_map_ops iommu_dma_ops = {
 	.flags			= DMA_F_PCI_P2PDMA_SUPPORTED |
 				  DMA_F_CAN_SKIP_SYNC,
@@ -1744,6 +1768,8 @@ static const struct dma_map_ops iommu_dma_ops = {
 	.get_merge_boundary	= iommu_dma_get_merge_boundary,
 	.opt_mapping_size	= iommu_dma_opt_mapping_size,
 	.max_mapping_size       = iommu_dma_max_mapping_size,
+	.alloc_iova		= iommu_dma_alloc_iova,
+	.free_iova		= iommu_dma_free_iova,
 };
 
 void iommu_setup_dma_ops(struct device *dev)
@@ -1786,7 +1812,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	if (!msi_page)
 		return NULL;
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	iova = __iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
 	if (!iova)
 		goto out_free_page;
 
@@ -1800,7 +1826,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	return msi_page;
 
 out_free_iova:
-	iommu_dma_free_iova(cookie, iova, size, NULL);
+	__iommu_dma_free_iova(cookie, iova, size, NULL);
 out_free_page:
 	kfree(msi_page);
 	return NULL;
-- 
2.26.3

