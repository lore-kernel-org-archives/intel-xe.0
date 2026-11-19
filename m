Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01250606A32F
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 01:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=flgCf/V0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B397D10E65D;
	Thu, 19 Nov 2026 01:46:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72DC10E65D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 01:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795052776; x=1826588776;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rAZnWUgkg8/JaBueoJoglTz+sPV1WzxsRmwIXJmjJUU=;
 b=flgCf/V0645U2r0dQAO0pg7p1brqa3sB781pWbkG8bwsU9WXwz9qiYWT
 HYk9Yh9eZ+KoEHvbKM0+vSW2A/SkhKkl3VsUX1VeYDgwghdVZOU1NNMg6
 7aHmPaAl3X8O58hSYkM60+QOwq40ABHeTaZpqoPSyNmdMXq0QlwupJNzB
 g0+V+TN3l/XJY6MKEdHtvH3UzDp3swoorDZykARNg2c3DJAVfgRyaEzeu
 WT5XZ/qnkq6kTDm/qme/67cFtAQyKpkrrK9ELCRXVvV87l742G7X4Qs5L
 tld8w/bS9F//nTALmOn4dnVqHsoAVHh47ywrNm2Y4KxTM9K5zjhFhA77D A==;
X-CSE-ConnectionGUID: bPXNiZyNQ22HIv2EMv7X8w==
X-CSE-MsgGUID: sUyQ7qacRHeCzJbBbZORaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3788847"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3788847"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 17:46:15 -0800
X-CSE-ConnectionGUID: QkB2BDxFT9Wvc1mFhmcLkQ==
X-CSE-MsgGUID: iG9uXq2jTMuhfEqBO2Wk9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10657438"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 17:46:16 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH] drm/xe: Add GuC FW path configfs overrides
Date: Thu, 19 Nov 2026 01:46:02 +0000
Message-ID: <20261119014602.243548-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some platforms (e.g. NVL-P) use different GuC binaries for the primary
and media GTs, which means that the guc_firmware_path modparam that we
use to override the FW on all GTs for testing can't be used on those
platforms.
This patch adds separate configfs overrides for the 2 GTs, which can be
used to tweak their GuC FW paths independently. Note that the modparam
is still supported and takes precedence over the configfs.
Since the allocation containing the user-provided config is only
guaranteed to exist while we hold a reference to the config group, we
need to take a copy instead of pointing uc_fw->path directly to it. To
keep things simple on the cleanup side, we use a drmm allocation.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 150 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c    |   7 +-
 3 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 2ddd707a6dbd..b6b544c3bc9d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -13,6 +13,8 @@
 #include <linux/pci.h>
 #include <linux/string.h>
 
+#include <drm/drm_managed.h>
+
 #include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
 #include "xe_defaults.h"
@@ -277,6 +279,24 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * GuC firmware override
+ * ---------------------
+ *
+ * Override the GuC firmware path for the primary and/or media GT. This is
+ * useful for testing a newer GuC firmware version without having to update the
+ * driver. The specified path must be relative to the /lib/firmware directory::
+ *
+ *	# echo 'path/to/guc_firmware' > /sys/kernel/config/xe/0000:03:00.0/primary_gt_guc_override
+ *	# echo 'path/to/guc_firmware' > /sys/kernel/config/xe/0000:03:00.0/media_gt_guc_override
+ *
+ * Writing an empty string disables the override::
+ *
+ *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/primary_gt_guc_override
+ *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/media_gt_guc_override
+ *
+ * A modparam is also available to override the GuC firmware path for all GTs,
+ * which takes precedence over the configfs override.
+ *
  * Remove devices
  * ==============
  *
@@ -309,6 +329,11 @@ struct xe_config_group_device {
 			unsigned int max_vfs;
 			bool admin_only_pf;
 		} sriov;
+
+		struct {
+			char *primary_gt;
+			char *media_gt;
+		} guc_overrides;
 	} config;
 
 	/* protects attributes */
@@ -331,6 +356,10 @@ static const struct xe_config_device device_defaults = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
 	},
+	.guc_overrides = {
+		.primary_gt = NULL,
+		.media_gt = NULL,
+	},
 };
 
 static void set_device_defaults(struct xe_config_device *config)
@@ -937,6 +966,84 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
 }
 
