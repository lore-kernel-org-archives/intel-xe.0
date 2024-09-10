Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDD1EE01FA
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5CA10E94D;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlP738Z4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D617010E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012047; x=1757548047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=joYZ81TIH/eIBTbdbAF2J6FPfvmLyVEbUGev/5YqR+M=;
 b=RlP738Z4wK5nEf9DZOFtmdcrJIrlEpySs5i8taQiT6qgoCFKsyT4Sn0I
 6jsQj5mMGp0DuT9L4j0f6Gfjt83GDIyMwAWvfabIynVhq//YOETBiywgu
 xkaplZorXToxQtOd7brEjTl9yqWEmBUHezFjwMAFEOdoxsWDEg+MHzWzj
 rkFItTfxWswN6oh1Nzp+3RzAOtMEUmz9vlUCpHKwOw/UEaguRNeyGptoO
 AZ+9TdWpiqYIjkDhi4n8BlLL0E6ZjBuJi3Wh2JaTaKarO0PCdglvdxTuP
 ytbZeKSR5WuRM50dfyUMcXiri6GvQK9t4YFQDBBcUmo7HnvPS23sO1K6R Q==;
X-CSE-ConnectionGUID: QT7skZLPRlSGNap6vjFCzQ==
X-CSE-MsgGUID: jg14ZwcLRWWWO0clX47raA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144311"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144311"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
X-CSE-ConnectionGUID: NacXsRyiTXqk39kXDmpUbg==
X-CSE-MsgGUID: y2UssrhTTcyBPqHVcyTHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989602"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 20/43] drm/xe/uc: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:40 -0700
Message-ID: <20240910234719.3335472-65-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 821b46c9b4ee..eab9456e051f 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -807,6 +807,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_mmio *mmio = &gt->mmio;
 	u64 src_offset;
 	u32 dma_ctrl;
 	int ret;
@@ -815,34 +816,34 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 
 	/* Set the source address for the uCode */
 	src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->css_offset;
-	xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
-	xe_mmio_write32(gt, DMA_ADDR_0_HIGH,
+	xe_mmio_write32(mmio, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
+	xe_mmio_write32(mmio, DMA_ADDR_0_HIGH,
 			upper_32_bits(src_offset) | DMA_ADDRESS_SPACE_GGTT);
 
 	/* Set the DMA destination */
-	xe_mmio_write32(gt, DMA_ADDR_1_LOW, offset);
-	xe_mmio_write32(gt, DMA_ADDR_1_HIGH, DMA_ADDRESS_SPACE_WOPCM);
+	xe_mmio_write32(mmio, DMA_ADDR_1_LOW, offset);
+	xe_mmio_write32(mmio, DMA_ADDR_1_HIGH, DMA_ADDRESS_SPACE_WOPCM);
 
 	/*
 	 * Set the transfer size. The header plus uCode will be copied to WOPCM
 	 * via DMA, excluding any other components
 	 */
-	xe_mmio_write32(gt, DMA_COPY_SIZE,
+	xe_mmio_write32(mmio, DMA_COPY_SIZE,
 			sizeof(struct uc_css_header) + uc_fw->ucode_size);
 
 	/* Start the DMA */
-	xe_mmio_write32(gt, DMA_CTRL,
+	xe_mmio_write32(mmio, DMA_CTRL,
 			_MASKED_BIT_ENABLE(dma_flags | START_DMA));
 
 	/* Wait for DMA to finish */
-	ret = xe_mmio_wait32(gt, DMA_CTRL, START_DMA, 0, 100000, &dma_ctrl,
+	ret = xe_mmio_wait32(mmio, DMA_CTRL, START_DMA, 0, 100000, &dma_ctrl,
 			     false);
 	if (ret)
 		drm_err(&xe->drm, "DMA for %s fw failed, DMA_CTRL=%u\n",
 			xe_uc_fw_type_repr(uc_fw->type), dma_ctrl);
 
 	/* Disable the bits once DMA is over */
-	xe_mmio_write32(gt, DMA_CTRL, _MASKED_BIT_DISABLE(dma_flags));
+	xe_mmio_write32(mmio, DMA_CTRL, _MASKED_BIT_DISABLE(dma_flags));
 
 	return ret;
 }
-- 
2.45.2

