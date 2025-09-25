Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5F4CCA471
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA77A10E9DA;
	Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7lHHOEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CAA10E30A
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844008; x=1790380008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hm6Y4lo8fRPrtOJJw/h7uK42anLo+QaoZeZY+XPq7Fs=;
 b=d7lHHOEu0t2ay494OudrodRIRgeuzFwQLXMM0em6V7Whb97lkhscnuqQ
 6sgeIbH0NiIvL5dhed7svjaSnqKA7uSR9RSqxAVSBWjA9RAD9EjMEhW9V
 PbRGaa6tkMkx6CmxnuYCgwYHpY7QKYSDysMyGAdpS0BVbFgRBn8B3IuMq
 UwlHvFYsW5IbWNTyKskQDZMeq0p2m5wD0EYquc6ZdHSJGQ6uILqqAc58n
 xlBc40sVv8bvYVX7NO2xg4pAY2q51rc5mSIuO7z0dIjs3XyVG8dqhtAMB
 TmTgH+a2R2CR1GvSvLZ0nXmZX005vunEIlTdxJ1YAsdilbKuwSnfYuefL g==;
X-CSE-ConnectionGUID: 4GDYHxxzSSSevUHh10ENaA==
X-CSE-MsgGUID: WoRQwRohRSCA81bewjPGoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817683"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817683"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: Ag19o5GAQJaxTHxHbS7qpQ==
X-CSE-MsgGUID: dlrGbRi/TEaznusShipTxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181853008"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 21/22] drm/xe/configfs: Add attribute to disable GT types
Date: Thu, 25 Sep 2025 16:46:49 -0700
Message-ID: <20250925234628.2112163-45-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 130 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |   2 +
 drivers/gpu/drm/xe/xe_pci.c      |  37 ++++++++-
 3 files changed, 165 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 139663423185..aaa98166f527 100644
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
@@ -292,6 +343,62 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
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
+	char *buf = kstrdup(page, GFP_KERNEL);
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
+		if (!matched) {
+			len = -EINVAL;
+			goto out;
+		}
+	}
+
+	scoped_guard(mutex, &dev->lock) {
+		if (is_bound(dev))
+			return -EBUSY;
+
+		dev->config.gt_types_allowed = typemask;
+	}
+
+out:
+	kfree(buf);
+	return len;
+}
+
 static ssize_t engines_allowed_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -672,6 +779,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
@@ -679,6 +787,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_post_bb,
 	&attr_enable_psmi,
 	&attr_engines_allowed,
+	&attr_gt_types_allowed,
 	&attr_survivability_mode,
 	NULL,
 };
@@ -846,6 +955,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 				 dev->config.attr_); \
 	} while (0)
 
+	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
@@ -896,6 +1006,26 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	return mode;
 }
 
+/**
+ * xe_configfs_get_gt_types_allowed - get GT type allowed mask from configfs
+ * @pdev: pci device
+ *
+ * Return: GT type mask set in configfs
+ */
+u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev)
+{
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
 /**
  * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index c61e0e47ed94..c6ad8df9e913 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -17,6 +17,7 @@ int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
@@ -28,6 +29,7 @@ static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
+static inline u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index df5b39d70b80..cef7751d2f0f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -666,11 +666,17 @@ static void xe_info_probe_tile_count(struct xe_device *xe)
 
 static struct xe_gt *init_primary_gt(struct xe_tile *tile,
 				     const struct xe_graphics_desc *graphics_desc,
-				     const struct xe_media_desc *media_desc)
+				     const struct xe_media_desc *media_desc,
+				     u64 gt_types_allowed)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt;
 
+	if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MAIN)) == 0) {
+		drm_info(&xe->drm, "Primary GT disabled via configfs\n");
+		return NULL;
+	}
+
 	gt = xe_gt_alloc(tile);
 	if (IS_ERR(gt))
 		return gt;
@@ -691,11 +697,17 @@ static struct xe_gt *init_primary_gt(struct xe_tile *tile,
 }
 
 static struct xe_gt *init_media_gt(struct xe_tile *tile,
-				   const struct xe_media_desc *media_desc)
+				   const struct xe_media_desc *media_desc,
+				   u64 gt_types_allowed)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt;
 
+	if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MEDIA)) == 0) {
+		drm_info(&xe->drm, "Media GT disabled via configfs\n");
+		return NULL;
+	}
+
 	gt = xe_gt_alloc(tile);
 	if (IS_ERR(gt))
 		return gt;
@@ -727,6 +739,7 @@ static int xe_info_init(struct xe_device *xe,
 	const struct xe_media_desc *media_desc;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
+	u64 gt_types_allowed;
 	u8 id;
 
 	/*
@@ -789,6 +802,8 @@ static int xe_info_init(struct xe_device *xe,
 			return err;
 	}
 
+	gt_types_allowed = xe_configfs_get_gt_types_allowed(to_pci_dev(xe->drm.dev));
+
 	/* Allocate any GT and VRAM structures necessary for the platform. */
 	for_each_tile(tile, xe, id) {
 		int err;
@@ -797,11 +812,25 @@ static int xe_info_init(struct xe_device *xe,
 		if (err)
 			return err;
 
-		tile->primary_gt = init_primary_gt(tile, graphics_desc, media_desc);
+		tile->primary_gt = init_primary_gt(tile, graphics_desc, media_desc,
+						   gt_types_allowed);
 		if (IS_ERR(tile->primary_gt))
 			return PTR_ERR(tile->primary_gt);
 
-		tile->media_gt = init_media_gt(tile, media_desc);
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
+		tile->media_gt = init_media_gt(tile, media_desc,
+					       gt_types_allowed);
 		if (IS_ERR(tile->media_gt))
 			return PTR_ERR(tile->media_gt);
 	}
-- 
2.51.0

