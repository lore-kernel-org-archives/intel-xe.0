Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC5606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 20:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHG+umVP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1327A10F515;
	Mon,  9 Nov 2026 20:37:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DB810E8D0
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 20:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794256637; x=1825792637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1C4SMNNNzH6WqVwmYSt20Y8Qfn/8oz3wRfm36usP6Sc=;
 b=AHG+umVPPPvg3wCI0c8k8fJCGTwWluZu/nQUglDuHEXktJ7r/czbTGCS
 Bhxq2HaRhtmWYHnzc6dRI07aWP80TGBONmWrY9U/gd0dg3H2aiQEianBv
 1GCEbZyiOGd39ksgQGMlfJDROaBkwv2WOy4kgl7lbE+DzXljZC9wXtUBG
 uGi2OB5dQ1BFBkT8tA1TDDQO4GgKwQrontfFeKC21ibu7QLBBF7v/4Iak
 u+YlDpTF+KDV7307MqP91Of8GQdX+mqoE9hf2Pog14X0zBvp/XJzlH14E
 uKr6XiZjiP4B8IeDGDH7PyfBPESAtFH7Ytv8jwAQS4JL5yF5VggpWLEq9 w==;
X-CSE-ConnectionGUID: 2S+U3eOSTuSyMmRWKCR/Rw==
X-CSE-MsgGUID: FFsMZrSnRe+EEBF/VQTgKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2889133"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2889133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 12:37:17 -0800
X-CSE-ConnectionGUID: ruxtKRmOQ2ubXGQQkdpdeA==
X-CSE-MsgGUID: +jkh0kmQQWyMbnYI4mqNwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7979032"
Received: from cyp07.fm.intel.com (HELO pallavi-cyp07.fm.intel.com)
 ([10.36.54.237])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 12:37:16 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com
Subject: [PATCH v3 2/2] drm/xe: Initialize GT GMD_ID from probed info
Date: Mon,  9 Nov 2026 12:37:01 -0800
Message-ID: <20261109203701.814007-3-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109203701.814007-1-pallavi.mishra@intel.com>
References: <20261109203701.814007-1-pallavi.mishra@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

GMD_ID is already read while probing IP versions. Stash that value in
xe_probed_info and use it to fill gt->info.gmdid from xe_info_init(),
instead of reading the register again during GT initialization.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c  | 15 -----------
 drivers/gpu/drm/xe/xe_pci.c | 50 +++++++++++++++++++++++++++++--------
 2 files changed, 40 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index becc82566457..674e0ef8b034 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -534,19 +534,6 @@ static void dump_pat_on_error(struct xe_gt *gt)
 	xe_pat_dump(gt, &p);
 }
 
-/*
- * Store GMD_ID before GuC upload. Main GAMCTRL consumes the stored subunit
- * field during upload. Pre-MTL platforms do not implement the register, so
- * the read returns zero.
- */
-static void xe_gt_read_gmdid(struct xe_gt *gt)
-{
-	u32 raw = xe_mmio_read32(&gt->mmio, GMD_ID);
-
-	gt->info.gmdid.value = raw;
-	gt->info.gmdid.subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, raw);
-}
-
 static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 {
 	int err;
@@ -555,8 +542,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
-	xe_gt_read_gmdid(gt);
-
 	err = xe_uc_init(&gt->uc);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 39636dea429d..2022f310f750 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -616,7 +616,8 @@ enum xe_gmdid_type {
 	GMDID_MEDIA
 };
 
-static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
+static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
+		      u32 *ver, u32 *revid, u32 *raw)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct xe_reg gmdid_reg = GMD_ID;
@@ -638,7 +639,7 @@ static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u
 
 		/* Don't try to read media ver if media GT is not allowed */
 		if (type == GMDID_MEDIA && !xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev))) {
-			*ver = *revid = 0;
+			*ver = *revid = *raw = 0;
 			return 0;
 		}
 
@@ -678,6 +679,7 @@ static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u
 		val = xe_mmio_read32(mmio, gmdid_reg);
 	}
 
+	*raw = val;
 	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
 	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
 
