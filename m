Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B74D73EB4
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 02:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CDE10E246;
	Fri, 30 Jan 2026 02:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ygx0kqpd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAFE10E246
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 02:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769741365; x=1801277365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L46IWINd9Z+d0DFYmSDBqDWPjcDJklGDQtlymPF7n30=;
 b=Ygx0kqpd3vVMQ3qNJ0MV+Wf+S0ic3XbTJZJvAuS6SFG//KS8hgzYD4xG
 He10Rw6AvfNIbzistnej1hnRysHRNYha2We2uOIZ19zzj5RPN+9LbQfDY
 dTeK3LVLNuDLnp5jz4frRKzOKK7/xQ+Zk+DoewYkaG7gVTT5U7KJmaF37
 E0C2Lsff7+142GaHlRjjh0YeawUVdEcH8HefsKdefKsEmcFJxFdQmHZwj
 GiCv4YSkequ+KeP5IKovBq44x3Kdg4FiAZfM3s4UwAB/HrzGQfmNdTjYW
 70/5JMEn+Ic4H0tzyy+fSHt/WPvLFFO6XwtCXurvd+SILdTaaB9uqGyIR Q==;
X-CSE-ConnectionGUID: Xj/xiPxeT6CvT/DqJH9fBQ==
X-CSE-MsgGUID: AmOv5Pd1Si+KdgRK5+yHYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70967887"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="70967887"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 18:49:25 -0800
X-CSE-ConnectionGUID: UJfH/I0CStuXqfp3SWyydw==
X-CSE-MsgGUID: 1UeJWy7bQ4KlpcMn0m797w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="207988678"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa010.jf.intel.com with ESMTP; 29 Jan 2026 18:49:24 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH v3] drm/xe: use entry_dump callbacks for xe2+ PAT dumps
Date: Fri, 30 Jan 2026 02:49:23 +0000
Message-ID: <20260130024923.2219501-1-x.wang@intel.com>
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

Cc: Matt Roper <matthew.d.roper@intel.com>
Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 14d0dce5190a..b6730fb20f79 100644
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
@@ -600,20 +604,17 @@ void xe_pat_init_early(struct xe_device *xe)
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
@@ -633,7 +634,7 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (!xe->pat.ops)
+	if (IS_SRIOV_VF(xe))
 		return -EOPNOTSUPP;
 
 	return xe->pat.ops->dump(gt, p);
@@ -658,12 +659,9 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
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
@@ -679,14 +677,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
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

