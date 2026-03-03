Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC17EDEBF1
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 20:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729310E06E;
	Tue,  3 Mar 2026 20:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lk0g8IRR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFD410E06E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 20:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772570805; x=1804106805;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=7XTkNcujj1ebnpyqJTPt+koASVXnGwG+66hc8toPzOc=;
 b=lk0g8IRRoSVUvkzmDi6QB9lTKuwJegX/emwjMLz8HjGsHYtCrW8FyoH8
 CpSgl4o0VhXGS6n/NfjzGV9+QH8PPt+MrAQKT1NIVHQHVqm0insvQraOv
 XgJNYUlpedLCTQWSO8+SDmnj3VCh1nz4VSbGJTAcTbwp/nZjajUxCt0x4
 DdyklWO75pblp1JFoUvIOU6O7ep+cgzSaxwuZQM7eQ8IkkfcMb/APtZFn
 Sen1z/JY1BPPcPxD9VZ/CpAu07QmiRpO3d7Md8siwBaSZm0IeTmfJf1fu
 RyE6rPgaamPR60MCRElcdFIQmmnrwt69C7oQWCGAmrTyT+2e8mjF5ew1b w==;
X-CSE-ConnectionGUID: Hos0cluaTmegroAlCp0UEw==
X-CSE-MsgGUID: zVEDL19vS+uDD/Dvt7voQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84260128"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="84260128"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:46:44 -0800
X-CSE-ConnectionGUID: 7UaH7bSbRvuXsIBB6sxu2Q==
X-CSE-MsgGUID: 1ynnRb6GQ0CJM0Ayg1dwbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="241124687"
Received: from mjruhl-desk.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.75])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:46:43 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 03 Mar 2026 17:46:17 -0300
Subject: [PATCH] drm/xe/pat: Extract gt_pta_entry()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-pat-gt_pta_entry-v1-1-0dee8e1e7bd9@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBNMI6KrRMRoY83GRCWK6O5Jy
 7f4/4FMiSnDKB5IdHLmI1S0jQC3Y9hI8loNWuleGWVkxCK3ssSCC4WSbomm096azlk/QM1iIs/
 Xv5zm9/0AbOUlSWIAAAA=
X-Change-ID: 20260303-pat-gt_pta_entry-a342fb34cbf8
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Avoid code duplication by extracting the logic for selection of the
correct PAT_PTA entry for a GT into function gt_pta_entry() and using
that function whenever necessary.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index f840d9a58740..34c9031e1e74 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -311,10 +311,25 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
 	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
 }
 
+static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe_gt_is_main_type(gt))
+		return xe->pat.pat_primary_pta;
+
+	if (xe_gt_is_media_type(gt))
+		return xe->pat.pat_media_pta;
+
+	xe_assert(xe, false);
+	return NULL;
+}
+
 static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			int n_entries)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
 
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
@@ -324,16 +339,16 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
 
 	if (xe->pat.pat_ats)
 		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe->pat.pat_ats->value);
-	if (xe->pat.pat_primary_pta && xe_gt_is_main_type(gt))
-		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe->pat.pat_primary_pta->value);
-	if (xe->pat.pat_media_pta && xe_gt_is_media_type(gt))
-		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe->pat.pat_media_pta->value);
+
+	if (pta_entry)
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), pta_entry->value);
 }
 
 static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			    int n_entries)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
 
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
@@ -343,10 +358,9 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 
 	if (xe->pat.pat_ats)
 		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->value);
-	if (xe->pat.pat_primary_pta && xe_gt_is_main_type(gt))
-		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe->pat.pat_primary_pta->value);
-	if (xe->pat.pat_media_pta && xe_gt_is_media_type(gt))
-		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe->pat.pat_media_pta->value);
+
+	if (pta_entry)
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry->value);
 }
 
 static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -677,8 +691,7 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	const struct xe_pat_table_entry *pta_entry = xe_gt_is_main_type(gt) ?
-		xe->pat.pat_primary_pta : xe->pat.pat_media_pta;
+	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
 	char label[PAT_LABEL_LEN];
 
 	if (!xe->pat.table || !xe->pat.n_entries)

---
base-commit: cfc20c776480fda8c1b0517b187bb71ec0781cd4
change-id: 20260303-pat-gt_pta_entry-a342fb34cbf8

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

