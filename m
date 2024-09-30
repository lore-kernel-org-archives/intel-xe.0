Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D45CF6498
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 00:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9057D10E0FC;
	Mon, 30 Sep 2024 00:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5Y8hDV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3B810E0FC
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 00:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727654774; x=1759190774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nVqHD/XeSqjlEYRaCNv1yfRePfjw40To43EoKgabqIs=;
 b=Y5Y8hDV5Qaj0Lc21duF0X/rnDlvNfWx9nsDi6f8yQtwyivf1msbGjtQ9
 K1ZY7VXddfhr+JrTaOz7J/MgSV1aa/CghZ2CfkEAFfedKFg5P/TCqW5w2
 Tqurdd/wmDbeQCdmQQV2EJi/3ZmSDHzvHBhsJz7aG01MnTcSmQeCWjT8R
 4HaONPg9T1eI8i2zkKwTc2tZAd5rVixGz2v/7xY5L+eZz/DpHeCXcd1vu
 qQCvluRMhsX2ypahb/2gQFOPsjB9iJYYL2FfPm2JbTxbA4nn9O4Dib6aY
 md7zLDGQX3CTI00gGX/6/HXig71G1IBw3HU3GqoFH07l0YmdFaZtkBjY5 w==;
X-CSE-ConnectionGUID: bo2AjS6MTPicjo98hxQpeA==
X-CSE-MsgGUID: lDC5YkRgQcy4JVPdsfQICw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26676920"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="26676920"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 17:06:13 -0700
X-CSE-ConnectionGUID: KsmTUV3OSzGyNWbuVchBYQ==
X-CSE-MsgGUID: shXERP5wRWu7zAafVWfSRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="77628137"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by fmviesa004.fm.intel.com with ESMTP; 29 Sep 2024 17:06:10 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, alex.zuo@intel.com,
 Pallavi Mishra <pallavi.mishra@intel.com>
Subject: [PATCH] drm/xe: Add support for object purgeability
Date: Mon, 30 Sep 2024 05:44:13 +0530
Message-Id: <20240930001413.3378863-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Introduce madvise ioctl in KMD for object level advice.
Userspace applications can utilize this feature to inform
KMD whether an object will be needed in near future or can
be safely discarded under memory pressure.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 71 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bo.h       |  7 ++++
 drivers/gpu/drm/xe/xe_bo_types.h |  3 ++
 drivers/gpu/drm/xe/xe_device.c   |  1 +
 include/uapi/drm/xe_drm.h        | 20 +++++++++
 5 files changed, 90 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5f2f1ec46b57..0e7e7a624676 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -644,6 +644,22 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 	return 0;
 }
 
+static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+{
+	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+
+	if (ttm_bo->ttm) {
+		struct ttm_placement place = {};
+		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
+
+		drm_WARN_ON(&xe->drm, ret);
+
+		if (bo && !ret)
+			bo->madv = XE_MADV_PURGED;
+	}
+}
+
 static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		      struct ttm_operation_ctx *ctx,
 		      struct ttm_resource *new_mem,
@@ -663,6 +679,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
 	int ret = 0;
 
+	if (bo->madv == XE_MADV_DONTNEED) {
+		xe_ttm_bo_purge(ttm_bo, ctx);
+		return ret;
+	}
+
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
 		if (new_mem->mem_type == XE_PL_TT)
@@ -1084,18 +1105,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
-static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
-{
-	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
-
-	if (ttm_bo->ttm) {
-		struct ttm_placement place = {};
-		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
-
-		drm_WARN_ON(&xe->drm, ret);
-	}
-}
-
 static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
 {
 	struct ttm_operation_ctx ctx = {
@@ -2416,6 +2425,44 @@ void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
 	list_del_init(&bo->vram_userfault_link);
 }
 
+int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file_priv)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct drm_xe_vm_madvise *args = data;
+	struct drm_gem_object *gem_obj = drm_gem_object_lookup(file_priv, args->handle);
+	struct xe_bo *bo;
+	int err;
+
+	if (XE_IOCTL_DBG(xe, (!(args->madv & DRM_XE_MADV_DONTNEED) &&
+			!(args->madv & DRM_XE_MADV_WILLNEED))))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !gem_obj))
+		return -EINVAL;
+
+	bo = gem_to_xe_bo(gem_obj);
+	if (!bo)
+		return -ENOENT;
+
+	err = xe_bo_lock(bo, true);
+	if (err)
+		return err;
+
+	if (XE_IOCTL_DBG(xe, ((bo->madv == XE_MADV_PURGED) && (args->madv == DRM_XE_MADV_WILLNEED)))) {
+		xe_bo_unlock(bo);
+		return -EINVAL;
+	}
+
+	args->retained = (bo->madv != XE_MADV_PURGED) ? 1 : 0;
+
+	bo->madv = (args->madv == DRM_XE_MADV_WILLNEED) ? XE_MADV_WILLNEED : XE_MADV_DONTNEED;
+
+	xe_bo_unlock(bo);
+
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_bo.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6e4be52306df..515dea54a8e8 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -63,6 +63,10 @@
 
 #define XE_BO_PROPS_INVALID	(-1)
 
+#define XE_MADV_WILLNEED               0
+#define XE_MADV_DONTNEED               1
+#define XE_MADV_PURGED                 2
+
 struct sg_table;
 
 struct xe_bo *xe_bo_alloc(void);
@@ -223,6 +227,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file);
+int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file_priv);
+
 void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
 
 int xe_bo_dumb_create(struct drm_file *file_priv,
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 2ed558ac2264..00b4de912dcf 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -76,6 +76,9 @@ struct xe_bo {
 
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 		struct list_head vram_userfault_link;
+
+	/** @madv: user space advise on obj purgeability */
+	u16 madv;
 };
 
 #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8e9b551c7033..efeb0bf08b1b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -197,6 +197,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b6fbe4988f2e..e32ba5598a8b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -102,6 +102,7 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_VM_MADVISE		0x0c
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +118,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_VM_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1694,6 +1696,24 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+/**
+ * struct drm_xe_vm_madvise - Input of &DRM_IOCTL_XE_VM_MADVISE
+ */
+struct drm_xe_vm_madvise {
+	/** Handle of the buffer to change the backing store advice */
+	__u32 handle;
+	/* Advice: either the buffer will be needed again in the near future,
+	 *         or won't be and could be discarded under memory pressure.
+	 */
+#define DRM_XE_MADV_WILLNEED 0
+#define DRM_XE_MADV_DONTNEED 1
+
+	__u32 madv;
+
+	/** Whether the backing store still exists. */
+	__u32 retained;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1

