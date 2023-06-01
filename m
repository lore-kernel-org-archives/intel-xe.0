Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA3EC77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E226E10E57A;
	Thu,  1 Jun 2023 15:59:19 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44E310E579
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685635158; x=1717171158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lJxMeLLjjMSmcm1fDE697YJln03pxnKesiKZJY9sepQ=;
 b=LhH/frPid8FU7Ousn21neuwAM+7AxL2XaznCmGyoYqj+m6cycpEvWKsj
 n+wZv2EtY6kRnPGsL9GJg2gcMLYlwICUej9Mx+FTNWsjfgvCEuy4P6nrY
 vNgQVCZGxDgQGtsxFO7QURQRFW3bumXpsyqKX61TNKGO0gtjyzjt3fSQE
 Hiu98FwLWV/qGSquz1lwIq1g3O3ugWKBGCjlO4oqf31Mfi+wDHerm7Npc
 1Td2pWGpB800ra5c3zNx4XCMYl0ev1VhLo+1kqWd1LkaRxsNJuOfoAia9
 sJO5LEbFTamh/DnfI4rAzhCqSxirhKLXr36IiqxJ8zpR7tWqKFZ4KZGVz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358895079"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358895079"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777259390"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="777259390"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:59:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 08:59:00 -0700
Message-Id: <20230601155900.498280-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1ddaea08-ed16-9cab-c8f3-b1222787722e@intel.com>
References: <1ddaea08-ed16-9cab-c8f3-b1222787722e@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4.1 29/31] drm/xe: Update query uapi to support
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

v2:
 - Drop num_gt() function in favor of stored xe->info.gt_count.  (Brian)
v3:
 - Keep XE_QUERY_GT_TYPE_REMOTE around for now.  Userspace probably
   doesn't actually need this, and we may remove it in the future, but
   for now let's avoid changing uapi.  (Brian)

Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 8087c94dd782..c4165fa3428e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -192,7 +192,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[XE_QUERY_CONFIG_VA_BITS] = 12 +
 		(9 * (xe->info.vm_max_level + 1));
-	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.tile_count;
+	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
 	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
 		hweight_long(xe->info.mem_region_mask);
 	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
@@ -211,7 +211,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 {
 	struct xe_gt *gt;
 	size_t size = sizeof(struct drm_xe_query_gts) +
-		xe->info.tile_count * sizeof(struct drm_xe_query_gt);
+		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
 	struct drm_xe_query_gts __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct drm_xe_query_gts *gts;
@@ -228,14 +228,14 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (XE_IOCTL_ERR(xe, !gts))
 		return -ENOMEM;
 
-	gts->num_gt = xe->info.tile_count;
+	gts->num_gt = xe->info.gt_count;
 	for_each_gt(gt, xe, id) {
-		if (id == 0)
-			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
-		else if (xe_gt_is_media_type(gt))
+		if (xe_gt_is_media_type(gt))
 			gts->gts[id].type = XE_QUERY_GT_TYPE_MEDIA;
-		else
+		else if (gt_to_tile(gt)->id > 0)
 			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
+		else
+			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
 		gts->gts[id].instance = id;
 		gts->gts[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
@@ -290,7 +290,7 @@ static int query_hwconfig(struct xe_device *xe,
 
 static size_t calc_topo_query_size(struct xe_device *xe)
 {
-	return xe->info.tile_count *
+	return xe->info.gt_count *
 		(3 * sizeof(struct drm_xe_query_topology_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
-- 
2.40.1

