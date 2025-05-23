Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A44C54F47
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 19:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957FB10E851;
	Fri, 23 May 2025 19:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCIfNa/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9501C10E851
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748026799; x=1779562799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XZYMSdRM/CeVnis/V3tbQbWjyaGZsUwIMsXLqecNb9Q=;
 b=CCIfNa/QLmeyX6tmy/OCUUgwNHQPcd6bNARBrak+LLC+mqeneym0NF6D
 ibEB/PKjkUDZiZZfoDpPEkh1ZqSG7X+1dgFiYaUBINVCYZP14+FuWgXBS
 qngxabbYPbgXFwwgBa+Ndg+XBndIUbgKZHSfrbcTsQW7Vs0H3VLeyHMm2
 ug4iwNje/6Me//GiV3MGR2YXNr1ukfqrvNW3hpSfHkvvdZDnMDrU/nMLN
 fUO3uNgWJ2Cs3oK/2ARnXks7axInCBnHBoMUBSYNGl9jaCIctBp4Lo4e+
 kscKey5OqOYn0nZObX0o+x9xJWg2KnpGZpvCDkAFa0kHPv7fGRxEPCqE1 A==;
X-CSE-ConnectionGUID: 9ehu4O8aQ7ikkkHt4KG1rg==
X-CSE-MsgGUID: lq9co25eSmeQWVIPHG0SdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61498470"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="61498470"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:59:59 -0700
X-CSE-ConnectionGUID: UviwiJiBQH6hdYJ00UcQKA==
X-CSE-MsgGUID: QV17UTgbRRaIffwc524iIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141758894"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 11:59:55 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH v3 03/11] PCI/ACPI: Add PERST# Assertion Delay _DSM method
Date: Sat, 24 May 2025 00:31:47 +0530
Message-Id: <20250523190155.2623462-4-badal.nilawar@intel.com>
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

Implement _DSM Method 0Bh as per PCI firmware specs
section 4.6.11 Rev 3.3.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/pci/pci-acpi.c   | 57 ++++++++++++++++++++++++++++++++++++++++
 include/linux/pci-acpi.h |  8 +++++-
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 53ba67678c3d..678c48f72010 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1531,6 +1531,63 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 }
 EXPORT_SYMBOL_GPL(pci_acpi_request_d3cold_aux_power);
 
+/**
+ * pci_acpi_add_perst_assertion_delay - Request PERST# delay via ACPI DSM
+ * @dev: PCI device instance
+ * @delay_us: Requested delay_us
+ *
+ * This function sends a request to the host BIOS via ACPI _DSM to grant the
+ * required PERST# delay for the specified PCI device. It evaluates the _DSM
+ * to request the PERST# delay and handles the response accordingly.
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
+	if (!acpi_check_dsm(handle, &pci_acpi_dsm_guid, 4, 1 << DSM_PCI_PERST_ASSERTION_DELAY)) {
+		pci_dbg(dev, "ACPI _DSM 0%Xh not supported\n", DSM_PCI_PERST_ASSERTION_DELAY);
+		return -ENODEV;
+	}
+
+	out_obj = acpi_evaluate_dsm_typed(handle, &pci_acpi_dsm_guid, 4,
+					  DSM_PCI_PERST_ASSERTION_DELAY,
+					  &in_obj, ACPI_TYPE_INTEGER);
+	if (!out_obj)
+		return -EINVAL;
+
+	result = out_obj->integer.value;
+
+	if (result == delay_us) {
+		pci_info(dev, "PERST# Assertion Delay set to %u microseconds\n", delay_us);
+		ret = 0;
+	} else if (result == 0) {
+		pci_warn(dev, "PERST# Assertion Delay request failed, no previous valid request\n");
+	} else {
+		pci_warn(dev, "PERST# Assertion Delay request failed, Previous valid delay: %u microseconds\n",
+			 result);
+	}
+
+	ACPI_FREE(out_obj);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pci_acpi_add_perst_assertion_delay);
+
 static void pci_acpi_set_external_facing(struct pci_dev *dev)
 {
 	u8 val;
diff --git a/include/linux/pci-acpi.h b/include/linux/pci-acpi.h
index 1705d03bfe26..889e469206e2 100644
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
 int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 				      u32 *retry_interval);
-
+int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us);
 #else	/* CONFIG_ACPI */
 static inline void acpi_pci_add_bus(struct pci_bus *bus) { }
 static inline void acpi_pci_remove_bus(struct pci_bus *bus) { }
@@ -144,6 +145,11 @@ static int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_
 {
 	return -EOPNOTSUPP;
 }
+
+static int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
+{
+	return -EOPNOTSUPP;
+}
 #endif	/* CONFIG_ACPI */
 
 #endif	/* _PCI_ACPI_H_ */
-- 
2.34.1

