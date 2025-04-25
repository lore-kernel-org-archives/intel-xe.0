Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9EDC369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 14:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1670110E2ED;
	Fri, 25 Apr 2025 14:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0oecPOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218E110E2ED
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745590065; x=1777126065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ePyRk3v0YeETZZTVEF7/6yP2gNT/FS0HIS5SrR/9y8=;
 b=J0oecPOv3R21rxZsAER7/94RbPO0Qf+CyAov4ERl0IFKKoWQekwEtARN
 rOr+I9Ae9V+sznlyxsOtnEx3pFVxMsAZMGPrnoec5zngk4ciWXH8n4cp1
 SCqRboqIKFVMrTyFgQQnI/WSCZj3/QwFfPh+1dlsxhi6vFp8vUG5N4aS/
 ijkzQ4CFaI/Yqlyo0bYSRXRikaiSOK6t0ewWFPS8mYmJI8awwUjTugCgQ
 dFfu9aWZxqueGJy7wS/tC6+H+FachAUudClHDQlpuiacoGyClqgzTJl8S
 BBMpXxsmQfRGL78uXXKRZvb5uEhC6m3DpQPDHeBSjHbQi0O7/jy4ajYen A==;
X-CSE-ConnectionGUID: 2OuA7n7zR5my+N0iY0u/uQ==
X-CSE-MsgGUID: Fm9eN3CaRgS8SeJH4p9MeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47345500"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47345500"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:07:45 -0700
X-CSE-ConnectionGUID: 32b8Pp0jRGmC+vDSJtfhKw==
X-CSE-MsgGUID: QH4Rz+rMSDCqCllkXkYkOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132900204"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 25 Apr 2025 07:07:43 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 2/3] drm/xe: Expose PCIe Gen5 downgrade attributes
Date: Fri, 25 Apr 2025 19:36:25 +0530
Message-Id: <20250425140626.3082588-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425140626.3082588-1-raag.jadav@intel.com>
References: <20250425140626.3082588-1-raag.jadav@intel.com>
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

Expose sysfs attributes for PCIe Gen5 downgrade capability and status.

v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
    Rework macros and their naming (Rodrigo)
v3: Use sysfs_create_files() (Riana)
    Fix checkpatch warning (Riana)
v4: s/gen4_downspeed/gen5_downgrade (Lucas, Rodrigo, Riana)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   5 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 103 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
 4 files changed, 114 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6c9d3009aa03..79b7b0ecfbae 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -26,6 +26,7 @@
 #include "xe_bo_evict.h"
 #include "xe_debugfs.h"
 #include "xe_devcoredump.h"
+#include "xe_device_sysfs.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_drv.h"
@@ -916,6 +917,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	err = xe_device_sysfs_init(xe);
+	if (err)
+		goto err_unregister_display;
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 2d25e5b5d4bf..6f1269b08570 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -11,6 +11,9 @@
 
 #include "xe_device.h"
 #include "xe_device_sysfs.h"
