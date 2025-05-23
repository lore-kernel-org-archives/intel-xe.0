Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDCCC54EDA
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 19:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A89D10E0AE;
	Fri, 23 May 2025 18:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYIsIFW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D623410E0A4
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748026795; x=1779562795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sY0NnDSms1Xf1JCRlFpt0/e3+SFgBMlluoazWQTLkB0=;
 b=WYIsIFW5+WW7/BNT59Xa1F9zWk149JF2VB/YLFEb5xVuuJ7BtQWOpV9k
 YbGglCa461vd1++ft0wG6FI8SFHyDS5fBE3u4QQ/up3fFelF+J2wTJ7Q1
 3fXXyXOzT79jk0imsAJdkjmVO2S7mC/dbVFvocL25mraHYuIwyUjosScZ
 /6JzXNMbVgKZihYWIU376rDXwt39gPCezOS5BqzFzRhFRGGdbRkU2rA7J
 YtsF3CdX4ZrWC2FZvveGD5SHM+sLriUcUxM490AqLGwj2gGEC0Cr7sOgD
 eF4fnoi9HAC5TS0auiPZgIrie9cDruICKtmFpCxAPuwD7zyJsgNVxkoOZ Q==;
X-CSE-ConnectionGUID: txPqaE/dRTC3ZPurQggbdg==
X-CSE-MsgGUID: SjTvXySgQpS9JNpQsS/ilA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61498423"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="61498423"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:59:51 -0700
X-CSE-ConnectionGUID: 661m8WK6SrO5W5EEk1u8mQ==
X-CSE-MsgGUID: MfyNjCaOTParsSvDwLoenA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141758844"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 11:59:47 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH v3 01/11] PCI/ACPI: Add D3cold Aux Power Limit_DSM method
Date: Sat, 24 May 2025 00:31:45 +0530
Message-Id: <20250523190155.2623462-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523190155.2623462-1-badal.nilawar@intel.com>
References: <20250523190155.2623462-1-badal.nilawar@intel.com>
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

From: Anshuman Gupta <anshuman.gupta@intel.com>

Implement _DSM method 0Ah according to PCI firmware specifications,
section 4.6.10 Rev 3.3., to request auxilary power needed for the
device when in D3Cold.

Note that this implementation assumes only a single device below the
Downstream Port will request for Aux Power Limit under a given
Root Port because it does not track and aggregate requests
from all child devices below the Downstream Port as required
by Section 4.6.10 Rev 3.3.

One possible mitigation would be only allowing only first PCIe
Non-Bridge Endpoint Function 0 driver to call_DSM method 0Ah.

V2(Bjorn/Rafael):
  - Call acpi_dsm_check() to find method 0Ah supported
  - Return retry interval to caller

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/pci/pci-acpi.c   | 87 ++++++++++++++++++++++++++++++++++++++++
 include/linux/pci-acpi.h |  8 ++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index af370628e583..76b19525535f 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1421,6 +1421,93 @@ static void pci_acpi_optimize_delay(struct pci_dev *pdev,
 	ACPI_FREE(obj);
 }
 
