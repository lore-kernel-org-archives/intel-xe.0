Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA48D73EA7
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144DA10E19D;
	Thu, 29 Jan 2026 23:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmBL9YXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1802410E19D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769729288; x=1801265288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jz8fTuOEZ/4QF3Vh6DxxxnTh16tW/q37MvpnwTdSWH8=;
 b=LmBL9YXgLipFrkqAs1Mvp+xqSZ822THWAOLWF4huBo8+Z15fdjWvOMC4
 CK1VvCaibfTjgxCNEL60pzrrDR/22jAqwseloXV4dgDHPP7H5tV/IqgMh
 UyzIsOamicjYMi1RraP5TUHqEkI42pSskTH99eBLGixFtmCSyzUVDEHUa
 nC3pMxBNYsVuVs/Ejn6TZw74x+IK66pFgerksSAu+UcC5aYXovdF43Fvx
 5RJPioloJUP+PqtW/40fejsYWq1399iI2aNk5yvJls0LZlmajBupnmCQa
 u6w0TewvSmXdh2zAnOta9TVHu7KX+xpM41ICNs2MpDaw+YfwpVMTmRUx8 g==;
X-CSE-ConnectionGUID: bbNQ/OIKQiuxlWpe4hvaWQ==
X-CSE-MsgGUID: vpdTrszDSm2aNms6O7+FOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96445283"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="96445283"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:28:08 -0800
X-CSE-ConnectionGUID: 40ZCLsi2SKmF+EAWwFUmtg==
X-CSE-MsgGUID: wERb2rCJQweZ2UQ6R+FsPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="209126879"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa009.fm.intel.com with ESMTP; 29 Jan 2026 15:28:08 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH] drm/xe: use entry_dump callbacks for xe2+ PAT dumps
Date: Thu, 29 Jan 2026 23:28:06 +0000
Message-ID: <20260129232806.2197213-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

Move xe2+ PAT entry printing into the entry_dump op so platform
specific logic stays localized, simplifying future maintenance.

Cc: Matt Roper <matthew.d.roper@intel.com>
Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 14d0dce5190a..c33620478c99 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -88,6 +88,8 @@ struct xe_pat_ops {
 	void (*program_media)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			      int n_entries);
 	int (*dump)(struct xe_gt *gt, struct drm_printer *p);
+	void (*entry_dump)(struct drm_printer *p, const char *label, u32 pat, bool rsvd);
+
 };
 
 static const struct xe_pat_table_entry xelp_pat_table[] = {
@@ -480,6 +482,7 @@ static const struct xe_pat_ops xe2_pat_ops = {
 	.program_graphics = program_pat_mcr,
 	.program_media = program_pat,
 	.dump = xe2_dump,
+	.entry_dump = xe2_pat_entry_dump,
 };
 
 static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -518,6 +521,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
 	.program_graphics = program_pat_mcr,
 	.program_media = program_pat,
 	.dump = xe3p_xpc_dump,
+	.entry_dump = xe3p_xpc_pat_entry_dump,
 };
 
 void xe_pat_init_early(struct xe_device *xe)
@@ -607,6 +611,9 @@ void xe_pat_init_early(struct xe_device *xe)
 	xe_assert(xe, !xe->pat.ops || xe->pat.ops->dump);
 	xe_assert(xe, !xe->pat.ops || xe->pat.ops->program_graphics);
 	xe_assert(xe, !xe->pat.ops || MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
+	if (GRAPHICS_VER(xe) >= 20) {
+		xe_assert(xe, !xe->pat.ops || xe->pat.ops->entry_dump);
+	}
 }
 
 void xe_pat_init(struct xe_gt *gt)
@@ -658,12 +665,9 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 	for (u32 i = 0; i < xe->pat.n_entries; i++) {
 		u32 pat = xe->pat.table[i].value;
 
-		if (GRAPHICS_VERx100(xe) == 3511) {
-			xe_pat_index_label(label, sizeof(label), i);
-			xe3p_xpc_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
-		} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
+		if (GRAPHICS_VERx100(xe) >= 20) {
 			xe_pat_index_label(label, sizeof(label), i);
-			xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
+			xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
 		} else if (xe->info.platform == XE_METEORLAKE) {
 			xelpg_pat_entry_dump(p, i, pat);
 		} else if (xe->info.platform == XE_PVC) {
@@ -679,14 +683,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 		u32 pat = xe->pat.pat_pta->value;
 
 		drm_printf(p, "Page Table Access:\n");
-		xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
+		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
 	}
 
 	if (xe->pat.pat_ats) {
 		u32 pat = xe->pat.pat_ats->value;
 
 		drm_printf(p, "PCIe ATS/PASID:\n");
-		xe2_pat_entry_dump(p, "PAT_ATS ", pat, false);
+		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
 	}
 
 	drm_printf(p, "Cache Level:\n");
-- 
2.43.0

