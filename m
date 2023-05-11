Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57032C7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE25710E59A;
	Thu, 11 May 2023 03:47:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344F210E593
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=darHot0Hf6FpdLLIIUMDsl3l4g8cMj/XVSYchWS037E=;
 b=BxXXDBFFR8Z1fq4J6mDJ3U+uE1XwsgVzMttIh/QojYV1otkkCHNvxbvZ
 9E7a5KKq7Rt31H+GzVk31ADL69KwaNroMM0T4M3vNI+QtT+w9/xZDSI+p
 2tVpW1FbT/Wa26icGjmtlaYS6XxXH+eCfc+eTl9OCuNqx2msnqKokyfKY
 rhfRBqdIHc5EOTQ7tx+3yPCmGNF1yxbLqmTUBqoIm0ctKmFcSuzOGwgK3
 Hc8Bl+4LsTmoNdf153mnxJRxPvs9L2kWhx7mXmHOGL+t7TbR9bkMPnavo
 f/zktcm4Ty82N6iYE7h9sB3zGURjiwcwpfaPWXG/p7O0dapJ782QW4h/k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850641"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850641"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203210"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203210"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:07 -0700
Message-Id: <20230511034722.1929038-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/26] drm/xe: Drop extra_gts[] declarations and
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
The primary GT of the root tile and the remote tiles behave the same way
and don't need independent handling.

When we re-add support for media GTs in a future patch, the presence of
media can be determined from MEDIA_VER() (i.e., >= 13) and media's GSI
offset handling is expected to remain constant for all forseeable future
platforms, so it won't need to be provided in a definition structure
either.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h |  1 -
 drivers/gpu/drm/xe/xe_pci.c      | 37 ++++++--------------------------
 2 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 8a5f9122ba80..5e0bfb21ae1c 100644
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
index 0f3508c72c79..bfdc9563e54f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -46,7 +46,6 @@ struct xe_device_desc {
 
 	const char *platform_name;
 	const struct xe_subplatform_desc *subplatforms;
-	const struct xe_gt_desc *extra_gts;
 
 	enum xe_platform platform;
 
@@ -254,20 +253,11 @@ static const struct xe_device_desc dg2_desc = {
 	DG2_FEATURES,
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
 	.require_force_probe = true,
-	.extra_gts = pvc_gts,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -531,26 +521,13 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.id = id;
 		gt->tile = tile;
 
-		gt->info.id = id;
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
-			gt->info.__engine_mask = xe_gt_is_media_type(gt) ?
-				media_desc->hw_engine_mask :
-				graphics_desc->hw_engine_mask;
-			gt->mmio.adj_limit =
-				desc->extra_gts[id - 1].mmio_adj_limit;
-			gt->mmio.adj_offset =
-				desc->extra_gts[id - 1].mmio_adj_offset;
-		}
+		gt->info.id = id;	/* FIXME: Determine sensible numbering */
+		gt->info.type = XE_GT_TYPE_MAIN;
+		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
+		if (MEDIA_VER(xe) < 13 && media_desc)
+			gt->info.__engine_mask |= media_desc->hw_engine_mask;
+
+		/* TODO: Init media GT, if present */
 	}
 
 	return 0;
-- 
2.40.0