+#include "xe_mmio.h"
+#include "xe_pcode_api.h"
+#include "xe_pcode.h"
 #include "xe_pm.h"
 
 /**
@@ -81,3 +84,103 @@ int xe_pm_sysfs_init(struct xe_device *xe)
 
 	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
 }
+
+/**
+ * DOC: PCIe Gen5 Limitations
+ *
+ * Default link speed of discrete GPUs is determined by configuration parameters
+ * stored in their flash memory, which are subject to override through user
+ * initiated firmware updates. It has been observed that devices configured with
+ * PCIe Gen5 as their default link speed can come across link quality issues due
+ * to host or motherboard limitations and may have to auto-downgrade their link
+ * to PCIe Gen4 speed when faced with unstable link at Gen5, which makes
+ * firmware updates rather risky on such setups. It is required to ensure that
+ * the device is capable of auto-downgrading its link to PCIe Gen4 speed before
+ * pushing the firmware image with PCIe Gen5 as default configuration. This can
+ * be done by reading ``pcie_gen5_downgrade_capable`` sysfs entry, which will
+ * denote if the device is capable of auto-downgrading its link to PCIe Gen4
+ * speed with boolean output value of ``0`` or ``1``, meaning `incapable` or
+ * `capable` respectively.
+ *
+ * .. code-block:: shell
+ *
+ *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen5_downgrade_capable
+ *
+ * Pushing the firmware image with PCIe Gen5 as default configuration on a link
+ * auto-downgrade incapable device and facing link instability due to host or
+ * motherboard limitations can result in driver failing to bind to the device,
+ * making further firmware updates impossible with RMA being the only last
+ * resort.
+ *
+ * Link downgrade status of auto-downgrade capable devices is available through
+ * ``pcie_gen5_downgrade_status`` sysfs entry with boolean output value of ``0``
+ * or ``1``, where ``0`` means no auto-downgrading was required during link
+ * training (which is the optimal scenario) and ``1`` means the device has
+ * auto-downgraded its link to PCIe Gen4 speed due to unstable Gen5 link.
+ *
+ * .. code-block:: shell
+ *
+ *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen5_downgrade_status
+ */
+
+static ssize_t
+pcie_gen5_downgrade_capable_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	u32 cap, val;
+
+	xe_pm_runtime_get(xe);
+	val = xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PCIE5_CAP);
+	xe_pm_runtime_put(xe);
+
+	cap = REG_FIELD_GET(PCIE5_DOWNGRADE, val);
+	return sysfs_emit(buf, "%u\n", cap == DOWNGRADE_CAPABLE ? true : false);
+}
+static DEVICE_ATTR_ADMIN_RO(pcie_gen5_downgrade_capable);
+
+static ssize_t
+pcie_gen5_downgrade_status_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	u32 val;
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_pcode_read(xe_device_get_root_tile(xe),
+			    PCODE_MBOX(DGFX_PCODE_STATUS, DGFX_GET_INIT_STATUS, 0),
+			    &val, NULL);
+	xe_pm_runtime_put(xe);
+
+	return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_PCIE5_DOWNGRADE_STATUS, val));
+}
+static DEVICE_ATTR_ADMIN_RO(pcie_gen5_downgrade_status);
+
+static const struct attribute *pcie_gen5_downgrade_attrs[] = {
+	&dev_attr_pcie_gen5_downgrade_capable.attr,
+	&dev_attr_pcie_gen5_downgrade_status.attr,
+	NULL
+};
+
+static void xe_device_sysfs_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	if (xe->info.platform == XE_BATTLEMAGE)
+		sysfs_remove_files(&xe->drm.dev->kobj, pcie_gen5_downgrade_attrs);
+}
+
+int xe_device_sysfs_init(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	int ret;
+
+	if (xe->info.platform == XE_BATTLEMAGE) {
+		ret = sysfs_create_files(&dev->kobj, pcie_gen5_downgrade_attrs);
+		if (ret)
+			return ret;
+	}
+
+	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
index 2c1fabdba9e4..b557db0a6023 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
@@ -9,5 +9,6 @@
 struct xe_device;
 
 int xe_pm_sysfs_init(struct xe_device *xe);
+int xe_device_sysfs_init(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index e622ae17f08d..e70cc5e83c32 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -34,6 +34,7 @@
 #define   DGFX_PCODE_STATUS		0x7E
 #define     DGFX_GET_INIT_STATUS	0x0
 #define     DGFX_INIT_STATUS_COMPLETE	0x1
+#define     DGFX_PCIE5_DOWNGRADE_STATUS	REG_BIT(31)
 
 #define   PCODE_POWER_SETUP			0x7C
 #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
@@ -66,6 +67,10 @@
 /* Auxiliary info bits */
 #define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
 
+#define BMG_PCIE5_CAP			XE_REG(0x138340)
+#define   PCIE5_DOWNGRADE		REG_GENMASK(1, 0)
+#define     DOWNGRADE_CAPABLE		2
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
-- 
2.34.1

