Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D14C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 14:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA93D10E964;
	Mon, 25 Mar 2024 14:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOvL8rHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC3010E959
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711378242; x=1742914242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eM/6mzvGEXVVunm+BO2CfMYQaPkj9M38DOvsOa+JAf4=;
 b=mOvL8rHEVaJt4E9CuMLEBNs2C4g524fZ9RyR+5CoacG0jQVZDK6vyzBD
 voE4k/ZW23B9+NLof+aa3xhiv+WmTvPkEt0dETFkIX4puIYRHABQUkNEI
 NSgZxikxSYse1pgtTMMK/x5OLhmndpVPEAe2igU54pz8Q+IN06xYog72c
 7+3NYZfTlkp7TBVr8RuRpMqY7RLUBbrfaUjFp1LWG9yskxwWTuL9ic1V3
 HmQBV2EK0BiXwqNqkdqftze1dEBoG4znoYyy82BP3oeiJjOlyFtiExsU7
 WwtG3AxOZo+gwKZt4r8euA3wnngPDb44qCiROUGUsMAOil8F0IYWnL0j7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17819355"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17819355"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20328973"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:50:41 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v3 1/2] drm/xe/guc: Add support for w/a KLVs
Date: Mon, 25 Mar 2024 20:34:34 +0530
Message-Id: <20240325150435.2967536-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240325150435.2967536-1-badal.nilawar@intel.com>
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
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

To prevent running out of bits, new w/a enable flags are being added
via a KLV system instead of a 32 bit flags word.

v2: GuC version check > 70.10 is not needed as xe will not be supporting
    anything below < 70.19 (John Harrison)
v3: Use 64 bit ggtt address for future
    compatibility (John Harrison/Daniele)

Cc: John Harrison <John.C.Harrison@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c       | 62 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 ++-
 3 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index df2bffb7e220..a98344a0ff4b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -80,6 +80,10 @@ ads_to_map(struct xe_guc_ads *ads)
  *      +---------------------------------------+
  *      | padding                               |
  *      +---------------------------------------+ <== 4K aligned
+ *      | w/a KLVs                              |
+ *      +---------------------------------------+
+ *      | padding                               |
+ *      +---------------------------------------+ <== 4K aligned
  *      | capture lists                         |
  *      +---------------------------------------+
  *      | padding                               |
@@ -131,6 +135,11 @@ static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
 	return PAGE_ALIGN(ads->golden_lrc_size);
 }
 
+static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
+{
+	return PAGE_ALIGN(ads->ads_waklv_size);
+}
+
 static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
 {
 	/* FIXME: Allocate a proper capture list */
@@ -167,12 +176,22 @@ static size_t guc_ads_golden_lrc_offset(struct xe_guc_ads *ads)
 	return PAGE_ALIGN(offset);
 }
 
+static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
+{
+	u32 offset;
+
+	offset = guc_ads_golden_lrc_offset(ads) +
+		 guc_ads_golden_lrc_size(ads);
+
+	return PAGE_ALIGN(offset);
+}
+
 static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
 {
 	size_t offset;
 
-	offset = guc_ads_golden_lrc_offset(ads) +
-		guc_ads_golden_lrc_size(ads);
+	offset = guc_ads_waklv_offset(ads) +
+		 guc_ads_waklv_size(ads);
 
 	return PAGE_ALIGN(offset);
 }
@@ -260,6 +279,42 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
+static void guc_waklv_init(struct xe_guc_ads *ads)
+{
+	u64 addr_ggtt;
+	u32 offset, remain, size;
+
+	offset = guc_ads_waklv_offset(ads);
+	remain = guc_ads_waklv_size(ads);
+
+	/*
+	 * Add workarounds here:
+	 *
+	 * if (want_wa_<name>) {
+	 *      size = guc_waklv_<name>(guc, offset, remain);
+	 *      offset += size;
+	 *      remain -= size;
+	 * }
+	 */
+
+	size = guc_ads_waklv_size(ads) - remain;
+	if (!size)
+		return;
+
+	offset = guc_ads_waklv_offset(ads);
+	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
+
+	ads_blob_write(ads, ads.wa_klv_addr_lo, lower_32_bits(addr_ggtt));
+	ads_blob_write(ads, ads.wa_klv_addr_hi, upper_32_bits(addr_ggtt));
+	ads_blob_write(ads, ads.wa_klv_size, size);
+}
+
+static int calculate_waklv_size(struct xe_guc_ads *ads)
+{
+	/* Fudge something chunky for now: */
+	return PAGE_SIZE;
+}
+
 #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
 
 int xe_guc_ads_init(struct xe_guc_ads *ads)
@@ -271,6 +326,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
+	ads->ads_waklv_size = calculate_waklv_size(ads);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
 					  XE_BO_CREATE_SYSTEM_BIT |
@@ -598,6 +654,8 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 	guc_mapping_table_init(gt, &info_map);
 	guc_capture_list_init(ads);
 	guc_doorbell_init(ads);
+	/* Workaround KLV list */
+	guc_waklv_init(ads);
 
 	if (xe->info.has_usm) {
 		guc_um_init_params(ads);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
index 4afe44bece4b..62235b2a6fe3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
@@ -20,6 +20,8 @@ struct xe_guc_ads {
 	size_t golden_lrc_size;
 	/** @regset_size: size of register set passed to GuC for save/restore */
 	u32 regset_size;
+	/** @ads_waklv_size: waklv size */
+	u32 ads_waklv_size;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index c281fdbfd2d6..52503719d2aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -207,7 +207,10 @@ struct guc_ads {
 	u32 capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
 	u32 capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
 	u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
-	u32 reserved[14];
+	u32 wa_klv_addr_lo;
+	u32 wa_klv_addr_hi;
+	u32 wa_klv_size;
+	u32 reserved[11];
 } __packed;
 
 /* Engine usage stats */
-- 
2.25.1

