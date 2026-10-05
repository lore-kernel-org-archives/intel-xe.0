Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20702CA6007
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 19:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A8510EE71;
	Mon,  5 Oct 2026 19:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjuQ+Bx2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16D810E5F5
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791227175; x=1822763175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3P1XU2i99jwtdUYYir9K8CQ/vZMr0KEFquGCkJIKzAU=;
 b=kjuQ+Bx248Jqg0BB4s5fjdP5vd1/p93mPbvh4QKZalqsz2qCIWmTA15W
 P8cfg8Tx369u2J4xagD2Dw1HTaZLZkhRBnG+XcF09GhzvnuaBM9OGQUrH
 HiElgXpJD4eDyApbmbM/Rlu/wyjJ+0mUVUmfP8nM1LBfiV7wd2Ve1LLLp
 8SR3pY/kiptrKOaTK2GOpVzUTawKd3BtkHhp5PMnvbz+Eqp3mAsOtmsNk
 UXo+YNsapHK0X4NQUxFlSK7M97AOLsy9i02XtRKozSJAxFpvIvLkupwFz
 SpdgwKCBiIOSoBCJiCh6IGokHy1onHRsE/RxXqsFYQEEFU86KeRe9mrT1 A==;
X-CSE-ConnectionGUID: QHCnaMvTSD6AowKwNtdbEQ==
X-CSE-MsgGUID: 6IhARdMhSRaAi58VAl/wMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102578420"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="102578420"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:15 -0700
X-CSE-ConnectionGUID: aneFIuAPTbyQ19upvnvMsQ==
X-CSE-MsgGUID: UEwO3C8STj+RlH3L2w7VxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274690867"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:16 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 05/15] drm/xe: Make survivability_mode configfs attribute a
 bitmap
Date: Mon,  5 Oct 2026 19:06:15 +0000
Message-ID: <20261005190611.332940-22-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005190611.332940-17-stuart.summers@intel.com>
References: <20261005190611.332940-17-stuart.summers@intel.com>
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
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_configfs.c           | 25 +++++++++++++---------
 drivers/gpu/drm/xe/xe_configfs.h           | 16 ++++++++++++--
 drivers/gpu/drm/xe/xe_survivability_mode.c |  7 +++---
 3 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 0ccf163306fc..a16e2f48b01a 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -78,8 +78,10 @@
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
@@ -301,7 +303,7 @@ struct xe_config_group_device {
 		u32 migrate_ulls_period_ms;
 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
-		bool survivability_mode;
+		u8 survivability_mode;
 		bool enable_psmi;
 		bool enable_multi_queue;
 		bool enable_vram_page_offline;
@@ -323,7 +325,7 @@ static const struct xe_config_device device_defaults = {
 	.gt_types_allowed = U64_MAX,
 	.engines_allowed = U64_MAX,
 	.migrate_ulls_period_ms = 5,
-	.survivability_mode = false,
+	.survivability_mode = 0,
 	.enable_psmi = false,
 	.enable_multi_queue = true,
 	.enable_vram_page_offline = true,
@@ -407,19 +409,22 @@ static ssize_t survivability_mode_show(struct config_item *item, char *page)
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
@@ -1243,7 +1248,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", enable_vram_page_offline);
-	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%u", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1278,10 +1283,10 @@ void xe_configfs_check_device(struct pci_dev *pdev)
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
index 1d538ce0ed2c..a5c081fc1672 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -5,6 +5,7 @@
 #ifndef _XE_CONFIGFS_H_
 #define _XE_CONFIGFS_H_
 
+#include <linux/bits.h>
 #include <linux/limits.h>
 #include <linux/types.h>
 
@@ -14,11 +15,22 @@
 
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
 #if IS_ENABLED(CONFIG_CONFIGFS_FS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
@@ -40,7 +52,7 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
-static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
+static inline u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return 0; }
 static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
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

