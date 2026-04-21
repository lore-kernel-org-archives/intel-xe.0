Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22120F8FA94
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 15:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93E810E8F2;
	Tue, 21 Apr 2026 15:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpiN4tvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4700210E8DA
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776785989; x=1808321989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QU78fHvF45PDWfIDg2vzYjQZPyN0kXGA3TdZYl5pI/A=;
 b=hpiN4tvpGBN4/Z81fnoQdbaQURBCbuj+hxsspmVEz/9XYBTOrMMzbhJ+
 WHquqrGGrNrscab2jHwqPujBIx1WEI8JcALH/kYWJwJtFv/CN/nZ0eeVZ
 Cu4SzYiHztVah4iypm+fcO76U+MAQ1kMiQGUWUZmh9sGTc7D6y/Crlz4U
 q8E/xbsvC2alV4ggSepSQKy631AuIhaezLcRRiJQ97ZnKnRwrzDTGXKo7
 M2g0rTxfjF9qK2NmJrKNPx1jTAuFqPNJMtDQ7JhBSD7XBrrXSd8OG5Kcn
 /MMMK3wcxwIff6ikR1XvRoXrn0tEVZoX7/DWd/F0hJ55QZ3D3OZF2POSy g==;
X-CSE-ConnectionGUID: K5VsQ2BcTmyxFWbw3SwQBA==
X-CSE-MsgGUID: P/A8tLuQRoqsIfhXmClhGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="81589032"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="81589032"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 08:39:49 -0700
X-CSE-ConnectionGUID: Zhg+hboDTj2OC4h/1qC4kg==
X-CSE-MsgGUID: Ri7P+A3tSGGA77wpWqRLRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="225557994"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 08:39:46 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 anshuman.gupta@intel.com, michael.j.ruhl@intel.com,
 mohamed.mansoor.v@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v2] drm/xe/sysctrl: Add helper to query application status
Date: Tue, 21 Apr 2026 08:38:33 -0700
Message-ID: <20260421153832.3785987-2-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
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

Introduce xe_sysctrl_check_app_status() to query whether a sysctrl
application is loaded and booted, returning error codes for not loaded
or not booted states.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v2: (Badal)
- Return SysCtrl firmware application states instead of errno for application lifecycle conditions
---
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h | 44 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.c         | 65 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h         |  1 +
 3 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
index 4cbde267ac44..8ed9ba791f3f 100644
--- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
@@ -62,4 +62,48 @@ struct xe_sysctrl_app_msg_hdr {
 #define APP_HDR_VERSION_MASK		GENMASK(23, 16)
 #define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
 
+/** System Controller Core command group */
+#define XE_SYSCTRL_GROUP_CORE		0xFF
+
+/*
+ * XE_SYSCTRL_CMD_GET_APP_STATUS - Query application status
+ *
+ * Check if a System Controller application is loaded and its status.
+ *
+ * Group: XE_SYSCTRL_GROUP_CORE (0xFF)
+ * Command: 0x04
+ */
+#define XE_SYSCTRL_CMD_GET_APP_STATUS	0x04
+
+/**
+ * struct xe_sysctrl_get_app_status_req - Get application status request
+ * @app_name: Application name (16 bytes, null-terminated)
+ */
+struct xe_sysctrl_get_app_status_req {
+	char app_name[16];
+} __packed;
+
+/**
+ * struct xe_sysctrl_get_app_status_resp - Get application status response
+ * @handle: Identifier used to control the app
+ * @flags: Application status flags (see XE_SYSCTRL_APP_* definitions)
+ */
+struct xe_sysctrl_get_app_status_resp {
+	u16 handle;
+	u16 flags;
+} __packed;
+
+/**
+ * DOC: System Controller Application Status Flags
+ *
+ * Flags returned in xe_sysctrl_get_app_status_resp indicating the
+ * current state of a System Controller application.
+ */
+
+enum xe_sysctrl_fw_status {
+	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED = 0, /* Firmware application not loaded */
+	XE_SYSCTRL_FIRMWARE_APP_LOADED,		/* Firmware application loaded, but not booted */
+	XE_SYSCTRL_FIRMWARE_APP_BOOTED,		/* Firmware application booted */
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 2bcef304eb9a..8d51f8cdaaa4 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -14,8 +14,11 @@
 #include "xe_soc_remapper.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
 #include "xe_sysctrl_types.h"
 
+#define XE_SYSCTRL_APP_BOOTED	BIT(2)
+
 /**
  * DOC: System Controller (sysctrl)
  *
@@ -99,3 +102,65 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
 
 	xe_sysctrl_mailbox_init(sc);
 }
+
+/**
+ * xe_sysctrl_check_app_status - Check if System Controller app is loaded
+ * @xe: xe device instance
+ * @app_name: Name of the application to check (max 15 chars + null terminator)
+ *
+ * Query System Controller firmware to verify if the specified application
+ * is loaded and booted. This is typically required before sending commands
+ * to application-specific command groups.
+ *
+ * Common application names:
+ * - "ocode"- oCode
+ * - "diag" - Dianostics
+ *
+ * Return: XE_SYSCTRL_FIRMWARE_APP_BOOTED if app is loaded and booted, error code otherwise:
+ *		-EOPNOTSUPP if System Controller is not available
+ *		-EINVAL if app_name is invalid
+ *		-EIO if communication with firmware failed
+ *		XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED if application is not loaded
+ *		XE_SYSCTRL_FIRMWARE_APP_LOADED if application is loaded but not booted yet
+ */
+int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name)
+{
+	struct xe_sysctrl_get_app_status_req req = {};
+	struct xe_sysctrl_get_app_status_resp resp = {};
+	struct xe_sysctrl_mailbox_command cmd = {};
+	size_t out_len = 0;
+	u16 flags;
+	int ret;
+
+	if (!xe->info.has_sysctrl)
+		return -EOPNOTSUPP;
+
+	if (!app_name || strlen(app_name) == 0 || strlen(app_name) >= sizeof(req.app_name))
+		return -EINVAL;
+
+	strscpy(req.app_name, app_name, sizeof(req.app_name));
+
+	cmd.header.data =
+		cpu_to_le32(FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_CORE) |
+			    FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_APP_STATUS) |
+			    FIELD_PREP(APP_HDR_VERSION_MASK, 0));
+
+	cmd.data_in = &req;
+	cmd.data_in_len = sizeof(req);
+	cmd.data_out = &resp;
+	cmd.data_out_len = sizeof(resp);
+
+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
+	if (ret)
+		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
+
+	if (out_len != sizeof(resp))
+		return -EIO;
+
+	flags = le16_to_cpu(resp.flags);
+
+	if (!(flags & XE_SYSCTRL_APP_BOOTED))
+		return XE_SYSCTRL_FIRMWARE_APP_LOADED;
+
+	return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index f3b0f3716b2f..db2743d54cea 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -18,5 +18,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
 
 int xe_sysctrl_init(struct xe_device *xe);
 void xe_sysctrl_pm_resume(struct xe_device *xe);
+int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name);
 
 #endif
-- 
2.43.0

