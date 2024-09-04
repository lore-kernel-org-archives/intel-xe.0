Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AC9CD484D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D42A10E660;
	Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzlghW8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F52F10E638
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409277; x=1756945277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0tODx/UTatjxEtfZ8bohufMB0AB9ZiHXPRbxzzPCRKo=;
 b=KzlghW8RevBKYe9Io37vYpt5j2/TX1lvTVjQ5zKO2jq9SR0wrLuXRYEi
 fSBLQLJWjtqIjhbuizSMfi8kdEN6e8BwnTJBlAfgsk452Xb+ejOhN6Iu1
 V9882FY8NOuu6J2Eust2BB7ZFe6iNmJdDCRrVBzftIHTfH7URrQG9XRbN
 bk6u7+WAyi+IFEViAqzBzdAFePGJ82PA/bingUUgkQnBZtjKLT+koVho2
 8MOy1zD41B7KqrzovqKo1nIQtylOdHyiWQ7jld9mW+fnnyqMQpko1gaWA
 JWLbkxKAeLFg5Bo+bXSaZNV17Rrf61TpOzF6JqtCVM1SCb5zpEfzFCCV2 A==;
X-CSE-ConnectionGUID: ZBIpDIgRRSecikxfMfJ7oA==
X-CSE-MsgGUID: 1v0RZlWnT2WKbXyE4b5Vwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904817"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904817"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
X-CSE-ConnectionGUID: haFRrfiPQrSiG2VfJaUG7g==
X-CSE-MsgGUID: V/5jys9TRkWqrzBZKEBoRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944292"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 29/43] drm/xe/pat: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:30 -0700
Message-ID: <20240904002100.2023834-74-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_pat.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index f291a1730024..67ac22ce5109 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -160,7 +160,7 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
 
-		xe_mmio_write32(gt, reg, table[i].value);
+		xe_mmio_write32(&gt->mmio, reg, table[i].value);
 	}
 }
 
@@ -186,7 +186,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "PAT table:\n");
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
-		u32 pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+		u32 pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
 		u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
 
 		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
@@ -278,7 +278,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 		u32 pat;
 
 		if (xe_gt_is_media_type(gt))
-			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
 		else
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
@@ -316,10 +316,10 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
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
@@ -336,7 +336,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		if (xe_gt_is_media_type(gt))
-			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
+			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
 		else
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
@@ -355,7 +355,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	 * PPGTT entries.
 	 */
 	if (xe_gt_is_media_type(gt))
-		pat = xe_mmio_read32(gt, XE_REG(_PAT_PTA));
+		pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_PTA));
 	else
 		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
 
-- 
2.45.2

