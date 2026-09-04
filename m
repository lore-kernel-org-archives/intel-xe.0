Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A01C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 13:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D5C10F9B6;
	Fri,  4 Sep 2026 13:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5xFK0Ag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A4710F9C5
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 13:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788529788; x=1820065788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=osGXyP/lpk8aV/70cqSRQrTgvhz1nRUOVMMpJH63tvY=;
 b=U5xFK0AgogqtmFXcEG+1gxoEVDrylJv5pgVuB90PFp9YvVYUVxDAJhz9
 v9vSnxhjPEO/04HwpLEMsRNy8JXrDOq/dRGnIXXktLcght0t6FiJ+2dwY
 nYrNMLzS0reX6C7AKXm94nRaEgbqKYZVEEYXIfuJKe5oskemUqfv+fNec
 8dSQIixkqHe4TA3em5jZ+SPVW6StE4USIM37Km1S+5ZgdiaQGh1J4sKMu
 0hvD9axncq32bONAl4ysTDGujhOjbSnn0xOW7kTaFrIY3BWEvUn1xxCqU
 xU9/228SCVAwvtJl6hD4hq3p1roiA3vPGT60BzcMJ7M/wk7Xoeyrb10vR A==;
X-CSE-ConnectionGUID: Mi4O0xd/SvuczvYNjmQkGw==
X-CSE-MsgGUID: FQqwEZE6TGG2TLIZIcveAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100550399"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="100550399"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 06:49:48 -0700
X-CSE-ConnectionGUID: prL3zW/PQcGTA799YaK/PQ==
X-CSE-MsgGUID: q0WmYZIaRs6xFI3PTvhyCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273565925"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 06:49:44 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v8 1/2] drm/xe/sysctrl: Add helper to query application status
Date: Fri,  4 Sep 2026 06:49:36 -0700
Message-ID: <20260904134935.674507-5-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904134935.674507-4-anoop.c.vijay@intel.com>
References: <20260904134935.674507-4-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add xe_sysctrl_check_app_status() to query the state of a System
Controller application using get_app_status_by_id mailbox command.

The helper maps xe_sysctrl_app_id values to firmware application
IDs and returns the reported application state. Add a convenience
wrapper to check diag firmware application readiness.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v2: (Badal)
- Return SysCtrl firmware application states instead of errno for
  application lifecycle conditions

v3: (Riana, Badal)
- Replace string-based app identifiers with enum xe_sysctrl_app_id
- Use get_app_status_by_id (opcode 0x05)
- Move mailbox definitions to xe_sysctrl_mailbox_types.h
- Return enum xe_sysctrl_fw_status consistently
- Map communication failures to COMM_FAILURE
- Add INITIALIZED state and status helpers
- Fix Diagnostics typo

v4: (Anshuman)
- Make xe_sysctrl_check_app_status() internal
- Remove unused app identifier

v5: (Anshuman)
- Rename OOBMSM status helper to use xe_sysctrl_* prefix
- Remove xe_is_diag_fw_ready() helper

v6: (Riana)
- Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
  header packing
- Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
- Use hex constant for application ID
- Move oCode application readiness helper to a separate patch
- Add xe_sysctrl_is_diag_fw_ready() helper.

v7: (Umesh)
- Clarify xe_sysctrl_is_diag_fw_ready() comment for sysctrl-less platforms
- Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id to xe_sysctrl.c

v8: (Umesh, Rodrigo, Mike)
- Drop XE_SYSCTRL_FIRMWARE_APP_NOTSUPP handling
- Simplify diag readiness helpers to a single
  XE_SYSCTRL_FIRMWARE_APP_INITIALIZED check
---
 drivers/gpu/drm/xe/xe_sysctrl.c               | 73 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 45 ++++++++++++
 3 files changed, 119 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 62ccc9be71b4..3b7fa2c9c333 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -13,9 +13,11 @@
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
@@ -29,6 +31,20 @@
  * This module provides initialization and support code for interacting
  * with System Controller through the mailbox interface.
  */
+
+/* Application status flags reported in xe_sysctrl_app_status_resp.flags */
+#define XE_SYSCTRL_APP_RESP_VALID		BIT(0)
+#define XE_SYSCTRL_APP_RESP_BOOTED		BIT(1)
+#define XE_SYSCTRL_APP_RESP_INITIALIZED	BIT(2)
+
+/*
+ * Known System Controller application identifiers, keyed by firmware
+ * application ID.
+ */
+enum xe_sysctrl_app_id {
+	XE_SYSCTRL_APP_DIAG	= 0x0D,
+};
+
 static void sysctrl_fini(void *arg)
 {
 	struct xe_device *xe = arg;
@@ -125,3 +141,60 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
 
 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
 }
+
+static enum xe_sysctrl_fw_status
+xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
+{
+	struct xe_sysctrl_app_status_req req = {};
+	struct xe_sysctrl_app_status_resp resp = {};
+	struct xe_sysctrl_mailbox_command cmd = {};
+	size_t out_len = 0;
+	u32 flags;
+	int ret;
+
+	req.app_id = (u8)app_id;
+
+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
+				  &req, sizeof(req), &resp, sizeof(resp));
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
+ * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
+ * @xe: xe device instance
+ *
+ * Returns true if diag firmware has reached the initialized state, indicating
+ * it is ready to handle requests.
+ *
+ * Callers must only invoke this on platforms where System Controller is
+ * present (xe->info.has_sysctrl).
+ *
+ * Return: true if diag firmware is initialized, false otherwise
+ */
+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
+{
+	return xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG) ==
+	       XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index 090dffb6d55f..8dc576796890 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
 int xe_sysctrl_init(struct xe_device *xe);
 void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_sysctrl_pm_resume(struct xe_device *xe);
+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 66e7cbcc3f91..c236e5377f30 100644
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
+	XE_SYSCTRL_GROUP_CORE			= 0xFF,
 };
 
 /**
@@ -42,6 +44,49 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
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
+ * struct xe_sysctrl_app_status_req - Get application status request
+ *
+ * @app_id: Application ID for which to retrieve status
+ */
+struct xe_sysctrl_app_status_req {
+	u8 app_id;
+} __packed;
+
+/**
+ * struct xe_sysctrl_app_status_resp - Get application status response
+ * @flags: Application status flags interpreted by xe_sysctrl_check_app_status()
+ */
+struct xe_sysctrl_app_status_resp {
+	u32 flags;
+} __packed;
+
+/**
+ * enum xe_sysctrl_fw_status - System Controller firmware application lifecycle states
+ *
+ * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by firmware
+ * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has not yet booted
+ * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-boot init pending
+ * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
+ * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System Controller firmware failed
+ */
+enum xe_sysctrl_fw_status {
+	XE_SYSCTRL_FIRMWARE_APP_INVALID,
+	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
+	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
+	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
+	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
+};
+
 /**
  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
  */
-- 
2.43.0

