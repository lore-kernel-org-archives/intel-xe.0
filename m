Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F867FF5135
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 19:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF34C10E040;
	Tue,  7 Apr 2026 19:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UR1lyJqv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163C110E040
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 19:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775589381; x=1807125381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9lk7bzyLDPFy7eAY8gunR2MaDaStat8ZMbUjn4s+tvo=;
 b=UR1lyJqvBj/7bwKlCd/pplz1gS8E6DmErNg2JJhefxSrkOzZYwhKUlFU
 OqfWmmdYGMITcdJE04s+VAAxy1HXnc5hmQWQx2hLapKWWV28p4veGi6zG
 r9zlDzEvpWW4h146OjFC8fmPy3pfIUZm+bIul+lyTWeg+KQayaQSdvdW5
 7dF5dexHOhhAACAPe7CEO/eKPzpD23CQNcPL7KflXRhwOJIM29UyjsXUz
 asb2h7+5YjZALLMvv5C5YYpHG6j6BEY9rF1qLe9m7NkUHTou3rzuLSAtK
 qr+7INt8ep01mckm+HrMvKQYl/NJJnopATt8l3ddf86eHbawemfk8qkvo w==;
X-CSE-ConnectionGUID: uSvpSfJyQqSbr9sbqtC5jA==
X-CSE-MsgGUID: MPUvRiw6Rbqp2J6TAx8UKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75600652"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="75600652"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 12:16:21 -0700
X-CSE-ConnectionGUID: G2J5lqjLQOiD/l6EIxi0yg==
X-CSE-MsgGUID: +SwmbQK5RU2spK5Wz//aMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="223484207"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 12:16:18 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, michael.j.ruhl@intel.com,
 mohamed.mansoor.v@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v1] drm/xe/sysctrl: Add helper to query application status
Date: Tue,  7 Apr 2026 12:16:11 -0700
Message-ID: <20260407191610.841935-2-anoop.c.vijay@intel.com>
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
application is loaded and booted, returning standard error codes for
not loaded (-ENOENT) or not booted (-EAGAIN) states.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h | 49 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.c         | 63 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h         |  1 +
 3 files changed, 113 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
index 4cbde267ac44..7e1d88dd1c94 100644
--- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
@@ -62,4 +62,53 @@ struct xe_sysctrl_app_msg_hdr {
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
+/** Application is loaded in System Controller */
+#define XE_SYSCTRL_APP_LOADED		BIT(0)
+/** Application binary is valid */
+#define XE_SYSCTRL_APP_VALID		BIT(1)
+/** Application has completed boot sequence */
+#define XE_SYSCTRL_APP_BOOTED		BIT(2)
+/** Application loaded as late binding */
+#define XE_SYSCTRL_APP_LATE_BINDING	BIT(3)
+/** Application contains data only (no executable code) */
+#define XE_SYSCTRL_APP_DATA_ONLY	BIT(4)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 2bcef304eb9a..6073c80ee79c 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -14,6 +14,7 @@
 #include "xe_soc_remapper.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
 #include "xe_sysctrl_types.h"
 
 /**
@@ -99,3 +100,65 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
 
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
+ * Return: 0 if app is loaded and booted, negative error code otherwise:
+ *		-ENODEV if System Controller is not available
+ *		-EINVAL if app_name is invalid
+ *		-EIO if communication with firmware failed
+ *		-ENOENT if application is not loaded
+ *		-EAGAIN if application is loaded but not booted yet
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
+		return -ENODEV;
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
+		return -ENOENT;
+
+	if (out_len != sizeof(resp))
+		return -EIO;
+
+	flags = le16_to_cpu(resp.flags);
+
+	if (!(flags & XE_SYSCTRL_APP_BOOTED))
+		return -EAGAIN;
+
+	return 0;
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

