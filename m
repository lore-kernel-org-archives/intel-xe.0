Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C49C83005
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3F610E440;
	Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9F010E439
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481372; x=1717017372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qfU9Cp784psrgsdSY0hFBmPZDdVf2tmVy+0wf6rzpAU=;
 b=F6TIsXoOyoqymxj7Ro8WB8F543Ix8N6tqw1AchPZ8EokqCUkcSW4KYo6
 N0cM++1AQtOAfoUEd6YgbKuPu0PiXzrIvcidn75KC2tLDb7kZFQ+gHeXG
 wGKKsdvkhZ8NtHncAqpQCPrwPoL+MsQSr82uO3hd+X1cslrtd6D/gZ/iq
 KqRDfeSZZK0RIVZQolHLj7gv0fMEcfaWxR+lmxClehBAiYhs9ofHyxdVl
 3SQoPbXF4rbd3pVcCeK8rj5kZ/SZ/GGZiFZrZc5v2Z+N+ynAw0UVU4x23
 tGyTCFMga6V/iR6N8ZRl9Qce/nIGWY3HG9ZPTzXx+d3FJk0e4XRgH5VTL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311967"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311967"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139492"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139492"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:46 -0700
Message-Id: <20230530211549.2632538-29-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 28/31] drm/xe: Allow GT looping and lookup on
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

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 40 +++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0a3a9134dd18..ea3270ea0d46 100644
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
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
 		for_each_if ((tile__) = &(xe__)->tiles[(id__)])
 
+/*
+ * FIXME: This only works for now since multi-tile and standalone media
+ * happen to be mutually exclusive.  Future platforms may change this...
+ */
 #define for_each_gt(gt__, xe__, id__) \
-	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
+	for ((id__) = 0; (id__) < (xe__)->info.tile_count + (MEDIA_VER(xe__) >= 13 ? 1 : 0); (id__++)) \
 		for_each_if ((gt__) = xe_device_get_gt((xe__), (id__)))
 
 static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
-- 
2.40.1

