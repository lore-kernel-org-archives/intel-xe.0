Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF472C7EE31
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEB410E52E;
	Thu,  1 Jun 2023 00:04:19 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4036E10E521
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577857; x=1717113857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n5afO0RHVThv/jLeuCKhkjStB0gjjqRiDJfwMd9HR/Y=;
 b=LDDCo6+4enRaeKtaA2GHNAwwC9WTJfKgD4I8imVJLh9EjOYpnTYzpKhw
 jTS0QXCcTsK5eCVpn6RSiqBfB00EpH7+VVjIqmkdGZXEIzvQIfkm49cf9
 DlIffhoOKENzJcRlaSk0UBZPWsBT/BW2KEi1dHvqBAQiqbAFRriQZmteq
 5NhzWhtP8VlUv/WxdqLtUx7eGax8EPycF5NIFT4zMWtAwSmEBtnAMZCPM
 OqVyO8m94iqYL1weB4vMb2plkSRpZWIjmTZmQabUFX2/n1rwARNp04jDJ
 3QoyNEraQkYVt+JVhNFTUvFjyyhzqZwz9imu4+of503AC17vtEdMLc+bD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996874"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996874"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556247"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556247"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:04:01 -0700
Message-Id: <20230601000403.432517-30-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 29/31] drm/xe: Update query uapi to support
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

Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 8087c94dd782..a47b0da5ef5c 100644
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
@@ -228,14 +228,12 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
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
 		else
-			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
+			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
 		gts->gts[id].instance = id;
 		gts->gts[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
@@ -290,7 +288,7 @@ static int query_hwconfig(struct xe_device *xe,
 
 static size_t calc_topo_query_size(struct xe_device *xe)
 {
-	return xe->info.tile_count *
+	return xe->info.gt_count *
 		(3 * sizeof(struct drm_xe_query_topology_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
-- 
2.40.1

