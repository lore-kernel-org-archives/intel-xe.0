Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D9D606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 00:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q/9UfNvr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD4010E049;
	Wed, 11 Nov 2026 00:08:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D1210E049
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 00:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794355705; x=1825891705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4DzJN8vchKclM8EUaX5JAL5a8Ys1vp6gDOySZnPfQ64=;
 b=Q/9UfNvr/Aq5Khe3y7/dkn+gaYGMuqLHWuZtcNUbgtnmxahN1y24Nkny
 2erFtUAVw3GgQKVpUtu0WNuVxWD1NF6ckRviN/PETPjfXFwSm6BPC8E0R
 Hi+42/cNWBCxyvrax+EiYirIMcAifngK+jEUebYmkh0JLsVqs5+UswoCT
 HUWfsv31NCcEV77YYmnRJXwBBw1DYUreXsOOu8HgwCQI3wwkbE71DBDEA
 LkrhYNT9JAeP0Vkz2ZrsXaLyGbvuxboVnpuzxC4QVtGBoro0BHao/emWA
 Betia9xGeXS/AGCih0GKM4AO726b+aXvl4LF9+IBr3m6gbyl6ZUrRuqUm g==;
X-CSE-ConnectionGUID: DUGfobpyQcGdftZClutSRA==
X-CSE-MsgGUID: fyWon/mFSC2Z2dNWsg1okQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3153571"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3153571"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 16:08:20 -0800
X-CSE-ConnectionGUID: Q42b+bOdRkuO82icTUK1qw==
X-CSE-MsgGUID: Aj8RdgX7RCWa8EByJ6eWeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8381951"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 16:08:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, fei.yang@intel.com, rodrigo.vivi@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/1] drm/xe/configfs: Allow overriding the GuC hwconfig table
Date: Wed, 11 Nov 2026 00:08:18 +0000
Message-ID: <20261111000818.238585-4-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111000818.238585-3-stuart.summers@intel.com>
References: <20261111000818.238585-3-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a binary configfs attribute holding a raw hwconfig blob. When set
before bind, it is loaded into the hwconfig BO instead of querying GuC,
so all consumers - including the DRM_XE_DEVICE_QUERY_HWCONFIG IOCTL -
see the override. This also permits supplying a table on platforms where
GuC exposes none, which is useful for testing userspace against
hwconfig data the hardware does not report.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c     | 119 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs.h     |   6 ++
 drivers/gpu/drm/xe/xe_guc_hwconfig.c |  36 +++++---
 3 files changed, 150 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 2ddd707a6dbd..6f810b33e12d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -63,7 +63,8 @@
  *	    ├── engines_allowed
  *	    ├── migrate_ulls_period_ms
  *	    ├── enable_psmi
- *	    └── disable_vram_page_offline
+ *	    ├── disable_vram_page_offline
+ *	    └── hwconfig
  *
  * After configuring the attributes as per next section, the device can be
  * probed with::
@@ -277,6 +278,22 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * Hwconfig:
+ * ---------
+ *
+ * Override the hardware configuration table normally obtained from the GuC
+ * with a user-provided binary blob. When set, the driver uses this table in
+ * place of the GuC one everywhere it is consumed, including the table
+ * reported to userspace by the DRM_XE_DEVICE_QUERY_HWCONFIG query. This also
+ * allows a table to be provided on platforms where the GuC exposes none.
+ *
+ * The blob is the raw hwconfig table, so its size must be a multiple of 4
+ * bytes. Writing a new blob replaces the previous one::
+ *
+ *	# cat hwconfig.bin > /sys/kernel/config/xe/0000:03:00.0/hwconfig
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Remove devices
  * ==============
  *
@@ -291,6 +308,12 @@ struct wa_bb {
 	u32 len; /* in dwords */
 };
 
+/* User-provided replacement for the GuC-provided hwconfig table */
+struct hwconfig_blob {
+	void *data;
+	size_t len; /* in bytes */
+};
+
 struct xe_config_group_device {
 	struct config_group group;
 	struct config_group sriov;
@@ -299,6 +322,7 @@ struct xe_config_group_device {
 		u64 gt_types_allowed;
 		u64 engines_allowed;
 		u32 migrate_ulls_period_ms;
+		struct hwconfig_blob hwconfig;
 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
@@ -937,6 +961,50 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
 }
 
+static ssize_t hwconfig_read(struct config_item *item, void *buf, size_t count)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	guard(mutex)(&dev->lock);
+
+	if (!buf)
+		return dev->config.hwconfig.len;
+
+	count = min(count, dev->config.hwconfig.len);
+	memcpy(buf, dev->config.hwconfig.data, count);
+
+	return count;
+}
+
+static ssize_t hwconfig_write(struct config_item *item, const void *buf, size_t count)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	void *data = NULL;
+
+	/* The table is a sequence of dwords */
+	if (count % sizeof(u32))
+		return -EINVAL;
+
+	if (count) {
+		data = kmemdup(buf, count, GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+	}
+
+	guard(mutex)(&dev->lock);
+
+	if (is_bound(dev)) {
+		kfree(data);
+		return -EBUSY;
+	}
+
+	kfree(dev->config.hwconfig.data);
+	dev->config.hwconfig.data = data;
+	dev->config.hwconfig.len = count;
+
+	return count;
+}
+
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_multi_queue);
@@ -946,6 +1014,7 @@ CONFIGFS_ATTR(, disable_vram_page_offline);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
+CONFIGFS_BIN_ATTR(, hwconfig, NULL, SZ_64K);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
@@ -960,12 +1029,18 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	NULL,
 };
 
