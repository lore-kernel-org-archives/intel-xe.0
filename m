Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A98C7EE2F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC2610E604;
	Thu,  1 Jun 2023 21:52:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CD610E613
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656371; x=1717192371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LH4gz+UxYk8lArfwbpxMvKzqj2pwhD2E7iqTVItS/Xw=;
 b=E6InyiQRZEfmqgV9t5pgK6ZBB6QktPUjvVX6tvegIsFlAaDSEOjkAAdI
 lc9jlAmABXAjnbXR57hpliO48+Qn1yQNhwK5uiQnBHaPuoO8bjWm9/W2H
 kSU5aUCaRfl6v7kgY9Ci3N97pNKOT3aJZFcTzWtHvrp+2rt9WW24+xc3k
 m4O8yZPjcnunkrMoUqKFGGHuXs0C7NgzFPLSQoNnybYKSO/t+q/hB+7dS
 iO4CL9aNPlIBvWc/XQuyVGv8Tc8WVgfJ/UNfz4xrfIId1b8k66z+3wxc0
 AIL8SSNS5PYyQhKntbafyq3Kfk6MHyFSg0wIxce9chEiR9vQdCNM8U3BL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313641"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313641"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563637"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563637"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:41 -0700
Message-Id: <20230601215244.678611-29-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 28/31] drm/xe: Allow GT looping and lookup on
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

Allow xe_device_get_gt() and for_each_gt() to operate as expected on
platforms with standalone media.

FIXME: We need to figure out a consistent ID scheme for GTs.  This patch
keeps the pre-existing behavior of 0/1 being the GT IDs for both PVC
(multi-tile) and MTL (multi-GT), but depending on the direction we
decide to go with uapi, we may change this in the future (e.g., to
return 0/1 on PVC and 0/2 on MTL).  Or if we decide we only need to
expose tiles to userspace and not GTs, we may not even need ID numbers
for the GTs anymore.

v2:
 - Restructure a bit to make the assertions more clear.
 - Clarify in commit message that the goal here is to preserve existing
   behavior; UAPI-visible changes may be introduced in the future once
   we settle on what we really want.
v3:
 - Store total GT count in xe_device for ease of lookup.  (Brian)
 - s/(id__++)/(id__)++/  (Gustavo)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h       | 40 +++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          |  6 ++++-
 3 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index f2d8479f6ff6..779f71d066e6 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -53,18 +53,42 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
 	return &xe->tiles[0];
 }
 
+#define XE_MAX_GT_PER_TILE 2
+
+static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id)
+{
+	if (drm_WARN_ON(&tile_to_xe(tile)->drm, gt_id > XE_MAX_GT_PER_TILE))
+		gt_id = 0;
+
+	return gt_id ? tile->media_gt : tile->primary_gt;
+}
+
 static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 {
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct xe_gt *gt;
 
-	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
+	/*
+	 * FIXME: This only works for now because multi-tile and standalone
+	 * media are mutually exclusive on the platforms we have today.
+	 *
+	 * id => GT mapping may change once we settle on how we want to handle
+	 * our UAPI.
+	 */
+	if (MEDIA_VER(xe) >= 13) {
+		gt = xe_tile_get_gt(root_tile, gt_id);
+	} else {
+		if (drm_WARN_ON(&xe->drm, gt_id > XE_MAX_TILES_PER_DEVICE))
+			gt_id = 0;
 
-	gt = xe->tiles[gt_id].primary_gt;
-	if (drm_WARN_ON(&xe->drm, !gt))
+		gt = xe->tiles[gt_id].primary_gt;
+	}
+
+	if (!gt)
 		return NULL;
 
-	XE_BUG_ON(gt->info.id != gt_id);
-	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
+	drm_WARN_ON(&xe->drm, gt->info.id != gt_id);
+	drm_WARN_ON(&xe->drm, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
 
 	return gt;
 }
@@ -100,8 +124,12 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
 		for_each_if ((tile__) = &(xe__)->tiles[(id__)])
 
+/*
+ * FIXME: This only works for now since multi-tile and standalone media
+ * happen to be mutually exclusive.  Future platforms may change this...
+ */
 #define for_each_gt(gt__, xe__, id__) \
-	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
+	for ((id__) = 0; (id__) < (xe__)->info.gt_count; (id__)++) \
 		for_each_if ((gt__) = xe_device_get_gt((xe__), (id__)))
 
 static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index da553878448d..17b6b1cc5adb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -190,6 +190,8 @@ struct xe_device {
 		u8 vram_flags;
 		/** @tile_count: Number of tiles */
 		u8 tile_count;
+		/** @gt_count: Total number of GTs for entire device */
+		u8 gt_count;
 		/** @vm_max_level: Max VM level */
 		u8 vm_max_level;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ddb256a4e39c..51207e94b254 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -556,7 +556,11 @@ static int xe_info_init(struct xe_device *xe,
 			return PTR_ERR(tile->primary_gt);
 
 		gt = tile->primary_gt;
-		gt->info.id = id;	/* FIXME: Determine sensible numbering */
+		/*
+		 * FIXME: GT numbering scheme may change depending on UAPI
+		 * decisions.
+		 */
+		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
 		if (MEDIA_VER(xe) < 13 && media_desc)
-- 
2.40.1

