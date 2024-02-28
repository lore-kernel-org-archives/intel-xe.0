Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130ACC47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 06:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B178910E350;
	Wed, 28 Feb 2024 06:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIE2eYPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B755E10E109
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 06:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709100626; x=1740636626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpnBIMVOuAtegerIUhU3NnxJ3SjegzZdZeyVvEtHR7Y=;
 b=LIE2eYPkYzx/hIGUUGGEv1SElRYpurTYSyUPOuR8MiA4Sj3Ir4G4PoHB
 h7FxjELs2BKW91UgvmqWCwMMqlMtHx8kKAiuKF3mbsncTSnQD3H54+0wc
 L0kvG/7ho1c7A8LMSk46NXdlnOCPAK1wyxO4Oh4zzPOA5koZDm3ajhWej
 cjDn0WzT9qUm1S8IBz8PSRppznyrD+3RYAxRNfErvQu+7zV5eWrIwIHGl
 e8NDVzThIFPCoh+4O0gOHX7ImJDs5m39gMo65Po7Iqg+eXmfl4bbQkY5B
 ZfiuaaKMB/sGSWOOZ616UcnvPyLiqgv6lmp0UpZxJM5f91KkYv/3n+tyk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25950321"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="25950321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7290291"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/5] drm/xe/mocs: Allow odd number of entries on test
Date: Tue, 27 Feb 2024 22:10:47 -0800
Message-ID: <20240228061048.3661978-5-lucas.demarchi@intel.com>
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

Refactor the mocs/l3cc kunit test to support odd number of entries. This
switches out from the "check the register value" approach to check the
entry value if it makes sense from the register read. This provides an
easier output to reason about and cross check with bspec.

Some code reordering and variable re-use was also done so the 2
functions follow more or less the same logic.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 67 +++++++++++++++++-------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 9787546e42249..25dd93ff16062 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -39,30 +39,37 @@ static int live_mocs_init(struct live_mocs *arg, struct xe_gt *gt)
 static void read_l3cc_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
+	struct kunit *test = xe_cur_kunit();
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 l3cc, l3cc_expected;
 	unsigned int i;
-	u32 l3cc;
 	u32 reg_val;
 	u32 ret;
 
-	struct kunit *test = xe_cur_kunit();
-
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
-	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
 
-	for (i = 0; i < (info->n_entries + 1) / 2; i++) {
-		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
-				    get_entry_l3cc(info, 2 * i + 1));
-
-		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
-			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
-		else
-			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
-		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
-			 XELP_LNCFCMOCS(i).addr, reg_val, l3cc);
-		if (reg_val != l3cc)
-			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val.\n",
-				   XELP_LNCFCMOCS(i).addr);
+	for (i = 0; i < info->n_entries; i++) {
+		if (!(i & 1)) {
+			if (GRAPHICS_VERx100(xe) >= 1250)
+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i >> 1));
+			else
+				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i >> 1));
+
+			mocs_dbg(&xe->drm, "reg_val=0x%x\n", reg_val);
+		} else {
+			/* Just re-use value read on previous iteration */
+			reg_val >>= 16;
+		}
+
+		l3cc_expected = get_entry_l3cc(info, i);
+		l3cc = reg_val & 0xffff;
+
+		mocs_dbg(&xe->drm, "[%u] expected=0x%x actual=0x%x\n",
+			 i, l3cc_expected, l3cc);
+
+		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
+				    "l3cc idx=%u has incorrect val.\n", i);
 	}
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
@@ -70,35 +77,35 @@ static void read_l3cc_table(struct xe_gt *gt,
 static void read_mocs_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
+	struct kunit *test = xe_cur_kunit();
 	struct xe_device *xe = gt_to_xe(gt);
-
+	u32 mocs, mocs_expected;
 	unsigned int i;
-	u32 mocs;
 	u32 reg_val;
 	u32 ret;
 
-	struct kunit *test = xe_cur_kunit();
-
 	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
 			      "Unused entries index should have been defined\n");
 
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
-	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
 
 	for (i = 0; i < info->n_entries; i++) {
-		mocs = get_entry_control(info, i);
-
-		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
+		if (GRAPHICS_VERx100(xe) >= 1250)
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
 			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
-		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
-			 XELP_GLOBAL_MOCS(i).addr, reg_val, mocs);
-		if (reg_val != mocs)
-			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val.\n",
-				   XELP_GLOBAL_MOCS(i).addr);
+
+		mocs_expected = get_entry_control(info, i);
+		mocs = reg_val;
+
+		mocs_dbg(&xe->drm, "[%u] expected=0x%x actual=0x%x\n",
+			 i, mocs_expected, mocs);
+
+		KUNIT_EXPECT_EQ_MSG(test, mocs_expected, mocs,
+				    "mocs reg 0x%x has incorrect val.\n", i);
 	}
+
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
-- 
2.43.0

