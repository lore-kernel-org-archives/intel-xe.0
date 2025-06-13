Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBDCC71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 21:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643A210EA52;
	Fri, 13 Jun 2025 21:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1+DcnJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C954010EA52
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 21:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749851284; x=1781387284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3U/caseseC+aN37Az/rMVt0QQbMycaUdtV/PfIp4Yy0=;
 b=C1+DcnJqL2ix9Iya4Q4L+8jLE5ecGO2HKJ5K1+AIej7ozj5BjIcfXMOl
 VFU3Ti4DLflf2/KFoQJYArccBhe4T6PXrto8YXSoH8fQw5KOmyROQlm8b
 QCXyset3bcaYEyt30VcsFjHLLIvLw1JhkXer2uwZRCwWY7n2BXFhhwE+C
 w8Qu1TIekgfpVYUcgbrGfn61ecfri3vWTbVubSQSlags01M3qDuw1baxX
 ENMGAKl4VfOC6rDC/QmxtjoUy2rC/Ix7Z9o/PA1iqlLqHW+yhxwu8OLWb
 NkkLGMH10KOa5Id1Cj7UDFW2+UwJcX61u+Vgo+0veUXn3gnlyyfVzmH6P A==;
X-CSE-ConnectionGUID: EGbgrRQBT7uTzr6ttiC5hA==
X-CSE-MsgGUID: z1ITQGZxR+ac1xZx7nI+og==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51190550"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="51190550"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:48:02 -0700
X-CSE-ConnectionGUID: rFe0qLogSWySubepNPSySA==
X-CSE-MsgGUID: m/IPjBf/RJSElF/ccoHx0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="147830245"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:48:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe/pat: Consolidate PAT programming logic for pre-Xe2
 and post-Xe2
Date: Fri, 13 Jun 2025 14:47:53 -0700
Message-ID: <20250613214751.792066-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613214751.792066-3-matthew.d.roper@intel.com>
References: <20250613214751.792066-3-matthew.d.roper@intel.com>
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

Now that the PAT settings for the new special entries introduced by Xe2
are decided during early software init and left NULL on platforms they
don't apply to, there's no need to keep separate programming functions
for pre-Xe2 and post-Xe2 platforms.  Consolidate down to a single pair
of programming functions (mcr and non-mcr) that can be used on any
platform.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 44 ++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 31663ead7822..2e7cb99ae87a 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -163,21 +163,35 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			int n_entries)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
 
 		xe_mmio_write32(&gt->mmio, reg, table[i].value);
 	}
+
+	if (xe->pat.pat_ats)
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe->pat.pat_ats->value);
+	if (xe->pat.pat_pta)
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe->pat.pat_pta->value);
 }
 
 static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			    int n_entries)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
 
 		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
 	}
+
+	if (xe->pat.pat_ats)
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->value);
+	if (xe->pat.pat_pta)
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe->pat.pat_pta->value);
 }
 
 static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -304,32 +318,6 @@ static const struct xe_pat_ops xelpg_pat_ops = {
 	.dump = xelpg_dump,
 };
 
-static void xe2lpg_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
-			       int n_entries)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	program_pat_mcr(gt, table, n_entries);
-
-	if (xe->pat.pat_ats)
-		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->value);
-	if (xe->pat.pat_pta)
-		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe->pat.pat_pta->value);
-}
-
-static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
-			       int n_entries)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	program_pat(gt, table, n_entries);
-
-	if (xe->pat.pat_ats)
-		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe->pat.pat_ats->value);
-	if (xe->pat.pat_pta)
-		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe->pat.pat_pta->value);
-}
-
 static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -382,8 +370,8 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
-	.program_graphics = xe2lpg_program_pat,
-	.program_media = xe2lpm_program_pat,
+	.program_graphics = program_pat_mcr,
+	.program_media = program_pat,
 	.dump = xe2_dump,
 };
 
-- 
2.49.0

