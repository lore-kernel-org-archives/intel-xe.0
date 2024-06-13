Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64BAC2BA16
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B1710E969;
	Thu, 13 Jun 2024 04:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SILqnp0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FCF10E048
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252030; x=1749788030;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZeP8O4jFX/EotO+GRLZQnKzOMi9yxaJPUT0rTKKYrnk=;
 b=SILqnp0dYeyJLogGi969qsWgd/ZUi0X6ytJNYnOnpTytyCyT0rKaaRfj
 Dm7cD7KDynhTCdLxbTdgjKolSFHZ2Qbb67rxPSdGtTEO2igJG+yWfFiMB
 Ot6A5OQybHxEcqS7w5WAw9dVwZynbih7PeBDn5SEu4HoAiqjYe+WFMniG
 nM8Aun0mnSev0FWINcdU6DncTal0NNr9j3xOc8d9OWLSOuo20uancjVgQ
 uSZxQ9SLt8QbkgFgsrKTo9M7murLlNvDPUAOpKGUSrkrRso9qYhOVdTGk
 sbFlD6lzLbDCW7d9F8Xc54XrNoTsnNCWTiFN/mohTIkbdK4NsXZ0gys+U w==;
X-CSE-ConnectionGUID: DZQNFti+QL2RihWPo4tQ0w==
X-CSE-MsgGUID: Q5y+mfVaTZewcbut/AdbSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847971"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847971"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
X-CSE-ConnectionGUID: 1+M5RVZ7SaurqO/LSUa5mQ==
X-CSE-MsgGUID: FFiusTxwQzqjKnlBcWT+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476322"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:47 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 06/42] iommu/dma: Implement link/unlink page callbacks
Date: Thu, 13 Jun 2024 00:23:53 -0400
Message-Id: <20240613042429.637281-6-oak.zeng@intel.com>
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

Add an implementation of link/unlink interface to perform in map/unmap
pages in fast patch for pre-allocated IOVA.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index dbef2581a98c..ddf402e7c8a3 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1766,6 +1766,21 @@ static void iommu_dma_free_iova(struct device *dev, dma_addr_t iova,
 	__iommu_dma_free_iova(cookie, iova, size, &iotlb_gather);
 }
 
+static dma_addr_t iommu_dma_link_range(struct device *dev, struct page *page,
+				       unsigned long offset, dma_addr_t iova,
+				       size_t size, enum dma_data_direction dir,
+				       unsigned long attrs)
+{
+	return __iommu_dma_map_pages(dev, page, offset, iova, size, dir, attrs);
+}
+
+static void iommu_dma_unlink_range(struct device *dev, dma_addr_t addr,
+				   size_t size, enum dma_data_direction dir,
+				   unsigned long attrs)
+{
+	__iommu_dma_unmap_pages(dev, addr, size, dir, attrs, false);
+}
+
 static const struct dma_map_ops iommu_dma_ops = {
 	.flags			= DMA_F_PCI_P2PDMA_SUPPORTED |
 				  DMA_F_CAN_SKIP_SYNC,
@@ -1792,6 +1807,8 @@ static const struct dma_map_ops iommu_dma_ops = {
 	.max_mapping_size       = iommu_dma_max_mapping_size,
 	.alloc_iova		= iommu_dma_alloc_iova,
 	.free_iova		= iommu_dma_free_iova,
+	.link_range		= iommu_dma_link_range,
+	.unlink_range		= iommu_dma_unlink_range,
 };
 
 void iommu_setup_dma_ops(struct device *dev)
-- 
2.26.3

