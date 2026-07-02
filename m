Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157F3C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 13:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E4F10E4D6;
	Thu,  2 Jul 2026 13:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cco59cZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F1E10E4D6
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782999138; x=1814535138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+350KlAJw7oU9VWXKiSCs/BhUdUZcRnvVAgk9gtyOpo=;
 b=Cco59cZv/AF3t0CgE+brVqimg6TSTJhtI/xdSDxC37REIrsUM1Ddg+JK
 mOk/MOaCd6Y+u93+HWC1QE90ClTXkQTn+VJ87QKVvlI9dkE8rLEcS3Mx1
 yR/6gmmDHFnH9Ou+zpnz+z/x2orVuyPT/BDCbpyQo8/UJuFGJ2acjrKEf
 IbtlWeFAeMXrURB/dLA9jzCQzPEdo3MUvar5HFAGiYPapZ8tcCvlq9Mne
 SgmgnOV89HnZ6bZzg56aCWV99y03Mkdo/b7lDeZQYujKcKtvgB4o3p73B
 8q+c5VNb2fyPaX+gjLKrmk9y8GVwiJLVaSO5teCoKnL8OOXdfTk7DjrgI w==;
X-CSE-ConnectionGUID: 1ECUrkXwQ1m98JUvMFebsQ==
X-CSE-MsgGUID: 0RnDNEnJSnKxOdwey+X8Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94353070"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="94353070"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 06:32:17 -0700
X-CSE-ConnectionGUID: b0wAxRQDS1WHiSbx113A/g==
X-CSE-MsgGUID: F2vFtYxzQlupb8/6M5ay7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="253023157"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 06:32:13 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v3] drm/xe/sysctrl: Add helper to query application status
Date: Thu,  2 Jul 2026 06:32:01 -0700
Message-ID: <20260702133201.2164749-2-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add xe_sysctrl_check_app_status() to query the state of a System
Controller application through get_app_status_by_id mailbox
command.

The helper maps xe_sysctrl_app_id values to firmware application
IDs and returns reported firmware state. Add convenience
wrappers to check OOBMSM and Diagnostics application readiness.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v3: (Riana, Badal)
- Replace string-based app identifiers with enum xe_sysctrl_app_id
- Use get_app_status_by_id (opcode 0x05)
- Move mailbox definitions to xe_sysctrl_mailbox_types.h
- Return enum xe_sysctrl_fw_status consistently
- Map communication failures to COMM_FAILURE
- Add INITIALIZED state and status helpers
- Fix Diagnostics typo

v2: (Badal)
- Return SysCtrl firmware application states instead of errno for application lifecycle conditions
---
 drivers/gpu/drm/xe/xe_pci.c                   |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c               | 107 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |   5 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  67 +++++++++++
 4 files changed, 180 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 15020df6937a..fa4862820c8b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -462,6 +462,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
 	.has_i2c = true,
+	.has_late_bind = true,
 	.has_mbx_power_limits = true,
 	.has_mbx_thermal_info = true,
 	.has_mert = true,
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 1db20be8158b..2c43217bc216 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -3,6 +3,7 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
 
@@ -13,9 +14,11 @@
 #include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
