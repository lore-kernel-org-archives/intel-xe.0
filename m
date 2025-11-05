Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5793BCCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 14:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1932210E75D;
	Wed,  5 Nov 2025 14:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkK4DDpC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3B110E75D
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762354229; x=1793890229;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=reHOHA7s8qkxlXdqMJLBoGc6YjJmzLWhfuciH2il9XA=;
 b=SkK4DDpCZzNGpATAbl+4hJ8ST1VxxlK2Kbjz61rvQ367waAHjeULHLwj
 YV9ED6IwlnfdUMzS4VVCDuB/gPMffUjmii4pYuca22RkQ3IZ1f9UuZFNC
 G8R8U3YiEgCXqZz9pdscSgsJXfJA1fPPom82257te8FaZbimjlun2UHBv
 b3bQ3Ih5L+sjcbKFHeiAd9ybI48ZFqRghTa1B9CTq8/3SsMrhlL12jO83
 25d+yWDECuOFUxYhkebOSbews6jOtdOAu0EjI78RSXDOaUz+ZvserqGKu
 l9H/Mb0HdZwJCCM+Nif+IRzfiayHSfkrHDRxyoifC3C0fKwV5deZ8O9L/ Q==;
X-CSE-ConnectionGUID: spBNOHJaSUmTSSi4VI+G1Q==
X-CSE-MsgGUID: 4+eY/QjjRLWK6pfV5da/3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68329299"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="68329299"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:50:28 -0800
X-CSE-ConnectionGUID: bHo+F6OaT325RmvRSk3ELw==
X-CSE-MsgGUID: yiv5bRSBTfmf35yNFZBBRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="210952611"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2025 06:50:26 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3] drm/xe/pm: Enable WAKE# support
Date: Wed,  5 Nov 2025 20:20:10 +0530
Message-Id: <20251105145010.428268-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

CRI supports signalling the host through WAKE# pin on smbus alerts
while in D3cold. Enable/disable this feature based on device/host
configuration. We also take user input into account in case the user
wants to enable/disable it from userspace.

v2: Make wakeup helper static, drop d3cold argument (Rodrigo)
v3: Expand commit message, drop defeature on init (Rodrigo)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 +++
 drivers/gpu/drm/xe/xe_pcode_api.h    |  5 +++
 drivers/gpu/drm/xe/xe_pm.c           | 53 ++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a03cc83aa26f..602849fcd3aa 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -528,6 +528,10 @@ struct xe_device {
 		 * Default threshold value is 300mb.
 		 */
 		u32 vram_threshold;
+
+		/** @d3cold.wake: Indicates WAKE# capability of device */
+		u32 wake;
+
 		/** @d3cold.lock: protect vram_threshold */
 		struct mutex lock;
 	} d3cold;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 92bfcba51e19..3f8d43c1b4fe 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -50,6 +50,11 @@
 #define	READ_PL_FROM_FW				0x1
 #define	READ_PL_FROM_PCODE			0x0
 
+#define   PCODE_D3COLD_WAKE			0x5A
+#define     READ_MODE				0x0
+#define     WRITE_MODE				0x1
+#define       I2C_WAKE_ENABLE			REG_BIT(1)
+
 #define   PCODE_LATE_BINDING			0x5C
 #define     GET_CAPABILITY_STATUS		0x0
 #define       V1_FAN_SUPPORTED			REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 7b089e6fb63f..94a0b1c9acc6 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -7,6 +7,8 @@
 
 #include <linux/fault-inject.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeup.h>
+#include <linux/string_choices.h>
 #include <linux/suspend.h>
 
 #include <drm/drm_managed.h>
@@ -22,6 +24,7 @@
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
+#include "xe_pcode_api.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
@@ -161,6 +164,29 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
 			 &xe_pm_runtime_d3cold_map);
 }
 
+static void xe_pm_set_wakeup(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *root_pdev;
+	bool wakeup;
+	int ret;
+
+	/* Currently WAKE# is supported for I2C only */
+	if (!REG_FIELD_GET(I2C_WAKE_ENABLE, xe->d3cold.wake))
+		return;
+
+	root_pdev = pcie_find_root_port(pdev);
+	wakeup = root_pdev && device_may_wakeup(&root_pdev->dev);
+
+	ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0),
+			     wakeup ? xe->d3cold.wake : 0);
+	if (ret)
+		return;
+
+	drm_dbg(&xe->drm, "WAKE# %s\n", str_enabled_disabled(wakeup));
+}
+
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -205,6 +231,8 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	xe_i2c_pm_suspend(xe);
 
+	xe_pm_set_wakeup(xe);
+
 	drm_dbg(&xe->drm, "Device suspended\n");
 	xe_pm_block_end_signalling();
 
@@ -422,6 +450,27 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+static void xe_pm_wakeup_init(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	int err;
+
+	if (xe->info.platform != XE_CRESCENTISLAND)
+		return;
+
+	err = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0),
+			    &xe->d3cold.wake, NULL);
+	if (err || !xe->d3cold.wake) {
+		drm_dbg(&xe->drm, "WAKE# not supported\n");
+		return;
+	}
+
+	if (!xe_i2c_present(xe))
+		xe->d3cold.wake &= ~I2C_WAKE_ENABLE;
+
+	drm_dbg(&xe->drm, "WAKE# configuration 0x%08x\n", xe->d3cold.wake);
+}
+
 /**
  * xe_pm_init - Initialize Xe Power Management
  * @xe: xe device instance
@@ -459,6 +508,7 @@ int xe_pm_init(struct xe_device *xe)
 			goto err_unregister;
 	}
 
+	xe_pm_wakeup_init(xe);
 	xe_pm_runtime_init(xe);
 	return 0;
 
@@ -602,6 +652,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_i2c_pm_suspend(xe);
 
+	if (xe->d3cold.allowed)
+		xe_pm_set_wakeup(xe);
+
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return 0;
-- 
2.34.1

