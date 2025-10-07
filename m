Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B70CCD189
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3D410E39A;
	Tue,  7 Oct 2025 20:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSZ9nWsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F79F10E6FD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870131; x=1791406131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BjCuzTY4QtZ+8jtUvsl8+jg+IR4cfnigYtZmeVKPrg0=;
 b=QSZ9nWsChDwP/4WwsEDQiN0pMyeG/mzjaCs8svNxD+BhhC6SHELLcMJr
 HaXjIGqTee9y0aAOE/fYSfYeiTtNm4biR4aLwCkFL+ROwVTQVhroEzfpY
 l1BjfKNLWEb+NtlK1Nk9N+ouSYAxEy0ycIjVSmy2j+QKDO9ur7WREo/6x
 KVMJGZijgenoOBtlcD4YZkkRc/dVB6FPkuQbQrBIQnpjgTZlVKY3qF2Gd
 4WMjQswe7CdaE7iwn+yGHFAAZG8h2wBUYIa5mr6UxxkLpAqNIHR5LjJ/E
 XyX8QZXtLDbUk16GTtefK04H+I9wePZhLvRDDLivAt2fizdwkPe+GMHXM A==;
X-CSE-ConnectionGUID: MYAaMsqWSjqhbk52AVv6Pg==
X-CSE-MsgGUID: beaSHbbnQBeT8sUDo/Dvcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616762"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616762"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: EhuVaTsNRHutMcGleGE8BQ==
X-CSE-MsgGUID: nC8HP21LSYS2TFvx2ft/gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631125"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 22/23] drm/xe/configfs: Add attribute to disable GT types
Date: Tue,  7 Oct 2025 13:48:52 -0700
Message-ID: <20251007204829.1468209-47-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Preventing the driver from initializing GTs of specific type(s) can be
useful for debugging and early hardware bringup.  Add a configfs
attribute to allow this kind of control for debugging.

With today's platforms and software design, this configuration setting
is only effective for disabling the media GT since the driver currently
requires that there always be a primary GT to probe the device.  However
this might change in the future ---  in theory it should be possible
(with some additional driver work) to allow an igpu device to come up
with only the media GT and no primary GT.  Or to allow an igpu device to
come up with no GTs at all (for display-only usage).  A primary GT will
likely always be required on dgpu platforms because we rely on the BCS
engines inside the primary GT for various vram operations.

v2:
 - Expand/clarify kerneldoc for configfs attribute.  (Gustavo)
 - Tighten type usage in gt_types[] structure.  (Gustavo)
 - Adjust string parsing/name matching to match exact GT names and not
   accept partial names.  (Gustavo)

v3:
 - Switch to scope-based cleanup in gt_types_allowed_store() to fix a
   leak if the device is already bound.  (Gustavo)
 - Switch configfs lookup interface to two boolean functions that
   specify whether primary/media are supported rather than one function
   that returns a mask.  This is simpler to use and understand.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 145 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |   4 +
 drivers/gpu/drm/xe/xe_pci.c      |  22 +++++
 3 files changed, 171 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 139663423185..e36cc5e1bc8f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -15,6 +15,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
+#include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_module.h"
 #include "xe_pci_types.h"
@@ -56,6 +57,7 @@
  *	:
  *	└── 0000:03:00.0
  *	    ├── survivability_mode
+ *	    ├── gt_types_allowed
  *	    ├── engines_allowed
  *	    └── enable_psmi
  *
@@ -79,6 +81,44 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * Allowed GT types:
+ * -----------------
+ *
+ * Allow only specific types of GTs to be detected and initialized by the
+ * driver.  Any combination of GT types can be enabled/disabled, although
+ * some settings will cause the device to fail to probe.
+ *
+ * Writes support both comma- and newline-separated input format. Reads
+ * will always return one GT type per line. "primary" and "media" are the
+ * GT type names supported by this interface.
+ *
+ * This attribute can only be set before binding to the device.
+ *
+ * Examples:
+ *
+ * Allow both primary and media GTs to be initialized and used.  This matches
+ * the driver's default behavior::
+ *
+ *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ *
+ * Allow only the primary GT of each tile to be initialized and used,
+ * effectively disabling the media GT if it exists on the platform::
+ *
+ *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ *
+ * Allow only the media GT of each tile to be initialized and used,
+ * effectively disabling the primary GT.  **This configuration will cause
+ * device probe failure on all current platforms, but may be allowed on
+ * igpu platforms in the future**::
+ *
+ *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ *
+ * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
+ * **This configuration will cause device probe failure on all current
+ * platforms, but may be allowed on igpu platforms in the future**::
+ *
+ *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ *
  * Allowed engines:
  * ----------------
  *
