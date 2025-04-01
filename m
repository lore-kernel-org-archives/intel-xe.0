Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12FAC36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 15:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CC110E5E6;
	Tue,  1 Apr 2025 15:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZkSQhRA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D5F10E5E6
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 15:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743521768; x=1775057768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Xc1RoVrx1nYSw+x5KzpjDT1p0v42K+S4ebdKYpd0w0=;
 b=OZkSQhRAKyaK+YBFYy2ESuKN2vB1pc1YoXOm1L9drVlDc9wqlU3hFv4n
 1CjdurgZQW3qw1wNnjbh0O1xRUx/F0gyflliVehBElez43PvhoxbF0qN+
 MZvsFsCkhsRA8ve2RdX/zz8UFstSUVdW0lIaWETjONdLa0sUCAL+3uo4W
 V/hkGOWybqnvom66TBLmdczEWuaC1AGJ+Ktqr2MfXtY980ydySBVRY6yD
 Xp51XWAz/ciCRtCznMLUiRqGK2a2r9SJpUUWyeeqttledbv8b53I73JZw
 UXk/X9nAQELtKauv4pSoqa7bn8HnzBaUVy1b6oSzwLMNqwmXEOHFi/ezL g==;
X-CSE-ConnectionGUID: uPAKl462S6Sabblwr2iovA==
X-CSE-MsgGUID: rhUcwTCKSA219vBlOnuhnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67324761"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="67324761"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:07 -0700
X-CSE-ConnectionGUID: moCALCC5RiOHEYJgni+WVQ==
X-CSE-MsgGUID: DuAmBsOQTwiknMu08LfaCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126410734"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:04 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH 01/12] PCI/ACPI: Add D3cold Aux Power Limit_DSM method
Date: Tue,  1 Apr 2025 21:02:14 +0530
Message-ID: <20250401153225.96379-2-anshuman.gupta@intel.com>
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

Implement _DSM method 10 and _DSM Method 11 as per PCI firmware specs
section 4.6.10 Rev 3.3.

Note that this implementation assumes only a single device below the
Downstream Port will request for Aux Power Limit under a given
Root Port because it does not track and aggregate requests
from all child devices below the Downstream Port as required
by Section 4.6.10 Rev 3.3.

One possible mitigation would be only allowing only first PCIe
Non-Bridge Endpoint Function 0 driver to call_DSM method 10.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/pci/pci-acpi.c   | 78 ++++++++++++++++++++++++++++++++++++++++
 include/linux/pci-acpi.h |  6 ++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index af370628e583..ebd49e43457e 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1421,6 +1421,84 @@ static void pci_acpi_optimize_delay(struct pci_dev *pdev,
 	ACPI_FREE(obj);
 }
 
+/**
+ * pci_acpi_request_d3cold_aux_power - Request D3cold aux power via ACPI DSM
+ * @dev: PCI device instance
+ * @requested_power: Requested auxiliary power in milliwatts
+ *
+ * This function sends a request to the host BIOS via ACPI _DSM Function 10
+ * to grant the required D3Cold Auxiliary power for the specified PCI device.
+ * It evaluates the _DSM (Device Specific Method) to request the Auxiliary
+ * power and handles the response accordingly.
+ *
+ * This function shall be only called by 1st non-bridge Endpoint driver
+ * on Function 0. For a Multi-Function Device, the driver for Function 0 is
+ * required to report an aggregate power requirement covering all
+ * functions contained within the device.
+ *
+ * Return: Returns 0 on success and errno on failure.
+ */
+int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
+{
+	union acpi_object in_obj = {
+		.integer.type = ACPI_TYPE_INTEGER,
+		.integer.value = requested_power,
+	};
+
+	union acpi_object *out_obj;
+	acpi_handle handle;
+	int result, ret = -EINVAL;
+
+	if (!dev || !ACPI_HANDLE(&dev->dev))
+		return -EINVAL;
+
+	handle = ACPI_HANDLE(&dev->dev);
+
+	out_obj = acpi_evaluate_dsm_typed(handle,
+					  &pci_acpi_dsm_guid,
+					  4,
+					  DSM_PCI_D3COLD_AUX_POWER_LIMIT,
+					  &in_obj,
+					  ACPI_TYPE_INTEGER);
+	if (!out_obj)
+		return -EINVAL;
+
+	result = out_obj->integer.value;
+
+	switch (result) {
+	case 0x0:
+		dev_dbg(&dev->dev, "D3cold Aux Power %umW request denied\n",
+			requested_power);
+		break;
+	case 0x1:
+		dev_info(&dev->dev, "D3cold Aux Power request granted: %umW\n",
+			 requested_power);
+		ret = 0;
+		break;
+	case 0x2:
+		dev_info(&dev->dev, "D3cold Aux Power: Main power won't be removed\n");
+		ret = -EBUSY;
+		break;
+	default:
+		if (result >= 0x11 && result <= 0x1F) {
+			int retry_interval = result & 0xF;
+
+			dev_warn(&dev->dev, "D3cold Aux Power request needs retry."
+				 "Interval: %d seconds.\n", retry_interval);
+			msleep(retry_interval * 1000);
+			ret = -EAGAIN;
+		} else {
+			dev_err(&dev->dev, "D3cold Aux Power: Reserved or "
+				"unsupported response: 0x%x.\n", result);
+		}
+		break;
+	}
+
+	ACPI_FREE(out_obj);
+	return ret;
+}
+EXPORT_SYMBOL(pci_acpi_request_d3cold_aux_power);
+
 static void pci_acpi_set_external_facing(struct pci_dev *dev)
 {
 	u8 val;
diff --git a/include/linux/pci-acpi.h b/include/linux/pci-acpi.h
index 078225b514d4..dbc4b0ed433c 100644
--- a/include/linux/pci-acpi.h
+++ b/include/linux/pci-acpi.h
@@ -121,6 +121,7 @@ extern const guid_t pci_acpi_dsm_guid;
 #define DSM_PCI_DEVICE_NAME			0x07
 #define DSM_PCI_POWER_ON_RESET_DELAY		0x08
 #define DSM_PCI_DEVICE_READINESS_DURATIONS	0x09
+#define DSM_PCI_D3COLD_AUX_POWER_LIMIT		0x0A
 
 #ifdef CONFIG_PCIE_EDR
 void pci_acpi_add_edr_notifier(struct pci_dev *pdev);
@@ -132,10 +133,15 @@ static inline void pci_acpi_remove_edr_notifier(struct pci_dev *pdev) { }
 
 int pci_acpi_set_companion_lookup_hook(struct acpi_device *(*func)(struct pci_dev *));
 void pci_acpi_clear_companion_lookup_hook(void);
+int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power);
 
 #else	/* CONFIG_ACPI */
 static inline void acpi_pci_add_bus(struct pci_bus *bus) { }
 static inline void acpi_pci_remove_bus(struct pci_bus *bus) { }
+int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
+{
+	return -EOPNOTSUPP;
+}
 #endif	/* CONFIG_ACPI */
 
 #endif	/* _PCI_ACPI_H_ */
-- 
2.43.0

