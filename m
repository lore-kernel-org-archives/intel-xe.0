Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC16606A32C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g0i5lDRo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D02A10F377;
	Tue,  3 Nov 2026 06:10:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6C610F377
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793686201; x=1825222201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OQcaIN7NOZqjVhHs1Iywalsf7K89Sy6Uw17/2pE/9lY=;
 b=g0i5lDRoG4GJgDRF0EQ24d4Yq6Ni9OnvLMxABNd7H5OVuoeLPnyylhd4
 w8OEfvREON8EhO1DJuM8kQvxPfTzREDJqNkR+idyIjglKQh0rkt9VXTew
 FPYggFD+SRyMMR1f2W0+fyf0Evaj1Eu4My5IcDrDpxrIRprbRaTofwGZV
 NGTjhMqA1b+EB/D+inxV6lCioJrKO6EbhlMbY4x8IoUmtf580NDph0Q6y
 qXmOO0w+knHLDvp5dAE0AhY6ly8VyGvcVFsTAySYVvifZ49Bs/p49DT4Y
 leahLtQwVI+imuhpw44iryF+rys5yeHobzrSgLfCrCBnZqDgjlVSqFWvI A==;
X-CSE-ConnectionGUID: vDYN2d8pRbe1wPgUP+YH7w==
X-CSE-MsgGUID: SN8K4s9OTRGwPMkyi2wwzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2276720"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2276720"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:10:01 -0800
X-CSE-ConnectionGUID: HXq2z4ofQUy2lqzD8ElP2Q==
X-CSE-MsgGUID: JB2zGkAWS22eHS0xQFRmQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6446368"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:58 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v3 5/7] drm/xe/xe_ras: Add a flag for uncorrectable internal
 error
Date: Tue,  3 Nov 2026 11:39:35 +0530
Message-ID: <20261103060929.1586783-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261103060929.1586783-9-riana.tauro@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce a flag with get/set accessors to record when an
uncorrectable internal error was reported via AER.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add PCI_POSSIBLE_ERROR
    fix kernel-doc
    rename aer_path to internal error
---
 drivers/gpu/drm/xe/xe_pci_error.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h       |  2 ++
 drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
 4 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 9bf0da3a3d15..4ade392b47be 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -54,6 +54,29 @@ static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action
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
+		dev_warn_once(&usp->dev, "AER capability unavailable\n");
+		return false;
+	}
+
+	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &status);
+	if (PCI_POSSIBLE_ERROR(status))
+		return false;
+
+	return status & PCI_ERR_UNC_INTN;
+}
+
 static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -67,6 +90,9 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
 		return PCI_ERS_RESULT_DISCONNECT;
 
+	if (is_aer_internal_error(pdev))
+		xe_ras_set_aer_internal_error(xe);
+
 	switch (state) {
 	case pci_channel_io_normal:
 		return PCI_ERS_RESULT_CAN_RECOVER;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 3aea4969af13..58a0b5fa676d 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1253,6 +1253,26 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
 	return xe->ras.state.max_pages;
 }
 
+/**
+ * xe_ras_is_aer_internal_error() - Check if an uncorrectable internal error was reported via AER
+ * @xe: xe device instance
+ *
+ * Return: true if an uncorrectable internal error was reported via AER, false otherwise.
+ */
+bool xe_ras_is_aer_internal_error(struct xe_device *xe)
+{
+	return xe->ras.state.aer_internal_error;
+}
+
+/**
+ * xe_ras_set_aer_internal_error() - Set if an uncorrectable internal error is reported via AER
+ * @xe: xe device instance
+ */
+void xe_ras_set_aer_internal_error(struct xe_device *xe)
+{
+	xe->ras.state.aer_internal_error = true;
+}
+
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index c44fa172011f..f7b587ac84e3 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -25,5 +25,7 @@ bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
 int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
 				struct xe_ras_get_counter_response *response);
+bool xe_ras_is_aer_internal_error(struct xe_device *xe);
+void xe_ras_set_aer_internal_error(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index a86f9d2b8c92..0ff5803d495b 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -414,6 +414,8 @@ struct xe_ras_set_health_response {
  * struct xe_ras_state - RAS device and firmware state
  */
 struct xe_ras_state {
+	/** @aer_internal_error: true if an uncorrectable internal error was reported via AER */
+	bool aer_internal_error;
 	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
 	bool disable_vram_page_offline;
 	/** @max_pages: Total number of pages that can be stored by firmware */
-- 
2.47.1

