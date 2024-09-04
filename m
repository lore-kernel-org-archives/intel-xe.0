Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE21CD484A
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C24410E65F;
	Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+H8e2rr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBD610E64A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409278; x=1756945278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5CbedbB7Fd5ACmYHeOpNwl9ziEcwGkHEsMS1SBAIWcY=;
 b=l+H8e2rr1/4I/pAmXgCrwKyM/3TM8L+GGGKXy6qGW/sTo5YFe+qGT+d5
 lBH4TwKLP+UFWJqHzvh23eXIJVxSBbA5kXbM1LvZcKvV7bYVVR+uNmIc6
 NNhMzzhPt+NCQOLmh5U7bYVc6Bga8EeyhhyP4WbWnMBl071pmTfEKbCAt
 fsL6MgdmMDLBCXKV/m87UeZXjSxvdaWKyrKgxEz83T2chQykQuFlE5HFv
 dhLPxzAMRhoaiiffJWdrBCrxSSUlQwKgFdcS62NY7ShV8GDWn1ZjLJaex
 j/Mxz4NmsBToNwujDldQZG54DrVZODXiKMPU/4LpeZvtsH6FPAELHk8VW g==;
X-CSE-ConnectionGUID: YJhgKVV1TSOVfYa6KBeZew==
X-CSE-MsgGUID: 7nMfr5naQ9uXPPgXEy9lpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904827"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
X-CSE-ConnectionGUID: XVNjbyp3SmuLbq5/fpquIQ==
X-CSE-MsgGUID: GOCtQCsfTwOSRIFrpr3Drw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944324"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 36/43] drm/xe/gt: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:37 -0700
Message-ID: <20240904002100.2023834-81-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_gt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dd96dec95b19..4a768b5f9542 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -110,7 +110,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 		return;
 
 	if (!xe_gt_is_media_type(gt)) {
-		xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
+		xe_mmio_write32(&gt->mmio, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
 		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 		reg |= CG_DIS_CNTLBUS;
 		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
@@ -247,7 +247,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 			else if (entry->clr_bits + 1)
 				val = (reg.mcr ?
 				       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
-				       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
+				       xe_mmio_read32(&gt->mmio, reg)) & (~entry->clr_bits);
 			else
 				val = 0;
 
@@ -442,7 +442,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	 * Stash hardware-reported version.  Since this register does not exist
 	 * on pre-MTL platforms, reading it there will (correctly) return 0.
 	 */
-	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
+	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
@@ -652,8 +652,8 @@ static int do_gt_reset(struct xe_gt *gt)
 
 	xe_gsc_wa_14015076503(gt, true);
 
-	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
-	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
+	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
+	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
 	if (err)
 		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
 			  ERR_PTR(err));
-- 
2.45.2

