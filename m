Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6093FC83F22
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 10:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2589810E666;
	Wed, 16 Jul 2025 10:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQKUtu+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D48B10E666
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752661053; x=1784197053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zvK2L1Fau9WxOgu/Hh8Anb5u3o6AOFIXnDv8RRcV5EI=;
 b=HQKUtu+RTJjdjMDgnE6WEc5TbaJa7BVqlPwXaACOLOvJnrI2vdQsqkLs
 yL5JsOOM89R8uJctLu3pelykVVl7qrJdrGyxQVTMLeKvJLp+AKriw7w6w
 p918S8xSHnMT1b6lxSjn7HVzRl9q66j6FNTzSCUxWCKjixg/XAlb34FUi
 c4UyV95yJWR0xBR8boRUEbkDvWaqzvRTs/FgPi/3nETwxtvrviVKfs+zd
 ajeRt2MrNIsD3kPkCsf28tjmHs99qa6p0TZGtqULygXyN9vEOcnwEXQA3
 sLU6UMftZFzX8XJtMaOkIvmHV9mS9CbJHOgOJoIwsSEo27/y2N33mJ9CC Q==;
X-CSE-ConnectionGUID: Up9o44ugT5iBxPYow9b3Jw==
X-CSE-MsgGUID: OIWRKpyaQTW4Qqsxo21qCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="42531152"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="42531152"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:17:33 -0700
X-CSE-ConnectionGUID: J4qw5DnkTyOt7FKPJdkgAQ==
X-CSE-MsgGUID: ugzBxygYRI+FElE0LJglxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="188427448"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:17:31 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, daniele.ceraolospurio@intel.com,
 vinay.belgaumkar@intel.com
Cc: Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe/ptl: Apply Wa_16026007364
Date: Wed, 16 Jul 2025 15:46:23 +0530
Message-ID: <20250716101622.3421480-2-sk.anirban@intel.com>
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

As part of this WA GuC will save and restore value of two XE3_Media
control registers that were not included in the HW power context.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 35 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 3 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 0366a9da5977..31dbfeee289e 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -396,6 +396,7 @@ enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
+	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 131cfc56be00..8ff8626227ae 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -284,6 +284,35 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
+static void guc_waklv_enable_two_word(struct xe_guc_ads *ads,
+				      enum xe_guc_klv_ids klv_id,
+				      u32 value1,
+				      u32 value2,
+				      u32 *offset, u32 *remain)
+{
+	u32 size;
+	u32 klv_entry[] = {
+			/* 16:16 key/length */
+			FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
+			FIELD_PREP(GUC_KLV_0_LEN, 2),
+			value1,
+			value2,
+			/* 2 dword data */
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
 static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
 				      enum xe_guc_klv_ids klv_id,
 				      u32 value,
@@ -381,6 +410,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable_simple(ads,
 					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
 					&offset, &remain);
+	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364))
+		guc_waklv_enable_two_word(ads,
+					  GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
+					  0x0,
+					  0xF,
+					  &offset, &remain);
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index e990f20eccfe..46ad72bb1f8d 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -72,3 +72,4 @@ no_media_l3	MEDIA_VERSION(3000)
 14022085890	GRAPHICS_VERSION(2001)
 
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
+16026007364    MEDIA_VERSION(3000)
-- 
2.43.0

