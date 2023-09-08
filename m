Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607DFEE57CC
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2EC10E871;
	Fri,  8 Sep 2023 04:24:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF4A10E85F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147036; x=1725683036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K6idOF9Scfg9DjXEw/4r0Mp0LuxAh+ibo9ukDpgOMVY=;
 b=oBKHjDm4BdjSo74bv6W7q4HscmYsHRoEkIZE6/+ENIiXRmulWAqZhdoV
 RW0PpLcglk1gw/BNNJy18Gaw4/3jA0n+UrJs2rf2p/n8v4HI3EMjIy+05
 ahfrLrPhKLSsZIqkPvEu1fMHBW2/DpVpiAgkFqcyyGTZD+e6cJ7JurS9r
 iq0mbNgYr7EQOFAzhkM61iy4Y9zum9UJoYpQnSxCMSvsdPEymivHwzq0z
 U71D4cg7Smc2v8Hb2ct7QtUsZrt2QU9LGdF9SWudr6kWZA587ERki9M1q
 b1kA5uaRcR7gwOE4vVvT8lsBxH9qXbtHn12/VcZOFoLl2QPjqEgprbZZN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935403"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935403"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200756"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200756"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:55 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:44 -0700
Message-ID: <20230908042348.1592535-14-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 13/17] drm/xe/oa: Multiplex PERF ops through a
 single PERF ioctl
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

Since we are already mulitplexing multiple perf counter stream types
through the PERF layer, it seems odd to retain separate ioctls for perf
op's (add/remove config). In fact it seems logical to also multiplex these
ops through a single PERF ioctl. This also affords greater flexibility to
add stream specific ops if needed for different perf stream types.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  5 +----
 drivers/gpu/drm/xe/xe_perf.c   | 32 ++++++++------------------------
 drivers/gpu/drm/xe/xe_perf.h   |  4 +---
 include/uapi/drm/xe_drm.h      | 16 ++++++++++------
 4 files changed, 20 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8447d1251fa59..75936b7eb3c67 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -115,10 +115,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 
-	DRM_IOCTL_DEF_DRV(XE_PERF_OPEN, xe_perf_open_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_PERF_ADD_CONFIG, xe_perf_add_config_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_PERF_REMOVE_CONFIG, xe_perf_remove_config_ioctl, DRM_RENDER_ALLOW),
-
+	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
index 0f747af59f245..f8d7eae8fffe0 100644
--- a/drivers/gpu/drm/xe/xe_perf.c
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -6,37 +6,21 @@
 #include "xe_oa.h"
 #include "xe_perf.h"
 
-int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg, struct drm_file *file)
 {
-	struct drm_xe_perf_param *arg = data;
-
-	if (arg->extensions)
-		return -EINVAL;
-
-	switch (arg->perf_type) {
-	case XE_PERF_TYPE_OA:
+	switch (arg->perf_op) {
+	case XE_PERF_STREAM_OPEN:
 		return xe_oa_stream_open_ioctl(dev, (void *)arg->param, file);
-	default:
-		return -EINVAL;
-	}
-}
-
-int xe_perf_add_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
-{
-	struct drm_xe_perf_param *arg = data;
-
-	if (arg->extensions)
-		return -EINVAL;
-
-	switch (arg->perf_type) {
-	case XE_PERF_TYPE_OA:
+	case XE_PERF_ADD_CONFIG:
 		return xe_oa_add_config_ioctl(dev, (void *)arg->param, file);
+	case XE_PERF_REMOVE_CONFIG:
+		return xe_oa_remove_config_ioctl(dev, (void *)arg->param, file);
 	default:
 		return -EINVAL;
 	}
 }
 
-int xe_perf_remove_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct drm_xe_perf_param *arg = data;
 
@@ -45,7 +29,7 @@ int xe_perf_remove_config_ioctl(struct drm_device *dev, void *data, struct drm_f
 
 	switch (arg->perf_type) {
 	case XE_PERF_TYPE_OA:
-		return xe_oa_remove_config_ioctl(dev, (void *)arg->param, file);
+		return xe_oa_ioctl(dev, arg, file);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
index 7ee90491132a0..254cc7cf49fef 100644
--- a/drivers/gpu/drm/xe/xe_perf.h
+++ b/drivers/gpu/drm/xe/xe_perf.h
@@ -11,8 +11,6 @@
 struct drm_device;
 struct drm_file;
 
-int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
-int xe_perf_add_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
-int xe_perf_remove_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 91aaeab603571..3c15dfe19f427 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -111,9 +111,7 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 #define DRM_XE_VM_MADVISE		0x0c
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
-#define DRM_XE_PERF_OPEN		0x16
-#define DRM_XE_PERF_ADD_CONFIG		0x17
-#define DRM_XE_PERF_REMOVE_CONFIG	0x18
+#define DRM_XE_PERF			0x16
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -130,9 +128,7 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
-#define DRM_IOCTL_XE_PERF_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_OPEN, struct drm_xe_perf_param)
-#define DRM_IOCTL_XE_PERF_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_ADD_CONFIG, struct drm_xe_perf_param)
-#define DRM_IOCTL_XE_PERF_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_REMOVE_CONFIG, struct drm_xe_perf_param)
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
 
 /**
  * enum drm_xe_memory_class - Supported memory classes.
@@ -1069,6 +1065,12 @@ enum drm_xe_perf_type {
 	XE_PERF_TYPE_OA,
 };
 
+enum drm_xe_perf_op {
+	XE_PERF_STREAM_OPEN,
+	XE_PERF_ADD_CONFIG,
+	XE_PERF_REMOVE_CONFIG,
+};
+
 /**
  * struct drm_xe_perf_param - XE perf layer param
  *
@@ -1081,6 +1083,8 @@ struct drm_xe_perf_param {
 	__u64 extensions;
 	/** @perf_type: Type, of enum drm_xe_perf_type, of perf stream  */
 	__u64 perf_type;
+	/** @perf_op: Perf op, of enum drm_xe_perf_op */
+	__u64 perf_op;
 	/** @param: Pointer to actual stream params */
 	__u64 param;
 };
-- 
2.41.0

