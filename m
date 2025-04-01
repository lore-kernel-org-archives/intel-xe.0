Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAE3C36018
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 15:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1196910E5EA;
	Tue,  1 Apr 2025 15:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DoKZafOE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E2910E083
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 15:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743521784; x=1775057784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AJWExx/lhsVKyDjZNNUh1i5V9rLOaQaDVOBlExnNiiI=;
 b=DoKZafOEeS0d6z1xrm02dM7yvs/jU4fFaG7auqFkUu4Ez69IWCS9oeT3
 tvDvOTyvyTwXflcoqaEXirctQUV0XxyMdUMSnMGQiFSwEowdAtlirzA6T
 lyZYxYO5x0+6BReDoSJNTqKKhswOG6EcSpSGiRF5Mnq5HxA/1OWnfpiZj
 04q4ec/1yjwgx3+tXpSum6tUCzvo6jlxDXExf8oETF/kwxry3Mh63WFBi
 3yC6JhF3NihRpxctFCgIG/zZ5kidZSU0VZtvIK8mi1MxBc8t07K3ERMBh
 25Nf56zSisT6w3IDGD55Z7MqAREuLwL8/J4hj302WAXRhMCaXbbGNUCnA w==;
X-CSE-ConnectionGUID: rhjJL2XKQW+k640AoimHFw==
X-CSE-MsgGUID: l7/X5DQEQpWE11Nf7LVXYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67324809"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="67324809"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:16 -0700
X-CSE-ConnectionGUID: RSa7Q1WpQxm3car1WNtayw==
X-CSE-MsgGUID: 0JLK/ni1TCyRpmHZEfJr6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126410797"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:12 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH 03/12] PCI/ACPI: Add aux power grant notifier
Date: Tue,  1 Apr 2025 21:02:16 +0530
Message-ID: <20250401153225.96379-4-anshuman.gupta@intel.com>
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

Adding a notifier to notify all PCIe child devices about the
block main power removal. It is needed because theoretically
multiple PCIe Endpoint devices on same Root Port
can request for AUX power and _DSM method can return with
80000000h signifies that the hierarchy connected via
the slot cannot support main power removal when in D3Cold.
This may disrupt functionality of other child device.

Let's notify all PCIe devices requested Aux power resource
and Let PCIe End Point driver handle it in its callback.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/pci/pci-acpi.c   | 34 +++++++++++++++++++++++++++++++---
 include/linux/pci-acpi.h | 13 +++++++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 04149f037664..d1ca1649e6e8 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1421,6 +1421,32 @@ static void pci_acpi_optimize_delay(struct pci_dev *pdev,
 	ACPI_FREE(obj);
 }
 
+static BLOCKING_NOTIFIER_HEAD(pci_acpi_aux_power_notify_list);
+
+/**
+ * pci_acpi_register_aux_power_notifier - Register driver notifier
+ * @nb: notifier block
+ *
+ * This function shall be called by PCIe End Point device requested the Aux
+ * power resource in order to handle the any scenario gracefully when other
+ * child PCIe devices Aux power request returns with No main power removal.
+ * PCIe devices which register this notifier shall handle No main power
+ * removal scenario accordingly.
+ *
+ * Return: Returns 0 on success and errno on failure.
+ */
+int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&pci_acpi_aux_power_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(pci_acpi_register_aux_power_notifier);
+
+void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb)
+{
+	blocking_notifier_chain_unregister(&pci_acpi_aux_power_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(pci_acpi_unregister_aux_power_notifier);
+
 /**
  * pci_acpi_request_d3cold_aux_power - Request D3cold aux power via ACPI DSM
  * @dev: PCI device instance
@@ -1466,17 +1492,19 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
 	result = out_obj->integer.value;
 
 	switch (result) {
-	case 0x0:
+	case ACPI_AUX_PW_DENIED:
 		dev_dbg(&dev->dev, "D3cold Aux Power %umW request denied\n",
 			requested_power);
 		break;
-	case 0x1:
+	case ACPI_AUX_PW_GRANTED:
 		dev_info(&dev->dev, "D3cold Aux Power request granted: %umW\n",
 			 requested_power);
 		ret = 0;
 		break;
-	case 0x2:
+	case ACPI_NO_MAIN_PW_REMOVAL:
 		dev_info(&dev->dev, "D3cold Aux Power: Main power won't be removed\n");
+		blocking_notifier_call_chain(&pci_acpi_aux_power_notify_list,
+					     ACPI_NO_MAIN_PW_REMOVAL, dev);
 		ret = -EBUSY;
 		break;
 	default:
diff --git a/include/linux/pci-acpi.h b/include/linux/pci-acpi.h
index 4b7373f91a9a..793b979af98b 100644
--- a/include/linux/pci-acpi.h
+++ b/include/linux/pci-acpi.h
@@ -124,6 +124,10 @@ extern const guid_t pci_acpi_dsm_guid;
 #define DSM_PCI_D3COLD_AUX_POWER_LIMIT		0x0A
 #define DSM_PCI_PERST_ASSERTION_DELAY		0x0B
 
+#define ACPI_AUX_PW_DENIED			0x0
+#define ACPI_AUX_PW_GRANTED			0x1
+#define ACPI_NO_MAIN_PW_REMOVAL			0x2
+
 #ifdef CONFIG_PCIE_EDR
 void pci_acpi_add_edr_notifier(struct pci_dev *pdev);
 void pci_acpi_remove_edr_notifier(struct pci_dev *pdev);
@@ -134,12 +138,21 @@ static inline void pci_acpi_remove_edr_notifier(struct pci_dev *pdev) { }
 
 int pci_acpi_set_companion_lookup_hook(struct acpi_device *(*func)(struct pci_dev *));
 void pci_acpi_clear_companion_lookup_hook(void);
+int pci_acpi_register_aux_power_notifier(struct notifier_block *nb);
+void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb);
 int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power);
 int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us);
 
 #else	/* CONFIG_ACPI */
 static inline void acpi_pci_add_bus(struct pci_bus *bus) { }
 static inline void acpi_pci_remove_bus(struct pci_bus *bus) { }
+int pci_acpi_register_aux_power_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
+void pci_acpi_unregister_aux_power_notifier(struct notifier_block *nb) { }
+
 int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
 {
 	return -EOPNOTSUPP;
-- 
2.43.0

