Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A58D2F33E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 16:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CD110E513;
	Tue, 13 Jan 2026 16:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUQCrZH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291F810E513
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 16:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768321927; x=1799857927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JCDcpEwXSkcksxWw7gSXLwgP4YIv9jpvViSWIWG2LmI=;
 b=KUQCrZH6clES70NeqI8StNs3OXasuHt87126/Q3j+zCCg+Q5WB/PMp/R
 ArToxQcxhK/I0/Gk8azOcEoVRUTZNBKvdN3LclSXA14tHBgGPrMlrX+T6
 d6bf4avGOvL3vNzH1cd1Aww953DqyGbe6JmW2KhSIxlYw4NokpQzhu5o5
 KizXQK4t4h0f1g0CDPbxGPjlyZ2FYIJbmapCTTA4IoRsIlnZb0DPLqSuJ
 TXPJpAoJQlCVUJh4MGpiaq/PJ739F+kLnDPnhTg6oM8iQmIIDoNuTBgPz
 VEuQGxj6NIwGbHY1BIQ8pKrY6o7pjhIH/ry9lJnrQxxM2F/qUI6aWVCV6 A==;
X-CSE-ConnectionGUID: sIekI7xGT4usMf0qt1Z2Zw==
X-CSE-MsgGUID: IZcMo0YtTmOD2qdsYmtW3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69521003"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69521003"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:32:07 -0800
X-CSE-ConnectionGUID: 3Ffs4sxTSimV0n5rzGSdHg==
X-CSE-MsgGUID: 4ilgcgxiTGKA3TwUw4e0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204060116"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:32:02 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com, matthew.auld@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com
Subject: [PATCH v6 02/12] PCI/ACPI: Add PERST# Assertion Delay _DSM method
Date: Tue, 13 Jan 2026 22:12:03 +0530
Message-ID: <20260113164200.1151788-16-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113164200.1151788-14-badal.nilawar@intel.com>
References: <20260113164200.1151788-14-badal.nilawar@intel.com>
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

From: Anshuman Gupta <anshuman.gupta@intel.com>

Implement _DSM Method 0Bh as per PCI Firmware r3.3, sec 4.6.10, to request
fixed delay in timing between the time the PME_TO_Ack message is received
at the PCI Express Downstream Port that originated the PME_Turn_Off
message, and the time the platform asserts PERST# to the slot during the
corresponding Endpoint’s or PCI Express Upstream Port’s transition to
D3cold while the system is in an ACPI operational state.
Host platform supporting this feature ensures that device is observing
this delay in every applicable D3Cold transition.

Co-developed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
For VRSR feature with PERST# Assertion delay device will get enough time
to transition to auxiliary power before main power removal.
---
 drivers/pci/pci-acpi.c   | 60 ++++++++++++++++++++++++++++++++++++++++
 include/linux/pci-acpi.h |  9 +++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 645d3005ba50..73eaee20a270 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1554,6 +1554,66 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_mw,
 }
 EXPORT_SYMBOL_GPL(pci_acpi_request_d3cold_aux_power);
 
+/**
+ * pci_acpi_add_perst_assertion_delay - Request PERST# Delay via ACPI DSM
+ * @dev: PCI device instance
+ * @delay_us: Requested delay_us
+ *
+ * Request PERST# Assertion Delay to platform firmware, via Root Port/
+ * Switch Downstream Port ACPI _DSM Function 0Bh, for the specified
+ * PCI device.
+ * Evaluate the _DSM and handle the response accordingly.
+ *
+ * Return: returns 0 on success and errno on failure.
+ */
+int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
+{
+	union acpi_object in_obj = {
+		.integer.type = ACPI_TYPE_INTEGER,
+		.integer.value = delay_us,
+	};
+
+	union acpi_object *out_obj;
+	int result, ret = -EINVAL;
+	struct pci_dev *bdev;
+	acpi_handle handle;
+
+	if (!dev)
+		return -EINVAL;
+
+	for (bdev = dev; bdev; bdev = pci_upstream_bridge(bdev)) {
+		handle = ACPI_HANDLE(&bdev->dev);
+		if (handle &&
+		    acpi_check_dsm(handle, &pci_acpi_dsm_guid, 4,
+				   1 << DSM_PCI_PERST_ASSERTION_DELAY))
+			break;
+	}
+
+	if (!bdev)
+		return -ENODEV;
+
+	out_obj = acpi_evaluate_dsm_typed(ACPI_HANDLE(&bdev->dev),
+					  &pci_acpi_dsm_guid, 4,
+					  DSM_PCI_PERST_ASSERTION_DELAY,
+					  &in_obj, ACPI_TYPE_INTEGER);
+	if (!out_obj)
+		return -EINVAL;
+
+	result = out_obj->integer.value;
+	ACPI_FREE(out_obj);
+
+	if (result == delay_us) {
+		pci_info(dev, "PERST# Assertion Delay set to %u microseconds\n", delay_us);
+		ret = 0;
+	} else {
+		pci_info(dev, "PERST# Assertion Delay request failed, using %u microseconds\n",
+			 result);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pci_acpi_add_perst_assertion_delay);
+
 static void pci_acpi_set_external_facing(struct pci_dev *dev)
 {
 	u8 val;
diff --git a/include/linux/pci-acpi.h b/include/linux/pci-acpi.h
index ba48e7ddb360..4d8b8cea019e 100644
--- a/include/linux/pci-acpi.h
+++ b/include/linux/pci-acpi.h
@@ -122,6 +122,7 @@ extern const guid_t pci_acpi_dsm_guid;
 #define DSM_PCI_POWER_ON_RESET_DELAY		0x08
 #define DSM_PCI_DEVICE_READINESS_DURATIONS	0x09
 #define DSM_PCI_D3COLD_AUX_POWER_LIMIT		0x0A
+#define DSM_PCI_PERST_ASSERTION_DELAY		0x0B
 
 #ifdef CONFIG_PCIE_EDR
 void pci_acpi_add_edr_notifier(struct pci_dev *pdev);
@@ -135,7 +136,7 @@ int pci_acpi_set_companion_lookup_hook(struct acpi_device *(*func)(struct pci_de
 void pci_acpi_clear_companion_lookup_hook(void);
 int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_mw,
 				      u32 *retry_interval);
-
+int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us);
 #else	/* CONFIG_ACPI */
 static inline void acpi_pci_add_bus(struct pci_bus *bus) { }
 static inline void acpi_pci_remove_bus(struct pci_bus *bus) { }
@@ -145,6 +146,12 @@ static inline int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev,
 {
 	return -EOPNOTSUPP;
 }
+
+static inline int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev,
+						     u32 delay_us)
+{
+	return -EOPNOTSUPP;
+}
 #endif	/* CONFIG_ACPI */
 
 #endif	/* _PCI_ACPI_H_ */
-- 
2.52.0

