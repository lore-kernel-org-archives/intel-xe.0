Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DEF606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SPkTXRVq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FFA10EA93;
	Mon, 26 Oct 2026 06:05:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CE210EA8C
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792994739; x=1824530739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P2BjF61XITn3RU1tG4uAL++4z9WhHh7AyvF6ShH3oN8=;
 b=SPkTXRVqtxEbwfiUv5VtYTGnI/U3pmfPO48peLpb6xrMVNKBhqtk0IaL
 h6pGVe2lIBvixle+eBpIs6Xn+2uhbDtZQfB48fhBoBUFGtbCz22lGjsHM
 FXYmhPFn0Z7jhEBhsKHDv12z+xVe8iUKJzaLx7VtrOWZy7hBatFb21QT2
 t+RSmdB3XQOoyl53YFD/vqjhIcNOtSMF4KKKqJ7HA2or8f5SawdVJhk3j
 0+QIz52kuykdpPjeqbsq2Ax6P0lcdJXpeftZcnaMv8kyS9jU4FDXekFKY
 S9ziAo6oeZ7/cFdgze0mKosnZ+cGvHJ8XNUtzxwDdx72vJbkvjP2hd/n6 Q==;
X-CSE-ConnectionGUID: kajDWrIVRGyzD3deXaN+Wg==
X-CSE-MsgGUID: YLR5x6vYSfeIM29Lb7/FpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1531045"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1531045"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:39 -0700
X-CSE-ConnectionGUID: MqWEQqy7Q/qFub3+9IK0QQ==
X-CSE-MsgGUID: Gz4IrJThR8G6D3weoWi4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4557343"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:36 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 7/9] drm/xe/xe_ras: Disable hw error worker when AER
 handling is in progress
Date: Mon, 26 Oct 2026 11:35:06 +0530
Message-ID: <20261026060459.771448-18-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261026060459.771448-11-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An uncorrectable internal AER error event is triggered for device fatal
errors. If non-fatal error processing is in progress, flush and disable
the worker to prevent further processing, as a reset is imminent.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c | 33 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.c       | 12 +++++++++++
 drivers/gpu/drm/xe/xe_ras.h       |  1 +
 drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
 4 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 9bf0da3a3d15..b27f8a0f1b17 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -5,14 +5,18 @@
 
 #include <linux/pci.h>
 
+#include <generated/xe_device_wa_oob.h>
+
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_hw_error.h"
 #include "xe_log.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_survivability_mode.h"
+#include "xe_wa.h"
 #include "xe_wedge.h"
 
 static void prepare_device_for_reset(struct pci_dev *pdev)
@@ -54,6 +58,26 @@ static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action
 	}
 }
 
+static bool is_aer_internal_error(struct pci_dev *pdev)
+{
+	struct pci_dev *usp;
+	u16 aer_cap;
+	u32 status;
+
+	usp = xe_pci_get_usp_dev(pdev);
+	if (!usp)
+		return false;
+
+	aer_cap = pci_find_ext_capability(usp, PCI_EXT_CAP_ID_ERR);
+	if (!aer_cap) {
+		dev_warn(&usp->dev, "AER capability unavailable\n");
+		return false;
+	}
+
+	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &status);
+	return status & PCI_ERR_UNC_INTN;
+}
+
 static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -67,6 +91,15 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
 		return PCI_ERS_RESULT_DISCONNECT;
 
+	/*
+	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
+	 * flush and disable the worker to prevent further processing, as a reset is imminent.
+	 */
+	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
+		xe_ras_set_aer_path(xe, true);
+		xe_hw_error_work_disable(xe);
+	}
+
 	switch (state) {
 	case pci_channel_io_normal:
 		return PCI_ERS_RESULT_CAN_RECOVER;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index a91c3d924e8c..42fb24366a6b 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1170,6 +1170,18 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
 	return xe->ras.state.max_pages;
 }
 
+/**
+ * xe_ras_set_aer_path - Set whether errors are processed via the AER path
+ * @xe: xe device instance
+ * @aer_path: true if errors are processed via the AER path, false if via irq
+ *
+ * Set if errors are processed via AER
+ */
+void xe_ras_set_aer_path(struct xe_device *xe, bool aer_path)
+{
+	xe->ras.state.aer_path = aer_path;
+}
+
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 1b358c7d040f..06518226db85 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -23,5 +23,6 @@ int xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
+void xe_ras_set_aer_path(struct xe_device *xe, bool aer_path);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index a86f9d2b8c92..558df12bcd9b 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -414,6 +414,8 @@ struct xe_ras_set_health_response {
  * struct xe_ras_state - RAS device and firmware state
  */
 struct xe_ras_state {
+	/** @aer_path: True if errors are processed via the AER path, false if via irq */
+	bool aer_path;
 	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
 	bool disable_vram_page_offline;
 	/** @max_pages: Total number of pages that can be stored by firmware */
-- 
2.47.1

