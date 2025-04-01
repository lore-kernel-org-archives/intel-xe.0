Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC77C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 15:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4337A10E5F0;
	Tue,  1 Apr 2025 15:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFbUJr/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0019310E5F0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 15:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743521790; x=1775057790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kCllvlI4DYI75yLP60fxv5+/f++JIKQYyLBAVVlaYpI=;
 b=lFbUJr/ACCQ86gmfWYoLvcGLbofJcv2MrVYr7IbVsCJ5LzZajbTschFl
 Iqe2YNYdPh1glT3lBmrGR9OCxQVtiiPpsEeHg7VZZxzIyfzsiI/1TW9q9
 6DnQ/BF8xzjG2p0ba4BH1iieQZKTidLHEz3b3LzdeIDNtoxU5TWQRImiS
 ZQFOxjFuiv7CueBVCcYZ5SV3O0swPXrxpHPt32JEVP4RfQ2xpB7EprzOT
 8L4MA6/9hFmshrFgbIXFUEhd/Kxadibs5bzzKIlkqWsbF2CMIIN4sa/FG
 74cyNXAtp3IGWV1EjpNPKMyEyuehFdmVBhSG2OPmgKgwz/LyTzne7Mrco w==;
X-CSE-ConnectionGUID: tRsI989KSJqE8C2TS+kJaw==
X-CSE-MsgGUID: VrlwSTvDSKatJXhAEgpp7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67324893"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="67324893"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:27 -0700
X-CSE-ConnectionGUID: qfTGjufFT5+w3VlqQHGFeA==
X-CSE-MsgGUID: ds/5bU3WSIuanKJQEHZQfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126410922"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:23 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH 06/12] drm/xe/vrsr: Initialize VRSR feature
Date: Tue,  1 Apr 2025 21:02:19 +0530
Message-ID: <20250401153225.96379-7-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401153225.96379-1-anshuman.gupta@intel.com>
References: <20250401153225.96379-1-anshuman.gupta@intel.com>
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

From: Badal Nilawar <badal.nilawar@intel.com>

Initialize VRSR feature by requesting Auxilary Power and PERST# assertion
delay. Include an API to enable VRSR feature.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_pcode_api.h    |  8 +++
 drivers/gpu/drm/xe/xe_pm.c           | 92 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pm.h           |  1 +
 4 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 219800092b8d..fd9dea207580 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_TYPES_H_
 
 #include <linux/pci.h>
+#include <linux/pci-acpi.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index e622ae17f08d..cffdf52495f9 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -42,6 +42,14 @@
 #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
 #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
 
+#define	  PCODE_D3_VRAM_SELF_REFRESH	0x71
+#define	    PCODE_D3_VRSR_SC_DISABLE	0x0
+#define	    PCODE_D3_VRSR_SC_ENABLE	0x1
+#define     PCODE_D3_VRSR_SC_AUX_PL_AND_PERST_DELAY	0x2
+#define     PCODE_D3_VRSR_PERST_SHIFT	16
+#define	    POWER_D3_VRSR_PSERST_MASK	REG_GENMASK(31, 16)
+#define	    POWER_D3_VRSR_AUX_PL_MASK	REG_GENMASK(15, 0)
+
 #define   PCODE_FREQUENCY_CONFIG		0x6e
 /* Frequency Config Sub Commands (param1) */
 #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c96be409de49..abb5099475cb 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -23,6 +23,7 @@
 #include "xe_guc.h"
 #include "xe_irq.h"
 #include "xe_mmio.h"
+#include "xe_pcode_api.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "regs/xe_regs.h"
@@ -261,6 +262,95 @@ static bool xe_pm_vrsr_capable(struct xe_device *xe)
 	return val & VRAM_SR_SUPPORTED;
 }
 
+static int pci_acpi_aux_power_setup(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *root_pdev;
+	int ret;
+	u32 uval;
+	u32 aux_pwr_limit;
+	u32 perst_delay;
+
+	root_pdev = pcie_find_root_port(pdev);
+	if (!root_pdev)
+		return -EINVAL;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3_VRAM_SELF_REFRESH,
+			    PCODE_D3_VRSR_SC_AUX_PL_AND_PERST_DELAY, 0),
+			    &uval, NULL);
+
+	if (ret)
+		return ret;
+
+	aux_pwr_limit = REG_FIELD_GET(POWER_D3_VRSR_AUX_PL_MASK, uval);
+	perst_delay = REG_FIELD_GET(POWER_D3_VRSR_PSERST_MASK, uval);
+
+	drm_dbg(&xe->drm, "AUX power limit =%d\n", aux_pwr_limit);
+	drm_dbg(&xe->drm, "PERST Assertion delay =%d\n", perst_delay);
+
+	ret = pci_acpi_request_d3cold_aux_power(root_pdev, aux_pwr_limit);
+	if (ret)
+		return ret;
+
+	ret = pci_acpi_add_perst_assertion_delay(root_pdev, perst_delay);
+
+	return ret;
+}
+
+static void xe_pm_vrsr_init(struct xe_device *xe)
+{
+	int ret;
+
+	/* Check if platform support d3cold vrsr */
+	if (!xe->info.has_vrsr)
+		return;
+
+	if (!xe_pm_vrsr_capable(xe))
+		return;
+
+	/*
+	 * If the VRSR initialization fails, the device will proceed with the regular
+	 * D3 Cold flow
+	 */
+	ret = pci_acpi_aux_power_setup(xe);
+	if (ret) {
+		drm_info(&xe->drm, "VRSR capable %s\n", "No");
+		return;
+	}
+
+	xe->d3cold.vrsr_capable = true;
+	drm_info(&xe->drm, "VRSR capable %s\n", "Yes");
+}
+
+/**
+ * xe_pm_vrsr_enable - Enable VRAM self refresh
+ * @xe: The xe device.
+ * @enable: true: Enable, false: Disable
+ *
+ * This function enables the VRSR feature in D3Cold path.
+ *
+ * Return: It returns 0 on success and errno on failure.
+ */
+int xe_pm_vrsr_enable(struct xe_device *xe, bool enable)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	int ret;
+	u32 uval = 0;
+
+	if (!xe->d3cold.vrsr_capable)
+		return -ENXIO;
+
+	if (enable)
+		ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3_VRAM_SELF_REFRESH,
+				     PCODE_D3_VRSR_SC_ENABLE, 0), uval);
+	else
+		ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3_VRAM_SELF_REFRESH,
+				     PCODE_D3_VRSR_SC_DISABLE, 0), uval);
+
+	return ret;
+}
+
 static void xe_pm_runtime_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -336,7 +426,7 @@ int xe_pm_init(struct xe_device *xe)
 		if (err)
 			return err;
 
-		xe->d3cold.vrsr_capable = xe_pm_vrsr_capable(xe);
+		xe_pm_vrsr_init(xe);
 	}
 
 	xe_pm_runtime_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 998d1ed64556..2b5df31db4c4 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -35,4 +35,5 @@ bool xe_rpm_reclaim_safe(const struct xe_device *xe);
 struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
 int xe_pm_module_init(void);
 
+int xe_pm_vrsr_enable(struct xe_device *xe, bool enable);
 #endif
-- 
2.43.0

