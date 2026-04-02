Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4912CCC6B00
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 06:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A4210F072;
	Thu,  2 Apr 2026 06:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+ZeIyWK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E072110F072
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775111394; x=1806647394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qab87RKLUEn46P52ub7/q2h9Jajp/WLf4rEZqO3t8aA=;
 b=i+ZeIyWKcFCLVu3V02wAz/pOWu0yBiXLSAKD+KJ0XUuaPqveOITp6Qyj
 5iknT+0rWmlKyk4VTWjFA4iUavN31Fx3Q6s/Vu8EbwD1aKVmAt4HPnWjo
 B6AaVQZsRPltBoZKFLMWAhzqzQiOJPT7vohcyCgGrs12NL1HqeNFFxq1W
 iSdiK12WQUNtZhk8FkS845Og5UXLO8Nve7rpL9CammlVviPMOUpcN5MO+
 eaCRFmLOTMQ2sre7KqQq3MAFCGeaznKCObvRACpULpSLcZ7zCZimtI93x
 8tAN6bcgwT3x017zvapq2uBw2G9+KefbQpGAK2c4m1FLT26qhLlL3qKP8 Q==;
X-CSE-ConnectionGUID: 3FSIS2YyT42d7ZvPVDbjFA==
X-CSE-MsgGUID: 8OJJVmZMRZ+kAxBvefz55A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76051493"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76051493"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:29:54 -0700
X-CSE-ConnectionGUID: 9+6Um4qtTZWYkE5YmfaRfw==
X-CSE-MsgGUID: nC0ZdAaUTgu84rIjhQ1lNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222532288"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:29:51 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 05/10] drm/xe/xe_ras: Initialize Uncorrectable AER Registers
Date: Thu,  2 Apr 2026 12:31:36 +0530
Message-ID: <20260402070131.1603828-17-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260402070131.1603828-12-riana.tauro@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Uncorrectable errors from different endpoints in the device are steered to
the USP which is a PCI Advanced Error Reporting (AER) Compliant device.
Downgrade all the errors to non-fatal to prevent PCIe bus driver
from triggering a Secondary Bus Reset (SBR). This allows error
detection, containment and recovery in the driver.

The Uncorrectable Error Severity Register has the 'Uncorrectable
Internal Error Severity' set to fatal by default. Set this to
non-fatal and unmask the error.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: clear stale uncorrectable internal status in status register
(Aravind)
---
 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_ras.c    | 78 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h    | 13 ++++++
 4 files changed, 95 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7f03f06df186..64b2a21239cb 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -112,6 +112,7 @@ xe-y += xe_bb.o \
 	xe_pxp_debugfs.o \
 	xe_pxp_submit.o \
 	xe_query.o \
+	xe_ras.o \
 	xe_range_fence.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d0b29d94edd2..32892a1a7377 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -60,6 +60,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_ras.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -1023,6 +1024,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
+	xe_ras_init(xe);
+
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
new file mode 100644
index 000000000000..bc7615c6c1be
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_device_types.h"
+#include "xe_ras.h"
+
+#ifdef CONFIG_PCIEAER
+static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *vsp, *usp;
+	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
+	u16 aer_cap;
+
+	 /* Gfx Device Hierarchy: USP-->VSP-->SGunit */
+	vsp = pci_upstream_bridge(pdev);
+	if (!vsp)
+		return;
+
+	usp = pci_upstream_bridge(vsp);
+	if (!usp)
+		return;
+
+	aer_cap = usp->aer_cap;
+
+	if (!aer_cap)
+		return;
+
+	/*
+	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
+	 * Status Register.
+	 */
+	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &aer_uncorr_status);
+	if (aer_uncorr_status & PCI_ERR_UNC_INTN)
+		pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, PCI_ERR_UNC_INTN);
+
+	/*
+	 * All errors are steered to USP which is a PCIe AER Compliant device.
+	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
+	 * from triggering a Secondary Bus Reset (SBR). This allows error
+	 * detection, containment and recovery in the driver.
+	 *
+	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
+	 * Internal Error Severity' set to fatal by default. Set this to
+	 * non-fatal and unmask the error.
+	 */
+
+	/* Initialize Uncorrectable Error Severity Register */
+	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
+	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
+	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
+
+	/* Initialize Uncorrectable Error Mask Register */
+	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
+	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
+	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
+
+	pci_save_state(usp);
+}
+#endif
+
+/**
+ * xe_ras_init - Initialize Xe RAS
+ * @xe: xe device instance
+ *
+ * Initialize Xe RAS
+ */
+void xe_ras_init(struct xe_device *xe)
+{
+	if (!xe->info.has_sysctrl)
+		return;
+
+#ifdef CONFIG_PCIEAER
+	aer_unmask_and_downgrade_internal_error(xe);
+#endif
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
new file mode 100644
index 000000000000..14cb973603e7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_H_
+#define _XE_RAS_H_
+
+struct xe_device;
+
+void xe_ras_init(struct xe_device *xe);
+
+#endif
-- 
2.47.1

