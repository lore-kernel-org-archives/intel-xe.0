Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B8A606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 21:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RfwJcL0K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C104611236A;
	Thu, 12 Nov 2026 21:35:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD5C10EBDA
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 21:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794519321; x=1826055321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0BSSvFvncHQu4Gk2Jz/hOZS/F2bjuJteLYAjLVgc2hs=;
 b=RfwJcL0KUFd2tf332+gBoWkmDD6iIqVwXcEAs2eClG0j2SPW5oWm3bEs
 ULYTDBJ1AcQJPyS+NQYTbc0ZAOIpuxKXM6JHloxyPWC2hBNnzesP0Yn4L
 IByR5dt8kHd779ycVnZhI57oQiSokrJ9Ka6NQ0GWYPQq3jvofO2OeyBE/
 rKvqk/DpmFUtLdr1vZKyX84xnd+h2rYJpmSGplG648XalBTdR2KbIWBE1
 sHl4GOr1QFgL5YtU2sA++2g3zFhQI4aSpQ+mI2BCTjtO7PAvvsi6fmfAl
 Wy/zL3pR60q+sBJWc/C7Zhi04HIqdG7vN75mOIHjOMdA7OnlrSQbPk/1P A==;
X-CSE-ConnectionGUID: MAt6UFemThqp9cGmnpvkaw==
X-CSE-MsgGUID: zS+MI+KPRYScnsnWAWmbQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3351725"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3351725"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:11 -0800
X-CSE-ConnectionGUID: kZKQNSniRV6Ja96rzqCq7g==
X-CSE-MsgGUID: EAaHu5BtRQiXVCJQWq7L7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8754531"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:11 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 5/8] drm/xe: Make survivability_mode configfs attribute a
 bitmap
Date: Thu, 12 Nov 2026 21:35:10 +0000
Message-ID: <20261112213508.457213-15-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112213508.457213-10-stuart.summers@intel.com>
References: <20261112213508.457213-10-stuart.summers@intel.com>
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

Survivability mode is likely to grow additional independently selectable
behaviors, so store it as a u8 bitmap rather than a bool. Only bit 0 is
defined, so the accepted values are unchanged.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c           | 25 +++++++++++++---------
 drivers/gpu/drm/xe/xe_configfs.h           | 14 +++++++++++-
 drivers/gpu/drm/xe/xe_survivability_mode.c |  7 +++---
 3 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 68d537cabef2..4ad07d9c3e90 100644
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
index fb92362907ef..a9442ab56a2e 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -5,6 +5,7 @@
 #ifndef _XE_CONFIGFS_H_
 #define _XE_CONFIGFS_H_
 
+#include <linux/bits.h>
 #include <linux/limits.h>
 #include <linux/types.h>
 
@@ -14,10 +15,21 @@
 
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
index 91a0680e449b..ed51cc5e805e 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -309,7 +309,8 @@ static const struct attribute_group survivability_info_group = {
 static int create_survivability_sysfs(struct pci_dev *pdev)
 {
 	/* Survivability info is required if not enabled via configfs */
-	bool needs_info = !xe_configfs_get_survivability_mode(pdev);
+	bool needs_info = !(xe_configfs_get_survivability_mode(pdev) &
+			    XE_CONFIGFS_SURVIVABILITY_ENABLE);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -408,14 +409,14 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
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

