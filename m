Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86193CD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E84710E851;
	Mon, 11 May 2026 16:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6pltfUf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9724510E839
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518578; x=1810054578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J0q4Pu/cB3VZFRvRmXcDN/hnzdm74R8WxfsjHEsyC3I=;
 b=k6pltfUfcvhww5vvBIT4GkBhAcztgId69wj7c/1TQtpK5/3PK4ER4t+Z
 fqdHYGze94FDx9CIeYDSq7XPsomUFJhOcv/DiAqZAEay/BohQ+NEEIu1g
 x1R4D1klqaL0QlEJyM8ezHCHKr+T3D5boe6wq0IDUSAPTCND2l2f9sP9p
 60Xv0T5Fm00SLyExdf7UaeEBUH67w5xCZ78GZ2Ja1kT6VLM0zBleyuzTz
 vS55hXG/txK6ZJdZidRQF9zOabqgMwSgoBrVw94PQ4WgGo5314Zhko7Oz
 hy9dufzihcp0Veu5iGiMyIQmtXfYzptSY7pihJ16sid6UWyIlEd0mD+hK w==;
X-CSE-ConnectionGUID: Y+J/SHfGTu6hwi16Cm9Sbg==
X-CSE-MsgGUID: 3oW9rms0TUCLYcbS55PF1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513548"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513548"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:18 -0700
X-CSE-ConnectionGUID: AfWS3Zc2TrGA4VUSeq5Kcw==
X-CSE-MsgGUID: RJcZwKStTdqn+cbArUlWUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988743"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:14 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v5 06/14] drm/xe/xe_ras: Initialize Uncorrectable AER Registers
Date: Mon, 11 May 2026 22:59:13 +0530
Message-ID: <20260511172908.1122252-22-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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

Uncorrectable errors from different endpoints in the device are steered to
the USP(Upstream Switch Port) which is a PCI Advanced Error Reporting (AER)
Compliant device. Downgrade all the errors to non-fatal to prevent PCIe
bus driver from triggering a Secondary Bus Reset (SBR). This allows error
detection, containment and recovery in the driver.

The Uncorrectable Error Severity Register has the 'Uncorrectable
Internal Error Severity' set to fatal by default. Set this to
non-fatal and unmask the error.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: clear stale uncorrectable internal status in status register
(Aravind)

v3: abbrevate TLA's (Raag)
    add a info message if USP does not support AER

v4: add a success log (Raag)
---
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_ras.c    | 78 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h    |  2 +-
 3 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4b45b617a039..200d6bbb1b70 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -62,6 +62,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_ras.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -1048,6 +1049,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_ras_init(xe);
+
 	err = xe_device_sysfs_init(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 4cb16b419b0c..24642c309967 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -91,3 +91,81 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 			comp_to_str(component), sev_to_str(severity));
 	}
 }
+
+#ifdef CONFIG_PCIEAER
+static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *vsp, *usp;
+	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
+	u16 aer_cap;
+
+	/*
+	 * Device Hierarchy:
+	 *
+	 * Upstream Switch Port (USP)--> Virtual Switch Port (VSP)--> SGunit (GPU endpoint)
+	 */
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
+	if (!aer_cap) {
+		dev_info(&usp->dev, "USP doesn't support AER capability\n");
+		return;
+	}
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
+	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
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
+	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
+		return;
+
+#ifdef CONFIG_PCIEAER
+	aer_unmask_and_downgrade_internal_error(xe);
+#endif
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index ea90593b62dc..a88ea0a46766 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -11,5 +11,5 @@ struct xe_sysctrl_event_response;
 
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
-
+void xe_ras_init(struct xe_device *xe);
 #endif
-- 
2.47.1

