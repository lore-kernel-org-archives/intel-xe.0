Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6668DC87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 20:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2904210EA12;
	Fri, 25 Jul 2025 20:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAsEByvC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E919C10EA12
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 20:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753475393; x=1785011393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9GnIHFTk9hzXPxZtL/S5z9aAjklfxIriE0qed1Np8Q0=;
 b=PAsEByvCe1hZWwcOps7QZ+RJmayiqEjhAD4WJ2D/SRH+h/dUCv2dPiwQ
 yPyzCQg39cirC3sTAiVYqphwgCqwtAO+5egTh1Q+QQ3CKBJjlGL5mjD58
 vXlqJZMRRJazlEUbjaYtc9+R8suPFRM2vewHDrSdDLQ+Oj6dTNQShI0aa
 FEWwtHsg+6udluTfP3SQhQVYZaITuJXhlbUArscQm9BmCK9KzsgBeMLQL
 XYtqS6hMkPkQliqAAuxVzCwRi1WobyXpl1VKfsgYwl2jhpTomf+7HfbUH
 1wg76qA51QpuigXhhZZ3GFvbyHnZeJm0k1/bZ5Vl/5e6W6ZOUkJr5XKpv A==;
X-CSE-ConnectionGUID: h9gohZ+PSMaO6dv3uzzVkw==
X-CSE-MsgGUID: CGmv0MRmQEmbNbn94p6Axg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55899200"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55899200"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 13:29:47 -0700
X-CSE-ConnectionGUID: 0x2S4Vq5TCigwNWx4Yw28A==
X-CSE-MsgGUID: BN9gEPeOT+uGSUFeMTmmhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161472173"
Received: from dut4086lnl.fm.intel.com ([10.105.10.26])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 13:29:46 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 lucas.demarchi@intel.com, daniele.ceraolospurio@intel.com,
 shuicheng.lin@intel.com, john.c.harrison@intel.com
Subject: [PATCH v4] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions
Date: Fri, 25 Jul 2025 20:29:46 +0000
Message-ID: <20250725202945.85432-2-jonathan.cavitt@intel.com>
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

Presently, multiple versions of the guc_waklv_enable_.* function exist,
all with different numbers of dwords added to the klv_entry array.  This
is not extensible, and more duplicates of the function will need to be
created if it ever becomes necessary to support 3 or more dwords per wa
in the future.

Consolidate the disparate guc_waklv_enable functions into a single
guc_waklv_enable function that can take an arbitrary number of dword
values.

v2:
- Update length value properly (Shuicheng)

v3: (Harrison)
- Use data as a term instead of dwords or arr
- Reformat warning message to use hex values
- Eliminate need for kzalloc and klv_entry array
- Reorder function parameters to fix line wrapping

v4:
- Miscellaneous formatting fixes (Cavitt)

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Lucas De Marchi <lucas.demarch@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 136 +++++++++-----------------------
 1 file changed, 39 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 8ff8626227ae..fc44c9f342d2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -284,81 +284,26 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
-static void guc_waklv_enable_two_word(struct xe_guc_ads *ads,
-				      enum xe_guc_klv_ids klv_id,
-				      u32 value1,
-				      u32 value2,
-				      u32 *offset, u32 *remain)
+static void guc_waklv_enable(struct xe_guc_ads *ads,
+			     u32 data[], u32 data_range,
+			     u32 *offset, u32 *remain,
+			     enum xe_guc_klv_ids klv_id)
 {
-	u32 size;
-	u32 klv_entry[] = {
-			/* 16:16 key/length */
-			FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
-			FIELD_PREP(GUC_KLV_0_LEN, 2),
-			value1,
-			value2,
-			/* 2 dword data */
-	};
-
-	size = sizeof(klv_entry);
-
-	if (*remain < size) {
-		drm_warn(&ads_to_xe(ads)->drm,
-			 "w/a klv buffer too small to add klv id %d\n", klv_id);
-	} else {
-		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
-				 klv_entry, size);
-		*offset += size;
-		*remain -= size;
-	}
-}
-
-static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
-				      enum xe_guc_klv_ids klv_id,
-				      u32 value,
-				      u32 *offset, u32 *remain)
-{
-	u32 size;
-	u32 klv_entry[] = {
-		/* 16:16 key/length */
-		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
-		FIELD_PREP(GUC_KLV_0_LEN, 1),
-		value,
-		/* 1 dword data */
-	};
-
-	size = sizeof(klv_entry);
+	size_t size = sizeof(u32) * (1 + data_range);
 
 	if (*remain < size) {
 		drm_warn(&ads_to_xe(ads)->drm,
-			 "w/a klv buffer too small to add klv id %d\n", klv_id);
-	} else {
-		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
-				 klv_entry, size);
-		*offset += size;
-		*remain -= size;
+			 "w/a klv buffer too small to add klv id 0x%04X\n", klv_id);
+		return;
 	}
-}
-
-static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
-				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
-{
-	u32 klv_entry[] = {
-		/* 16:16 key/length */
-		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
-		FIELD_PREP(GUC_KLV_0_LEN, 0),
-		/* 0 dwords data */
-	};
-	u32 size;
 
-	size = sizeof(klv_entry);
+	/* 16:16 key/length */
+	xe_map_wr(ads_to_xe(ads), ads_to_map(ads), *offset, u32,
+		  FIELD_PREP(GUC_KLV_0_KEY, klv_id) | FIELD_PREP(GUC_KLV_0_LEN, data_range));
+	/* data_range dwords of data */
+	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads),
+			 *offset + sizeof(u32), data, size - sizeof(u32));
 
-	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
-		       "w/a klv buffer too small to add klv id %d\n", klv_id))
-		return;
-
-	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
-			 klv_entry, size);
 	*offset += size;
 	*remain -= size;
 }
@@ -373,49 +318,46 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	remain = guc_ads_waklv_size(ads);
 
 	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
-					&offset, &remain);
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
 	if (XE_WA(gt, 18024947630))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
-					&offset, &remain);
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING);
 	if (XE_WA(gt, 16022287689))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
-					&offset, &remain);
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE);
 
 	if (XE_WA(gt, 14022866841))
-		guc_waklv_enable_simple(ads,
-					GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
-					&offset, &remain);
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO);
 
 	/*
 	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
 	 * the default value for this register is determined to be 0xC40. This could change in the
 	 * future, so GuC depends on KMD to send it the correct value.
 	 */
-	if (XE_WA(gt, 13011645652))
-		guc_waklv_enable_one_word(ads,
-					  GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
-					  0xC40,
-					  &offset, &remain);
+	if (XE_WA(gt, 13011645652)) {
+		u32 data = 0xC40;
+
+		guc_waklv_enable(ads, &data, sizeof(data) / sizeof(u32), &offset, &remain,
+				 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE);
+	}
 
 	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
-					&offset, &remain);
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
 
 	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_WA(gt, 16026508708))
-		guc_waklv_enable_simple(ads,
-					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
-					&offset, &remain);
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364))
-		guc_waklv_enable_two_word(ads,
-					  GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
-					  0x0,
-					  0xF,
-					  &offset, &remain);
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
+	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364)) {
+		u32 data[] = {
+			0x0,
+			0xF,
+		};
+		guc_waklv_enable(ads, data, sizeof(data) / sizeof(u32), &offset, &remain,
+				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
+	}
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
-- 
2.43.0

