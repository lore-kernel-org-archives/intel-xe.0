Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04CCCDB466
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 17:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C6210E16A;
	Wed, 11 Oct 2023 17:26:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35AE10E161
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 17:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697045210; x=1728581210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dOzMr9oiBWxgcYSMGgkDcBMYgIdLyBv1D2xhb5pKd3g=;
 b=JbFFcTRaet8B3O0gXRviB2ENmRgFL2NjWVXKpgDOISmwj0XirscjN2rp
 n262dUi8k0tw3Lid5flqP3dFD5tIWtOs+y17/1LATWYV61D28cTtjP2TK
 6vgq/5d5SFnIYtsviQU+fm0g4pmSQuFjlLFXKt/Lnr8BjQGABShQ4vA7d
 HTfP9NIJQXCmDSWOYSew6NFkvz12SeqlZQbRSg0NMbOzfIQ0lOXFoHPY2
 M2pMwKzmu4HPk2NpTF6aCofsT+lm1q/9ajhvqvvKZeL8GXtVLDGkUmGQ7
 s52qo+CuGmx5LV/AenSh8gfhUfwbtaLYaxyLmGb0F4y/gmCoY0F7/Z58k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="375072638"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="375072638"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 10:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730572968"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="730572968"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 10:26:50 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 10:26:42 -0700
Message-ID: <20231011172643.826452-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011172643.826452-1-ashutosh.dixit@intel.com>
References: <20231011172643.826452-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/uapi: Multiplex PERF ops through a
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
Cc: robert.krzemien@intel.com, ogabbay@habana.ai,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, gzadicario@habana.ai,
 Harish Chegondi <harish.chegondi@intel.com>, bdotan@habana.ai, talbo@habana.ai
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Since we are already mulitplexing multiple perf counter stream types
through the PERF layer, it seems odd to retain separate ioctls for perf
op's (add/remove config). In fact it seems logical to also multiplex these
ops through a single PERF ioctl. This also affords greater flexibility to
add stream specific ops if needed for different perf stream types.

v2: Add 'enum drm_xe_perf_op' previously missed out (Guy Zadicario)
    Add DRM_ prefix to perf op names and more consistent naming

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 +---
 drivers/gpu/drm/xe/xe_perf.c   | 28 +---------------------------
 drivers/gpu/drm/xe/xe_perf.h   |  4 +---
 include/uapi/drm/xe_drm.h      | 24 ++++++++++++++++++------
 4 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3c0c28c6f9fb8..86472e189b194 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -129,9 +129,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_PERF_OPEN, xe_perf_open_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_PERF_ADD_CONFIG, xe_perf_add_config_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_PERF_REMOVE_CONFIG, xe_perf_remove_config_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
index de430065e0d27..a130076b59aa2 100644
--- a/drivers/gpu/drm/xe/xe_perf.c
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -7,33 +7,7 @@
 
 #include "xe_perf.h"
 
-int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
-{
-	struct drm_xe_perf_param *arg = data;
-
-	if (arg->extensions)
-		return -EINVAL;
-
-	switch (arg->perf_type) {
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
-	default:
-		return -EINVAL;
-	}
-}
-
-int xe_perf_remove_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct drm_xe_perf_param *arg = data;
 
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
index d734d2ee385b1..9b048f99bb056 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -111,9 +111,7 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 #define DRM_XE_VM_MADVISE		0x0c
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
-#define DRM_XE_PERF_OPEN		0x0e
-#define DRM_XE_PERF_ADD_CONFIG		0x0f
-#define DRM_XE_PERF_REMOVE_CONFIG	0x10
+#define DRM_XE_PERF			0x0e
 
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
@@ -1106,6 +1102,20 @@ enum drm_xe_perf_type {
 	DRM_XE_PERF_TYPE_MAX,
 };
 
+/**
+ * enum drm_xe_perf_op - Perf stream ops
+ */
+enum drm_xe_perf_op {
+	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
+	DRM_XE_PERF_OP_STREAM_OPEN,
+
+	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
+	DRM_XE_PERF_OP_ADD_CONFIG,
+
+	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
+	DRM_XE_PERF_OP_REMOVE_CONFIG,
+};
+
 /**
  * struct drm_xe_perf_param - XE perf layer param
  *
@@ -1118,6 +1128,8 @@ struct drm_xe_perf_param {
 	__u64 extensions;
 	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
 	__u64 perf_type;
+	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
+	__u64 perf_op;
 	/** @param_size: size of data struct pointed to by @param */
 	__u64 param_size;
 	/** @param: Pointer to actual stream params */
-- 
2.41.0

