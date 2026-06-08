Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318D6CD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC3D10EF79;
	Mon,  8 Jun 2026 08:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+nPPWE1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB51710EF79
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908462; x=1812444462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vc62ONRBX7QS5l4Fjk9JKzroxtb2BykUbTUXeMJNTDw=;
 b=U+nPPWE1AMopUB9TZwfe9/FnqLL20zOeITBJEjxaqnCYHht8ccrUZ0zm
 BuSsND3ciM1RhuzHT+tRZc6Lg0atVJCTjBByUkcuYtBVKHWy1skN5Qn0l
 oTlODuGdTdR4Jq+Xk+Iuo0vErMlghLOvh5mNGAtOVG9IsiUiGOCyk3zBf
 X0ps3lBsruYGr3XZEb65HnASQ7nX1ccgOtbxE4PMNwnoTz691nk7o2Ihl
 rM3NZnxzUfgKowIiH2G3MXrvVSxKi583CQxUZE4FwCxa1Q/vaIktdkxWs
 FpUXLBRGzgLYJm48oLe2VsLyc+HiuQgOMJSpRhly3WJsy0ywkwYUBzv9r w==;
X-CSE-ConnectionGUID: DHTa9/crQm69eUWtXdyN4Q==
X-CSE-MsgGUID: wpgbN/7FQ3WUN+AOUfozkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029087"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029087"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:42 -0700
X-CSE-ConnectionGUID: hN7v0sI+QZ6OXmkLj1SLpA==
X-CSE-MsgGUID: ZVAWUczcQwy9/5jXfP2hmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466099"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:39 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v8 07/15] drm/xe/xe_ras: Initialize Uncorrectable AER Registers
Date: Mon,  8 Jun 2026 14:17:08 +0530
Message-ID: <20260608084700.640376-24-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260608084700.640376-17-riana.tauro@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: clear stale uncorrectable internal status in status register
(Aravind)

v3: abbrevate TLA's (Raag)
    add a info message if USP does not support AER

v4: add a success log (Raag)

v5: add extra newline
    use IS_ENABLED check
    remove VF check (Michal)
    add function to get usp

v6: fix kunit error
---
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_ras.c    | 81 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h    |  1 +
 3 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7154f356d631..ac3d6ae56fb9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -61,6 +61,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_ras.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -1074,6 +1075,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_ras_init(xe);
+
 	err = xe_device_sysfs_init(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 4cb16b419b0c..c846e98ec6ab 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -91,3 +91,84 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 			comp_to_str(component), sev_to_str(severity));
 	}
 }
+
+static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
+{
+	struct pci_dev *vsp;
+
+	/*
+	 * Device Hierarchy:
+	 *
+	 * Upstream Switch Port (USP) --> Virtual Switch Port (VSP) --> SGunit (GPU endpoint)
+	 */
+	vsp = pci_upstream_bridge(pdev);
+	if (!vsp)
+		return NULL;
+
+	return pci_upstream_bridge(vsp);
+}
+
+static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
+	struct pci_dev *usp;
+	u16 aer_cap;
+
+	usp = find_usp_dev(pdev);
+	if (!usp)
+		return;
+
+	aer_cap = pci_find_ext_capability(usp, PCI_EXT_CAP_ID_ERR);
+	if (!aer_cap) {
+		dev_info(&usp->dev, "AER capability unavailable\n");
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
+	if (IS_ENABLED(CONFIG_PCIEAER))
+		aer_unmask_and_downgrade_internal_error(xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index ea90593b62dc..8acfd0ffe48e 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -11,5 +11,6 @@ struct xe_sysctrl_event_response;
 
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
+void xe_ras_init(struct xe_device *xe);
 
 #endif
-- 
2.47.1

