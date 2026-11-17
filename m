Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94880606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Btaoii+N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B8510E592;
	Tue, 17 Nov 2026 09:57:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2133010F5A3
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794909433; x=1826445433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1cQRhUSSMgE4Cqx52nkBcCIW/zjGkbBg9gPKahuWE7g=;
 b=Btaoii+N63zC8w/leaQ+bedUnM17ou5TPzLGMTsIN/zwwiDgNizExCSK
 olou9yEGuTlgFX4h9KLsLAPJzrD2V6wvCoq//VFo0wJMS0EMhPESQxYWZ
 dbfXu/c2v03sOoSWbnYa9lNP2X5BTPPKrucFxa2MWHhEo0ynVTPz8ytSo
 eyHVvxuJQAAqZ+fl45FKOSiGKM8iH0rlZ6vDsnv48RqvaCBWmnqGpfTg1
 RGODtmPRWGvnpJ668r3uBqbimdFPFr21DXBMg2xrD4ikMLNQa2rQkekez
 DN51EmxAMvd+GLi8cr+iMlww2Hx+FebSqNhhmmZZugQCj/wtyoEuFhfmO A==;
X-CSE-ConnectionGUID: JScPGvKyR5mF59lNZRlymg==
X-CSE-MsgGUID: +2eYK9vXSqmROJwRBYvAgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3565211"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3565211"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 01:57:12 -0800
X-CSE-ConnectionGUID: U+tck2XMQzmpFx9v0QhrPw==
X-CSE-MsgGUID: wDBHftCdTemVmL/3EdOzPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10326895"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 01:57:10 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH] drm/xe/ras: Add RAS config command to downgrade AER
 uncorrectable internal error
Date: Tue, 17 Nov 2026 15:27:00 +0530
Message-ID: <20261117095701.404369-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The driver downgrades the AER uncorrectable internal error severity of the
upstream switch port (USP) to non-fatal, so that errors can be handled
by the driver. This is done by writing the AER registers of the USP
directly, which is only allowed when the OS has native control of AER.

The OS does not have native control of AER when the platform uses firmware
first error handling or when native AER is disabled (pcie_ports=compat).
In these cases the driver cannot program the USP AER registers, so request
the firmware to downgrade the error instead.

The firmware provides a generic configuration command to get or set
firmware owned RAS configuration settings. Add support for this
configuration command and use it to request the firmware to downgrade the
severity when the OS does not have native control of AER.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---

Note: This change to remove the cxl namespace from pcie_aer_is_native
function is discussed in the following mailing list thread:
https://lore.kernel.org/all/avs1MPhrZtf7u_uB@wunner.de/
The cxl import will be removed once this change is merged.
Sending this for initial review.

---
 drivers/gpu/drm/xe/xe_ras.c                   | 65 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 58 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
 3 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..8055340d0096 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,7 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/aer.h>
 #include <linux/bitfield.h>
 
 #include <generated/xe_device_wa_oob.h>
@@ -508,17 +509,80 @@ static void get_offline_list(struct xe_device *xe)
 			      &response, sizeof(response), &response.common, false);
 }
 
+static inline const char *action_to_str(enum xe_ras_config_action action)
+{
+	return action == XE_RAS_CONFIG_ACTION_GET ? "get" : "set";
+}
+
+static int ras_config(struct xe_device *xe, enum xe_ras_config config,
+		      enum xe_ras_config_action action)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_config_response response = {0};
+	struct xe_ras_config_request request = {0};
+	size_t len;
+	int ret;
+
+	request.config = config;
+	request.action = action;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_RAS_CONFIG,
+				  &request, sizeof(request), &response, sizeof(response));
+
+	guard(xe_pm_runtime)(xe);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &len);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to %s config %u: %d\n", action_to_str(action), config,
+		       ret);
+		return ret;
+	}
+
+	if (len != sizeof(response)) {
+		xe_err(xe, "sysctrl: unexpected %s config response length %zu (expected %zu)\n",
+		       action_to_str(action), len, sizeof(response));
+		return -EIO;
+	}
+
+	ret = ras_status_to_errno(response.status);
+	if (ret) {
+		xe_err(xe, "sysctrl: %s config command failed with status %#x\n",
+		       action_to_str(action), response.status);
+		return ret;
+	}
+
+	if (response.size)
+		xe_dbg(xe, "[RAS]: %s config %u, data (%u bytes): %*ph\n",
+		       action_to_str(response.action), response.config, response.size,
+		       (int)min(response.size, sizeof(response.data)), response.data);
+
+	return 0;
+}
+
 static void ras_usp_aer_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	enum xe_ras_config config;
 	struct pci_dev *usp;
 	u16 aer_cap;
 	u32 status;
