Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FAAC021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 21:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E21910E131;
	Thu, 13 Feb 2025 21:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="foMOpv2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B22010E131
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739482865; x=1771018865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0dpDBZ7Ki7Rm1BfpN7wk6w29d6JHHzlG5P0hQbb5g0k=;
 b=foMOpv2WQL/VMYDedhwn55uUXhq8CYmHEe2r4Y2QvsyLMjLSJFd/0bdj
 YTSEUycvv8Urw/nw3cJBXtNPzXofTfsBR/TrQtd54hE0Uece37m6AcSrX
 QyCxb+LgC/+ESHPWNbIb6ggBwqxOTGVquqwOeYzbJwIrSOBsWoCtp9L6+
 +TsRkTjVrEDI2pwKUsvd4B8IIG/Qf3/l9V5Skz/5KkfHEsZzL0brMoZnY
 uBKIdUPoFVSj15UuRvI2n2J3vXK9HdKDy6VWoFIqqYvvP/0o7TbwAjx6E
 /bqjb5ez28nakVfNvThAjFU+8d1VixDwX9FCAVwtVMr65ixR+LIvQjTRR A==;
X-CSE-ConnectionGUID: G78uyNM2QteRmxBVWmBuqw==
X-CSE-MsgGUID: HuUDyHh5TCaKlYxWFPLU9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51614387"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="51614387"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 13:41:04 -0800
X-CSE-ConnectionGUID: T5vBgxClSgGb+5Xuof/G8w==
X-CSE-MsgGUID: yOu05+q+TBGFjteb6afbvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="118362272"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 13:41:03 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Stop reading masks from device memory when
 populating the ADS
Date: Thu, 13 Feb 2025 13:40:53 -0800
Message-ID: <20250213214053.2191635-1-daniele.ceraolospurio@intel.com>
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

If the device memory is corrupted during the suspend/resume flow, the
masks might end up being random values and using them might lead us to
trying to set values for engines that do not exist, which in turns might
lead to invalid memory accesses.

Given that the driver does know which engines are available, we can just
calculate the masks instead of reading them out of memory.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 36 ++++++++++++---------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index fab259adc380..10e2ab5791b7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -129,9 +129,6 @@ struct __guc_ads_blob {
 #define info_map_write(xe_, map_, field_, val_) \
 	xe_map_wr_field(xe_, map_, 0, struct guc_gt_system_info, field_, val_)
 
-#define info_map_read(xe_, map_, field_) \
-	xe_map_rd_field(xe_, map_, 0, struct guc_gt_system_info, field_)
-
 static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
 {
 	struct xe_device *xe = ads_to_xe(ads);
@@ -493,13 +490,12 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
 static void guc_prep_golden_lrc_null(struct xe_guc_ads *ads)
 {
 	struct xe_device *xe = ads_to_xe(ads);
-	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
-			offsetof(struct __guc_ads_blob, system_info));
-	u8 guc_class;
+	u8 class;
 
-	for (guc_class = 0; guc_class <= GUC_MAX_ENGINE_CLASSES; ++guc_class) {
-		if (!info_map_read(xe, &info_map,
-				   engine_enabled_masks[guc_class]))
+	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
+		u8 guc_class = xe_engine_class_to_guc_class(class);
+
+		if (!engine_enable_mask(ads_to_gt(ads), class))
 			continue;
 
 		ads_blob_write(ads, ads.eng_state_size[guc_class],
@@ -546,25 +542,24 @@ static void guc_mapping_table_init(struct xe_gt *gt,
 static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_map,
 				       enum guc_capture_list_class_type capture_class)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	u32 mask;
 
 	switch (capture_class) {
 	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
-		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
-		mask |= info_map_read(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
+		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_RENDER);
+		mask |= engine_enable_mask(gt, XE_ENGINE_CLASS_COMPUTE);
 		break;
 	case GUC_CAPTURE_LIST_CLASS_VIDEO:
-		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS]);
+		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
 		break;
 	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
-		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
+		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
 		break;
 	case GUC_CAPTURE_LIST_CLASS_BLITTER:
-		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS]);
+		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_COPY);
 		break;
 	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
-		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
+		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER);
 		break;
 	default:
 		mask = 0;
@@ -907,8 +902,6 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
 {
 	struct xe_device *xe = ads_to_xe(ads);
 	struct xe_gt *gt = ads_to_gt(ads);
-	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
-			offsetof(struct __guc_ads_blob, system_info));
 	size_t total_size = 0, alloc_size, real_size;
 	u32 addr_ggtt, offset;
 	int class;
@@ -917,12 +910,9 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
 	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
 
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
-		u8 guc_class;
+		u8 guc_class = xe_engine_class_to_guc_class(class);
 
-		guc_class = xe_engine_class_to_guc_class(class);
-
-		if (!info_map_read(xe, &info_map,
-				   engine_enabled_masks[guc_class]))
+		if (!engine_enable_mask(gt, class))
 			continue;
 
 		xe_gt_assert(gt, gt->default_lrc[class]);
-- 
2.43.0

