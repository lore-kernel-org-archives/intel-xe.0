Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAD7606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQuesx8M
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7ECA10F520;
	Fri,  6 Nov 2026 07:20:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E972810E961
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793949625; x=1825485625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ZlqHrwrfUB8locKROOk2PaMVaaLz4kL97Vr875+wus=;
 b=lQuesx8MkVAyaLM2ArEYpA+zcXLTUST6bju9U9/q1zdqpi/7+9eyTNQz
 c1N/lEyHIZfueZR/JzSkHTf9Kyy1VpnHeA3fIuWrmotUmaR1IRyPEz+66
 l2lkg1XjD5cbz0U/vcFhkhBMp0b1J8sI4CKRgipx2pqlTGrIrXVuVmdm2
 tZd3bZokcii/Q6AOOx+qCAOWOrU+LSh4vuFoGXAn3vzGUxchCYrzyv986
 CchebSJ3IKzZ8iSKB34L3mS5vBg1q1sfC9XJZo4pwIdWU98A0wZiLo0Pn
 /aQmr44S3qTw85FV1AdwAVC60lmMg97/ZbtVsmpeD43fs/WVFdYx6lsVc A==;
X-CSE-ConnectionGUID: /KRTiMX9QVKqSpCpWdDWXw==
X-CSE-MsgGUID: lNL3T5NlQYix9O89ZDPjMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2659354"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2659354"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:24 -0800
X-CSE-ConnectionGUID: rHb2Vtp5Ry60g8nH7edacw==
X-CSE-MsgGUID: qvUAwgTaT1WvS0Eo3jaPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7549105"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:22 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com
Subject: [PATCH v4 6/8] drm/xe/xe_ras: Add a flag for uncorrectable internal
 error
Date: Fri,  6 Nov 2026 12:49:51 +0530
Message-ID: <20261106071944.2693854-16-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261106071944.2693854-10-riana.tauro@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
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
index 03a9f295d077..472b85d0ccc3 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -55,6 +55,29 @@ static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action
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
@@ -68,6 +91,9 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
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

