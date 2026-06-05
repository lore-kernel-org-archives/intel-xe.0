Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A996CD6E74
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 09:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4B011A666;
	Fri,  5 Jun 2026 09:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmNu5ecM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6DB11A66E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780652132; x=1812188132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q0opX6nYnb0kx/gCMUZXzne0mIzR2yONiP6chkPiwrg=;
 b=NmNu5ecMsPyOm96e8ouE4njunmZgUgfyRUqzH/Y81drgQkrFMhrRSwrp
 8OV5pP4i/f6rEa/TFg9+ay6/BTa9cVGBQQ4IsIdPOCTqwDfSCLZ1LXzQG
 fjZUJK16iKxun5T0kiu4xCTPMEJyO3TT8boZD7sv2Bcgjda5Y9sKsm7h6
 09QxI/XBlPUlVs3B8hfS6PcRA59EHYUcB0G9tnDWpon7tJjgqPdQtciIW
 /iHiUz+DeS495Wq3/lfAvtcpHSYwLE0FYKiQzPLQVApk53OeGK179lm8W
 2oPEc6cE9wLnOZNlbjGLuSNPb9CNYKpoLsmgnPZAS3Q60IVzXAAul9W8s Q==;
X-CSE-ConnectionGUID: VOdzLl4bTEGnxYi7lHWvDg==
X-CSE-MsgGUID: ZYokNlPfT+iSpS8KCH7juA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98903949"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="98903949"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:32 -0700
X-CSE-ConnectionGUID: HsUPBQyaRGe6ydIjkvoQPA==
X-CSE-MsgGUID: w4MVVE2TTjWK3hT+u+moTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249133605"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:29 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v7 07/15] drm/xe/xe_ras: Initialize Uncorrectable AER Registers
Date: Fri,  5 Jun 2026 15:04:53 +0530
Message-ID: <20260605093446.4189929-24-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260605093446.4189929-17-riana.tauro@intel.com>
References: <20260605093446.4189929-17-riana.tauro@intel.com>
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
index 4cb16b419b0c..1dcf2f765aa7 100644
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
+	aer_cap = usp->aer_cap;
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

