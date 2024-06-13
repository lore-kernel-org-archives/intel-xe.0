Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CD0C27C6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093AA10EABA;
	Thu, 13 Jun 2024 15:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAx2Ancx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E8110EABA
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292043; x=1749828043;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZeP8O4jFX/EotO+GRLZQnKzOMi9yxaJPUT0rTKKYrnk=;
 b=CAx2Ancx6li0OzCnFyJRQJ/+XLQogiBbQltaTJOgG92eXkRy1lOS6orl
 4uBL+hZ7G3apLV8T0AoHsd52/yBITxGoYuvBVEbinLkY8US3mXGkyy2cS
 x6zprz3YavaNegCx7ddyOJCrZ/pXs8F6MuL606jKbKcbkLDNZ4N20UPBd
 TGUznvAW4a8SLVjZMlZR/e7Eu8d8gpVie5+qXkAtpc6ab9b464AXErCzH
 SV+fhxJ+6kQUa1x9EgmlGZ11h5mdTDXV2e2XV9cOI65Zru3LpjHlueJCd
 wMLskO1Lfp6VPIf7IFF4C5ga5MDkAg1NQ3KxrzgitLkRRt4IMSxUaQ2Mc Q==;
X-CSE-ConnectionGUID: 4K529Qr6QMSZlovfA1gUUA==
X-CSE-MsgGUID: +n9nUXBIQ3yUkCWxq62WeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348636"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348636"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:41 -0700
X-CSE-ConnectionGUID: kade7wTLR1GyGMosFo2KAA==
X-CSE-MsgGUID: yFcW+8DfQg6vS1XNGSNVXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135067"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:40 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 06/42] iommu/dma: Implement link/unlink page callbacks
Date: Thu, 13 Jun 2024 11:30:52 -0400
Message-Id: <20240613153128.681864-6-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
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

