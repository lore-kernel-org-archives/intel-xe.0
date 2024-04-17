Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF3BC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 05:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5EE1130FD;
	Wed, 17 Apr 2024 05:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLXgjCB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05F61130FD
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 05:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713332984; x=1744868984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aW3XZsOWYgAQFwLkRkzXGufNcZK65qE5LsmT5dyzCMM=;
 b=TLXgjCB1ftGE/sXYNiMVwJm2P8lj/sGGRC6rI7qk37ziBtILH84hZynU
 RhBu0KZ+1Ev6c+eka961oHz6hsZN93SipAWouavjVC/WFQ02agoallkvl
 MKAzaHwURruxDwqzyuGH+8lGV0gmVvGgvLo6vT2XqaPoZunp1abE8t6Ck
 LSL3+rxkrv4GunC1TRuM0l085dGEUSjuD2Qu7ICALNHj/4HfWnO5upVGp
 btGrkpw4VUEoD9EeiHGVEUP+ZLMhn27RO2EUI4odIezKm375mTfcNqNjE
 wJw/8dnjkEwFn4S+EgzJnVsxhhkf7s0Z73cb6rSqSt9WMIs/SdxLnnvLx g==;
X-CSE-ConnectionGUID: 2NKFfVXKTq+DhFTV/3z33Q==
X-CSE-MsgGUID: RuM/hJsmSrywDpzUYB4yyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8633903"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8633903"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 22:49:39 -0700
X-CSE-ConnectionGUID: ChtsvmDmSL6gVT0npKVieg==
X-CSE-MsgGUID: s0aGSlvNSVSXYoOw44fmwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="22590683"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa009.fm.intel.com with ESMTP; 16 Apr 2024 22:49:39 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v3] drm/xe/lnl: Apply GuC Wa_13011645652
Date: Tue, 16 Apr 2024 22:48:02 -0700
Message-Id: <20240417054802.1766359-1-vinay.belgaumkar@intel.com>
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

v2: Add comment clarifying the WA (John H)
v3: Add more details to the comment (John H)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 38 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 0972113f6b81..511cf974d585 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -326,6 +326,7 @@ enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
 	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
+	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 678ece366056..1aafa486edec 100644
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
@@ -327,6 +354,17 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
 					&offset, &remain);
 
+	/*
+	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
+	 * the default value for this register is determined to be 0xC40. This could change in the
+	 * future, so GuC depends on KMD to send it the correct value.
+	 */
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
index eb647d5a1e16..12fe88796a49 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -26,3 +26,4 @@
 		MEDIA_VERSION(2000)
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
+13011645652	GRAPHICS_VERSION(2004)
-- 
2.38.1

