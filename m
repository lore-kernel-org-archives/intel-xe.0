Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0334FCD5BB7
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 12:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3E710F736;
	Fri, 22 May 2026 12:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oExbHivm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1704210F6EE
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779453455; x=1810989455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6qs6x6v/EyS0Gwl2uyBaWcSnIKX/HkXweM/1ziRluXA=;
 b=oExbHivmBHYJ+DDXN0bCeaVLVOi/LyvD/a4ncfkxYigy49bxvdm5tZd5
 ZIwHIzsKWw4VZzSiSK6O43JX1CeUBXADn7wo1Yu+Ai/I2NuC/mLs3ETmS
 qz4jZgmWrnHFe2vFwT99BFH1OBHj+PvZEPHI1C897KqZTklfgZBw3HYzf
 +kH3xYMSMus0teyaLe0reYlv9Lb7Zv17nFCaQT/D52W+K/5ipf5c+5aCO
 L2zCjqtPnuP/LZr00ScHVMAUx/zOojBbU4O96P7muCsNHoHa+hNn2ek8m
 6+P790WJxVurlfZm/Mb1gvXxDvgyd6DNonTtRGFvGlsuVTleSvnOn6oEP A==;
X-CSE-ConnectionGUID: PKcJoeV+Q8yVOurwTSaqDw==
X-CSE-MsgGUID: WBYgcbybRb+tXhvTMXZjDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84264583"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84264583"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:35 -0700
X-CSE-ConnectionGUID: lyrDCiRnQ5OGT50JfF5ang==
X-CSE-MsgGUID: FfiCh9reQmO84ZA4J45dDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238302135"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.22])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 01/10] drm/xe/guc: refactor ads to use guc_class
Date: Fri, 22 May 2026 13:37:22 +0100
Message-ID: <20260522123720.39656-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123720.39656-12-matthew.auld@intel.com>
References: <20260522123720.39656-12-matthew.auld@intel.com>
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

Currently in the lrc init flow on the ads side, we loop through each
generic engine class and convert that to the respective guc engine
class. However, with some upcoming changes, it will be better to go the
opposite way and loop through every guc engine class, and convert that
to the generic engine class.

This also reworks engine_enable_mask to operate on the guc_class, that
way we can easily filter out the PAGING vs normal BSC, when applicable.

This will be needed in an upcoming patch where we have a new guc engine
class that just matches up to the existing blitter/copy class, but needs
to be treated as separate entity from the normal copy lrc, when setting
up the ADS.

As a bonus this also gets rid of two xe_engine_class_to_guc_class()
users which will be helpful for the next patch.

No functional changes.

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 67 ++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index b9bca6084a4f..ffe60d77b713 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -251,15 +251,37 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 	return count * sizeof(struct guc_mmio_reg);
 }
 
-static u32 engine_enable_mask(struct xe_gt *gt, enum xe_engine_class class)
+static inline enum xe_engine_class guc_class_to_engine_class(u16 guc_class)
+{
+	switch (guc_class) {
+	case GUC_RENDER_CLASS:
+		return XE_ENGINE_CLASS_RENDER;
+	case GUC_VIDEO_CLASS:
+		return XE_ENGINE_CLASS_VIDEO_DECODE;
+	case GUC_VIDEOENHANCE_CLASS:
+		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	case GUC_BLITTER_CLASS:
+		return XE_ENGINE_CLASS_COPY;
+	case GUC_COMPUTE_CLASS:
+		return XE_ENGINE_CLASS_COMPUTE;
+	case GUC_GSC_OTHER_CLASS:
+		return XE_ENGINE_CLASS_OTHER;
+	default:
+		XE_WARN_ON(guc_class);
+		return -1;
+	}
+}
+
+static u32 engine_enable_mask(struct xe_gt *gt, u16 guc_class)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	u32 mask = 0;
 
-	for_each_hw_engine(hwe, gt, id)
-		if (hwe->class == class)
+	for_each_hw_engine(hwe, gt, id) {
+		if (xe_engine_class_to_guc_class(hwe->class) == guc_class)
 			mask |= BIT(hwe->instance);
+	}
 
 	return mask;
 }
@@ -268,10 +290,13 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 {
 	struct xe_gt *gt = ads_to_gt(ads);
 	size_t total_size = 0, alloc_size, real_size;
-	int class;
+	u16 guc_class;
 
-	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
-		if (!engine_enable_mask(gt, class))
+	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class) {
+		enum xe_engine_class class =
+			guc_class_to_engine_class(guc_class);
+
+		if (!engine_enable_mask(gt, guc_class))
 			continue;
 
 		real_size = xe_gt_lrc_size(gt, class);
@@ -465,18 +490,18 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
 	struct xe_device *xe = gt_to_xe(gt);
 
 	info_map_write(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_RENDER));
+		       engine_enable_mask(gt, GUC_RENDER_CLASS));
 	info_map_write(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_COPY));
+		       engine_enable_mask(gt, GUC_BLITTER_CLASS));
 	info_map_write(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_DECODE));
+		       engine_enable_mask(gt, GUC_VIDEO_CLASS));
 	info_map_write(xe, info_map,
 		       engine_enabled_masks[GUC_VIDEOENHANCE_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE));
+		       engine_enable_mask(gt, GUC_VIDEOENHANCE_CLASS));
 	info_map_write(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_COMPUTE));
+		       engine_enable_mask(gt, GUC_COMPUTE_CLASS));
 	info_map_write(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER));
+		       engine_enable_mask(gt, GUC_GSC_OTHER_CLASS));
 }
 
 /*
@@ -491,15 +516,14 @@ static void guc_golden_lrc_init(struct xe_guc_ads *ads)
 			offsetof(struct __guc_ads_blob, system_info));
 	size_t alloc_size, real_size;
 	u32 addr_ggtt, offset;
-	int class;
+	u16 guc_class;
 
 	offset = guc_ads_golden_lrc_offset(ads);
 	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
 
-	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
-		u8 guc_class;
-
-		guc_class = xe_engine_class_to_guc_class(class);
+	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class) {
+		enum xe_engine_class class =
+			guc_class_to_engine_class(guc_class);
 
 		if (!info_map_read(xe, &info_map,
 				   engine_enabled_masks[guc_class]))
@@ -943,14 +967,13 @@ static void guc_golden_lrc_populate(struct xe_guc_ads *ads)
 			offsetof(struct __guc_ads_blob, system_info));
 	size_t total_size = 0, alloc_size, real_size;
 	u32 offset;
-	int class;
+	u16 guc_class;
 
 	offset = guc_ads_golden_lrc_offset(ads);
 
-	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
-		u8 guc_class;
-
-		guc_class = xe_engine_class_to_guc_class(class);
+	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class) {
+		enum xe_engine_class class =
+			guc_class_to_engine_class(guc_class);
 
 		if (!info_map_read(xe, &info_map,
 				   engine_enabled_masks[guc_class]))
-- 
2.54.0

