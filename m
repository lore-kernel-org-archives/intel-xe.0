Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F5BC7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2905710E4A5;
	Fri, 19 May 2023 23:19:12 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124EB10E62C
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538330; x=1716074330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bFANWVN+z32+lb3yTsBiD5J072Kd6YIEX5v6bBE64rA=;
 b=CiAzBkc22cJwFMzYXVnZHRlL0UazV2bC1UxUOLpCGd/9afKgx1BSoAZg
 yjaLwP4L/GlhBgWk9GEt0nuVf80NtXP0887skWp+fc71H2a5bMk/dF6vM
 gJc3jCQod/9LE8c3+XWIbpBlJSa4FxhOXl+IANZMKirxKhfrDwAvB3Arw
 NWG8rvqkMYxWQJ4EuiqUI6Xr2ZJP/fA4LT6m6qvxVJGrknj9LdeLfhgxA
 KzIDzXU01ugs7/1aSeJfO4LbJLq5YGZvNRkzN1vc9RQE6lZa/fhORM1gV
 Zv7H5NUK1K7Ajrum0r+IIXApG04bO5b+uNH26dLEh7ZoC2Mwdho3liuoi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526385"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526385"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888765"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888765"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:24 -0700
Message-Id: <20230519231827.3572452-28-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 27/30] drm/xe: Allow GT looping and lookup on
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

FIXME: We need to figure out a consistent ID scheme for GTs.  At the
moment our platforms either have multi-tile (i.e., PVC) or standalone
media (MTL) but not both.  If a future platform supports both of these
capabilities at the same time, how will we number the GTs of the
platform?   primary-primary-media-media?  primary-media-primary-media?
For that matter should we even still be exposing the concept of 'GT' to
userspace or should that switch to tile instead (and keep the hardware's
separation of render and media an internal implementation detail like it
is on i915)?  If we only expose tiles to userspace and not GTs, then we
may not even need per-GT ID numbers anymore.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 156c62ac0381..e0085fcd3f47 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -55,16 +55,27 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
 
 static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 {
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct xe_gt *gt;
 
-	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
+	if (drm_WARN_ON(&xe->drm, gt_id > XE_MAX_TILES_PER_DEVICE))
+		return root_tile->primary_gt;
 
-	gt = xe->tiles[gt_id].primary_gt;
-	if (drm_WARN_ON(&xe->drm, !gt))
+	/*
+	 * FIXME: This only works for now because multi-tile and standalone
+	 * media are mutually exclusive on the platforms we have today.
+	 */
+	if (MEDIA_VER(xe) >= 13) {
+		gt = gt_id ? root_tile->media_gt : root_tile->primary_gt;
+	} else {
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
@@ -98,8 +109,12 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
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
2.40.0

