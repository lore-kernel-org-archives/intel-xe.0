Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268AFEE01F1
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A58110E983;
	Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRU4CW4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50FF10E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012048; x=1757548048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0K06BXtTO92EhzecWrw42KuUOXJjzuba8DVgcQlkPNE=;
 b=jRU4CW4W6utVoVjhSwF3odjnRB48/JDFPGcsIwDCEFNzuoxtQYImLOoL
 MaZb4PHL6E5H7fi3Gq+8pazTM5pNUB9yPK5neYACKnlrUPF6sltdL0FH1
 vwFe4fq1Cu+CEUhyIGOJdPn9wHuaosTPZ9E8iSOYaLzEpZ76mtCyKXKh+
 jC3nQb3mrPxdjbCHu7tCa6tKq3n9N18t5GyLHHGMRNRJIF+aJSESc1vus
 6x3xzq5pJs1Hvzj7uP/Lxxgi+2BabWIcsC+rHRVa4Nt3stNePe7dkS59N
 LlhrsPfXbdGFnrOQRJCW9ODgF76zqrC3m0l8u4GHDeepIFEbm+6ShwgSL Q==;
X-CSE-ConnectionGUID: spPgGkkGQHi7LiTzZCM0uw==
X-CSE-MsgGUID: RFhmwXEsSneMA42GymzWkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144320"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144320"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
X-CSE-ConnectionGUID: jX6WiKlsRCaLhPGR92U21A==
X-CSE-MsgGUID: CDW3EHwVRhWuaTrFYNruWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989634"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 29/43] drm/xe/pat: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:49 -0700
Message-ID: <20240910234719.3335472-74-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_pat.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 5bf48e99c939..6bd6adfdfc74 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -165,7 +165,7 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
 
-		xe_mmio_write32(gt, reg, table[i].value);
+		xe_mmio_write32(&gt->mmio, reg, table[i].value);
 	}
 }
 
@@ -191,7 +191,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "PAT table:\n");
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
-		u32 pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+		u32 pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
 		u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
 
 		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
@@ -283,7 +283,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 		u32 pat;
 
 		if (xe_gt_is_media_type(gt))
-			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
 		else
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
@@ -321,10 +321,10 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
 			       int n_entries)
 {
 	program_pat(gt, table, n_entries);
-	xe_mmio_write32(gt, XE_REG(_PAT_ATS), xe2_pat_ats.value);
+	xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe2_pat_ats.value);
 
 	if (IS_DGFX(gt_to_xe(gt)))
-		xe_mmio_write32(gt, XE_REG(_PAT_PTA), xe2_pat_pta.value);
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe2_pat_pta.value);
 }
 
 static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -341,7 +341,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		if (xe_gt_is_media_type(gt))
-			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
 		else
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
@@ -360,7 +360,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	 * PPGTT entries.
 	 */
 	if (xe_gt_is_media_type(gt))
-		pat = xe_mmio_read32(gt, XE_REG(_PAT_PTA));
+		pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_PTA));
 	else
 		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
 
-- 
2.45.2