+	int ret;
 
 	usp = xe_pci_get_usp_dev(pdev);
 	if (!usp)
 		return;
 
+	if (!pcie_aer_is_native(usp)) {
+		config = XE_RAS_CONFIG_USP_AER_UNCOR_INTERNAL_NONFATAL;
+
+		ret = ras_config(xe, config, XE_RAS_CONFIG_ACTION_SET);
+		if (ret)
+			return;
+
+		/* Read the configuration */
+		ras_config(xe, config, XE_RAS_CONFIG_ACTION_GET);
+		return;
+	}
+
 	aer_cap = pci_find_ext_capability(usp, PCI_EXT_CAP_ID_ERR);
 	if (!aer_cap) {
 		dev_warn(&usp->dev, "AER capability unavailable\n");
@@ -553,6 +617,7 @@ static void ras_usp_aer_init(struct xe_device *xe)
 	pci_save_state(usp);
 	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
 }
+MODULE_IMPORT_NS("CXL");
 
 static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component)
 {
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 0ff5803d495b..b62a48446fb0 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -50,6 +50,30 @@ enum xe_ras_recovery_action {
 	XE_RAS_RECOVERY_ACTION_MAX
 };
 
+/**
+ * enum xe_ras_config_action - Action requested for a config
+ *
+ * @XE_RAS_CONFIG_ACTION_GET: Get the current state of the config
+ * @XE_RAS_CONFIG_ACTION_SET: Set the config
+ * @XE_RAS_CONFIG_ACTION_MAX: Max action value
+ */
+enum xe_ras_config_action {
+	XE_RAS_CONFIG_ACTION_GET = 0,
+	XE_RAS_CONFIG_ACTION_SET,
+	XE_RAS_CONFIG_ACTION_MAX
+};
+
+/**
+ * enum xe_ras_config - RAS configuration options
+ *
+ * @XE_RAS_CONFIG_USP_AER_UNCOR_INTERNAL_NONFATAL: Downgrade USP AER Uncorrectable Internal Error
+ * @XE_RAS_CONFIG_MAX: Max config value
+ */
+enum xe_ras_config {
+	XE_RAS_CONFIG_USP_AER_UNCOR_INTERNAL_NONFATAL = 0x01,
+	XE_RAS_CONFIG_MAX
+};
+
 /**
  * struct xe_ras_error_common - Error fields that are common across all products
  */
@@ -408,6 +432,40 @@ struct xe_ras_set_health_response {
 	u32 reserved1[2];
 } __packed;
 
+/**
+ * struct xe_ras_config_request - Request structure for RAS configuration
+ */
+struct xe_ras_config_request {
+	/** @config: Config id, see &enum xe_ras_config */
+	u16 config;
+	/** @action: Action to perform, see &enum xe_ras_config_action */
+	u8 action;
+	/** @reserved: Reserved for future use */
+	u8 reserved;
+	/** @size: Bytes valid in the payload */
+	u32 size;
+	/** @data: Payload */
+	u32 data[16];
+} __packed;
+
+/**
+ * struct xe_ras_config_response - Response structure for RAS configuration
+ */
+struct xe_ras_config_response {
+	/** @status: Status of config operation */
+	u32 status;
+	/** @config: Config id from request, see &enum xe_ras_config */
+	u16 config;
+	/** @action: Action that was performed, see &enum xe_ras_config_action */
+	u8 action;
+	/** @reserved: Reserved for future use */
+	u8 reserved;
+	/** @size: Bytes valid in the payload */
+	u32 size;
+	/** @data: Payload */
+	u32 data[16];
+} __packed;
+
 /* Device structures */
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index cdacceebca06..34ced248aa68 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -37,6 +37,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
+ * @XE_SYSCTRL_CMD_RAS_CONFIG: Get or set FW RAS configuration
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
@@ -50,6 +51,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
+	XE_SYSCTRL_CMD_RAS_CONFIG		= 0x0E,
 };
 
 /**
-- 
2.47.1