+static ssize_t __gt_guc_override_show(struct xe_config_group_device *dev,
+				      char **override, char *page)
+{
+	guard(mutex)(&dev->lock);
+
+	return sprintf(page, "%s\n", *override ? *override : "no override");
+}
+
+static ssize_t __gt_guc_override_store(struct xe_config_group_device *dev,
+				       char **override, const char *page, size_t len)
+{
+	char *path;
+
+	if (len > PATH_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	/*
+	 * An empty string disables the override. Some bash commands can add a
+	 * '\n' or '\0 ' at the end of the string, so consider a string of
+	 * length 1 containing one of those characters as empty.
+	 */
+	if (!len || (len == 1 && (page[0] == '\n' || page[0] == '\0'))) {
+		kfree(*override);
+		*override = NULL;
+	} else {
+		path = krealloc(*override, len + 1, GFP_KERNEL);
+		if (!path)
+			return -ENOMEM;
+
+		memcpy(path, page, len);
+
+		/*
+		 * the echo command adds a trailing newline unless the -n option
+		 * is used, so replace it if present.
+		 */
+		if (path[len - 1] == '\n')
+			path[len - 1] = '\0';
+		else
+			path[len] = '\0';
+
+		*override = path;
+	}
+
+	return len;
+}
+
+static ssize_t primary_gt_guc_override_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return __gt_guc_override_show(dev, &dev->config.guc_overrides.primary_gt, page);
+}
+
+static ssize_t primary_gt_guc_override_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return __gt_guc_override_store(dev, &dev->config.guc_overrides.primary_gt, page, len);
+}
+
+static ssize_t media_gt_guc_override_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return __gt_guc_override_show(dev, &dev->config.guc_overrides.media_gt, page);
+}
+
+static ssize_t media_gt_guc_override_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return __gt_guc_override_store(dev, &dev->config.guc_overrides.media_gt, page, len);
+}
+
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_multi_queue);
@@ -945,6 +1052,8 @@ CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, disable_vram_page_offline);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
+CONFIGFS_ATTR(, media_gt_guc_override);
+CONFIGFS_ATTR(, primary_gt_guc_override);
 CONFIGFS_ATTR(, survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
@@ -956,6 +1065,8 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_disable_vram_page_offline,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
+	&attr_media_gt_guc_override,
+	&attr_primary_gt_guc_override,
 	&attr_survivability_mode,
 	NULL,
 };
@@ -966,6 +1077,8 @@ static void xe_config_device_release(struct config_item *item)
 
 	mutex_destroy(&dev->lock);
 
+	kfree(dev->config.guc_overrides.primary_gt);
+	kfree(dev->config.guc_overrides.media_gt);
 	kfree(dev->config.ctx_restore_mid_bb[0].cs);
 	kfree(dev->config.ctx_restore_post_bb[0].cs);
 	kfree(dev);
@@ -1479,6 +1592,43 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 	return len;
 }
 
+/**
+ * xe_configfs_guc_override - get configfs guc override path
+ * @pdev: pci device
+ * @gt_type: type of the GT for which to get the guc override path
+ *
+ * Return: A new drmm-managed allocation containing the path to the specified GT
+ * guc override if set, NULL otherwise
+ */
+const char *xe_configfs_guc_override(struct pci_dev *pdev, enum xe_gt_type gt_type)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	struct drm_device *drm = pci_get_drvdata(pdev);
+	const char *override, *path = NULL;
+
+	if (!dev)
+		return NULL;
+
+	if (!drm)
+		goto out_put;
+
+	scoped_guard(mutex, &dev->lock) {
+		if (gt_type == XE_GT_TYPE_MAIN)
+			override = dev->config.guc_overrides.primary_gt;
+		else if (gt_type == XE_GT_TYPE_MEDIA)
+			override = dev->config.guc_overrides.media_gt;
+		else
+			override = NULL;
+
+		if (override)
+			path = drmm_kstrdup(drm, override, GFP_KERNEL);
+	}
+
+out_put:
+	config_group_put(&dev->group);
+	return path;
+}
+
 #ifdef CONFIG_PCI_IOV
 /**
  * xe_configfs_admin_only_pf() - Get PF's operational mode.
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index d726800de26a..514f115e1977 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 #include "xe_defaults.h"
+#include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_module.h"
 
@@ -31,6 +32,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 					enum xe_engine_class class,
 					const u32 **cs);
+const char *xe_configfs_guc_override(struct pci_dev *pdev, enum xe_gt_type gt_type);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c042075a36e5..98cf7f658b8e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -10,7 +10,9 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_guc_regs.h"
+#include "xe_any.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gsc.h"
@@ -291,13 +293,16 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 static void
 uc_fw_override(struct xe_uc_fw *uc_fw)
 {
-	char *path_override = NULL;
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	const char *path_override = NULL;
 
 	/* empty string disables, but it's not allowed for GuC */
 	switch (uc_fw->type) {
 	case XE_UC_FW_TYPE_GUC:
 		if (xe_modparam.guc_firmware_path && *xe_modparam.guc_firmware_path)
 			path_override = xe_modparam.guc_firmware_path;
+		else
+			path_override = xe_configfs_guc_override(xe_any_to_pdev(gt), gt->info.type);
 		break;
 	case XE_UC_FW_TYPE_HUC:
 		path_override = xe_modparam.huc_firmware_path;
-- 
2.53.0

