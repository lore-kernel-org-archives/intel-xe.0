Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70466CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 21:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AA710E909;
	Thu, 18 Sep 2025 21:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZELiJz5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8359010E909
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 21:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758230011; x=1789766011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FpkB516LK/aEEl5twEno8zWIriddayloR7tsD7O86aI=;
 b=WZELiJz5W6kse9qepouUaucXH4qLcvsvhgNkmivz4QCxcVTIQFPG+5Rs
 KTv7zuoFCI+L6Z5weVewRC+jafpuqIE8LLxIBtlFtsh/FF1fZ4mDmMpBb
 KN0MEm7qQEo0J+Hvu8biH9xkZ58wAp8z7+Skg03F+ttEBI+Ozv/eZD9Zm
 PVDSyydg8xCT15LqubAO76ugVjhBiYo6uDNSBr8jBh7U+euimrftlWD5J
 +jQb8OjWhbOzFMNOJDohySzI7y2OjsId0jxeuCBA/8rscU7s8b/o1YDOH
 yWOajCURmLDLijCmXSkqE2GWxBApVWoNK3bAfAfPF8ngYd/RZZuBoTtBQ A==;
X-CSE-ConnectionGUID: UR6MmBJ/RBuw1XYXc7ODmg==
X-CSE-MsgGUID: MRiS8rtkTimh/eYdMmveCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60506103"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="60506103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 14:13:31 -0700
X-CSE-ConnectionGUID: 6/5XCvhURF6BpjiEG0QIpA==
X-CSE-MsgGUID: QDXGY/SoQCqUJkho+TBmfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="212809524"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 14:13:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 2/2] drm/xe/configfs: Add attribute to disable GT types
Date: Thu, 18 Sep 2025 14:13:19 -0700
Message-ID: <20250918211319.603324-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918211319.603324-4-matthew.d.roper@intel.com>
References: <20250918211319.603324-4-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 119 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |   2 +
 drivers/gpu/drm/xe/xe_pci.c      |  18 +++++
 3 files changed, 139 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index e52808e3199f..c675994439d4 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -13,6 +13,7 @@
 #include <linux/string.h>
 
 #include "xe_configfs.h"
+#include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_module.h"
 #include "xe_pci_types.h"
@@ -54,6 +55,7 @@
  *	:
  *	└── 0000:03:00.0
  *	    ├── survivability_mode
+ *	    ├── gt_types_allowed
  *	    ├── engines_allowed
  *	    └── enable_psmi
  *
@@ -77,6 +79,40 @@
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
+ * This attribute can only be set before binding to the device.
+ *
  * Allowed engines:
  * ----------------
  *
@@ -127,6 +163,7 @@ struct xe_config_group_device {
 	struct config_group group;
 
 	struct xe_config_device {
+		u64 gt_types_allowed;
 		u64 engines_allowed;
 		bool survivability_mode;
 		bool enable_psmi;
@@ -139,6 +176,7 @@ struct xe_config_group_device {
 };
 
 static const struct xe_config_device device_defaults = {
+	.gt_types_allowed = U64_MAX,
 	.engines_allowed = U64_MAX,
 	.survivability_mode = false,
 	.enable_psmi = false,
@@ -157,6 +195,7 @@ struct engine_info {
 /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
 #define MAX_ENGINE_CLASS_CHARS 5
 #define MAX_ENGINE_INSTANCE_CHARS 2
+#define MAX_GT_TYPE_CHARS 7
 
 static const struct engine_info engine_info[] = {
 	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
@@ -167,6 +206,14 @@ static const struct engine_info engine_info[] = {
 	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
 };
 
+static const struct {
+	const char *name;
+	u64 type;
+} gt_types[] = {
+	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
+	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
+};
+
 static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
 {
 	return container_of(to_config_group(item), struct xe_config_group_device, group);
@@ -229,6 +276,55 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
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
+	const char *p = page;
+	u64 typemask = 0;
+
+	while (p < page + len) {
+		size_t typelen = strcspn(p, ",\n");
+		bool matched = false;
+
+		if (typelen > MAX_GT_TYPE_CHARS)
+			return -EINVAL;
+
+		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
+			if (strncmp(p, gt_types[i].name, typelen) == 0) {
+				typemask |= BIT(gt_types[i].type);
+				matched = true;
+				break;
+			}
+		}
+
+		if (!matched)
+			return -EINVAL;
+
+		p += typelen + 1;
+	}
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.gt_types_allowed = typemask;
+
+	return len;
+}
+
 static ssize_t engines_allowed_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -342,11 +438,13 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
 }
 
 CONFIGFS_ATTR(, enable_psmi);
+CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_enable_psmi,
+	&attr_gt_types_allowed,
 	&attr_engines_allowed,
 	&attr_survivability_mode,
 	NULL,
@@ -513,6 +611,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 				 dev->config.attr_); \
 	} while (0)
 
+	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
@@ -563,6 +662,26 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
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
index 1402e863b71c..eddb66201edf 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -15,6 +15,7 @@ int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 #else
@@ -22,6 +23,7 @@ static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
+static inline u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 77bee811a150..f065b8ea5673 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -668,8 +668,21 @@ static int xe_info_init(struct xe_device *xe,
 	const struct xe_media_desc *media_desc;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
+	u64 gt_types_allowed;
 	u8 id;
 
+	/*
+	 * It's not currently possible to probe a device with the primary
+	 * GT disabled.  With some work, this may be future in the possible
+	 * for igpu platforms (although probably not for dgpu's since access
+	 * to the primary GT's BCS engines is required for VRAM management).
+	 */
+	gt_types_allowed = xe_configfs_get_gt_types_allowed(to_pci_dev(xe->drm.dev));
+	if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MAIN)) == 0) {
+		drm_err(&xe->drm, "Cannot probe device with primary GT disabled via configfs\n");
+		return -ENODEV;
+	}
+
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers.
@@ -761,6 +774,11 @@ static int xe_info_init(struct xe_device *xe,
 		if (MEDIA_VER(xe) < 13 || !media_desc)
 			continue;
 
+		if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MEDIA)) == 0) {
+			drm_info(&xe->drm, "Media GT disabled via configfs\n");
+			continue;
+		}
+
 		/*
 		 * Allocate and setup media GT for platforms with standalone
 		 * media.
-- 
2.51.0

