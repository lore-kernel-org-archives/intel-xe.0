Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D52C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 21:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C61110EA51;
	Fri, 13 Jun 2025 21:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfUmhodf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002C310EA51
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 21:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749851282; x=1781387282;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FZfI0WllF0xTOaZynYdcdbn9pAHFndwWB+/ImdKcHrU=;
 b=UfUmhodfd60fMI1kk18Y01HrOJ18xRCBq/xbjHLiIpwBLNOo5bH5V0iW
 rPcpmQNJx3ngBw8XjOroxwJ6B+Mroze4ld5f3pK1yZLbgMmoYlsXl543A
 SDTF4y42GzxKmVjKfv/OTJtHUv6J0y/u7F2zSavOKRIqb//sE1J2ExkAr
 l7hcD7UYu2tGa59uor4uo+uYqI0IJpykZlStyve8racgx1LoV3YPBhYSD
 84tLiAIkfwmDbViZMdDLqeRDgECPUIZCpKVkKEdNJioeVvQ2SiX/fFNvK
 CZ1Us3cxi35kN0tC32a/bIsUEWuGrOV15sh/sg1EgsaU/dFVhI3qAh2Ou A==;
X-CSE-ConnectionGUID: layQJPL1QuCnGt72Yh5PTg==
X-CSE-MsgGUID: 6xH80/xVSBOHYjCZkNtKGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51190548"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="51190548"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:48:01 -0700
X-CSE-ConnectionGUID: BS5z2nHlR1eq1mR6FRGtAQ==
X-CSE-MsgGUID: Ejoml3RtR0aSj0DFaNzGSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="147830235"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:48:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe/pat: Determine ATS / PTA programming during early
 sw init
Date: Fri, 13 Jun 2025 14:47:52 -0700
Message-ID: <20250613214751.792066-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
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

Decide whether programming of the special ATS and PTA PAT entries is
necessary (and which entries should be programmed) during early software
initialization rather than hardcoding this into the 'program' functions.
Future platforms may want to re-use the same functions but utilize
different special entry values.  Consolidating all of the decisions
into one place keeps things simple.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_pat.c          | 21 +++++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ac27389ccb8b..003afb279a5e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -499,6 +499,10 @@ struct xe_device {
 		const struct xe_pat_table_entry *table;
 		/** @pat.n_entries: Number of PAT entries */
 		int n_entries;
+		/** @pat.ats_entry: PAT entry for PCIe ATS responses */
+		const struct xe_pat_table_entry *pat_ats;
+		/** @pat.pta_entry: PAT entry for page table accesses */
+		const struct xe_pat_table_entry *pat_pta;
 		u32 idx[__XE_CACHE_LEVEL_COUNT];
 	} pat;
 
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 38a6a49c1b2a..31663ead7822 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -307,21 +307,27 @@ static const struct xe_pat_ops xelpg_pat_ops = {
 static void xe2lpg_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			       int n_entries)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	program_pat_mcr(gt, table, n_entries);
-	xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe2_pat_ats.value);
 
-	if (IS_DGFX(gt_to_xe(gt)))
-		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe2_pat_pta.value);
+	if (xe->pat.pat_ats)
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->value);
+	if (xe->pat.pat_pta)
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe->pat.pat_pta->value);
 }
 
 static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			       int n_entries)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	program_pat(gt, table, n_entries);
-	xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe2_pat_ats.value);
 
-	if (IS_DGFX(gt_to_xe(gt)))
-		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe2_pat_pta.value);
+	if (xe->pat.pat_ats)
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe->pat.pat_ats->value);
+	if (xe->pat.pat_pta)
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe->pat.pat_pta->value);
 }
 
 static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -386,6 +392,9 @@ void xe_pat_init_early(struct xe_device *xe)
 	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
 		xe->pat.ops = &xe2_pat_ops;
 		xe->pat.table = xe2_pat_table;
+		xe->pat.pat_ats = &xe2_pat_ats;
+		if (IS_DGFX(xe))
+			xe->pat.pat_pta = &xe2_pat_pta;
 
 		/* Wa_16023588340. XXX: Should use XE_WA */
 		if (GRAPHICS_VERx100(xe) == 2001)
-- 
2.49.0

