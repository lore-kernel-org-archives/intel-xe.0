Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED41ECCD1A5
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 10:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78DF10E8FF;
	Fri, 24 Oct 2025 10:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEoTeZv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2EA10E8FF
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 10:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761301419; x=1792837419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T4iKMq1IxBpfUP+p0fEpIAx8MZqQgv4SHqujzt1BvlY=;
 b=ZEoTeZv2lKgz4bz8XXL/7MQVCeWfRHJVmeZ8K2EG4JYjpLwRS5b+gVrR
 6d4fLdzzxeLQjr3uq6Qze4MpWGsfLn+jVwPy0M/PF8rkVcSJV5vw8t44w
 J5N1RRJZeL6dmIQ6I0IzGbk6Eep84LnEvuS5uMtV5Hl4O2RpnoCP5TPl4
 aoOYkidl8I4F71eECPPPzkRROC1o6fnL9xL/v2u/bCidOiLYAUX41Obc6
 lljdHrQaB99+Mpg+9EuLQINrH/zzuuqtKIpHpwojCpwlDPuyvTMVwakx5
 Bh3Dt9Kqabgc30Yn0KX20i+ZilErrva6a9Ki5jSBhKvA1F5RhjvcKHqLe A==;
X-CSE-ConnectionGUID: j2GrgDkXSay275QXlRWvoA==
X-CSE-MsgGUID: naYOY+INSPahvoqVkuJEvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63387691"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="63387691"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 03:23:39 -0700
X-CSE-ConnectionGUID: nmTY54WpTMCAsfq3Eo+BjQ==
X-CSE-MsgGUID: 3OvRfVcIRJ+hxXC5b/0xlw==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2025 03:23:36 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/pm: Enable WAKE# support
Date: Fri, 24 Oct 2025 15:51:48 +0530
Message-Id: <20251024102148.3641819-1-raag.jadav@intel.com>
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

CRI supports signalling the host through WAKE# pin on smbus alerts while
in D3cold. Enable/disable this feature based on device/host configuration.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++
 drivers/gpu/drm/xe/xe_pci.c          |  4 ++
 drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++
 drivers/gpu/drm/xe/xe_pm.c           | 72 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h           |  1 +
 5 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f62ee7a73ac..dae2bd06bcea 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -517,6 +517,10 @@ struct xe_device {
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
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6e59642e7820..edf63f55f345 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1105,6 +1105,8 @@ static int xe_pci_suspend(struct device *dev)
 	if (err)
 		return err;
 
+	xe_pm_set_wake(xe, true);
+
 	/*
 	 * Enabling D3Cold is needed for S2Idle/S0ix.
 	 * It is save to allow here since xe_pm_suspend has evicted
@@ -1156,6 +1158,8 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	if (err)
 		return err;
 
+	xe_pm_set_wake(xe, xe->d3cold.allowed);
+
 	pci_save_state(pdev);
 
 	if (xe->d3cold.allowed) {
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
index 53507e09f7bc..30e4a787b9cb 100644
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
@@ -422,6 +425,74 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+void xe_pm_set_wake(struct xe_device *xe, bool d3cold)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *root_pdev;
+	bool wakeup;
+	u32 val = 0;
+	int ret;
+
+	/* WAKE# is not needed, let PME do the job. */
+	if (!d3cold)
+		return;
+
+	/* Currently WAKE# is supported for I2C only */
+	if (!REG_FIELD_GET(I2C_WAKE_ENABLE, xe->d3cold.wake))
+		return;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0), &val, NULL);
+	if (ret)
+		return;
+
+	root_pdev = pcie_find_root_port(pdev);
+	wakeup = root_pdev && device_may_wakeup(&root_pdev->dev);
+
+	if (wakeup)
+		val |= I2C_WAKE_ENABLE;
+	else
+		val &= ~I2C_WAKE_ENABLE;
+
+	ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), val);
+	if (ret)
+		return;
+
+	drm_dbg(&xe->drm, "WAKE# %s\n", str_enabled_disabled(wakeup));
+}
+
+static void xe_pm_wake_init(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *root_pdev;
+	int err;
+
+	if (xe->info.platform != XE_CRESCENTISLAND)
+		return;
+
+	err = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0),
+			    &xe->d3cold.wake, NULL);
+	if (err || !xe->d3cold.wake) {
+		drm_dbg(&xe->drm, "WAKE# not supported by device\n");
+		return;
+	}
+
+	root_pdev = pcie_find_root_port(pdev);
+	if (!root_pdev || !device_can_wakeup(&root_pdev->dev)) {
+		drm_dbg(&xe->drm, "WAKE# not supported by host\n");
+		xe->d3cold.wake = 0;
+		goto out;
+	}
+
+	if (!xe_i2c_present(xe))
+		xe->d3cold.wake &= ~I2C_WAKE_ENABLE;
+
+	drm_dbg(&xe->drm, "WAKE# configuration 0x%08x\n", xe->d3cold.wake);
+out:
+	xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), xe->d3cold.wake);
+}
+
 /**
  * xe_pm_init - Initialize Xe Power Management
  * @xe: xe device instance
@@ -459,6 +530,7 @@ int xe_pm_init(struct xe_device *xe)
 			goto err_unregister;
 	}
 
+	xe_pm_wake_init(xe);
 	xe_pm_runtime_init(xe);
 	return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index f7f89a18b6fc..9cedba8a7f80 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -30,6 +30,7 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
+void xe_pm_set_wake(struct xe_device *xe, bool d3cold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
 bool xe_rpm_reclaim_safe(const struct xe_device *xe);
 struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
-- 
2.34.1

