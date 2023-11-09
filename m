Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4769C001B2
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF48D10E8DF;
	Thu,  9 Nov 2023 15:46:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85E310E8EB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544772; x=1731080772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XuBy46KgvyNWga6syxBvxyP9t1+KL+HLHrmQrJ6ObXc=;
 b=YM2Q+2VbF3S9YdqeA4YdM7oFTAXo1/XVpbzQmWuz6TstnwzM7GbBellk
 IYKIHoom0z/AKqFr30eDJXhCBFF7KSBucpiAhiKOSHIXrSh87nP4sexFv
 u8pbW96Vzg52Zn2/ghw2x9TIZ7dJHWZJZEVTXp90YpccBl86ts1119nvN
 icHNrFplMfbHbuEbVuYGn58r2xEGrhJxKXh3LlbT6RhIc4NIJ7MrXgw7N
 rvZUt1JAACnXUcwB3TeTKZbFZ9KQajIcerk5brETM3rtU/aLgCnRK+Qe7
 3UbCklnQ+M8qwatrf8+Yl9CR5S/jmERv5pE+yx0QvkS/S0Hg/8l0zvIf/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556840"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556840"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886091"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886091"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:46:02 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:52 +0000
Message-Id: <20231109154457.7-39-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 38/43] drm/xe/uapi: Remove bogus engine list
 from the wait_user_fence IOCTL
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

Right now this is only checking if the engine list is sane and nothing
else. In the end every operation with this IOCTL is a soft check.
So, let's formalize that and only use this IOCTL to wait on the fence.

Upon timeout, userspace need then to inspect the engine properties
like BAN, in order to determine the reset status and any other
information that can be (or be added) there.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 56 +------------------------
 include/uapi/drm/xe_drm.h               | 17 +-------
 2 files changed, 3 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index dcbb1c578b22..a9d231548498 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -58,29 +58,7 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
 	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
 };
 
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
-		if (eci[i].sched_group_id >= xe->info.tile_count)
-			return -EINVAL;
-
-		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].sched_group_id),
-				     user_class, eci[i].engine_instance, true))
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
-#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
-			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
+#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
 #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
 
 static long to_jiffies_timeout(struct xe_device *xe,
@@ -132,12 +110,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
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
 
@@ -151,41 +125,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
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
index 174e3b98b361..3e3f2428e6c6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1279,8 +1279,7 @@ struct drm_xe_wait_user_fence {
 	/** @op: wait operation (type of comparison) */
 	__u16 op;
 
-#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
-#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
+#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
 	/** @flags: wait flags */
 	__u16 flags;
 
@@ -1313,20 +1312,8 @@ struct drm_xe_wait_user_fence {
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
-
 	/** @reserved: Reserved */
-	__u64 reserved[2];
+	__u64 reserved[4];
 };
 
 /**
-- 
2.34.1

