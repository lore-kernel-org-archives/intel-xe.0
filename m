Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBE6C2BA12
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A8510E2B8;
	Fri, 14 Jun 2024 21:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+Sant3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A119610E2E0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401654; x=1749937654;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZeP8O4jFX/EotO+GRLZQnKzOMi9yxaJPUT0rTKKYrnk=;
 b=O+Sant3kw0k3Nlm+cCVRyPImkHZUeyGeYfYf3enqDyZNPJy7c6MbK/t4
 PAySdbfc9ucbJZefrh3pJEErXk/x5UTvuNjg8KAhrLt98vm8tNt0S5LHC
 kdfc4g59XojDUjBjT1Wf1LmLbCnbmkwaqBRomQ2xGWK2/5SJAlyX+GKP3
 RdcFVRPPBtQ3lXaExsIr48H51eWnx4+vnH7XcikKp62htH+ib3sd27meQ
 rSIKfRAVgPg7d9QQRz13UP7XmCV1sHKbou7hF5eb0bi5e/k2deJGjH2jz
 7yN7lrC1NHJva7jvtqgLdZT98pYzHJYJDVY7sXJywQy1Tw6uHjNjHT9go Q==;
X-CSE-ConnectionGUID: aVv4S0xFS0KjFJxZNETZjQ==
X-CSE-MsgGUID: XDyHQQQ/R6ejD5SrkA/0Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886579"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886579"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
X-CSE-ConnectionGUID: cbURsDLXQs+0x7Lirsqq0w==
X-CSE-MsgGUID: IOX5wl/PTjK4XObEd86JqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572398"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 06/44] iommu/dma: Implement link/unlink page callbacks
Date: Fri, 14 Jun 2024 17:57:39 -0400
Message-Id: <20240614215817.1097633-6-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

