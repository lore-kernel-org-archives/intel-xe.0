Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CDBC71150
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 00:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22010E2AE;
	Fri, 13 Jun 2025 00:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eoSFlSzm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBEE10E1E2
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749773693; x=1781309693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hkwK3zFckRzXL3RtZqkjU4FCkM7SenBFnrFzZkCowCc=;
 b=eoSFlSzmxpy600y5/FeFInMmuRZTxmV/lpLZx8j+fJfiNyiq58cxbtzo
 l627qWeRC9t8KMKVs5+iEmij62P6qAJVh9+GoUB/lJNggmYHxzsi8bZZi
 RBzjPphTFo9xGSe5ZhXAEKxRi5UDaB7YnaWwJYhHj++zt6l4k/oV5o79z
 x/T8Ct07jpfY21pOlHF4VcTWiccDHn8cOUgaFdwgPC8Tp56h+UkBWfOTm
 BDVmVQVzSbQ4TSZPE2H2UPxWtCXNPT5WXp8ninQ+Xta9XAPow8eKbNWkg
 dW+GnRcAkgWdlHrDV1aqG1pRx6HPqRZn42IHnLI8ng4CEjPEhJjmsB2zq A==;
X-CSE-ConnectionGUID: uTcSgsSKTgeqdbPDBi+Z6w==
X-CSE-MsgGUID: s8DvVKSWRvGg3WMqrjS5zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51204676"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="51204676"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:14:52 -0700
X-CSE-ConnectionGUID: t/TqldJJSGqNx0kjwje8Hg==
X-CSE-MsgGUID: KPGmxyI+TWqETqlnC84MkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="151491077"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:14:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 5/5] drm/xe: Don't compare GT ID to GT count when determining
 valid GTs
Date: Thu, 12 Jun 2025 17:14:44 -0700
Message-ID: <20250613001438.678728-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613001438.678728-7-matthew.d.roper@intel.com>
References: <20250613001438.678728-7-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On current platforms with multiple GTs, all of the GT IDs are
consecutive; as a result we know that the GT IDs range from 0 to
gt_count-1 and can determine if a GT ID is valid by comparing against
the count.  The consecutive nature of GT IDs may not hold true on future
platforms if/when we have platforms that are both multi-tile and have
multiple GTs within each tile.  Once such platforms exist, it's quite
possible that we could wind up with something like a GT list composed of
IDs 0, 2, and 3 with no GT 1 (which would be a 2-tile platform with
media only on the second tile).

To future-proof the code we should stop comparing against the GT count
to determine whether a GT ID is valid or not.  Instead we should do an
actual lookup of the ID to determine whether the GT exists.  This also
means that our GT loop macro should not end at the GT count, but should
rather examine the entire space up to (# of tiles) * (max GT per tile)
to ensure it doesn't stop prematurely.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h     | 6 +-----
 drivers/gpu/drm/xe/xe_eu_stall.c   | 6 ++++--
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 3 ++-
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6e8d912df357..22ebfd6fa474 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -127,12 +127,8 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
 
-/*
- * FIXME: This only works for now since multi-tile and standalone media
- * happen to be mutually exclusive.  Future platforms may change this...
- */
 #define for_each_gt(gt__, xe__, id__) \
-	for ((id__) = 0; (id__) < (xe__)->info.gt_count; (id__)++) \
+	for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \
 		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
 
 static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 96732613b4b7..af7916315ac6 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -258,11 +258,13 @@ static int set_prop_eu_stall_wait_num_reports(struct xe_device *xe, u64 value,
 static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
 				   struct eu_stall_open_properties *props)
 {
-	if (value >= xe->info.gt_count) {
+	struct xe_gt *gt = xe_device_get_gt(xe, value);
+
+	if (!gt) {
 		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
 		return -EINVAL;
 	}
-	props->gt = xe_device_get_gt(xe, value);
+	props->gt = gt;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fee22358cc09..8991b4aed440 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -610,7 +610,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
+	if (XE_IOCTL_DBG(xe, !xe_device_get_gt(xe, eci[0].gt_id)))
 		return -EINVAL;
 
 	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 3439c8522d01..796ba8c34a16 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1059,12 +1059,13 @@ struct xe_hw_engine *
 xe_hw_engine_lookup(struct xe_device *xe,
 		    struct drm_xe_engine_class_instance eci)
 {
+	struct xe_gt *gt = xe_device_get_gt(xe, eci.gt_id);
 	unsigned int idx;
 
 	if (eci.engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
 		return NULL;
 
-	if (eci.gt_id >= xe->info.gt_count)
+	if (!gt)
 		return NULL;
 
 	idx = array_index_nospec(eci.engine_class,
-- 
2.49.0

