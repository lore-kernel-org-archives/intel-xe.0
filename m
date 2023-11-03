Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E85C00A5A
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD06010EA07;
	Fri,  3 Nov 2023 14:36:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169D610E9F8
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022158; x=1730558158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qoRkSDuNHtvyF3ROS88+FqRGTeEbfn5rwKvjqRbAj00=;
 b=Ke3GMwuIMZIPX/qaIEaIv2BU0Lz0W8QcnYI1hNgCaD3g3ebghXCSJM2G
 sGzoc1cbTe5UHILpigDnClo1VeIeK94i3NrvSTiCP4GaWLUMSLle/GzAG
 uQ8W00klB+9RPKI2ZP915gMkxYXHBl7z33eMvAxf9r8/PWQN7ALmnScGT
 VPpiKq0DpDfk27PNWxXW70KQRuijsx/jTTb1mI8Lhnc5U1IbQDE77TcoB
 8xMpVILGyYRDg7eEzWInpUSOkZ6lrxq8A7Pl+8TJnqBTVTpEVsdjVjeIl
 rhyjw1Tu1xACRYjwRyusi9F8PT5t0tvBrs+0e7DvY/zjJ7DrVuVu6hnci g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843461"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843461"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832506"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832506"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:44 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:35 +0000
Message-Id: <20231103143456.7-30-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 29/50] drm/xe/uapi: Split xe_sync types from
 flags
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

Let's continue on the uapi clean-up with more splits
with stuff into their own exclusive fields instead of
reusing stuff.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c       | 23 +++++++----------------
 drivers/gpu/drm/xe/xe_sync_types.h |  1 +
 include/uapi/drm/xe_drm.h          | 24 ++++++++++++------------
 3 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index eafe53c2f55d..883987b27c4e 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -17,8 +17,6 @@
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
 
-#define SYNC_FLAGS_TYPE_MASK 0x3
-
 struct user_fence {
 	struct xe_device *xe;
 	struct kref refcount;
@@ -109,15 +107,13 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
 		return -EFAULT;
 
-	if (XE_IOCTL_DBG(xe, sync_in.flags &
-			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_FLAG_SIGNAL)) ||
-	    XE_IOCTL_DBG(xe, sync_in.pad) ||
+	if (XE_IOCTL_DBG(xe, sync_in.flags & ~DRM_XE_SYNC_FLAG_SIGNAL) ||
 	    XE_IOCTL_DBG(xe, sync_in.reserved[0] || sync_in.reserved[1]))
 		return -EINVAL;
 
 	signal = sync_in.flags & DRM_XE_SYNC_FLAG_SIGNAL;
-	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
-	case DRM_XE_SYNC_FLAG_SYNCOBJ:
+	switch (sync_in.type) {
+	case DRM_XE_SYNC_TYPE_SYNCOBJ:
 		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
 			return -EOPNOTSUPP;
 
@@ -135,7 +131,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		}
 		break;
 
-	case DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ:
+	case DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ:
 		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
 			return -EOPNOTSUPP;
 
@@ -165,12 +161,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		}
 		break;
 
-	case DRM_XE_SYNC_FLAG_DMA_BUF:
-		if (XE_IOCTL_DBG(xe, "TODO"))
-			return -EINVAL;
-		break;
-
-	case DRM_XE_SYNC_FLAG_USER_FENCE:
+	case DRM_XE_SYNC_TYPE_USER_FENCE:
 		if (XE_IOCTL_DBG(xe, !signal))
 			return -EOPNOTSUPP;
 
@@ -192,6 +183,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		return -EINVAL;
 	}
 
+	sync->type = sync_in.type;
 	sync->flags = sync_in.flags;
 	sync->timeline_value = sync_in.timeline_value;
 
@@ -252,8 +244,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 			user_fence_put(sync->ufence);
 			dma_fence_put(fence);
 		}
-	} else if ((sync->flags & SYNC_FLAGS_TYPE_MASK) ==
-		   DRM_XE_SYNC_FLAG_USER_FENCE) {
+	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
 		job->user_fence.used = true;
 		job->user_fence.addr = sync->addr;
 		job->user_fence.value = sync->timeline_value;
diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
index 24fccc26cb53..852db5e7884f 100644
--- a/drivers/gpu/drm/xe/xe_sync_types.h
+++ b/drivers/gpu/drm/xe/xe_sync_types.h
@@ -21,6 +21,7 @@ struct xe_sync_entry {
 	struct user_fence *ufence;
 	u64 addr;
 	u64 timeline_value;
+	u32 type;
 	u32 flags;
 };
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 061e698f65d2..4c7ee3828428 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -929,11 +929,12 @@ struct drm_xe_vm_bind {
  *
  * This can be used with both @drm_xe_exec or with @drm_xe_vm_bind
  *
+ * The @type can be:
+ *  - %DRM_XE_SYNC_TYPE_SYNCOBJ - A simple drm sync object
+ *  - %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ - A timelined sync object
+ *  - %DRM_XE_SYNC_TYPE_USER_FENCE - An user fence
+ *
  * The @flags can be:
- *  - %DRM_XE_SYNC_FLAG_SYNCOBJ
- *  - %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ
- *  - %DRM_XE_SYNC_FLAG_DMA_BUF
- *  - %DRM_XE_SYNC_FLAG_USER_FENCE
  *  - %DRM_XE_SYNC_FLAG_SIGNAL
  *
  */
@@ -941,17 +942,16 @@ struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_SYNC_FLAG_SYNCOBJ		0x0
-#define DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ	0x1
-#define DRM_XE_SYNC_FLAG_DMA_BUF		0x2
-#define DRM_XE_SYNC_FLAG_USER_FENCE		0x3
-#define DRM_XE_SYNC_FLAG_SIGNAL		0x10
+#define DRM_XE_SYNC_TYPE_SYNCOBJ		0x0
+#define DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ	0x1
+#define DRM_XE_SYNC_TYPE_USER_FENCE		0x2
+	/** @type: Type of the this sync object */
+	__u32 type;
+
+#define DRM_XE_SYNC_FLAG_SIGNAL	(1 << 0)
 	/** @flags: Sync Flags */
 	__u32 flags;
 
-	/** @pad: MBZ */
-	__u32 pad;
-
 	union {
 		/** @handle: Handle to the sync object */
 		__u32 handle;
-- 
2.34.1

