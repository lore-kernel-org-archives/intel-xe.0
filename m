Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588A6C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 09:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A90A10E12B;
	Fri, 14 Aug 2026 09:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjJMq45l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A7210E12B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786701196; x=1818237196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=trcK+ACmRxejHSl8lWz0AGQ7rsVuR8QA0AYb6U50a2M=;
 b=EjJMq45lQNavARB1rYGukEhJ5C2/7HB6mMSCm49qZT0m7TDHzp/IGkGB
 VHPJzgxBpMX5xxO/r3+gIX/bn6gfoG6PtqcaFUO9ERUD6tHz+RHAFis+c
 mHGIn0ZC1pxGK4W4uY/PxrdjXkwbaGrHHMenH5cW+BVlYeWDsP9M9oREr
 owzWbst18EeFWtlZ70cRkosnkyPyv6+pxchuTm/mgfg+sSkk75K+cahhl
 juvAQIkEcxCV6tdNRzGpnwsI4v/+VO3T7Yz0VomWeJ9XjYmO0rZwUuK3d
 EKwjm9N6/hqpCZfbOrvk1khmzeMEcp/imNhX5gNogtTmb6hjzbYuENBzW w==;
X-CSE-ConnectionGUID: egE8//EMTVOaFbeAr3AAVw==
X-CSE-MsgGUID: 1wZGD+q+RMKqCAd71t+7nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74815250"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="74815250"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 02:53:15 -0700
X-CSE-ConnectionGUID: Ji+zf+WGRuGVM3gfMdPaaw==
X-CSE-MsgGUID: t4hJD61dRH+/HxvNe20H0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="268037164"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 02:53:12 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v7 1/2] drm/xe/sysctrl: Add helper to query application status
Date: Fri, 14 Aug 2026 02:53:06 -0700
Message-ID: <20260814095306.2482289-5-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
References: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
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
---
 drivers/gpu/drm/xe/xe_sysctrl.c               | 80 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 47 +++++++++++
 3 files changed, 128 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 1db20be8158b..c53a26af3189 100644
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
+#define XE_SYSCTRL_APP_RESP_VALID	BIT(0)
+#define XE_SYSCTRL_APP_RESP_BOOTED	BIT(1)
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
@@ -130,3 +146,67 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
 
 	xe_sysctrl_mailbox_init(sc);
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
+	if (!xe->info.has_sysctrl)
+		return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
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
+ * it is ready to handle requests. On platforms without System Controller
+ * support there is no System Controller mailbox to gate on, so diag firmware
+ * readiness is not tracked through this path; the function unconditionally
+ * returns true so callers are not blocked by this check on such platforms.
+ *
+ * Return: true if diag firmware is initialized, or if System Controller is
+ * not present on this platform; false otherwise
+ */
+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
+{
+	enum xe_sysctrl_fw_status status =
+		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
+
+	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
+	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
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
index d0341538ad05..f1e4253fda4b 100644
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
@@ -38,6 +40,51 @@ enum xe_sysctrl_gfsp_cmd {
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
 /**
  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
  */
-- 
2.43.0

