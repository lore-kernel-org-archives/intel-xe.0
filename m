Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56357C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C0710EA0E;
	Fri,  3 Nov 2023 14:36:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846E810EA00
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022162; x=1730558162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KORIfEtcnAguvSup3HZJg+PFvUtyJbh6GXSHYY+v8eg=;
 b=RECf1cKofa3CqjTDupkbrOmGIOFOCw3/2x+NJStdET/OoUognLdvIkOB
 IsVFChDiyPYRekTj6Q+t5DhEFJywwFv+eJK/Pyf9WbuQ+/uucN5OvgjG6
 1M6RS+sPR9TKnoFg3mRgDNnwjYPZWd34uV6v2eJN2/BGDT0MMoxhuG/gc
 JCZDSEkNDxkB0tEty3lqmugEHRRLYaAex7BF1nIRGOHn4BOhzIAvkJevr
 Y1VRg7NxUG0WONCpePuS3vwg3D3MBN7NHCNOxc7RO9vVyihGqoExhog47
 JwxzbOOeMy/mb6TRPjSZ8Noep0ypXH76oCoNOVKtUEsr+rn2nFMKU4s/U g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843528"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843528"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832538"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832538"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:55 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:45 +0000
Message-Id: <20231103143456.7-40-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 39/50] drm/xe/uapi: Refactor engine information
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

First of all, let's add the tile and gt IDs to the engine_info.
We originally tried to abstract tile from the uAPI, but it is
not future proof since the tile might be important info to the
user space in regarding cache line information.

Now that we have gt_id as part of the info, let's convert
the instance.gt_id into a generic scheduling group id number.
For all the current platforms, the scheduling group is the
GT ID underneath, but at least the API becomes flexible enough
to allow different kind of engine grouping without necessarily
get so tied to the GT ID.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c      | 17 +++++++++--------
 drivers/gpu/drm/xe/xe_query.c           | 13 ++++++++++---
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  4 ++--
 include/uapi/drm/xe_drm.h               | 12 ++++++++++--
 4 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 849e463c4ed8..15fe709384e7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -500,13 +500,13 @@ find_hw_engine(struct xe_device *xe,
 	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
 		return NULL;
 
-	if (eci.gt_id >= xe->info.gt_count)
+	if (eci.sched_group_id >= xe->info.gt_count)
 		return NULL;
 
 	idx = array_index_nospec(eci.engine_class,
 				 ARRAY_SIZE(user_to_xe_engine_class));
 
-	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
+	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.sched_group_id),
 			       user_to_xe_engine_class[idx],
 			       eci.engine_instance, true);
 }
@@ -547,7 +547,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 	int len = num_bb_per_exec * num_dispositions;
 	int i, j, n;
 	u16 class;
-	u16 gt_id;
+	u16 sched_group_id;
 	u32 return_mask = 0, prev_mask;
 
 	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe) &&
@@ -569,12 +569,13 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 			if (XE_IOCTL_DBG(xe, xe_hw_engine_is_reserved(hwe)))
 				return 0;
 
