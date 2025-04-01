Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4CAC36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 15:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DAA10E083;
	Tue,  1 Apr 2025 15:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mb3kY9yQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A2110E5ED
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743521795; x=1775057795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RGVfWksi97tOIwSsM8PfmoqSMtxWfhpbqylmDyrun3w=;
 b=Mb3kY9yQS5vo2ksl1ag6oIhQ0vUQxDHRzOhL+6b23DxPR7vn1ZoY1zc0
 GXh5Oq9DjGJe7rKO6r/Mgfc8N5hK46TI2/iGqqg8u72Fh5p2Zx7vcV9jm
 m63XQ7PE8eNOuOzdtfJHQoBsOatViUfkXLHATtZzDOkZwBlgrvbJcVkia
 KUjqCSYjwtCCS63LsoKZ99+nAG7NRCCWcF2XJfDmYhZoNk2JJ68BCg6Pt
 S8JzJmZWpW6PKo9ZBiOYLFFU12u+BpoHyQWxz5h9YcbKgIwkmLQ5v5nH5
 vCmo1cjZKKkdpkJEl2qxp6/Fd6fhiu/4S2lCgB27NnNRlYlaqmc/bDzV0 w==;
X-CSE-ConnectionGUID: rVkfMFQNQcCeHMSvk76yng==
X-CSE-MsgGUID: kLmqe9MNTPa0YzseLGX6Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67324933"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="67324933"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:35 -0700
X-CSE-ConnectionGUID: Adpi5qGPSbSthHKsEI0htw==
X-CSE-MsgGUID: RcDsk9/PTl2fNxN5ri5S9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126410967"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:31 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH 08/12] drm/xe: Add PCIe ACPI Aux Power notifier
Date: Tue,  1 Apr 2025 21:02:21 +0530
Message-ID: <20250401153225.96379-9-anshuman.gupta@intel.com>
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

Register PCIe ACPI notifier block and mark vrsr_capable
false in the notifier callback. This will ensure that
BMG GPU does not explode if any other PCIe child device
(under same Root Port) aux power request returns
with No main power removal.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_pm.c           | 41 ++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index fd9dea207580..9aacd5af7d0f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -517,6 +517,9 @@ struct xe_device {
 		struct mutex lock;
 	} d3cold;
 
+	/** @nb: PCI ACPI Aux power notifier */
+	struct notifier_block nb;
+
 	/** @pmt: Support the PMT driver callback interface */
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 364b937e0ded..ea93923d6671 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -87,6 +87,41 @@ static struct lockdep_map xe_pm_runtime_nod3cold_map = {
 };
 #endif
 
+static int aux_pwr_notifier(struct notifier_block *nb,
+			    unsigned long val, void *data)
+{
+	struct pci_dev *root_pdev = data;
+	struct pci_dev *pdev;
+	struct xe_device *xe;
+
+	xe = container_of(nb, struct xe_device, nb);
+
+	pdev = pcie_find_root_port(to_pci_dev(xe->drm.dev));
+	if (!pdev)
+		return -EINVAL;
+
+	if (root_pdev != pdev)
+		return 0;
+
+	xe_pm_runtime_get(xe);
+
+	if (val == ACPI_NO_MAIN_PW_REMOVAL) {
+		drm_err(&xe->drm, "PCIe core blocked the removal of Main Supply\n");
+		xe->d3cold.vrsr_capable = false;
+	}
+
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
+static void xe_pm_vrsr_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	pci_acpi_unregister_aux_power_notifier(&xe->nb);
+}
+
 /**
  * xe_rpm_reclaim_safe() - Whether runtime resume can be done from reclaim context
  * @xe: The xe device.
@@ -295,6 +330,12 @@ static int pci_acpi_aux_power_setup(struct xe_device *xe)
 		return ret;
 
 	ret = pci_acpi_add_perst_assertion_delay(root_pdev, perst_delay);
+	if (ret)
+		return ret;
+
+	xe->nb.notifier_call = aux_pwr_notifier;
+	pci_acpi_register_aux_power_notifier(&xe->nb);
+	devm_add_action_or_reset(xe->drm.dev, xe_pm_vrsr_fini, xe);
 
 	return ret;
 }
-- 
2.43.0

