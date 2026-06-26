Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B609CDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 11:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6CD10E38C;
	Fri, 26 Jun 2026 11:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="af/QRiiZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D285E10E390
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782472535; x=1814008535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JrDmb8Vv7X94ldLO2usIyKCvUcNRZp/3NadGMY0UZwk=;
 b=af/QRiiZujTHy0AAKxVVSC5spEzgMi42ZrieYYHqLfIYC049RMqc/Wb+
 diuPmGChV5eHbol3WkERVA/Z5WJqYbfIuEly/2mL/PVkZWX+wn8jUl6v0
 w6cE3ekTdy6hi3XIdJxvOxqFYp/ukc/0jH/45/22LCv5IS/kLeWVufeeA
 IhXaxf9a1tKl1YThu9t8ODE3A4V6qnCeVJo3JUv3Q3RxLWV8bNvia8UEd
 TCik08Vr/KK+xIS8n1zv8JDwC9Hn4BH8xxRGYUqGfch2SK8lbrBoa9Bm/
 SRVWzobCJXna1vgMEYn6jHksif0nVDCoJ4cQZuTHsbkyps5/RK5ywRHRu w==;
X-CSE-ConnectionGUID: /MnxtEvRQfSoYt8r+/4l1w==
X-CSE-MsgGUID: A+7g8lbNSCiwvPSEEODLFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100694981"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="100694981"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:35 -0700
X-CSE-ConnectionGUID: 0eVHqgkFQU+T0B4wSimc7g==
X-CSE-MsgGUID: Rqy4uuKjQlqccMzOiZZwGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="253214338"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.49])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v7 01/10] drm/xe/guc: refactor ads to use guc_class
Date: Fri, 26 Jun 2026 12:15:22 +0100
Message-ID: <20260626111520.487997-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626111520.487997-12-matthew.auld@intel.com>
References: <20260626111520.487997-12-matthew.auld@intel.com>
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

This will be needed in an upcoming patch where we have a new guc engine
class that just matches up to the existing blitter/copy class, but needs
to be treated as a separate entity from the normal copy lrc, when
setting up the ADS.

This also reworks engine_enable_mask to operate on the guc_class, that
way we can easily filter out the PAGING vs normal BSC, when applicable.

As a bonus, this also gets rid of two xe_engine_class_to_guc_class()
users which will be helpful for the next patch.

No functional changes.

v2 (Daniele):
 - Simplify fill_engine_enable_masks() to just loop over all guc
   classes.

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 69 ++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index c98454545a85..9e5d03aa465d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -251,14 +251,35 @@ static size_t calculate_regset_size(struct xe_gt *gt)
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
 
 	for_each_hw_engine(hwe, gt, id)
-		if (hwe->class == class)
+		if (xe_engine_class_to_guc_class(hwe->class) == guc_class)
 			mask |= BIT(hwe->instance);
 
 	return mask;
@@ -268,10 +289,13 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
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
@@ -463,20 +487,11 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
 				     struct iosys_map *info_map)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	u16 guc_class;
 
-	info_map_write(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_RENDER));
-	info_map_write(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_COPY));
-	info_map_write(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_DECODE));
-	info_map_write(xe, info_map,
-		       engine_enabled_masks[GUC_VIDEOENHANCE_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE));
-	info_map_write(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_COMPUTE));
-	info_map_write(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS],
-		       engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER));
+	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class)
+		info_map_write(xe, info_map, engine_enabled_masks[guc_class],
+			       engine_enable_mask(gt, guc_class));
 }
 
 /*
@@ -491,15 +506,14 @@ static void guc_golden_lrc_init(struct xe_guc_ads *ads)
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
@@ -948,14 +962,13 @@ static void guc_golden_lrc_populate(struct xe_guc_ads *ads)
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