+#include "xe_printk.h"
 #include "xe_soc_remapper.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
 #include "xe_sysctrl_types.h"
 
 /**
@@ -130,3 +133,107 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
 
 	xe_sysctrl_mailbox_init(sc);
 }
+
+/**
+ * xe_sysctrl_check_app_status() - Query lifecycle state of a System Controller application
+ * @xe: xe device instance
+ * @app_id: application identifier (see enum xe_sysctrl_app_id)
+ *
+ * Query System Controller firmware to determine lifecycle state of specified
+ * application. Uses get_app_status_by_id command (Core group 0xFF, opcode 0x05)
+ * which provides explicit validity, boot, and initialization status.
+ *
+ * This is typically called before issuing commands to application-specific
+ * command groups to verify the application is ready to handle requests.
+ *
+ * Return: %XE_SYSCTRL_FIRMWARE_APP_INITIALIZED if the application is fully
+ * operational, %XE_SYSCTRL_FIRMWARE_APP_NOTSUPP if System Controller is not
+ * present on this platform, or another %XE_SYSCTRL_FIRMWARE_* value describing
+ * current application lifecycle state or a communication error.
+ */
+enum xe_sysctrl_fw_status
+xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
+{
+	struct xe_sysctrl_get_app_status_by_id_req req = {};
+	struct xe_sysctrl_get_app_status_by_id_resp resp = {};
+	struct xe_sysctrl_mailbox_command cmd = {};
+	size_t out_len = 0;
+	u32 flags;
+	int ret;
+
+	if (!xe->info.has_sysctrl)
+		return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
+
+	req.app_id = (u8)app_id;
+
+	cmd.header.data =
+		FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_CORE) |
+		FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID) |
+		FIELD_PREP(APP_HDR_VERSION_MASK, 0);
+
+	cmd.data_in = &req;
+	cmd.data_in_len = sizeof(req);
+	cmd.data_out = &resp;
+	cmd.data_out_len = sizeof(resp);
+
+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
+	if (ret)
+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
+
+	if (out_len != sizeof(resp)) {
+		xe_err(xe, "sysctrl: unexpected get app status response length %zu (expected %zu)\n",
+		       out_len, sizeof(resp));
+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
+	}
+
+	flags = resp.flags;
+
+	if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
+		return XE_SYSCTRL_FIRMWARE_APP_INVALID;
+
+	if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
+		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
+
+	if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
+		return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
+
+	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
+}
+
+/**
+ * xe_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
+ * @xe: xe device instance
+ *
+ * Returns true if oCode firmware has reached the initialized state, indicating
+ * it is ready to handle requests. Returns true also on platforms without System
+ * Controller support, as there is no firmware gate to wait on.
+ *
+ * Return: true if oCode is initialized or sysctrl is not present, false otherwise
+ */
+bool xe_is_oobmsm_fw_ready(struct xe_device *xe)
+{
+	enum xe_sysctrl_fw_status status =
+		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
+
+	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
+	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
+}
+
+/**
+ * xe_is_diag_fw_ready() - Check if diag firmware is fully initialized
+ * @xe: xe device instance
+ *
+ * Returns true if diag firmware has reached the initialized state, indicating
+ * it is ready to handle requests. Returns true also on platforms without System
+ * Controller support, as there is no firmware gate to wait on.
+ *
+ * Return: true if diag is initialized or sysctrl is not present, false otherwise
+ */
+bool xe_is_diag_fw_ready(struct xe_device *xe)
+{
+	enum xe_sysctrl_fw_status status =
+		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
+
+	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
+	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index 090dffb6d55f..7337d9f7c3ae 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -9,6 +9,7 @@
 #include <linux/container_of.h>
 
 #include "xe_device_types.h"
+#include "xe_sysctrl_mailbox_types.h"
 #include "xe_sysctrl_types.h"
 
 static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
@@ -20,5 +21,9 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
 int xe_sysctrl_init(struct xe_device *xe);
 void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_sysctrl_pm_resume(struct xe_device *xe);
+enum xe_sysctrl_fw_status
+xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id);
+bool xe_is_oobmsm_fw_ready(struct xe_device *xe);
+bool xe_is_diag_fw_ready(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 6e3753554510..ebaa48fc667b 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -14,9 +14,11 @@
  * enum xe_sysctrl_group - System Controller command groups
  *
  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
+ * @XE_SYSCTRL_GROUP_CORE: Core group
  */
 enum xe_sysctrl_group {
 	XE_SYSCTRL_GROUP_GFSP			= 0x01,
+	XE_SYSCTRL_GROUP_CORE                   = 0xFF,
 };
 
 /**
@@ -32,6 +34,71 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 };
 
+/**
+ * enum xe_sysctrl_core_cmd - Commands supported by Core group
+ *
+ * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
+ */
+enum xe_sysctrl_core_cmd {
+	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
+};
+
+/**
+ * struct xe_sysctrl_get_app_status_by_id_req - Get application status request
+ *
+ * @app_id: Application ID for which to retrieve status
+ */
+struct xe_sysctrl_get_app_status_by_id_req {
+	u8 app_id;
+} __packed;
+
+/**
+ * struct xe_sysctrl_get_app_status_by_id_resp - Get application status response
+ * @flags: Application status flags (see XE_SYSCTRL_APP_RESP_* definitions)
+ */
+struct xe_sysctrl_get_app_status_by_id_resp {
+	u32 flags;
+} __packed;
+
+/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by System Controller firmware */
+#define XE_SYSCTRL_APP_RESP_VALID		BIT(0)
+/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed its boot sequence */
+#define XE_SYSCTRL_APP_RESP_BOOTED		BIT(1)
+/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has completed all post-boot initialization */
+#define XE_SYSCTRL_APP_RESP_INITIALIZED		BIT(2)
+
+/**
+ * enum xe_sysctrl_fw_status - System Controller firmware application lifecycle states
+ *
+ * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by firmware
+ * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has not yet booted
+ * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-boot init pending
+ * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
+ * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available on this device
+ * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System Controller firmware failed
+ */
+enum xe_sysctrl_fw_status {
+	XE_SYSCTRL_FIRMWARE_APP_INVALID,
+	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
+	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
+	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
+	XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
+	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
+};
+
+/**
+ * enum xe_sysctrl_app_id - Known System Controller application identifiers
+ *
+ * @XE_SYSCTRL_APP_GFSP: GFSP application (firmware ID 11)
+ * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
+ * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID 13)
+ */
+enum xe_sysctrl_app_id {
+	XE_SYSCTRL_APP_GFSP	= 11,
+	XE_SYSCTRL_APP_OCODE	= 12,
+	XE_SYSCTRL_APP_DIAG	= 13,
+};
+
 /**
  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
  */
-- 
2.43.0

