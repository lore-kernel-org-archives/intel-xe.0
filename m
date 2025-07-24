Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ABBC83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 22:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736EF10E07C;
	Thu, 24 Jul 2025 22:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcKjy8sx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A8010E07C
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 22:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753395553; x=1784931553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=st3QoYBsK00Mm2C4VyVGzgeSW+UOrZAlpqF2JQ+SMfs=;
 b=PcKjy8sxKTpTjdR2jMRgMH0VkolcAxTGvEG6kNipRkoB2FPzlQX5NQgP
 Xt2wsaZeD3/nZeyH9Y1twUHqtuORxS6twNXID0H3c0yLZZHKtZsXFLNQ7
 6E8J5VMYBAuhWLOlqYZD2eAotSw7Y9q4DFmTlBCommB2cJgHnRYFkG51c
 2NsXJAr+mH9sa56PCFRK7qmLQTXERNVbx5esWkc5rvxpspwMsCMGJ/7WV
 t0YOOdGhqQ/N0BrbmfmkSGLpiLCUJXXo0A+5sm3CDv1umwygSeDm4B7Lw
 68tk8PQ+uEd2/vlVUAZX+uMq+Qazo2H1Sm5/Pyt1dxl9DyUb/rqVlp7Yw A==;
X-CSE-ConnectionGUID: mmZ0DcXfT3KVVQAUi2IObQ==
X-CSE-MsgGUID: jqkXlRu1TY+sWe8n+eKe4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78275523"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="78275523"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 15:19:12 -0700
X-CSE-ConnectionGUID: pOatynfqRB2wlFB1WOJZ0A==
X-CSE-MsgGUID: m4Jo9t99R8aY2gjc669rDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160625067"
Received: from dut4086lnl.fm.intel.com ([10.105.10.26])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 15:19:13 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 lucas.demarchi@intel.com, daniele.ceraolospurio@intel.com
Subject: [PATCH] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions
Date: Thu, 24 Jul 2025 22:19:12 +0000
Message-ID: <20250724221911.114782-2-jonathan.cavitt@intel.com>
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

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Lucas De Marchi <lucas.demarch@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 144 ++++++++++++--------------------
 1 file changed, 54 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 8ff8626227ae..793a3054c562 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -284,83 +284,41 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
-static void guc_waklv_enable_two_word(struct xe_guc_ads *ads,
-				      enum xe_guc_klv_ids klv_id,
-				      u32 value1,
-				      u32 value2,
-				      u32 *offset, u32 *remain)
+static void guc_waklv_enable(struct xe_guc_ads *ads,
+			     enum xe_guc_klv_ids klv_id,
+			     u32 dwords[], u32 num_dwords,
+			     u32 *offset, u32 *remain)
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
+	size_t size = sizeof(u32) * (1 + num_dwords);
+	u32 *klv_entry;
 
 	if (*remain < size) {
 		drm_warn(&ads_to_xe(ads)->drm,
 			 "w/a klv buffer too small to add klv id %d\n", klv_id);
-	} else {
-		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
-				 klv_entry, size);
-		*offset += size;
-		*remain -= size;
+		return;
 	}
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
 
-	if (*remain < size) {
+	klv_entry = kzalloc(size, GFP_KERNEL);
+	if (!klv_entry) {
 		drm_warn(&ads_to_xe(ads)->drm,
-			 "w/a klv buffer too small to add klv id %d\n", klv_id);
-	} else {
-		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
-				 klv_entry, size);
-		*offset += size;
-		*remain -= size;
+			 "w/a klv buffer for klv id %d not allocated!\n", klv_id);
+		return;
 	}
-}
 
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
+	/* 16:16 key/length */
+	klv_entry[0] = FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
+		       FIELD_PREP(GUC_KLV_0_LEN, 0);
 
-	size = sizeof(klv_entry);
-
-	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
-		       "w/a klv buffer too small to add klv id %d\n", klv_id))
-		return;
+	/* add dwords of data */
+	for (int i = 1; i <= num_dwords; i++)
+		klv_entry[i] = dwords[i];
 
 	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
 			 klv_entry, size);
 	*offset += size;
 	*remain -= size;
+
+	kfree(klv_entry);
 }
 
 static void guc_waklv_init(struct xe_guc_ads *ads)
@@ -373,49 +331,55 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	remain = guc_ads_waklv_size(ads);
 
 	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
-					&offset, &remain);
+		guc_waklv_enable(ads,
+				 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
+				 NULL, 0, &offset, &remain);
 	if (XE_WA(gt, 18024947630))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
-					&offset, &remain);
+		guc_waklv_enable(ads,
+				 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
+				 NULL, 0, &offset, &remain);
 	if (XE_WA(gt, 16022287689))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
-					&offset, &remain);
+		guc_waklv_enable(ads,
+				 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
+				 NULL, 0, &offset, &remain);
 
 	if (XE_WA(gt, 14022866841))
-		guc_waklv_enable_simple(ads,
-					GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
-					&offset, &remain);
+		guc_waklv_enable(ads,
+				 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
+				 NULL, 0, &offset, &remain);
 
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
+		u32 arr[] = {
+			0xC40,
+		};
+		guc_waklv_enable(ads,
+				 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
+				 arr, 1, &offset, &remain);
+	}
 
 	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
-					&offset, &remain);
+		guc_waklv_enable(ads,
+				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
+				 NULL, 0, &offset, &remain);
 
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
+		guc_waklv_enable(ads,
+				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
+				 NULL, 0, &offset, &remain);
+	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364)) {
+		u32 arr[] = {
+			0x0,
+			0xF,
+		};
+		guc_waklv_enable(ads,
+				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
+				 arr, 2, &offset, &remain);
+	}
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
-- 
2.43.0

