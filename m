Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C93DCD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 08:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13796113A5C;
	Fri,  5 Apr 2024 08:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfxT/ROl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3707410E6BA
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712305701; x=1743841701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rC31phezpDHlN/pAvrRwnlVloNFjB+txGCdbjjKOisg=;
 b=lfxT/ROlz+jYEplZbDC0kCBQyhQqnLw6sQJCXCG3/o8PNkjiiE6gz6lM
 3OueKJfuZH13ATS10ZYLN/So0grBhWSrXbracPPbsUUe1IB2zVH3ZhbyD
 w2PyB3znOljUab8zGrF54m3iSkgvGYuC/jp4cca7QT3QL5kZZDV9wVzvB
 HfCbHxbxEGm9t5v4xG/8t18QKiHSCjmJfxZrGVZ7ZVqkwzs2gF4ZJ8nXB
 qxMGRmgiijDesM2WjiL3EYi+gFAd29mYfdf1nElfAKq9P/8c+ydpj05Bg
 fdlvVXWGJIDNJ0+0s15A45j2qbdyx3c4XA+Mflh58y1ihRRHo4sa6AsIc g==;
X-CSE-ConnectionGUID: XhwbQi2jQoGy5aa34D6Qcw==
X-CSE-MsgGUID: lDevawPlQYCkyg4dbb/Ekg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7811400"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7811400"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:28:21 -0700
X-CSE-ConnectionGUID: hHT56lhOSj+xXH4ry7MZTw==
X-CSE-MsgGUID: iCjJE5wAQq+IfsZUDVI9DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="50033321"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:28:18 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v4 1/2] drm/xe/guc: Add support for workaround KLVs
Date: Fri,  5 Apr 2024 14:12:30 +0530
Message-Id: <20240405084231.3620848-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405084231.3620848-1-badal.nilawar@intel.com>
References: <20240405084231.3620848-1-badal.nilawar@intel.com>
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

To prevent running out of bits, new workaround (w/a) enable flags are
being added via a KLV system instead of a 32 bit flags word.

v2: GuC version check > 70.10 is not needed as base line xe doesnot
    support anything below < 70.19
v3: Use 64 bit ggtt address for future
    compatibility (John Harrison/Daniele)
v4: %s/PAGE_SIZE/SZ_4K/ (Michal)

Cc: John Harrison <John.C.Harrison@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c       | 62 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 ++-
 3 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e025f3e10c9b..0a8f27243c84 100644
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
@@ -260,6 +279,43 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
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
+	/* Add workarounds here
+	 *
+	 * if (XE_WA(gt, wa_id))
+	 *	guc_waklv_enable_simple(ads,
+	 *				wa_klv_id,
+	 *				&offset, &remain);
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
+	/*
+	 * A single page is both the minimum size possible and
+	 * is sufficiently large enough for all current platforms.
+	 */
+	return SZ_4K;
+}
+
 #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
 
 int xe_guc_ads_init(struct xe_guc_ads *ads)
@@ -271,6 +327,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
+	ads->ads_waklv_size = calculate_waklv_size(ads);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
 					  XE_BO_FLAG_SYSTEM |
@@ -598,6 +655,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 	guc_mapping_table_init(gt, &info_map);
 	guc_capture_list_init(ads);
 	guc_doorbell_init(ads);
+	guc_waklv_init(ads);
 
 	if (xe->info.has_usm) {
 		guc_um_init_params(ads);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
index 4afe44bece4b..2de5decfe0fd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
@@ -20,6 +20,8 @@ struct xe_guc_ads {
 	size_t golden_lrc_size;
 	/** @regset_size: size of register set passed to GuC for save/restore */
 	u32 regset_size;
+	/** @ads_waklv_size: total waklv size supported by platform */
+	u32 ads_waklv_size;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 5474025271e3..19ee71aeaf17 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -209,7 +209,10 @@ struct guc_ads {
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

