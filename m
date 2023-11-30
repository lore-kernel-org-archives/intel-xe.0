Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A688C10DC2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4B710E766;
	Thu, 30 Nov 2023 18:40:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447DD10E76A
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369622; x=1732905622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jej0FpT+I0Bh9O0oJjVpoDQLzJoVqC+4C3Hrq7ooqms=;
 b=kHiwMSVc3y+YVGbDLgCKZkqLrBqJWNsIpvpSxim1UT42n/lRpTdjkIoa
 yupO8srsiE0lHMqB5awvNz33UKGyvSnEkGVFLth9r+gzhmtbYUxXmRQtl
 FgB392wkTX9dpWP7p+y/ILWOZqiVaTKH5YHWuE83j4NBF3T2eEl0XvnVg
 O0WJMf/nYJ4JJhOBlCc2BGkWtjWKHIIXJXcnLy2IhgXxjG54P/Ns7zhx2
 3Vb6KJDIq4sfhp3GUVNRWwbN2A4hJOq9+3rKWDKI2vrRNLwwsCfIuknxO
 5iRCUcraLRxcAEUzgDGZSa9JCw2qLS4HQiGtMGz0+CbYpgMlHLyLRMtHm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111730"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111730"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294943"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294943"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:20 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:47 +0000
Message-Id: <20231130183955.7-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 08/16] drm/xe/uapi: Split xe_sync types from
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c       | 23 +++++++----------------
 drivers/gpu/drm/xe/xe_sync_types.h |  1 +
 include/uapi/drm/xe_drm.h          | 16 ++++++++--------
 3 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index ea96ba4b41da..936227e79483 100644
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
 		if (XE_IOCTL_DBG(xe, in_lr_mode && signal))
 			return -EOPNOTSUPP;
 
@@ -135,7 +131,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		}
 		break;
 
-	case DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ:
+	case DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ:
 		if (XE_IOCTL_DBG(xe, in_lr_mode && signal))
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
index 782983cc4c49..c7fb252b8d04 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -940,16 +940,16 @@ struct drm_xe_sync {
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

