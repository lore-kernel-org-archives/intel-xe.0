Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C790CCF9E7
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9132110E6B1;
	Wed, 22 Oct 2025 05:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBXF41Ou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A159C10E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110318; x=1792646318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vTGQsARLeMkHBpXWr2SmlUHPRPff0NPdIvgRIfIAZqc=;
 b=hBXF41Ou2KnDIuBhzNycz2HH9O1gjYVPKsCfqribBER3ZFhK6y9AA6vz
 wzibKYguaT905b0ATYcFeJwwbJmhdTUrgvpnkFHols3Nwe+h4o5sxrzTn
 pkCpPqk4xQ7kOLcvnaW83zQDQs8WlAafVv6zqYou3or0rfNg1ulJ/cnJN
 QJLvunQpYs90da16ibsQrRReMZ2TEdRr4A56uLxnj61RHm4bW0rfsnOwN
 wAcwTsVtHkiZipt5fTpnywiXJJvoQlvfzCaoyH57NKSHR/nr11o11QxZc
 yM+1AUO9ES+TH+kn03Nmle/bq4Gv+AGaO5Lc1MQBZNLuXXH1zaVVy1anR Q==;
X-CSE-ConnectionGUID: jAxYSjDvT+e5XlxthD8onA==
X-CSE-MsgGUID: hMEojzvtQ4ySAGB0ux8kag==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083976"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083976"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: 4Ul50lmhRjWcZnMgjoPh+A==
X-CSE-MsgGUID: sUXXbPpiSwu2VRx/q9rhxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959697"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH 06/12] drm/xe/pm: Enable D3cold WAKE# support
Date: Tue, 21 Oct 2025 22:17:38 -0700
Message-ID: <20251021-cri-v1-6-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Raag Jadav <raag.jadav@intel.com>

CRI supports signalling the host through WAKE# pin on smbus alerts while
in D3cold. Enable/disable this feature based on device/host configuration.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_i2c.c          | 38 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h    |  5 +++++
 drivers/gpu/drm/xe/xe_pm.c           | 34 ++++++++++++++++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 02c04ad7296e4..f1e3b16897d1b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -520,6 +520,10 @@ struct xe_device {
 		 * Default threshold value is 300mb.
 		 */
 		u32 vram_threshold;
+
+		/** @d3cold.wake: Indicates d3cold WAKE# capability of device */
+		u32 wake;
+
 		/** @d3cold.lock: protect vram_threshold */
 		struct mutex lock;
 	} d3cold;
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 0b5452be0c873..65788c02556ff 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -16,9 +16,11 @@
 #include <linux/notifier.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeup.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/sprintf.h>
+#include <linux/string_choices.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
@@ -30,6 +32,8 @@
 #include "xe_device_types.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_pcode_api.h"
+#include "xe_pcode.h"
 #include "xe_platform_types.h"
 
 /**
@@ -265,6 +269,37 @@ static const struct regmap_config i2c_regmap_config = {
 	.fast_io = true,
 };
 
+static void xe_i2c_d3cold_wake(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *root_pdev;
+	bool wakeup;
+	u32 val;
+	int ret;
+
+	/* Check D3cold WAKE# support for I2C */
+	if (!REG_FIELD_GET(I2C_WAKE_ENABLE, xe->d3cold.wake))
+		return;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0), &val, NULL);
+	if (ret)
+		return;
+
+	root_pdev = pcie_find_root_port(pdev);
+	wakeup = root_pdev && device_may_wakeup(&root_pdev->dev);
+	if (wakeup)
+		val |= I2C_WAKE_ENABLE;
+	else
+		val &= ~I2C_WAKE_ENABLE;
+
+	ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), val);
+	if (ret)
+		return;
+
+	drm_dbg(&xe->drm, "d3cold: I2C WAKE# %s\n", str_enabled_disabled(wakeup));
+}
+
 void xe_i2c_pm_suspend(struct xe_device *xe)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
@@ -272,6 +307,9 @@ void xe_i2c_pm_suspend(struct xe_device *xe)
 	if (!xe_i2c_present(xe))
 		return;
 
+	if (xe->d3cold.allowed)
+		xe_i2c_d3cold_wake(xe);
+
 	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D3hot);
 	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
 }
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index bd32af0b5a23f..9f4b0d29c4e29 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -51,6 +51,11 @@
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
index 210298c4bcb15..93a19822983ce 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -7,6 +7,7 @@
 
 #include <linux/fault-inject.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeup.h>
 #include <linux/suspend.h>
 
 #include <drm/drm_managed.h>
@@ -22,6 +23,7 @@
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
+#include "xe_pcode_api.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
@@ -418,6 +420,35 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+static void xe_pm_d3cold_wake(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *root_pdev;
+	int err;
+
+	err = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0),
+			    &xe->d3cold.wake, NULL);
+	if (err || !xe->d3cold.wake) {
+		drm_dbg(&xe->drm, "d3cold: WAKE# not supported by device\n");
+		return;
+	}
+
+	root_pdev = pcie_find_root_port(pdev);
+	if (!root_pdev || !device_can_wakeup(&root_pdev->dev)) {
+		drm_dbg(&xe->drm, "d3cold: WAKE# not supported by host\n");
+		xe->d3cold.wake = 0;
+		goto out;
+	}
+
+	if (!xe_i2c_present(xe))
+		xe->d3cold.wake &= ~I2C_WAKE_ENABLE;
+
+	drm_dbg(&xe->drm, "d3cold: WAKE# configuration 0x%08x\n", xe->d3cold.wake);
+out:
+	xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), xe->d3cold.wake);
+}
+
 /**
  * xe_pm_init - Initialize Xe Power Management
  * @xe: xe device instance
@@ -455,6 +486,9 @@ int xe_pm_init(struct xe_device *xe)
 			goto err_unregister;
 	}
 
+	if (xe->info.platform == XE_CRESCENTISLAND)
+		xe_pm_d3cold_wake(xe);
+
 	xe_pm_runtime_init(xe);
 	return 0;
 

-- 
2.51.0

