Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B75C87FF1
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80F010E448;
	Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B826A10E439
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481372; x=1717017372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5SIrMCjxs6RSNCHGQrMsEZXoNJSUdBRvQBINteU0zcc=;
 b=Cc9Uae+9eZWOD6AYoKFJpRONjtKjx5+Ji+ClRQQK1Ie3ZehEmR0aVV4U
 494kg9OTK9CagmN5Us8GBA1M8zIxl8DUvRf6aJmx4UePfH3ZBiSqsQ2MQ
 Zmvjs/nZlPjDLUqsaMQlNMdN7xszAAChW4LtueCQqtATJwgN29fB8wccO
 pqE9j7vc+fXzffD6zAL3wJPnAoQfCHd/VaePWBs25RG1bENPWrq92N3gH
 z2+rPJqVqL3ccS4laMSuqP8T2JOi0Sgp0Pck7+/mvwTsRw8XXEVQfCCW3
 r5d/7iaj8OZ16EkB+qfrFtnAAc7Z7StP+rP0f6WG0q+C7V5Js+TJsprnv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311968"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311968"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139495"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139495"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:47 -0700
Message-Id: <20230530211549.2632538-30-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 29/31] drm/xe: Update query uapi to support
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
index 8087c94dd782..ce2f0d92a4e4 100644
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
2.40.1

