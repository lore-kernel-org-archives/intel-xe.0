Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DE9C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 23:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D1110E64A;
	Thu, 11 Apr 2024 23:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BB//sW34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B5A10E64A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712878429; x=1744414429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H+Ozp7AOxwbbXhwVH1jCXAA/H77YynjTfKH0acNUGpQ=;
 b=BB//sW34MKSQ60gjs4fxa8LUJ1FCYXhhlyIxwiIlir1rdHljpzeVt40w
 WuHXxORm3eEh6E9zORuUbi1hsly2f0EKfEQ7JyTfiXfhkIKKKv0xbseau
 CwjE8bCG4bDMbcyCnH6XM9q4eIF+9scl2Mi2dyJNXnYMTVGN43UCEC+g0
 NLYtYZnW9jRNLN9a2U6/51tZcQQUFCYNzln34714AIjm52UAEtIfBbvXt
 lHyXTzBzzNAtHJcuwIyq9mDQxP/odbWwyV0Mq9NxrYP8vCHP3hF3hIDjO
 2XYc6LY1ASn1n8Y9ONcs2IwzrQfCTjIQFF3o5bBwB0ecUKPtb46IMwkhl w==;
X-CSE-ConnectionGUID: OLM2MsTwRnutOdrB5dB6KA==
X-CSE-MsgGUID: BsaRY63AQy+2Bb8kt5a6Sg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8880091"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="8880091"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 16:33:48 -0700
X-CSE-ConnectionGUID: 7ANIOmn8T5ambZ6sFKjyAA==
X-CSE-MsgGUID: RUHC1xpURImxCpxHRW0KDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="21124087"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2024 16:33:48 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe/lnl: Apply GuC Wa_13011645652
Date: Thu, 11 Apr 2024 16:32:07 -0700
Message-Id: <20240411233207.394688-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Enable WA for a bug that could cause the C6 state machine to hang
during RC6 exit.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 33 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 3 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 5dd45e06f0b6..3158fddb2f27 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -324,6 +324,7 @@ enum  {
  */
 enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
+	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 757cbbb87869..05b6e7fa7fc2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -282,6 +282,33 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
+static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
+				      enum xe_guc_klv_ids klv_id,
+				      u32 value,
+				      u32 *offset, u32 *remain)
+{
+	u32 size;
+	u32 klv_entry[] = {
+		/* 16:16 key/length */
+		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
+		FIELD_PREP(GUC_KLV_0_LEN, 1),
+		value,
+		/* 1 dword data */
+	};
+
+	size = sizeof(klv_entry);
+
+	if (*remain < size) {
+		drm_warn(&ads_to_xe(ads)->drm,
+			 "w/a klv buffer too small to add klv id %d\n", klv_id);
+	} else {
+		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
+				 klv_entry, size);
+		*offset += size;
+		*remain -= size;
+	}
+}
+
 static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
 				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
 {
@@ -319,6 +346,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
 					&offset, &remain);
 
+	if (XE_WA(gt, 13011645652))
+		guc_waklv_enable_one_word(ads,
+					  GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
+					  0xC40,
+					  &offset, &remain);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 98a81468bc8e..f74af0d369dd 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -21,3 +21,4 @@
 		PLATFORM(DG2)
 14018094691	GRAPHICS_VERSION(2004)
 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
+13011645652	GRAPHICS_VERSION(2004)
-- 
2.38.1

