Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966A8C61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 14:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6D710E656;
	Wed, 22 Nov 2023 14:39:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66A010E655
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663943; x=1732199943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Li3zpOwxc4LBZtPM7Rj0+/0bNaLtdX6VgWG7IHTGhWY=;
 b=eqCo4wdXwKfir6uxZJDR/PSnBqoWMPfHA0mQXxM3NQ1xJxD3Ut7CVn0w
 zpXujYQKkUHG+/7+i3RAnMJCY0idhddyL3esXEDWQa72RUEYbH8QOaWU0
 vimysNV98/VTlYBsHw6saBZshBEgItvYhq49OKMrZq74B9PWsM5rilyh3
 q82R5I513yIXehX03Bd1Oql0Hj1g+cFQNlVXwL5oaYQjSMyxGXAWg1Jry
 Ll99Y6jBEDrlQt46EuOlagRLtk0kuikdsICMtGdrF+EWo21oLbmMaqSq2
 Fj3YrUCqDk0zfGz5Chw5jc6G/g9zVVJY5YaxmpBfQ5vw3HWSDeAyuKWjb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395985146"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="395985146"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098430359"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1098430359"
Received: from arechber-mobl.ger.corp.intel.com (HELO 039181c9d572.intel.com)
 ([10.249.44.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:52 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 14:38:27 +0000
Message-Id: <20231122143833.7-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/14] drm/xe/uapi: Split xe_sync types from
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
 include/uapi/drm/xe_drm.h          | 16 ++++++++--------
 3 files changed, 16 insertions(+), 24 deletions(-)

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
index fe911728fd97..f2bdc6e323e4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -880,16 +880,16 @@ struct drm_xe_sync {
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
+	/** @flags: Sync Flags */
 	__u32 flags;
 
-	/** @pad: MBZ */
-	__u32 pad;
-
 	union {
 		__u32 handle;
 
-- 
2.34.1

