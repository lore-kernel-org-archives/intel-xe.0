Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39513C83003
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA5710E5A8;
	Thu, 11 May 2023 03:47:37 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AA010E592
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SxuyG7WdKTorfESAJuDoaIctoLSg05GPbwVXNpTHYZA=;
 b=Ier9q7sP9IslDzstuxADQyvCod5uG9mlRQdWz5zwuvZOpzualqz3UJct
 1G5UItJ4nBJmXvlv03B91RhUaiohA1rJ2+dhtKjhC3GrAhy5z2zp8JOLS
 HeTMtMWIX1bJo7/W/PBteBZjkjYr1cyeBPxFc59o1wk99JgM7gJnyFCG9
 ujKwX/qBWgwQtC0GbsGIPdlUGvnv2w9I3/Kd32tIYJWDIXhcQABFwy+h0
 MmlHURV2n2bOZ/oBRP8Cey7ZY44oC9D0oUhYJJYgAZcy0Tu5wK2uYxKQW
 piK5b8KEsEYYOGBbrM9i7drV3uumkv3d9F3zUDhu+0l4Cnetaz4neaQ/Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850654"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850654"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203250"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203250"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:20 -0700
Message-Id: <20230511034722.1929038-25-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 24/26] drm/xe: Update query uapi to support
 standalone media
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that a higher GT count can result from either multiple tiles (with
one GT each) or an extra media GT within the root tile, we need to
update the query code slightly to stop looking at tile_count.

FIXME: As noted previously, we need to decide on a formal direction for
exposing tiles and/or GTs to userspace.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4d8473328962..d3d39eb44b39 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -26,6 +26,18 @@ static const enum xe_engine_class xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
 };
 
+static int num_gt(struct xe_device *xe)
+{
+	int num = xe->info.tile_count;
+
+	if (xe_device_get_root_tile(xe)->media_gt) {
+		drm_WARN_ON(&xe->drm, num > 1);
+		num++;
+	}
+
+	return num;
+}
+
 static size_t calc_hw_engine_info_size(struct xe_device *xe)
 {
 	struct xe_hw_engine *hwe;
@@ -192,7 +204,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[XE_QUERY_CONFIG_VA_BITS] = 12 +
 		(9 * (xe->info.vm_max_level + 1));
-	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.tile_count;
+	config->info[XE_QUERY_CONFIG_GT_COUNT] = num_gt(xe);
 	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
 		hweight_long(xe->info.mem_region_mask);
 	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
@@ -211,7 +223,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 {
 	struct xe_gt *gt;
 	size_t size = sizeof(struct drm_xe_query_gts) +
-		xe->info.tile_count * sizeof(struct drm_xe_query_gt);
+		num_gt(xe) * sizeof(struct drm_xe_query_gt);
 	struct drm_xe_query_gts __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct drm_xe_query_gts *gts;
@@ -228,14 +240,12 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (XE_IOCTL_ERR(xe, !gts))
 		return -ENOMEM;
 
-	gts->num_gt = xe->info.tile_count;
+	gts->num_gt = num_gt(xe);
 	for_each_gt(gt, xe, id) {
-		if (id == 0)
-			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
-		else if (xe_gt_is_media_type(gt))
+		if (xe_gt_is_media_type(gt))
 			gts->gts[id].type = XE_QUERY_GT_TYPE_MEDIA;
 		else
-			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
+			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
 		gts->gts[id].instance = id;
 		gts->gts[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
@@ -290,7 +300,7 @@ static int query_hwconfig(struct xe_device *xe,
 
 static size_t calc_topo_query_size(struct xe_device *xe)
 {
-	return xe->info.tile_count *
+	return num_gt(xe) *
 		(3 * sizeof(struct drm_xe_query_topology_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
-- 
2.40.0

