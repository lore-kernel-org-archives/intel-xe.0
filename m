Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E734C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5847510E8E5;
	Thu,  9 Nov 2023 15:46:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56B010E8E8
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544772; x=1731080772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qRFRIKyY/UzxZGMWC3wM5yZ0JXaFrWVD5t4Sb7UBtPE=;
 b=Gj+LypLfmTvIO0Iram+5FEl62njwyMS+rKDnIDs9G462PLOiMuP/ysEw
 7k8YeJmsekAOt18rAR9MBbHPr9ZeE62D38DQJW/nqwDc0uF/aBMU1BMH5
 MFtckBTDyvymKxuLKyp7lEqGNEp81vHWBQKFIgg0jUnahVBjDyH7kbKfN
 F2KyWB/cRkKfatJP6AjNfiOLQGWJ2sAgx4ckJgbQUrACfbQ1wBrlj95U7
 n1Cv2TY2ZcPIAxNrbBULID6vvOi77aV84Hr5cHj6dTgEHg/KcKhFES1RM
 BZHO8ufcIin4unbVHTspvg1zVbVvsrc8HsMV80Iz+9AaPYHTN4++xosE2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556820"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556820"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886081"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886081"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:58 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:49 +0000
Message-Id: <20231109154457.7-36-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 35/43] drm/xe/uapi: Refactor engine information
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
 include/uapi/drm/xe_drm.h               | 10 ++++++++--
 4 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 064f25e5e3a5..e30363bb5152 100644
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
 	int len = num_bb_per_exec * num_eng_per_bb;
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
 								    args->num_eng_per_bb);
@@ -677,7 +678,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 					      &q->multi_gt_link);
 		}
 	} else {
-		gt = xe_device_get_gt(xe, eci[0].gt_id);
+		gt = xe_device_get_gt(xe, eci[0].sched_group_id);
 		logical_mask = calc_validate_logical_mask(xe, gt, eci,
 							  args->num_bb_per_exec,
 							  args->num_eng_per_bb);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e5db18c91f01..99e1bfa9b446 100644
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
index df8c5663f899..342f22c2d9f0 100644
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
-- 
2.34.1

