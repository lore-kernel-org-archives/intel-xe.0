Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848B0C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 08:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486A510E773;
	Mon, 29 Jun 2026 08:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJizfi/3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F9010E776
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782721714; x=1814257714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R3rRPzPCk08VubYMDVMc+WjUMYOzDdHr77AdMWqTpRU=;
 b=TJizfi/3MABK9Ov2pHfw8WltQI7dbqECgOZ+GKwHY+OGHpRBzcyJmvjR
 0UqwebT0q4NaFgL4/YHrnfMkVQWKuW40T2mzE+wd4UcS02Awrv79gowlr
 aLYg8eskDKhBAWQ7wgWhDDYJJey6ApL7BPXtNNCpe0kbMQQrocm4QBOsv
 xCkw7uUGy6n3SBag+W+DQm+ep8QN85tik2cZP/HBRNDhUfySl4oCfVKCc
 bv2HctLBrN7/HkC3YsnqitOSJJAp5AaKD1PK/3jNVXNpwkDGT07dpY7ET
 OdRZWRi/kPaEZDAkIpQvG2zKF/5aZ1nTW0Dl2FPZ0/pBo+lEugmm91Txj A==;
X-CSE-ConnectionGUID: PHW+KxmFR4yHLKy73gLPqw==
X-CSE-MsgGUID: qxUQx1EXTK6gEA+my6P/yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="82398902"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="82398902"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 01:28:34 -0700
X-CSE-ConnectionGUID: uDQTvkqbR2yKgb/UFdeG6w==
X-CSE-MsgGUID: HIqi/zgCS2ywhBqUpPTKog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="281980320"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 01:28:32 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v9 4/4] drm/xe/xe_ras: Initialize Uncorrectable AER Registers
Date: Mon, 29 Jun 2026 13:58:06 +0530
Message-ID: <20260629082802.3690896-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260629082802.3690896-6-riana.tauro@intel.com>
References: <20260629082802.3690896-6-riana.tauro@intel.com>
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

v7: reorder functions (Mallesh)
    use pci_clear_and_set_config_dword
    rename function
    fix comment
---
 drivers/gpu/drm/xe/xe_ras.c | 70 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 44f4e1a3455b..74d5016d9ffe 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -131,6 +131,68 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
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
+static void ras_usp_aer_init(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *usp;
+	u16 aer_cap;
+	u32 status;
+
+	usp = find_usp_dev(pdev);
+	if (!usp)
+		return;
+
+	aer_cap = pci_find_ext_capability(usp, PCI_EXT_CAP_ID_ERR);
+	if (!aer_cap) {
+		dev_warn(&usp->dev, "AER capability unavailable\n");
+		return;
+	}
+
+	/*
+	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
+	 * Status Register.
+	 */
+	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &status);
+	if (status & PCI_ERR_UNC_INTN)
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
+	/* Downgrade Uncorrectable Internal Error to non-fatal */
+	pci_clear_and_set_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, PCI_ERR_UNC_INTN, 0);
+
+	/* Unmask Uncorrectable Internal Error */
+	pci_clear_and_set_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, PCI_ERR_UNC_INTN, 0);
+
+	pci_save_state(usp);
+	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -274,7 +336,7 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
  *
- * Register drm_ras nodes
+ * Initialize Xe RAS
  */
 void xe_ras_init(struct xe_device *xe)
 {
@@ -282,4 +344,10 @@ void xe_ras_init(struct xe_device *xe)
 		return;
 
 	xe_drm_ras_init(xe);
+
+	if (!xe->info.has_sysctrl)
+		return;
+
+	if (IS_ENABLED(CONFIG_PCIEAER))
+		ras_usp_aer_init(xe);
 }
-- 
2.47.1