@@ -187,6 +227,7 @@ struct xe_config_group_device {
 	struct config_group group;
 
 	struct xe_config_device {
+		u64 gt_types_allowed;
 		u64 engines_allowed;
 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
@@ -201,6 +242,7 @@ struct xe_config_group_device {
 };
 
 static const struct xe_config_device device_defaults = {
+	.gt_types_allowed = U64_MAX,
 	.engines_allowed = U64_MAX,
 	.survivability_mode = false,
 	.enable_psmi = false,
@@ -220,6 +262,7 @@ struct engine_info {
 /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
 #define MAX_ENGINE_CLASS_CHARS 5
 #define MAX_ENGINE_INSTANCE_CHARS 2
+#define MAX_GT_TYPE_CHARS 7
 
 static const struct engine_info engine_info[] = {
 	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
@@ -230,6 +273,14 @@ static const struct engine_info engine_info[] = {
 	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
 };
 
+static const struct {
+	const char name[MAX_GT_TYPE_CHARS + 1];
+	enum xe_gt_type type;
+} gt_types[] = {
+	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
+	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
+};
+
 static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
 {
 	return container_of(to_config_group(item), struct xe_config_group_device, group);
@@ -292,6 +343,58 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 	return len;
 }
 
+static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	char *p = page;
+
+	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
+		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
+			p += sprintf(p, "%s\n", gt_types[i].name);
+
+	return p - page;
+}
+
+static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
+				      size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
+	char *p = buf;
+	u64 typemask = 0;
+
+	if (!buf)
+		return -ENOMEM;
+
+	while (p) {
+		char *typename = strsep(&p, ",\n");
+		bool matched = false;
+
+		if (typename[0] == '\0')
+			continue;
+
+		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
+			if (strcmp(typename, gt_types[i].name) == 0) {
+				typemask |= BIT(gt_types[i].type);
+				matched = true;
+				break;
+			}
+		}
+
+		if (!matched)
+			return -EINVAL;
+	}
+
+	scoped_guard(mutex, &dev->lock) {
+		if (is_bound(dev))
+			return -EBUSY;
+
+		dev->config.gt_types_allowed = typemask;
+	}
+
+	return len;
+}
+
 static ssize_t engines_allowed_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -672,6 +775,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
@@ -679,6 +783,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_post_bb,
 	&attr_enable_psmi,
 	&attr_engines_allowed,
+	&attr_gt_types_allowed,
 	&attr_survivability_mode,
 	NULL,
 };
@@ -846,6 +951,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 				 dev->config.attr_); \
 	} while (0)
 
+	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
@@ -896,6 +1002,45 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	return mode;
 }
 
+static u64 get_gt_types_allowed(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u64 mask;
+
+	if (!dev)
+		return device_defaults.gt_types_allowed;
+
+	mask = dev->config.gt_types_allowed;
+	config_group_put(&dev->group);
+
+	return mask;
+}
+
+/**
+ * xe_configfs_primary_gt_supported - determine whether primary GTs are supported
+ * @xe: xe device
+ *
+ * Return: True if primary GTs are enabled, false if they have been disabled via
+ *     configfs.
+ */
+bool xe_configfs_primary_gt_supported(struct xe_device *xe)
+{
+	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN)) != 0;
+}
+
+/**
+ * xe_configfs_media_gt_supported - determine whether media GTs are supported
+ * @xe: xe device
+ *
+ * Return: True if the media GTs are enabled, false if they have been disabled
+ *     via configfs.
+ */
+bool xe_configfs_media_gt_supported(struct xe_device *xe)
+{
+	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MEDIA)) != 0;
+}
+
 /**
  * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index c61e0e47ed94..5624e965b911 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -17,6 +17,8 @@ int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+bool xe_configfs_primary_gt_supported(struct xe_device *xe);
+bool xe_configfs_media_gt_supported(struct xe_device *xe);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
@@ -28,6 +30,8 @@ static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
+static inline bool xe_configfs_primary_gt_supported(struct xe_device *xe) { return true; }
+static inline bool xe_configfs_media_gt_supported(struct xe_device *xe) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a5932e4f4a23..9c8ab2b41737 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -695,6 +695,11 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt;
 
+	if (!xe_configfs_primary_gt_supported(xe)) {
+		drm_info(&xe->drm, "Primary GT disabled via configfs\n");
+		return NULL;
+	}
+
 	gt = xe_gt_alloc(tile);
 	if (IS_ERR(gt))
 		return gt;
@@ -720,6 +725,11 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt;
 
+	if (!xe_configfs_media_gt_supported(xe)) {
+		drm_info(&xe->drm, "Media GT disabled via configfs\n");
+		return NULL;
+	}
+
 	if (MEDIA_VER(xe) < 13 || !media_desc)
 		return NULL;
 
@@ -829,6 +839,18 @@ static int xe_info_init(struct xe_device *xe,
 		if (IS_ERR(tile->primary_gt))
 			return PTR_ERR(tile->primary_gt);
 
+		/*
+		 * It's not currently possible to probe a device with the
+		 * primary GT disabled.  With some work, this may be future in
+		 * the possible for igpu platforms (although probably not for
+		 * dgpu's since access to the primary GT's BCS engines is
+		 * required for VRAM management).
+		 */
+		if (!tile->primary_gt) {
+			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
+			return -ENODEV;
+		}
+
 		tile->media_gt = alloc_media_gt(tile, media_desc);
 		if (IS_ERR(tile->media_gt))
 			return PTR_ERR(tile->media_gt);
-- 
2.51.0

