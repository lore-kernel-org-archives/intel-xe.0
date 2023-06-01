Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCD9C7EE39
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DEC10E5E6;
	Thu,  1 Jun 2023 21:53:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD86E10E5DD
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656368; x=1717192368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5wg6pv0lMK1OO6sQdnJQuN4jLvjCNqjEvsztE57MYt0=;
 b=Yg8FAN2xRmVYIsZarGzQpuZs8mOhebMqOd1edKJnGxoxy5ocJMJSiqCe
 r0KMcF6O+p6p9HOXE+n6bdXjdsPeNzl8ELp/ngoD9/YaTfT1/Ub9YX0Vw
 2LbRI0rkmb8/ETzqlCb35MGTwgdyO5hUKEFNO6ZwQ7GnTrj4EXavsn3SR
 fwnQuDwYMXwpVdvM8dmi0NK8H5LXnXKxMKCncV6QchN9fYsf1qzq8W/WF
 v2Jm5y9o7yS7b1RcVP72fUBEu+pX8Y6TByAY5B8HymfdMKwVaWp49lWj2
 rc5IYsK0J19edU4Zg5z2KhdzJxCrOXQVHdwVPQfqA3nhsygwo4ioi/RWp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313615"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313615"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563600"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563600"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:30 -0700
Message-Id: <20230601215244.678611-18-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 17/31] drm/xe: Drop extra_gts[] declarations and
 XE_GT_TYPE_REMOTE
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

Now that tiles and GTs are handled separately, extra_gts[] doesn't
really provide any useful information that we can't just infer directly.
The primary GT of the root tile and of the remote tiles behave the same
way and don't need independent handling.

When we re-add support for media GTs in a future patch, the presence of
media can be determined from MEDIA_VER() (i.e., >= 13) and media's GSI
offset handling is expected to remain constant for all forseeable future
platforms, so it won't need to be provided in a definition structure
either.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h |  1 -
 drivers/gpu/drm/xe/xe_pci.c      | 36 ++++++--------------------------
 2 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 34d5dd98885e..99ab7ec99ccd 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -20,7 +20,6 @@ struct xe_ring_ops;
 enum xe_gt_type {
 	XE_GT_TYPE_UNINITIALIZED,
 	XE_GT_TYPE_MAIN,
-	XE_GT_TYPE_REMOTE,
 	XE_GT_TYPE_MEDIA,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4cb4b5810f40..723d69b88a52 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -45,7 +45,6 @@ struct xe_device_desc {
 
 	const char *platform_name;
 	const struct xe_subplatform_desc *subplatforms;
-	const struct xe_gt_desc *extra_gts;
 
 	enum xe_platform platform;
 
@@ -271,21 +270,12 @@ static const struct xe_device_desc dg2_desc = {
 	.has_display = true,
 };
 
-static const struct xe_gt_desc pvc_gts[] = {
-	{
-		.type = XE_GT_TYPE_REMOTE,
-		.mmio_adj_limit = 0,
-		.mmio_adj_offset = 0,
-	},
-};
-
 static const struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
 	.has_display = false,
 	.require_force_probe = true,
-	.extra_gts = pvc_gts,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -561,28 +551,14 @@ static int xe_info_init(struct xe_device *xe,
 		tile->id = id;
 
 		gt = &tile->primary_gt;
-		gt->info.id = id;
+		gt->info.id = id;	/* FIXME: Determine sensible numbering */
 		gt->tile = tile;
+		gt->info.type = XE_GT_TYPE_MAIN;
+		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
+		if (MEDIA_VER(xe) < 13 && media_desc)
+			gt->info.__engine_mask |= media_desc->hw_engine_mask;
 
-		if (id == 0) {
-			gt->info.type = XE_GT_TYPE_MAIN;
-
-			gt->info.__engine_mask = graphics_desc->hw_engine_mask;
-			if (MEDIA_VER(xe) < 13 && media_desc)
-				gt->info.__engine_mask |= media_desc->hw_engine_mask;
-
-			gt->mmio.adj_limit = 0;
-			gt->mmio.adj_offset = 0;
-		} else {
-			gt->info.type = desc->extra_gts[id - 1].type;
-			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
-				media_desc->hw_engine_mask :
-				graphics_desc->hw_engine_mask;
-			gt->mmio.adj_limit =
-				desc->extra_gts[id - 1].mmio_adj_limit;
-			gt->mmio.adj_offset =
-				desc->extra_gts[id - 1].mmio_adj_offset;
-		}
+		/* TODO: Init media GT, if present */
 	}
 
 	return 0;
-- 
2.40.1