-			if (XE_IOCTL_DBG(xe, n && eci[n].gt_id != gt_id) ||
+			if (XE_IOCTL_DBG(xe, n &&
+					 eci[n].sched_group_id != sched_group_id) ||
 			    XE_IOCTL_DBG(xe, n && eci[n].engine_class != class))
 				return 0;
 
 			class = eci[n].engine_class;
-			gt_id = eci[n].gt_id;
+			sched_group_id = eci[n].sched_group_id;
 
 			if (num_bb_per_exec == 1 || !i)
 				return_mask |= BIT(eci[n].engine_instance);
@@ -623,7 +624,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
+	if (XE_IOCTL_DBG(xe, eci[0].sched_group_id >= xe->info.gt_count))
 		return -EINVAL;
 
 	if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
@@ -636,7 +637,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (xe_gt_is_media_type(gt))
 				continue;
 
-			eci[0].gt_id = gt->info.id;
+			eci[0].sched_group_id = gt->info.id;
 			logical_mask = bind_exec_queue_logical_mask(xe, gt, eci,
 								    args->num_bb_per_exec,
 								    args->num_dispositions);
@@ -677,7 +678,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 					      &q->multi_gt_link);
 		}
 	} else {
-		gt = xe_device_get_gt(xe, eci[0].gt_id);
+		gt = xe_device_get_gt(xe, eci[0].sched_group_id);
 		logical_mask = calc_validate_logical_mask(xe, gt, eci,
 							  args->num_bb_per_exec,
 							  args->num_dispositions);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4ee002b76f21..e23c179c9cec 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -131,10 +131,10 @@ query_engine_cycles(struct xe_device *xe,
 		return -EINVAL;
 
 	eci = &resp.eci;
-	if (eci->gt_id > XE_MAX_GT_PER_TILE)
+	if (eci->sched_group_id > XE_MAX_GT_PER_TILE)
 		return -EINVAL;
 
-	gt = xe_device_get_gt(xe, eci->gt_id);
+	gt = xe_device_get_gt(xe, eci->sched_group_id);
 	if (!gt)
 		return -EINVAL;
 
@@ -215,8 +215,15 @@ static int query_engines(struct xe_device *xe,
 				xe_to_user_engine_class[hwe->class];
 			hw_engine_info[i].instance.engine_instance =
 				hwe->logical_instance;
-			hw_engine_info[i].instance.gt_id = gt->info.id;
+			/*
+			 * Scheduling Group ID is the global GT ID for the
+			 * current hardware, although the API is flexible
+			 */
+			hw_engine_info[i].instance.sched_group_id = gt->info.id;
 			hw_engine_info[i].instance.pad = 0;
+			hw_engine_info[i].tile_id = gt_to_tile(gt)->id;
+			hw_engine_info[i].gt_id = gt->info.id;
+
 			/*
 			 * The mem_regions indexes in the mask below need to
 			 * directly identify the struct
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 4d5c2555ce41..dcbb1c578b22 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -68,10 +68,10 @@ static int check_hw_engines(struct xe_device *xe,
 		enum xe_engine_class user_class =
 			user_to_xe_engine_class[eci[i].engine_class];
 
-		if (eci[i].gt_id >= xe->info.tile_count)
+		if (eci[i].sched_group_id >= xe->info.tile_count)
 			return -EINVAL;
 
-		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
+		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].sched_group_id),
 				     user_class, eci[i].engine_instance, true))
 			return -EINVAL;
 	}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index a6c70b8697c7..5b239c48f19d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -211,8 +211,8 @@ struct drm_xe_engine_class_instance {
 	__u16 engine_class;
 	/** @engine_instance: Engine instance */
 	__u16 engine_instance;
-	/** @gt_id: GT ID the instance is associated with */
-	__u16 gt_id;
+	/** @sched_group_id: Scheduling Group ID for this engine instance */
+	__u16 sched_group_id;
 	/** @pad: MBZ */
 	__u16 pad;
 };
@@ -228,6 +228,12 @@ struct drm_xe_query_engine_info {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
 
+	/** @tile_id: Tile ID where this Engine lives */
+	__u16 tile_id;
+
+	/** @gt_id: GT ID where this Engine lives */
+	__u16 gt_id;
+
 	/**
 	 * @near_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_regions that is near this engine.
@@ -1038,6 +1044,8 @@ struct drm_xe_exec_queue_create {
 	 * @instances: user pointer to a 2-d array of struct
 	 * drm_xe_engine_class_instance
 	 *
+	 * Every engine in the array needs to have the same @sched_group_id
+	 *
 	 * length = num_bb_per_exec (i) * num_dispositions (j)
 	 * index = j + i * num_bb_per_exec
 	 */
-- 
2.34.1

