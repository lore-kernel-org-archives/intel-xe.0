Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D84C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 19:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A6710FD42;
	Thu, 14 Mar 2024 19:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZcnQQeon";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044BB10FD3B
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 19:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710446313; x=1741982313;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZJM8rDiBsECf/qsHjSr31zw2SyrYH9CCSZeurge5iBI=;
 b=ZcnQQeonCF//QjboudWVn5DknfVSz+H5Pgb79PAnusxnDONVr6wBxU0+
 HFQNF4TSi6PDvFP/jgyql8F1SioXlAAw1VjRmgVtpb631anXC+JQ54PMf
 NHl69hhQbX6LdGkD9K3x3skoTwwJc7vVxoHYVrC/mUNJxUslIQjN0QHK1
 ZrmAsuEecLwjBXO7E5OyExR42gCJatlj0yYzbTtXBBkfhzCwRVXA0b1cw
 QzbcyF/LXEPuLNW90yW7LaXHKxeSwm/AmMIF7ybeAsCFgaIoU1mR3PD1D
 DjlXVsM61CsIwhsJKoI1gLiGVS/NRbbb7XEUOkyBSrky94iiSgLE1Id/9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5422606"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5422606"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 12:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12309183"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 12:58:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe/mocs: Determine MCR separately for primary/media
 GT in kunit test
Date: Thu, 14 Mar 2024 12:58:26 -0700
Message-ID: <20240314195825.3226856-3-matthew.d.roper@intel.com>
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

Although MOCS registers became multicast in graphics version 12.50 on
the primary GT, this transition did not happen until version 20 on the
media GT.  Considering each GT independently is mostly important for
MTL/ARL where the Xe_LPM+ IP has non-MCR MOCS registers, even though
Xe_LPG IP has MCR registers.

Bspec: 67789, 71186
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c |  4 ++--
 drivers/gpu/drm/xe/xe_mocs.c       | 14 ++++++++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 25dd93ff1606..7fd99ba96a12 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -51,7 +51,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 
 	for (i = 0; i < info->n_entries; i++) {
 		if (!(i & 1)) {
-			if (GRAPHICS_VERx100(xe) >= 1250)
+			if (regs_are_mcr(gt))
 				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i >> 1));
 			else
 				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i >> 1));
@@ -91,7 +91,7 @@ static void read_mocs_table(struct xe_gt *gt,
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->n_entries; i++) {
-		if (GRAPHICS_VERx100(xe) >= 1250)
+		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
 			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index f56f630fa29d..35ccd4ac00d2 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -466,6 +466,16 @@ static u32 get_entry_control(const struct xe_mocs_info *info,
 	return info->table[info->unused_entries_index].control_value;
 }
 
+static bool regs_are_mcr(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe_gt_is_media_type(gt))
+		return MEDIA_VER(xe) >= 20;
+	else
+		return GRAPHICS_VERx100(xe) >= 1250;
+}
+
 static void __init_mocs_table(struct xe_gt *gt,
 			      const struct xe_mocs_info *info)
 {
@@ -485,7 +495,7 @@ static void __init_mocs_table(struct xe_gt *gt,
 		mocs_dbg(&gt_to_xe(gt)->drm, "GLOB_MOCS[%d] 0x%x 0x%x\n", i,
 			 XELP_GLOBAL_MOCS(i).addr, mocs);
 
-		if (GRAPHICS_VERx100(gt_to_xe(gt)) > 1250)
+		if (regs_are_mcr(gt))
 			xe_gt_mcr_multicast_write(gt, XEHP_GLOBAL_MOCS(i), mocs);
 		else
 			xe_mmio_write32(gt, XELP_GLOBAL_MOCS(i), mocs);
@@ -525,7 +535,7 @@ static void init_l3cc_table(struct xe_gt *gt,
 		mocs_dbg(&gt_to_xe(gt)->drm, "LNCFCMOCS[%d] 0x%x 0x%x\n", i,
 			 XELP_LNCFCMOCS(i).addr, l3cc);
 
-		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
+		if (regs_are_mcr(gt))
 			xe_gt_mcr_multicast_write(gt, XEHP_LNCFCMOCS(i), l3cc);
 		else
 			xe_mmio_write32(gt, XELP_LNCFCMOCS(i), l3cc);
-- 
2.43.0

