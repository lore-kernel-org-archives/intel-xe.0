Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A00CD4849
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6312310E65E;
	Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhDruw3g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FBF10E63B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409277; x=1756945277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KO/6N4OHV/g6ex2m4DDwUBVM9tw4ruXzkGIehYo3sXs=;
 b=QhDruw3gZiagQPr7fAlvEGf1GaSjm/tJ9OR1MyjV2IzjS3Gc3g17bFGo
 Mqq7Pm5Uzucu30DJb4zNtRL3B+tE4j/HcH0Sb5slz5XA1wHnRXdhUWsY7
 lCW6L3U78HQEslWZjwvtAIG4YsQwESMwphKh4OBUIAU1fATmlQcxmGNO0
 3OOOhgpdysq2t1MSNkMf3/e9FN8sJHIaIPyABam+fKzbtolMmjHPyvuJm
 fW51VkE87xngBne44bYh+ixoEJAVRFxk3HyOOAfOESaloyHW1M9PIALWN
 dHWzsadGr+H0XlbNksUjsEUZaz4Om8hXVAN98pF1gMDh7F83FnesXEojM w==;
X-CSE-ConnectionGUID: Ar+7J6ONR/6UzeXncUETtg==
X-CSE-MsgGUID: 3vcjCa2oTSCGaiApBSMypw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904818"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
X-CSE-ConnectionGUID: wFjmpbXJTOubhBbN5Z+rNg==
X-CSE-MsgGUID: 0RCy2iOIQseZn17OczesYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944296"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 30/43] drm/xe/wopcm: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:31 -0700
Message-ID: <20240904002100.2023834-75-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wopcm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index d3a99157e523..93c82825d896 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -123,8 +123,8 @@ static bool __check_layout(struct xe_device *xe, u32 wopcm_size,
 static bool __wopcm_regs_locked(struct xe_gt *gt,
 				u32 *guc_wopcm_base, u32 *guc_wopcm_size)
 {
-	u32 reg_base = xe_mmio_read32(gt, DMA_GUC_WOPCM_OFFSET);
-	u32 reg_size = xe_mmio_read32(gt, GUC_WOPCM_SIZE);
+	u32 reg_base = xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET);
+	u32 reg_size = xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE);
 
 	if (!(reg_size & GUC_WOPCM_SIZE_LOCKED) ||
 	    !(reg_base & GUC_WOPCM_OFFSET_VALID))
@@ -150,13 +150,13 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 	XE_WARN_ON(size & ~GUC_WOPCM_SIZE_MASK);
 
 	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
-	err = xe_mmio_write32_and_verify(gt, GUC_WOPCM_SIZE, size, mask,
+	err = xe_mmio_write32_and_verify(&gt->mmio, GUC_WOPCM_SIZE, size, mask,
 					 size | GUC_WOPCM_SIZE_LOCKED);
 	if (err)
 		goto err_out;
 
 	mask = GUC_WOPCM_OFFSET_MASK | GUC_WOPCM_OFFSET_VALID | huc_agent;
-	err = xe_mmio_write32_and_verify(gt, DMA_GUC_WOPCM_OFFSET,
+	err = xe_mmio_write32_and_verify(&gt->mmio, DMA_GUC_WOPCM_OFFSET,
 					 base | huc_agent, mask,
 					 base | huc_agent |
 					 GUC_WOPCM_OFFSET_VALID);
@@ -169,10 +169,10 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 	drm_notice(&xe->drm, "Failed to init uC WOPCM registers!\n");
 	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
 		   DMA_GUC_WOPCM_OFFSET.addr,
-		   xe_mmio_read32(gt, DMA_GUC_WOPCM_OFFSET));
+		   xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET));
 	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
 		   GUC_WOPCM_SIZE.addr,
-		   xe_mmio_read32(gt, GUC_WOPCM_SIZE));
+		   xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE));
 
 	return err;
 }
-- 
2.45.2

