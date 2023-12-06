Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B1DC10DC1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 03:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE6A10E07A;
	Wed,  6 Dec 2023 03:46:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5976A10E076
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 03:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701834375; x=1733370375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ox+e4BMeVCssLGEyTMtX31DSEcJ4ejV6LDVmuA1s2tE=;
 b=n8ev8vgVZ/SxyawaTxptAEazXwNf1Z5AZ7EN130ibKda4AS14B76K5fc
 ekRemVjqMJ1Aj3N3hG5xbslRdmpkaHy3vkz5LerSq8sHNclHm3+iGsNlT
 99yTZco9XR7/57PJ+W1Ob1PVZf5Xyk1plnj00m8sV6ieeSiZY4M61s8eW
 XYn4IAyLTS4RuZqyIM/jA1nKIRWNZTfx3FPoT8hvvQvBHFnkvXiQZCVka
 sKAWhQDflWz5ZC/NEmflGSuFk1eWo3rdxtDMm3ASEiI49VeuR4GfvxsAl
 WJ9PX+QB7kEJ3C7fOBoBxYFAwWzIxjNWspHTmio7AMf2dUf+JAXdWbUb/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="480197289"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="480197289"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 19:46:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774854132"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="774854132"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2023 19:46:13 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 09:11:29 +0530
Message-Id: <20231206034130.7897-2-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
References: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/2] drm/xe/uapi: add exec_queue_id member to
 drm_xe_wait_user_fence structure
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

remove the num_engines/instances members from drm_xe_wait_user_fence
structure and add a exec_queue_id member

Right now this is only checking if the engine list is sane and nothing
else. In the end every operation with this IOCTL is a soft check.
So, let's formalize that and only use this IOCTL to wait on the fence.

exec_queue_id member will help to user space to get proper error code
from kernel while in exec_queue reset

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 64 +------------------------
 include/uapi/drm/xe_drm.h               | 16 ++-----
 2 files changed, 4 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 4d5c2555ce41..9f272bbaad95 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -50,37 +50,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 	return passed ? 0 : 1;
 }
 
-static const enum xe_engine_class user_to_xe_engine_class[] = {
-	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
-	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
-	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
-	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
-};
-
-static int check_hw_engines(struct xe_device *xe,
-			    struct drm_xe_engine_class_instance *eci,
-			    int num_engines)
-{
-	int i;
-
-	for (i = 0; i < num_engines; ++i) {
-		enum xe_engine_class user_class =
-			user_to_xe_engine_class[eci[i].engine_class];
-
-		if (eci[i].gt_id >= xe->info.tile_count)
-			return -EINVAL;
-
-		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
-				     user_class, eci[i].engine_instance, true))
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
-#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
-			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
+#define VALID_FLAGS	DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
 #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
 
 static long to_jiffies_timeout(struct xe_device *xe,
@@ -132,12 +102,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
 	struct drm_xe_wait_user_fence *args = data;
-	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
-	struct drm_xe_engine_class_instance __user *user_eci =
-		u64_to_user_ptr(args->instances);
 	u64 addr = args->addr;
 	int err;
-	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
 	long timeout;
 	ktime_t start;
 
@@ -151,41 +117,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, no_engines &&
-			 (args->num_engines || args->instances)))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, addr & 0x7))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
-		return -EINVAL;
-
-	if (!no_engines) {
-		err = copy_from_user(eci, user_eci,
-				     sizeof(struct drm_xe_engine_class_instance) *
-			     args->num_engines);
-		if (XE_IOCTL_DBG(xe, err))
-			return -EFAULT;
-
-		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
-						      args->num_engines)))
-			return -EINVAL;
-	}
-
 	timeout = to_jiffies_timeout(xe, args);
 
 	start = ktime_get();
 
-	/*
-	 * FIXME: Very simple implementation at the moment, single wait queue
-	 * for everything. Could be optimized to have a wait queue for every
-	 * hardware engine. Open coding as 'do_compare' can sleep which doesn't
-	 * work with the wait_event_* macros.
-	 */
 	add_wait_queue(&xe->ufence_wq, &w_wait);
 	for (;;) {
 		err = do_compare(addr, args->value, args->mask, args->op);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index eb03a49c17a1..d922641e11e8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1030,8 +1030,7 @@ struct drm_xe_wait_user_fence {
 	/** @op: wait operation (type of comparison) */
 	__u16 op;
 
-#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
-#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
+#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
 	/** @flags: wait flags */
 	__u16 flags;
 
@@ -1064,17 +1063,8 @@ struct drm_xe_wait_user_fence {
 	 */
 	__s64 timeout;
 
-	/**
-	 * @num_engines: number of engine instances to wait on, must be zero
-	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 num_engines;
-
-	/**
-	 * @instances: user pointer to array of drm_xe_engine_class_instance to
-	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 instances;
+	/** @exec_queue_id: exec_queue_id returned from xe_exec_queue_create_ioctl */
+	__u32 exec_queue_id;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.25.1

