Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E72CE68174
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 11:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C571510E249;
	Tue, 17 Feb 2026 11:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbTICjnC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C3B10E249
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 11:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771329066; x=1802865066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3VF3vAxU9VEmG+cDCZEThO+4pnnXSU0q+UXQ1wrM+cQ=;
 b=MbTICjnCZKPtdGhcEcrryaXgCPPHRolV/BiAS6NU2xr9bDykneBNU60o
 JodmtwplJ52h61p/xUyCLbiSdBr7ZGPJgT2YTM/yGo9BqSRRbVQ3ACIvL
 5n3ABJd1apqle0lFa1IsRKxVEdSkYE2ia0275cmzNFnDfhjWKtRgFuzFm
 TWtAtlMId19/I/KWl/OohcgxT23BSZrUAeg5gjYEVFfrCaqxxALui4e/G
 Ye09StWUZt70GETx1IVYgZLJ72KGDRhw2U8yUPWcx5xPP6/kie3IgoKga
 feSjBXoWwXn2RYQ5Zrm0Z1EWDrjNjRuva5RbiT65ecXZINdSoJGUdHa80 A==;
X-CSE-ConnectionGUID: a0RNHjoaSFu2M3moXwXh4g==
X-CSE-MsgGUID: TWEik8BiSsu3IZeqSGKibQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83495368"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="83495368"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:51:05 -0800
X-CSE-ConnectionGUID: 4OpD+9Q7TliCXNPswcx9jA==
X-CSE-MsgGUID: tq0dgbLOS1i6UrQZ9fcgxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="251546412"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 17 Feb 2026 03:51:02 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/3] drm/xe/hw_error: Reuse CSC worker for generic error
 handling
Date: Tue, 17 Feb 2026 17:16:32 +0530
Message-ID: <20260217114656.2546878-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217114656.2546878-1-raag.jadav@intel.com>
References: <20260217114656.2546878-1-raag.jadav@intel.com>
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

We have upcoming usecases which require defering work during error
handling. Since we already have CSC worker in place, prepare it to
be reused generically.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c   | 10 +++++-----
 drivers/gpu/drm/xe/xe_tile_types.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index eb557266d083..b704eab7d3bd 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -51,9 +51,9 @@ static bool fault_inject_csc_hw_error(void)
 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
 }
 
-static void csc_hw_error_work(struct work_struct *work)
+static void hw_error_work(struct work_struct *work)
 {
-	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
+	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
 	int ret;
 
@@ -90,7 +90,7 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
 					     err_bit);
 
-			schedule_work(&tile->csc_hw_error_work);
+			schedule_work(&tile->hw_error_work);
 		}
 	}
 
@@ -139,7 +139,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 	enum hardware_error hw_err;
 
 	if (fault_inject_csc_hw_error())
-		schedule_work(&tile->csc_hw_error_work);
+		schedule_work(&tile->hw_error_work);
 
 	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
 		if (master_ctl & ERROR_IRQ(hw_err))
@@ -193,7 +193,7 @@ void xe_hw_error_init(struct xe_device *xe)
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
+	INIT_WORK(&tile->hw_error_work, hw_error_work);
 
 	if (xe->info.platform == XE_CRESCENTISLAND)
 		xe_hw_error_irq_route(xe);
diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
index 33932fd547d7..f214e893f39e 100644
--- a/drivers/gpu/drm/xe/xe_tile_types.h
+++ b/drivers/gpu/drm/xe/xe_tile_types.h
@@ -116,8 +116,8 @@ struct xe_tile {
 	/** @memirq: Memory Based Interrupts. */
 	struct xe_memirq memirq;
 
-	/** @csc_hw_error_work: worker to report CSC HW errors */
-	struct work_struct csc_hw_error_work;
+	/** @hw_error_work: worker to handle HW errors */
+	struct work_struct hw_error_work;
 
 	/** @pcode: tile's PCODE */
 	struct {
-- 
2.43.0

