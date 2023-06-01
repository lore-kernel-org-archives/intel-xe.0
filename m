Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2325EC7EE43
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 20:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ED210E5D1;
	Thu,  1 Jun 2023 20:30:36 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6C510E5C0
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651433; x=1717187433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5wg6pv0lMK1OO6sQdnJQuN4jLvjCNqjEvsztE57MYt0=;
 b=ghfVfp67uBiD6Por9hxzF/IJ7ZXIP6mljD7MJhbXOof1loCpnnhkchLC
 EN4Ic6oVnh0nvqyaj+wqZhNSCK8h1BOo0kiGqQS5GAP/XjiXEako6140k
 dIT7kiAHdCRwfbeanmPbSJkoP8vE5faVITBUMJ7hSy/qFVVrK3brLDHNW
 qXtW2tW89Tm29gTNd3/sD13MPAdpoT3fPI/9FSnf2nx10AsE/ugppGApm
 o8mNP9aLDb5ma2hyBHA8xTxolvEiC0dZJlyprtVp+rHE5vp2Y+Q09Fed+
 Db01r4Tc0hW7ol3L/+LL0GxEFxGJEcNcrMxB9A+vmLh3ep5L4vor/V5Ug g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358102526"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358102526"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740493263"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740493263"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:30:11 -0700
Message-Id: <20230601203025.615494-18-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601203025.615494-1-matthew.d.roper@intel.com>
References: <20230601203025.615494-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 17/31] drm/xe: Drop extra_gts[] declarations and
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

