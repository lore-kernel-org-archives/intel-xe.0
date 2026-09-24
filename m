Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46932C9831E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 23:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2E510E558;
	Thu, 24 Sep 2026 23:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iG4UqUCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D17110E558
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 23:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790290883; x=1821826883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Js2uStLQrYIeSYWHCO5j181R9FChnetVyJnIs+oD1Lg=;
 b=iG4UqUCegpN3sBZPleTu+XGQyg1oFK18cRVTooLKDsRGURVPL/tefljq
 k+X+aUXSfpFc5OOScvDnjy9xthHzQjP0U5eInaAXw/5YBOnIABPGZW+Xz
 hAaxjkcbMbo1GeRV5BuP6ktcJx3WXZV3dzpqGc+PvTzwVd1a81AKHP4qh
 +ucZAG9ygNjGDj9cjzAQgqgSlqCiOVTZSVoZxChsFSOTFrPba4Hr6myZx
 njc8xOteyEROn+wzvflX3UpitX0FtpqAPA6YkONO7622sYHnkZ+88q1f4
 mmuutgyx/fK1q3K63sqhkSYQX2EDrBNIQORKGeJJ7O31NXTqbyuW+JTQr A==;
X-CSE-ConnectionGUID: 0z0vwGozSS2g51jV/ZG/1g==
X-CSE-MsgGUID: gh3PYOFeQ/KffJ7gTSpftQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90120173"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90120173"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:22 -0700
X-CSE-ConnectionGUID: JAtPv0FpSUSHcVadwldIGQ==
X-CSE-MsgGUID: gRnrViKUTYWWTSbg0ydOHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="270651605"
Received: from dut4435arlh.fm.intel.com ([10.105.8.61])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:22 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 06/16] drm/xe: Make survivability_mode configfs attribute a
 bitmap
Date: Thu, 24 Sep 2026 23:01:25 +0000
Message-ID: <20260924230120.389685-24-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924230120.389685-18-stuart.summers@intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
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

Survivability mode is likely to grow additional independently selectable
behaviors, so store it as a u8 bitmap rather than a bool. Only bit 0 is
defined, so the accepted values are unchanged.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-5
---
 drivers/gpu/drm/xe/xe_configfs.c           | 25 +++++++++++++---------
 drivers/gpu/drm/xe/xe_configfs.h           | 14 +++++++++++-
 drivers/gpu/drm/xe/xe_survivability_mode.c |  7 +++---
 3 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 28a3b3761c91..722babb8b328 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -77,8 +77,10 @@
  * Survivability mode:
  * -------------------
  *
- * Enable survivability mode on supported cards. This setting only takes
- * effect when probing the device. Example to enable it::
+ * Enable survivability mode on supported cards. This is a bitmap; bit 0
+ * enables survivability mode and is currently the only bit defined, so the
+ * only accepted values remain 0 and 1. This setting only takes effect when
+ * probing the device. Example to enable it::
  *
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
  *
@@ -285,7 +287,7 @@ struct xe_config_group_device {
 		u64 engines_allowed;
 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
-		bool survivability_mode;
+		u8 survivability_mode;
 		bool enable_psmi;
 		bool enable_multi_queue;
 		bool enable_vram_page_offline;
@@ -306,7 +308,7 @@ struct xe_config_group_device {
 static const struct xe_config_device device_defaults = {
 	.gt_types_allowed = U64_MAX,
 	.engines_allowed = U64_MAX,
-	.survivability_mode = false,
+	.survivability_mode = 0,
 	.enable_psmi = false,
 	.enable_multi_queue = true,
 	.enable_vram_page_offline = true,
@@ -390,19 +392,22 @@ static ssize_t survivability_mode_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
 
-	return sprintf(page, "%d\n", dev->survivability_mode);
+	return sprintf(page, "%u\n", dev->survivability_mode);
 }
 
 static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	bool survivability_mode;
+	u8 survivability_mode;
 	int ret;
 
-	ret = kstrtobool(page, &survivability_mode);
+	ret = kstrtou8(page, 0, &survivability_mode);
 	if (ret)
 		return ret;
 
+	if (survivability_mode & ~XE_CONFIGFS_SURVIVABILITY_MASK)
+		return -EINVAL;
+
 	guard(mutex)(&dev->lock);
 	if (is_bound(dev))
 		return -EBUSY;
@@ -1196,7 +1201,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", enable_vram_page_offline);
-	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%u", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1231,10 +1236,10 @@ void xe_configfs_check_device(struct pci_dev *pdev)
  *
  * Return: survivability_mode attribute in configfs
  */
-bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
+u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 {
 	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	bool mode;
+	u8 mode;
 
 	if (!dev)
 		return device_defaults.survivability_mode;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 28ff1381382d..19b0bb596f5d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -5,16 +5,28 @@
 #ifndef _XE_CONFIGFS_H_
 #define _XE_CONFIGFS_H_
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 #include "xe_hw_engine_types.h"
 
 struct pci_dev;
 
+/**
+ * DOC: survivability_mode configfs bits
+ *
+ * The survivability_mode attribute is a bitmap so that additional
+ * survivability behaviors can be requested independently in the future.
+ * %XE_CONFIGFS_SURVIVABILITY_ENABLE is currently the only defined bit, so
+ * the attribute still only accepts 0 and 1.
+ */
+#define XE_CONFIGFS_SURVIVABILITY_ENABLE	BIT(0)
+#define XE_CONFIGFS_SURVIVABILITY_MASK		XE_CONFIGFS_SURVIVABILITY_ENABLE
+
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 45d44ebe288b..3b96097f6ee6 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -306,7 +306,8 @@ static const struct attribute_group survivability_info_group = {
 static int create_survivability_sysfs(struct pci_dev *pdev)
 {
 	/* Survivability info is required if not enabled via configfs */
-	bool needs_info = !xe_configfs_get_survivability_mode(pdev);
+	bool needs_info = !(xe_configfs_get_survivability_mode(pdev) &
+			    XE_CONFIGFS_SURVIVABILITY_ENABLE);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -405,14 +406,14 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u32 data;
-	bool survivability_mode;
+	u8 survivability_mode;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE)
 		return false;
 
 	survivability_mode = xe_configfs_get_survivability_mode(pdev);
 	/* Enable survivability mode if set via configfs */
-	if (survivability_mode)
+	if (survivability_mode & XE_CONFIGFS_SURVIVABILITY_ENABLE)
 		return true;
 
 	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
-- 
2.43.0