+static const struct configfs_bin_attribute *const xe_config_device_bin_attrs[] = {
+	&attr_hwconfig,
+	NULL,
+};
+
 static void xe_config_device_release(struct config_item *item)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 
 	mutex_destroy(&dev->lock);
 
+	kfree(dev->config.hwconfig.data);
 	kfree(dev->config.ctx_restore_mid_bb[0].cs);
 	kfree(dev->config.ctx_restore_post_bb[0].cs);
 	kfree(dev);
@@ -1001,6 +1076,7 @@ static const struct config_item_type xe_config_device_type = {
 	.ct_item_ops	= &xe_config_device_ops,
 	.ct_group_ops	= &xe_config_device_group_ops,
 	.ct_attrs	= xe_config_device_attrs,
+	.ct_bin_attrs	= xe_config_device_bin_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1243,6 +1319,10 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
+
+	if (dev->config.hwconfig.len)
+		pci_info(pdev, "configfs: hwconfig = %zu bytes\n",
+			 dev->config.hwconfig.len);
 }
 
 /**
@@ -1479,6 +1559,43 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 	return len;
 }
 
+/**
+ * xe_configfs_get_hwconfig - get a copy of the configfs hwconfig blob
+ * @pdev: pci device
+ * @blob: pointer to store the newly allocated copy of the blob
+ *
+ * If a hwconfig table override was written to configfs for @pdev, allocate a
+ * copy of it and store the pointer in @blob. The caller takes ownership of it
+ * and is responsible for freeing it with kfree().
+ *
+ * Return: size in bytes of the blob stored in @blob, or 0 if no override is
+ *     set or it could not be copied.
+ */
+size_t xe_configfs_get_hwconfig(struct pci_dev *pdev, void **blob)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	size_t len = 0;
+
+	*blob = NULL;
+
+	if (!dev)
+		return 0;
+
+	scoped_guard(mutex, &dev->lock) {
+		if (!dev->config.hwconfig.len)
+			break;
+
+		*blob = kmemdup(dev->config.hwconfig.data,
+				dev->config.hwconfig.len, GFP_KERNEL);
+		if (*blob)
+			len = dev->config.hwconfig.len;
+	}
+
+	config_group_put(&dev->group);
+
+	return len;
+}
+
 #ifdef CONFIG_PCI_IOV
 /**
  * xe_configfs_admin_only_pf() - Get PF's operational mode.
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 327b648944ff..526250e9fdfe 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -32,6 +32,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 					enum xe_engine_class class,
 					const u32 **cs);
+size_t xe_configfs_get_hwconfig(struct pci_dev *pdev, void **blob);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
@@ -54,6 +55,11 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 						      enum xe_engine_class class,
 						      const u32 **cs) { return 0; }
+static inline size_t xe_configfs_get_hwconfig(struct pci_dev *pdev, void **blob)
+{
+	*blob = NULL;
+	return 0;
+}
 #ifdef CONFIG_PCI_IOV
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index dc667a71b438..33abfdfcff41 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -10,7 +10,9 @@
 
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device_types.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_map.h"
@@ -55,6 +57,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
+	void *blob;
 	u32 size;
 	int err;
 
@@ -68,25 +71,38 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 	if (gt != xe_root_mmio_gt(xe))
 		return 0;
 
-	/* ADL_P, DG2+ supports hwconfig table */
-	if (GRAPHICS_VERx100(xe) < 1255 && xe->info.platform != XE_ALDERLAKE_P)
-		return 0;
-
-	err = guc_hwconfig_size(guc, &size);
-	if (err)
-		return err;
-	if (!size)
-		return -EINVAL;
+	size = xe_configfs_get_hwconfig(to_pci_dev(xe->drm.dev), &blob);
+	if (!size) {
+		/* ADL_P, DG2+ supports hwconfig table */
+		if (GRAPHICS_VERx100(xe) < 1255 && xe->info.platform != XE_ALDERLAKE_P)
+			return 0;
+
+		err = guc_hwconfig_size(guc, &size);
+		if (err)
+			return err;
+		if (!size)
+			return -EINVAL;
+	}
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
 					  XE_BO_FLAG_GGTT_INVALIDATE);
-	if (IS_ERR(bo))
+	if (IS_ERR(bo)) {
+		kfree(blob);
 		return PTR_ERR(bo);
+	}
 	guc->hwconfig.bo = bo;
 	guc->hwconfig.size = size;
 
+	if (blob) {
+		xe_map_memcpy_to(xe, &bo->vmap, 0, blob, size);
+		kfree(blob);
+		xe_gt_info(gt, "Using hwconfig table override from configfs (%u bytes)\n",
+			   size);
+		return 0;
+	}
+
 	return guc_hwconfig_copy(guc);
 }
 
-- 
2.43.0

