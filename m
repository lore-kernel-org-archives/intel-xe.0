Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02106C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 15:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA98910E083;
	Tue,  1 Apr 2025 15:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEfvo7qT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA7610E083
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743521783; x=1775057783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=46JUgl+6vaQPaPwaARcd8Y1Jg6gjnPnlcycQ5y7QLZQ=;
 b=PEfvo7qT3Tckv7SOJfcLAHGPCQn+vHPeMU0YEzvFiP6mKJEeiTblrd63
 kyb4RpJxYLs5jfMahbt7CQ2BysBkAczsrbfj39N6164HsGcHHkhM2fXkR
 HDdONUrxC9b4qz4jkD0+v/EghTgK26II7qWd1mR0iYCmof9yE27Xpp1hQ
 GFcg9Ja2j+VgYOwO1ci90aFw81MlXuXP8cLgHYx0GjxXO34Futc7qUD8V
 0xXgxil2uuOwl35j2lXlWRL8tou65ozk39Vlh9FKQqscgE4dBNw9zbA2A
 gi+soD/tlBgUBfi7cxA9Bh79KdK+qViUgOC15ba9schwqUcx5DC1tnI5H w==;
X-CSE-ConnectionGUID: 9dLKnfplSE+PGFrl5W2lwg==
X-CSE-MsgGUID: NTSQAw37SselLheWjN+3LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67324791"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="67324791"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:11 -0700
X-CSE-ConnectionGUID: etIrAIWtRnijZgdupovB6g==
X-CSE-MsgGUID: jjcCTox1SyWZWOgMsdAKdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126410769"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:08 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH 02/12] PCI/ACPI: Add PERST# Assertion Delay _DSM method
Date: Tue,  1 Apr 2025 21:02:15 +0530
Message-ID: <20250401153225.96379-3-anshuman.gupta@intel.com>
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

Implement _DSM Method 11 as per PCI firmware specs
section 4.6.11 Rev 3.3.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/pci/pci-acpi.c   | 53 ++++++++++++++++++++++++++++++++++++++++
 include/linux/pci-acpi.h |  7 ++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index ebd49e43457e..04149f037664 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1499,6 +1499,59 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
 }
 EXPORT_SYMBOL(pci_acpi_request_d3cold_aux_power);
 
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
+	if (!dev || !ACPI_HANDLE(&dev->dev))
+		return -EINVAL;
+
+	handle = ACPI_HANDLE(&dev->dev);
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
+		dev_info(&dev->dev, "PERST# Assertion Delay set to"
+			 "%u microseconds\n", delay_us);
+		ret = 0;
+	} else if (result == 0) {
+		dev_warn(&dev->dev, "PERST# Assertion Delay request failed,"
+			 "no previous valid request\n");
+	} else {
+		dev_warn(&dev->dev,
+			 "PERST# Assertion Delay request failed"
+			 "Previous valid delay: %u microseconds\n", result);
+	}
+
+	ACPI_FREE(out_obj);
+	return ret;
+}
+EXPORT_SYMBOL(pci_acpi_add_perst_assertion_delay);
+
 static void pci_acpi_set_external_facing(struct pci_dev *dev)
 {
 	u8 val;
diff --git a/include/linux/pci-acpi.h b/include/linux/pci-acpi.h
index dbc4b0ed433c..4b7373f91a9a 100644
--- a/include/linux/pci-acpi.h
+++ b/include/linux/pci-acpi.h
@@ -122,6 +122,7 @@ extern const guid_t pci_acpi_dsm_guid;
 #define DSM_PCI_POWER_ON_RESET_DELAY		0x08
 #define DSM_PCI_DEVICE_READINESS_DURATIONS	0x09
 #define DSM_PCI_D3COLD_AUX_POWER_LIMIT		0x0A
+#define DSM_PCI_PERST_ASSERTION_DELAY		0x0B
 
 #ifdef CONFIG_PCIE_EDR
 void pci_acpi_add_edr_notifier(struct pci_dev *pdev);
@@ -134,6 +135,7 @@ static inline void pci_acpi_remove_edr_notifier(struct pci_dev *pdev) { }
 int pci_acpi_set_companion_lookup_hook(struct acpi_device *(*func)(struct pci_dev *));
 void pci_acpi_clear_companion_lookup_hook(void);
 int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power);
+int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us);
 
 #else	/* CONFIG_ACPI */
 static inline void acpi_pci_add_bus(struct pci_bus *bus) { }
@@ -142,6 +144,11 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
 {
 	return -EOPNOTSUPP;
 }
+
+int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
+{
+	return -EOPNOTSUPP;
+}
 #endif	/* CONFIG_ACPI */
 
 #endif	/* _PCI_ACPI_H_ */
-- 
2.43.0

