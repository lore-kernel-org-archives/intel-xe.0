Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280F2C27C78
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9EF10E76F;
	Wed, 12 Jun 2024 02:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CnwFbQAf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0AF10E76F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158540; x=1749694540;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZeP8O4jFX/EotO+GRLZQnKzOMi9yxaJPUT0rTKKYrnk=;
 b=CnwFbQAfAHA+Hb3IvhWwF8jsZ7NFP0KPCWOeju4v7+gv9drLz/lbEFmF
 nOnO8PG+3vWaevFCCSZGbH/phowcZ5aa+A94r/o1MAJ5ixN2AecvmE85K
 9IOGbB1/gIv1f6GBVzk16eRmjGMP4G0tp5r0SmXAbdFLnIO/6SRYY0JSh
 7TpWia62u79wYiP6g7GT4kD8cZAYu+MSYDRzfEUMf6XLRtICo0Yl1DbJz
 luw4QlMSx2cgJfbQV1W2QaiIt7ZgEvrqem5RrqUkCkkfrd/CytHuCSjXO
 aoJXyhdfHLx5iN4DyPKzxtIRFJ9/c6b1A91jprrZfoZLul2CQO8DEM3p4 A==;
X-CSE-ConnectionGUID: t2+gXe2aSi+pyCOcLWD8sg==
X-CSE-MsgGUID: ZswRR8pKS5Giv1i9jTQtXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427802"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427802"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: uVQxY/vYST6yrp2O5KQ52g==
X-CSE-MsgGUID: w4IDKwImTfeLY82P7fUdyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763622"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 06/43] iommu/dma: Implement link/unlink page callbacks
Date: Tue, 11 Jun 2024 22:25:28 -0400
Message-Id: <20240612022605.385062-6-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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

