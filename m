Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D7EC88C83
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1A510E52F;
	Thu,  1 Jun 2023 00:04:19 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E29710E51E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577857; x=1717113857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZMrSgKPYfmqvP+KOuc4yxWYMVrpIgrEgSK9c0fVyY6M=;
 b=Kff59yxx6tGJq5a5eJ1JIsdngCpE8kBJ77woPk1tT/PVEnHkMBtHhYk9
 e6leeX+Rj0CZxORlw+t8GDkVCaCIbWxAXaKyW8zZJwlJwGeIyqPzAmH66
 OiaP7idM8OmvGvHFsfGhKiHCnDF03JEu9cUnJ+8CNProm0BTpLptiXASq
 0HhfPNPQuMleDZH1wvQJkrnHgxMEdaUgJOaXWoAVUMYRgLbUD3eI6ltE9
 dOer3ARbltIwmpfyGzd8i0uB88h8EKlnRsH4QyQuvA9bTF1Nd8ozmXawp
 t0cF58AGuafYjlhO6FaCFNzEz/GwNvc1S6l2XqUoS+AMiOnusO0e+7fGE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996871"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996871"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556243"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556243"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:04:00 -0700
Message-Id: <20230601000403.432517-29-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 28/31] drm/xe: Allow GT looping and lookup on
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
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

