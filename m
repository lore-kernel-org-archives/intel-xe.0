Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91D3CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B32610E436;
	Mon, 20 Oct 2025 12:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6QPRgRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356C810E432
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 12:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760964888; x=1792500888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TWun5WX1ZbJZqHTsQaFu+dar9P6LrFGRy4cXLlayRyQ=;
 b=G6QPRgRFFlUXRoF64GhyEToT3gmfbMO64N826F2C+NinYtDNe2qXzWUd
 YfJcbIWA8mQINejmFtbzcncGxxXyiwqO1tsRHunuMxfRq5xxI8LAhH4ip
 hHl5MchSlh6/GXQX4hd9BKkCgVGmlO28KfQcGtWBfbRUPd9TpGeTEeA7P
 ixlUeeR4GiIH+0gYccexhfExRf7KcVpfJR0XA1A95hoxgbEtoKMoevEby
 2H+9JKK+J3EYIr10lq7K7nVQS7S4H3kYTcJ+2YYjzJL5Vi/CyDZMvKja2
 jlS4QWX9AYY/dGBOv5siGztLvINWzwduY3frH1MHUZAluVeJ9oRfYoP1T Q==;
X-CSE-ConnectionGUID: JwoQXL47RIC0m0oJ7pKOcg==
X-CSE-MsgGUID: BM9td18nTCODG2TdC7blmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74422400"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74422400"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:48 -0700
X-CSE-ConnectionGUID: d7csCmddRMCVPZm0c4GScw==
X-CSE-MsgGUID: DLkNWfKqRemp2i/AfU78qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182512907"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.44])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 7/7] drm/xe/configfs: add disable_mem_copy knob
Date: Mon, 20 Oct 2025 13:54:39 +0100
Message-ID: <20251020125431.41153-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020125431.41153-9-matthew.auld@intel.com>
References: <20251020125431.41153-9-matthew.auld@intel.com>
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

For easier experimentation/comparison allow turning off the newer
MEM_COPY path, without needing to apply manual hacks and build a new
kernel. This needs to be configured before fully probing the device.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 65 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  2 +
 drivers/gpu/drm/xe/xe_pci.c      |  4 +-
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index c1419a270fa4..df459daa0f07 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -236,6 +236,15 @@
  *
  * This setting only takes effect when probing the device.
  *
+ * Disable MEM_COPY path
+ * -----------------------------------------------------
+ * This config will force the use of the older XY_FAST_COPY instruction in the migration code.
+ * Intended only for experimentation.
+ *
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_mem_copy
+ *
+ * This setting only takes effect when probing the device.
+ *
  * Remove devices
  * ==============
  *
@@ -264,6 +273,9 @@ struct xe_config_group_device {
 		struct {
 			unsigned int max_vfs;
 		} sriov;
+		struct {
+			bool disable_mem_copy;
+		} migrate;
 	} config;
 
 	/* protects attributes */
@@ -282,6 +294,9 @@ static const struct xe_config_device device_defaults = {
 	.sriov = {
 		.max_vfs = UINT_MAX,
 	},
+	.migrate = {
+		.disable_mem_copy = false,
+	},
 };
 
 static void set_device_defaults(struct xe_config_device *config)
@@ -809,8 +824,35 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
 }
 
+static ssize_t disable_mem_copy_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->migrate.disable_mem_copy);
+}
+
+static ssize_t disable_mem_copy_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.migrate.disable_mem_copy = val;
+
+	return len;
+}
+
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
+CONFIGFS_ATTR(, disable_mem_copy);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
@@ -819,6 +861,7 @@ CONFIGFS_ATTR(, survivability_mode);
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
+	&attr_disable_mem_copy,
 	&attr_enable_psmi,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
@@ -1065,6 +1108,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%d", migrate.disable_mem_copy);
 
 #undef PRI_CUSTOM_ATTR
 }
@@ -1242,6 +1286,27 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 	return len;
 }
 
+/**
+ * xe_configfs_migrate_disable_mem_copy - get configfs disable_mem_copy setting
+ * @pdev: pci device
+ *
+ * Return: True if fast_copy_xy instruction in migration code should be used as the default. False
+ * otherwise.
+ */
+bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool disable_mem_copy;
+
+	if (!dev)
+		return false;
+
+	disable_mem_copy = dev->config.migrate.disable_mem_copy;
+	config_group_put(&dev->group);
+
+	return disable_mem_copy;
+}
+
 #ifdef CONFIG_PCI_IOV
 /**
  * xe_configfs_get_max_vfs() - Get number of VFs that could be managed
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index fed57be0b90e..01f285ce56f2 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -25,6 +25,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_clas
 				       const u32 **cs);
 u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
 					const u32 **cs);
+bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 #endif
@@ -42,6 +43,7 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum
 static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
 						      const u32 **cs) { return 0; }
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
+bool xe_configfs_migrate_disable_mem_copy(struct pci_dev *pdev) { return false; }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8458d4ae8ee7..9f8a2a298216 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -660,7 +660,9 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
-	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
+	xe->info.has_mem_copy_instr =
+		desc->has_mem_copy_instr &&
+		!xe_configfs_migrate_disable_mem_copy(to_pci_dev(xe->drm.dev));
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
-- 
2.51.0

