Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58FDCD11C2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 15:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6285210FBDE;
	Tue, 19 Mar 2024 15:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKDT34ED";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072DD10FBB7
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710863712; x=1742399712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+amTBUA5Sun2qEKqVkniS94T0GVFysZfd8OfHv0hpg8=;
 b=MKDT34EDgBN2+9DrbPcX5b5MoL8RqtrAYAEuBH0c3DZ62t630ksCw9Z9
 yKa6DCHYrlhCCCopYIvazbA4FcJwdWUvKBtkxGRSj9X0Y/0gLN7w/qSBB
 XiR4bCCtoY9E7Dlv3X3FoD97sMOdmrGt4tCD17t0VNJiFq9L3hHYxNayx
 obS739K3syDtg1M606jlCqQYaZ/LJizcGKtxI7JG9WFHt0DNK+ulv8ylz
 kxeBRFptgDIXE9SbExualNWkdS8RNxkzl1CUvwhh/HVDH2lxBW5Nda4d5
 +6hgXIXEQSssoPQkXAsWwsOwnAUeAxxd6JqvxYG3ViYFMLIrHCmrsQP1p g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="17145565"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="17145565"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 08:55:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13949181"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 08:55:10 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 1/2] drm/xe/guc: Add support for w/a KLVs
Date: Tue, 19 Mar 2024 21:38:58 +0530
Message-Id: <20240319160859.2672825-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240319160859.2672825-1-badal.nilawar@intel.com>
References: <20240319160859.2672825-1-badal.nilawar@intel.com>
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

Cc: John Harrison <John.C.Harrison@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c       | 61 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 ++-
 3 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 6ad4c1a90a78..506f0be35763 100644
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
@@ -260,6 +279,41 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
+static void guc_waklv_init(struct xe_guc_ads *ads)
+{
+	u32 addr_ggtt, offset, remain, size;
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
+	ads_blob_write(ads, ads.wa_klv_addr_lo, addr_ggtt);
+	ads_blob_write(ads, ads.wa_klv_addr_hi, 0);
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
@@ -271,6 +325,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
+	ads->ads_waklv_size = calculate_waklv_size(ads);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
 					  XE_BO_CREATE_SYSTEM_BIT |
@@ -597,6 +652,8 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
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