@@ -712,7 +714,9 @@ static int handle_gmdid(struct xe_device *xe,
 			const struct xe_ip **graphics_ip,
 			const struct xe_ip **media_ip,
 			u32 *graphics_revid,
-			u32 *media_revid)
+			u32 *media_revid,
+			u32 *graphics_gmdid,
+			u32 *media_gmdid)
 {
 	u32 ver;
 	int ret;
@@ -720,7 +724,7 @@ static int handle_gmdid(struct xe_device *xe,
 	*graphics_ip = NULL;
 	*media_ip = NULL;
 
-	ret = read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
+	ret = read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid, graphics_gmdid);
 	if (ret)
 		return ret;
 
@@ -731,7 +735,7 @@ static int handle_gmdid(struct xe_device *xe,
 			   ver / 100, ver % 100);
 	}
 
-	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
+	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid, media_gmdid);
 	if (ret)
 		return ret;
 
@@ -756,6 +760,9 @@ struct xe_probed_info {
 	struct xe_step_info step;
 	const struct xe_ip *graphics_ip;
 	const struct xe_ip *media_ip;
+	/* Raw GMD_ID values; 0 on platforms without the register. */
+	u32 graphics_gmdid;
+	u32 media_gmdid;
 };
 
 /*
@@ -881,9 +888,23 @@ static void xe_probe_tile_count(struct xe_device *xe,
 	}
 }
 
+/*
+ * Record the GMD_ID value already probed for this GT's IP.
+ *
+ * Pre-GMD_ID platforms pass zero, matching a read of the unimplemented
+ * register. subip is GMD_ID[13:6]; those bits are reserved except on media
+ * version 35, and only xe_guc_using_main_gamctrl_queues() interprets them.
+ */
+static void init_gt_gmdid(struct xe_gt *gt, u32 raw)
+{
+	gt->info.gmdid.value = raw;
+	gt->info.gmdid.subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, raw);
+}
+
 static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 				      const struct xe_graphics_desc *graphics_desc,
-				      const struct xe_media_desc *media_desc)
+				      const struct xe_media_desc *media_desc,
+				      u32 gmdid_raw)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt;
@@ -927,11 +948,14 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	if (MEDIA_VER(xe) < 13 && media_desc)
 		gt->info.engine_mask |= media_desc->hw_engine_mask;
 
+	init_gt_gmdid(gt, gmdid_raw);
+
 	return gt;
 }
 
 static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
-				    const struct xe_media_desc *media_desc)
+				    const struct xe_media_desc *media_desc,
+				    u32 gmdid_raw)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt;
@@ -954,6 +978,8 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
 	gt->info.has_uncorrectable_error_reporting = media_desc->has_uncorrectable_error_reporting;
 	gt->info.engine_mask = media_desc->hw_engine_mask;
 
+	init_gt_gmdid(gt, gmdid_raw);
+
 	return gt;
 }
 
@@ -980,7 +1006,9 @@ static int xe_probe_ips(struct xe_device *xe,
 		xe_assert(xe, !desc->pre_gmdid_media_ip);
 
 		err = handle_gmdid(xe, &probed_info->graphics_ip, &probed_info->media_ip,
-				   &graphics_revid, &media_revid);
+				   &graphics_revid, &media_revid,
+				   &probed_info->graphics_gmdid,
+				   &probed_info->media_gmdid);
 		if (err)
 			return err;
 
@@ -1087,7 +1115,8 @@ static int xe_info_init(struct xe_device *xe,
 		if (err)
 			return err;
 
-		tile->primary_gt = alloc_primary_gt(tile, graphics_desc, media_desc);
+		tile->primary_gt = alloc_primary_gt(tile, graphics_desc, media_desc,
+						    probed_info->graphics_gmdid);
 		if (IS_ERR(tile->primary_gt))
 			return PTR_ERR(tile->primary_gt);
 
@@ -1103,7 +1132,8 @@ static int xe_info_init(struct xe_device *xe,
 			return -ENODEV;
 		}
 
-		tile->media_gt = alloc_media_gt(tile, media_desc);
+		tile->media_gt = alloc_media_gt(tile, media_desc,
+						probed_info->media_gmdid);
 		if (IS_ERR(tile->media_gt))
 			return PTR_ERR(tile->media_gt);
 	}
-- 
2.43.0

