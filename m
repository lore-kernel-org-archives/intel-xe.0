Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE51C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 05:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6512110E4AE;
	Tue,  6 May 2025 05:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8cfZiq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B937210E4AE
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 05:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746510618; x=1778046618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n+2DpNiTuGNvYo3kdxgsiHrn4Dy8620WwcaLonUdjAw=;
 b=Y8cfZiq7IlLFpAHyAqJLmA0VBAzJWqOPcRZjohOH2VmUWXqhcPSavdQk
 7Tt0g5r2R/HkVpZ4ETjBcf6KpFzIGc32KlHWZMHP2qCfECupVkbt463hZ
 Lp+wuA7ehLaH12K4XtWBReUb2SG+ucS9GYMc3DQrbuW8QgaamkCprxbeW
 qPqpu4b+idcnQ4jSKN4QMfmVi14xcXzn+rrzA3PGNWhjfaQxpcht9ZLUZ
 okS9Cz21DXAk31PU1+5sW2ozM2wLXjh4FG9K2OXCBo5JbjpN/WyUbi3jH
 cDcMRIlsHyNF1gCtlGr8wm0wj+Ac2vmqE9WiU+7KJZBznlDbDpljBrM79 A==;
X-CSE-ConnectionGUID: GYp+oJNPR/OYZc4HH8NvEg==
X-CSE-MsgGUID: IDc5QlHvQ9Oxq6bUGTbnyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48029019"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="48029019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 22:50:18 -0700
X-CSE-ConnectionGUID: dTovf8KVSiOI5Md/qMZwTA==
X-CSE-MsgGUID: OoKTMCs6TdKPMSZDOOHKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="136473448"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 05 May 2025 22:50:17 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 2/3] drm/xe: Expose PCIe link downgrade attributes
Date: Tue,  6 May 2025 11:18:34 +0530
Message-Id: <20250506054835.3395220-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506054835.3395220-1-raag.jadav@intel.com>
References: <20250506054835.3395220-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Expose sysfs attributes for PCIe link downgrade capability and status.

v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
    Rework macros and their naming (Rodrigo)
v3: Use sysfs_create_files() (Riana)
    Fix checkpatch warning (Riana)
v4: s/downspeed/downgrade (Lucas, Rodrigo, Riana)
v5: Use PCIe Gen agnostic naming (Rodrigo)
v6: s/pcie_gen/auto_link (Lucas)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 93 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++
 2 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index d4c73acea1cf..9628e9a0a0af 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -3,14 +3,16 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/device.h>
 #include <linux/kobject.h>
 #include <linux/pci.h>
 #include <linux/sysfs.h>
 
-#include <drm/drm_managed.h>
-
 #include "xe_device.h"
 #include "xe_device_sysfs.h"
+#include "xe_mmio.h"
+#include "xe_pcode_api.h"
+#include "xe_pcode.h"
 #include "xe_pm.h"
 
 /**
@@ -63,12 +65,93 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(vram_d3cold_threshold);
 
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
+ * be done by reading ``auto_link_downgrade_capable`` sysfs entry, which will
+ * denote if the device is capable of auto-downgrading its link to PCIe Gen4
+ * speed with boolean output value of ``0`` or ``1``, meaning `incapable` or
+ * `capable` respectively.
+ *
+ * .. code-block:: shell
+ *
+ *    $ cat /sys/bus/pci/devices/<bdf>/auto_link_downgrade_capable
+ *
+ * Pushing the firmware image with PCIe Gen5 as default configuration on a auto
+ * link downgrade incapable device and facing link instability due to host or
+ * motherboard limitations can result in driver failing to bind to the device,
+ * making further firmware updates impossible with RMA being the only last
+ * resort.
+ *
+ * Link downgrade status of auto link downgrade capable devices is available
+ * through ``auto_link_downgrade_status`` sysfs entry with boolean output value
+ * of ``0`` or ``1``, where ``0`` means no auto-downgrading was required during
+ * link training (which is the optimal scenario) and ``1`` means the device has
+ * auto-downgraded its link to PCIe Gen4 speed due to unstable Gen5 link.
+ *
+ * .. code-block:: shell
+ *
+ *    $ cat /sys/bus/pci/devices/<bdf>/auto_link_downgrade_status
+ */
+
+static ssize_t
+auto_link_downgrade_capable_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	u32 cap, val;
+
+	xe_pm_runtime_get(xe);
+	val = xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PCIE_CAP);
+	xe_pm_runtime_put(xe);
+
+	cap = REG_FIELD_GET(LINK_DOWNGRADE, val);
+	return sysfs_emit(buf, "%u\n", cap == DOWNGRADE_CAPABLE ? true : false);
+}
+static DEVICE_ATTR_ADMIN_RO(auto_link_downgrade_capable);
+
+static ssize_t
+auto_link_downgrade_status_show(struct device *dev, struct device_attribute *attr, char *buf)
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
+	return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_LINK_DOWNGRADE_STATUS, val));
+}
+static DEVICE_ATTR_ADMIN_RO(auto_link_downgrade_status);
+
+static const struct attribute *auto_link_downgrade_attrs[] = {
+	&dev_attr_auto_link_downgrade_capable.attr,
+	&dev_attr_auto_link_downgrade_status.attr,
+	NULL
+};
+
 static void xe_device_sysfs_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
 	if (xe->d3cold.capable)
 		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+
+	if (xe->info.platform == XE_BATTLEMAGE)
+		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
 }
 
 int xe_device_sysfs_init(struct xe_device *xe)
@@ -82,5 +165,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
 			return ret;
 	}
 
+	if (xe->info.platform == XE_BATTLEMAGE) {
+		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
+		if (ret)
+			return ret;
+	}
+
 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index e622ae17f08d..127d4d26c4cf 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -34,6 +34,7 @@
 #define   DGFX_PCODE_STATUS		0x7E
 #define     DGFX_GET_INIT_STATUS	0x0
 #define     DGFX_INIT_STATUS_COMPLETE	0x1
+#define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
 
 #define   PCODE_POWER_SETUP			0x7C
 #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
@@ -66,6 +67,10 @@
 /* Auxiliary info bits */
 #define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
 
+#define BMG_PCIE_CAP			XE_REG(0x138340)
+#define   LINK_DOWNGRADE		REG_GENMASK(1, 0)
+#define     DOWNGRADE_CAPABLE		2
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
-- 
2.34.1

