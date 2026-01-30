Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A9AE6BF2F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 17:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7852910EA33;
	Fri, 30 Jan 2026 17:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i6ObNDVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539E710EA33
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769795631; x=1801331631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h0LHR6QLLPns4yxNxN3Nr3ina4S7dw4TSoCyWFMLiN4=;
 b=i6ObNDVy/xrtYgtFvgR38ZE9b6rVQJpx1uVOY9r3atb9nYvJRQY3bm9T
 prC0dqP2fRcTR4VKZFAOS8arfmTlh3A1YZgb+QZYKAlyHdTiIngTG78DC
 Wsigm9jwen4YLhDtIUtoU3Y+1f6B3NuThYHfemmCn5tUBg7ssG30d5ZGd
 EnUQbLiMLqCo3iX1cOsEjIcHBqVEy+E38bkptavxqja9dQH/1LcyCdxdw
 lGRSFMMQnHjgzwiAMwcInkiJqBjabAi2J/IpaNPDH71rYDLA1RfDE0kcD
 n3wKHgmrSWSWdp0OC+YUfQjQ4i27Zgk+1oL/TVDDGOWFq0fZqo6iFEGq/ A==;
X-CSE-ConnectionGUID: vkKhjGd2RzqsCiLqSydC5g==
X-CSE-MsgGUID: qbOP8KljTlebU+EXw2Gj/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="82474870"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="82474870"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 09:53:51 -0800
X-CSE-ConnectionGUID: dwrgZ0fQSmeJB9UoptGSYg==
X-CSE-MsgGUID: V2eKWz6XSFyDG4+DwfhnYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="239635466"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa002.jf.intel.com with ESMTP; 30 Jan 2026 09:53:51 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH v4] drm/xe: use entry_dump callbacks for xe2+ PAT dumps
Date: Fri, 30 Jan 2026 17:53:49 +0000
Message-ID: <20260130175349.2249033-1-x.wang@intel.com>
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

v2:
 - Do not null xe->pat.ops for VFs.
 - Skip PAT init and dump on VFs (-EOPNOTSUPP), avoiding NULL ops use.

v3:
 - fixed typo

v4: (Matt)
 - Switch xe2_dump() to use the new ops->entry_dump() vfunc.
 - Remove xe3p_xpc_dump() and reuse the common xe2_dump() for Xe3p XPC.
 - This also fixes Xe3p_HPM media PAT dumping by using the proper
non-MCR access for the PAT register range (bspec 76445).

Cc: Matt Roper <matthew.d.roper@intel.com>
Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 67 +++++++++----------------------------
 1 file changed, 16 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 14d0dce5190a..2cd3fd1c3953 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -88,6 +88,7 @@ struct xe_pat_ops {
 	void (*program_media)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			      int n_entries);
 	int (*dump)(struct xe_gt *gt, struct drm_printer *p);
+	void (*entry_dump)(struct drm_printer *p, const char *label, u32 pat, bool rsvd);
 };
 
 static const struct xe_pat_table_entry xelp_pat_table[] = {
@@ -458,7 +459,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
 		xe_pat_index_label(label, sizeof(label), i);
-		xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
+		xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
 	}
 
 	/*
@@ -471,7 +472,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
 
 	drm_printf(p, "Page Table Access:\n");
-	xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
+	xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
 
 	return 0;
 }
@@ -480,44 +481,14 @@ static const struct xe_pat_ops xe2_pat_ops = {
 	.program_graphics = program_pat_mcr,
 	.program_media = program_pat,
 	.dump = xe2_dump,
+	.entry_dump = xe2_pat_entry_dump,
 };
 
-static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	u32 pat;
-	int i;
-	char label[PAT_LABEL_LEN];
-
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref.domains)
-		return -ETIMEDOUT;
-
-	drm_printf(p, "PAT table: (* = reserved entry)\n");
-
-	for (i = 0; i < xe->pat.n_entries; i++) {
-		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
-
-		xe_pat_index_label(label, sizeof(label), i);
-		xe3p_xpc_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
-	}
-
-	/*
-	 * Also print PTA_MODE, which describes how the hardware accesses
-	 * PPGTT entries.
-	 */
-	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
-
-	drm_printf(p, "Page Table Access:\n");
-	xe3p_xpc_pat_entry_dump(p, "PTA_MODE", pat, false);
-
-	return 0;
-}
-
 static const struct xe_pat_ops xe3p_xpc_pat_ops = {
 	.program_graphics = program_pat_mcr,
 	.program_media = program_pat,
-	.dump = xe3p_xpc_dump,
+	.dump = xe2_dump,
+	.entry_dump = xe3p_xpc_pat_entry_dump,
 };
 
 void xe_pat_init_early(struct xe_device *xe)
@@ -600,20 +571,17 @@ void xe_pat_init_early(struct xe_device *xe)
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
 
-	/* VFs can't program nor dump PAT settings */
-	if (IS_SRIOV_VF(xe))
-		xe->pat.ops = NULL;
-
-	xe_assert(xe, !xe->pat.ops || xe->pat.ops->dump);
-	xe_assert(xe, !xe->pat.ops || xe->pat.ops->program_graphics);
-	xe_assert(xe, !xe->pat.ops || MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
+	xe_assert(xe, xe->pat.ops->dump);
+	xe_assert(xe, xe->pat.ops->program_graphics);
+	xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
+	xe_assert(xe, GRAPHICS_VER(xe) < 20 || xe->pat.ops->entry_dump);
 }
 
 void xe_pat_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (!xe->pat.ops)
+	if (IS_SRIOV_VF(xe))
 		return;
 
 	if (xe_gt_is_media_type(gt))
@@ -633,7 +601,7 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (!xe->pat.ops)
+	if (IS_SRIOV_VF(xe))
 		return -EOPNOTSUPP;
 
 	return xe->pat.ops->dump(gt, p);
@@ -658,12 +626,9 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 	for (u32 i = 0; i < xe->pat.n_entries; i++) {
 		u32 pat = xe->pat.table[i].value;
 
-		if (GRAPHICS_VERx100(xe) == 3511) {
-			xe_pat_index_label(label, sizeof(label), i);
-			xe3p_xpc_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
-		} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
+		if (GRAPHICS_VER(xe) >= 20) {
 			xe_pat_index_label(label, sizeof(label), i);
-			xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
+			xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
 		} else if (xe->info.platform == XE_METEORLAKE) {
 			xelpg_pat_entry_dump(p, i, pat);
 		} else if (xe->info.platform == XE_PVC) {
@@ -679,14 +644,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
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