+/**
+ * pci_acpi_request_d3cold_aux_power - Request aux power while device is in D3Cold
+ * @dev: PCI device instance
+ * @requested_power: Requested auxiliary power in milliwatts
+ * @retry_interval: Retry interval returned by platform to retry auxiliary
+ *                  power request
+ *
+ * This function sends a request to the host BIOS via root port ACPI _DSM Function 0Ah
+ * for the auxiliary power needed by the PCI device when it is in D3Cold.
+ * It checks and evaluates the _DSM (Device Specific Method) to request the auxiliary
+ * power and handles the response accordingly.
+ *
+ * This function shall be only called by 1st non-bridge Endpoint driver
+ * on Function 0. For a Multi-Function Device, the driver for Function 0 is
+ * required to report an aggregate power requirement covering all
+ * functions contained within the device.
+ *
+ * Return: Returns 0 on success and errno on failure.
+ */
+int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
+				      u32 *retry_interval)
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
+	if (!dev)
+		return -EINVAL;
+
+	handle = ACPI_HANDLE(&dev->dev);
+	if (!handle)
+		return -EINVAL;
+
+	if (!acpi_check_dsm(handle, &pci_acpi_dsm_guid, 4, 1 << DSM_PCI_D3COLD_AUX_POWER_LIMIT)) {
+		pci_dbg(dev, "ACPI _DSM 0%Xh not supported\n", DSM_PCI_D3COLD_AUX_POWER_LIMIT);
+		return -ENODEV;
+	}
+
+	out_obj = acpi_evaluate_dsm_typed(handle, &pci_acpi_dsm_guid, 4,
+					  DSM_PCI_D3COLD_AUX_POWER_LIMIT,
+					  &in_obj, ACPI_TYPE_INTEGER);
+	if (!out_obj)
+		return -EINVAL;
+
+	result = out_obj->integer.value;
+	if (retry_interval)
+		*retry_interval = 0;
+
+	switch (result) {
+	case 0x0:
+		pci_dbg(dev, "D3cold Aux Power %u mW request denied\n",
+			requested_power);
+		break;
+	case 0x1:
+		pci_info(dev, "D3cold Aux Power request granted: %u mW\n",
+			 requested_power);
+		ret = 0;
+		break;
+	case 0x2:
+		pci_info(dev, "D3cold Aux Power: Main power won't be removed\n");
+		ret = -EBUSY;
+		break;
+	default:
+		if (result >= 0x11 && result <= 0x1F) {
+			if (retry_interval) {
+				*retry_interval = result & 0xF;
+				pci_warn(dev, "D3cold Aux Power request needs retry interval: %u seconds\n",
+					 *retry_interval);
+				ret = -EAGAIN;
+			}
+		} else {
+			pci_err(dev, "D3cold Aux Power: Reserved or unsupported response: 0x%x\n",
+				result);
+		}
+		break;
+	}
+
+	ACPI_FREE(out_obj);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pci_acpi_request_d3cold_aux_power);
+
 static void pci_acpi_set_external_facing(struct pci_dev *dev)
 {
 	u8 val;
diff --git a/include/linux/pci-acpi.h b/include/linux/pci-acpi.h
index 078225b514d4..1705d03bfe26 100644
--- a/include/linux/pci-acpi.h
+++ b/include/linux/pci-acpi.h
@@ -121,6 +121,7 @@ extern const guid_t pci_acpi_dsm_guid;
 #define DSM_PCI_DEVICE_NAME			0x07
 #define DSM_PCI_POWER_ON_RESET_DELAY		0x08
 #define DSM_PCI_DEVICE_READINESS_DURATIONS	0x09
+#define DSM_PCI_D3COLD_AUX_POWER_LIMIT		0x0A
 
 #ifdef CONFIG_PCIE_EDR
 void pci_acpi_add_edr_notifier(struct pci_dev *pdev);
@@ -132,10 +133,17 @@ static inline void pci_acpi_remove_edr_notifier(struct pci_dev *pdev) { }
 
 int pci_acpi_set_companion_lookup_hook(struct acpi_device *(*func)(struct pci_dev *));
 void pci_acpi_clear_companion_lookup_hook(void);
+int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
+				      u32 *retry_interval);
 
 #else	/* CONFIG_ACPI */
 static inline void acpi_pci_add_bus(struct pci_bus *bus) { }
 static inline void acpi_pci_remove_bus(struct pci_bus *bus) { }
+static int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
+					     u32 *retry_interval)
+{
+	return -EOPNOTSUPP;
+}
 #endif	/* CONFIG_ACPI */
 
 #endif	/* _PCI_ACPI_H_ */
-- 
2.34.1

