Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F92C54E41
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 06:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A416D10E109;
	Wed, 28 Feb 2024 06:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnxzay+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7D410E350
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 06:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709100626; x=1740636626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j68HT3XRAmEV99jpaKmJaRRIyV7wMthA+K4e+XwvuXI=;
 b=bnxzay+B7zKGp4/D9QddU4lGeoAypEu+jYolMC/8uc+VSQ5sTtLe2zc8
 psfPbwKL0NLIVcoWbHvhjB9EZiGRSqTS85Xb/nemCXqTSFEDHTc6+npzD
 0Ll+teCLNGgdjcMpjZXFayejl3dGCycTN4Isdk9do00olrho02POZkKID
 mGwtDiNVB4rkpwtNePxCvOWJAEvGq95iCxN2RaXn6AtzZWVFAWe6kb0GD
 exMD/Cic0gHs1QGDzD8MZre4YyzQ1KGEcKg8pdNBEcpkkBK14mnN1Co54
 R8nzs3HaPPOnT7xyK4kfZtO3QbpmKkW/sswXcy9qqmzDzyO2q2KDTrJnE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25950314"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="25950314"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7290276"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/5] drm/xe/mocs: Refactor mocs/l3cc loop
Date: Tue, 27 Feb 2024 22:10:44 -0800
Message-ID: <20240228061048.3661978-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228061048.3661978-1-lucas.demarchi@intel.com>
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
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

There's no reason to keep the assignment an condition in the same
statement, particularly making use of the comma operator. Improve
readability by doing each step on its own statement. This will make
supporting odd number of entries more easily.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 17 +++++++++--------
 drivers/gpu/drm/xe/xe_mocs.c       | 19 +++++++++----------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index df0cbb2ddcb50..7c91e01c47a3a 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -49,11 +49,11 @@ static void read_l3cc_table(struct xe_gt *gt,
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
-	for (i = 0;
-	     i < (info->n_entries + 1) / 2 ?
-	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
-				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
-	     i++) {
+
+	for (i = 0; i < (info->n_entries + 1) / 2; i++) {
+		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
+				    get_entry_l3cc(info, 2 * i + 1));
+
 		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
@@ -84,9 +84,10 @@ static void read_mocs_table(struct xe_gt *gt,
 	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
 	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
 		      "Unused entries index should have been defined\n");
-	for (i = 0;
-	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
-	     i++) {
+
+	for (i = 0; i < info->n_entries; i++) {
+		mocs = get_entry_control(info, i);
+
 		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 609d997b3e9b0..001e4301c639d 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -473,9 +473,9 @@ static void __init_mocs_table(struct xe_gt *gt,
 	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
 	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
 		      "Unused entries index should have been defined\n");
-	for (i = 0;
-	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
-	     i++) {
+	for (i = 0; i < info->n_entries; i++) {
+		mocs = get_entry_control(info, i);
+
 		mocs_dbg(&gt_to_xe(gt)->drm, "GLOB_MOCS[%d] 0x%x 0x%x\n", i,
 			 XELP_GLOBAL_MOCS(i).addr, mocs);
 
@@ -511,13 +511,12 @@ static void init_l3cc_table(struct xe_gt *gt,
 	u32 l3cc;
 
 	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
-	for (i = 0;
-	     i < (info->n_entries + 1) / 2 ?
-	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
-				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
-	     i++) {
-		mocs_dbg(&gt_to_xe(gt)->drm, "LNCFCMOCS[%d] 0x%x 0x%x\n", i, XELP_LNCFCMOCS(i).addr,
-			 l3cc);
+	for (i = 0; i < (info->n_entries + 1) / 2; i++) {
+		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
+				    get_entry_l3cc(info, 2 * i + 1));
+
+		mocs_dbg(&gt_to_xe(gt)->drm, "LNCFCMOCS[%d] 0x%x 0x%x\n", i,
+			 XELP_LNCFCMOCS(i).addr, l3cc);
 
 		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
 			xe_gt_mcr_multicast_write(gt, XEHP_LNCFCMOCS(i), l3cc);
-- 
2.43.0

