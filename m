Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A2CC05022
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B1310E8E1;
	Thu,  9 Nov 2023 15:46:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528F210E8E9
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544769; x=1731080769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Bj7Nn9saFvIm66zlSTyd6sNZ/TJxRBJLU/dyqNaIuc=;
 b=HmTWNKpyI/2zqWSwt5tGe5lesZYj6h5XMrAHaDMGrzDISodqvXM9hhvw
 liCw76b9eeZCpZA/PBWkDkqYYkOzWr9kgwXUhDDvte7Xb49qJqol/sC6U
 IFSbns9z/D2gUTyw1W1K/kNggEQ128fNR8pns2jAz3TtMCosAb8PSmdh1
 OiUaFwGHhCJ4PLMVBlX0BqIYeLckoGdyZkuJU26kZgJPawQwM5VKW+0kd
 Ruy6hbC7+m/jZZpgZNqxV+H7mv7Akcr83AZca6J7XxXQcEVzPU/Kqfy/v
 S7s6fElwGfCb3/AAEwhXClHdCYDPTSFDL212ZsBPO2L6Typ3Bbi+WWWTd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556776"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556776"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886046"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886046"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:46 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:40 +0000
Message-Id: <20231109154457.7-27-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 26/43] drm/xe/uapi: Split xe_sync types from
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Let's continue on the uapi clean-up with more splits
with stuff into their own exclusive fields instead of
reusing stuff.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c       | 23 +++++++----------------
 drivers/gpu/drm/xe/xe_sync_types.h |  1 +
 include/uapi/drm/xe_drm.h          | 26 +++++++++++++-------------
 3 files changed, 21 insertions(+), 29 deletions(-)

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
index 65cbeaeacedb..0c004b24f820 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -932,11 +932,12 @@ struct drm_xe_vm_bind {
  *
  * This can be used with both @drm_xe_exec or with @drm_xe_vm_bind
  *
+ * The @type can be:
+ *  - %DRM_XE_SYNC_TYPE_SYNCOBJ - A simple drm sync object
+ *  - %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ - A timelined sync object
+ *  - %DRM_XE_SYNC_TYPE_USER_FENCE - A user fence
+ *
  * The @flags can be:
- *  - %DRM_XE_SYNC_FLAG_SYNCOBJ
- *  - %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ
- *  - %DRM_XE_SYNC_FLAG_DMA_BUF
- *  - %DRM_XE_SYNC_FLAG_USER_FENCE
  *  - %DRM_XE_SYNC_FLAG_SIGNAL
  *
  */
@@ -944,17 +945,16 @@ struct drm_xe_sync {
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
@@ -972,7 +972,7 @@ struct drm_xe_sync {
 
 	/**
 	 * @timeline_value: Input for the timeline sync object. Needs to be
-	 * different than 0 when used with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
+	 * different than 0 when used with %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
 	 */
 	__u64 timeline_value;
 
-- 
2.34.1

