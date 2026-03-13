Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4A8105F7B0
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 14:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BAA10EC2C;
	Fri, 13 Mar 2026 14:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeVaRMAY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7D510E0B0
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773412406; x=1804948406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jQZObx3yhKRDKstQ7D9VrPZnz8ZM3krPprKq/5y5sdA=;
 b=jeVaRMAYhlLpt+DdOdsF4/WXR76BImuLxfEEtiIEgCbUXM5lTVA9Lt4C
 a6F/sTJ52mHUQF/aBim4DpMigjh+doP5LbzDgwnmYOQcLNKe3EsnKNGmI
 LSEpg0xLO37rgqgUZGZKERUpCSzrGTDIPJZOEUxskHezpH/+bGzLET3R/
 YURwfwJvp8uOT68rLBcONoAWkbhlDv2X72j1JGwHaGWbZ3vbIcxBcWF4M
 HaPnomtNxCsLRbc6I0S5jRDxOK6OyXV5gT0CdOK6sikZYzl1irUVFLijh
 aNsJB4TrUmUTpjLEe4dKMIW54zgPwUKTHXEDV615kuByqm6X01aZciS+A A==;
X-CSE-ConnectionGUID: SZMh7Hw0TUSVXDGpWUO0vg==
X-CSE-MsgGUID: O33u20FtRqKf8nJ4WoBQIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="73536528"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="73536528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:33:21 -0700
X-CSE-ConnectionGUID: SgP/fMUBTE+GazmkfVrhzw==
X-CSE-MsgGUID: 29FfM1QGQqmzKQQOaQhEOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="216084337"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:33:18 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v10 3/7] drm/xe/xe_sysctrl: Add ABI and mailbox interface
 headers
Date: Fri, 13 Mar 2026 07:33:06 -0700
Message-ID: <20260313143303.2441609-12-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
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

Add ABI definitions, mailbox API, and command data structures required
for System Controller communication.

No functional changes. This patch introduces definitions for mailbox
communication.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v8: (Matt, Michal)
- Reordered patches for logical flow
- Moved ABI definitions to dedicated header

v9: (Badal)
- Renamed MKHI to SCHI (System Controller Host Interface)

v10: (Riana, Badal)
- Removed SCHI terminology and aligned to sysctrl mailbox naming
- Added System Controller ABI kernel-doc
- Converted xe_sysctrl_app_msg_hdr data field to u32
- Fixed macro alignment
---
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       | 48 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       | 31 ++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 36 ++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h

diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
new file mode 100644
index 000000000000..642750e7468c
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_ABI_H_
+#define _XE_SYSCTRL_ABI_H_
+
+#include <linux/types.h>
+
+/**
+ * DOC: System Controller ABI
+ *
+ * This header defines the Application Binary Interface (ABI) used by
+ * drm/xe driver to communicate with the System Controller firmware on
+ * Intel Xe3p discrete GPU platforms.
+ *
+ * The System Controller is a firmware-managed entity responsible for
+ * certain platform-level management functions delegated by the driver.
+ * Communication is performed via a System Controller mailbox interface.
+ *
+ * This header defines ABI-level message formats and data structures
+ * shared between the driver and System Controller firmware.
+ */
+
+/**
+ * struct xe_sysctrl_app_msg_hdr - Application layer message header
+ * @data: 32-bit header data
+ *
+ * Header structure for application-level messages.
+ */
+struct xe_sysctrl_app_msg_hdr {
+	u32 data;
+} __packed;
+
+#define SYSCTRL_HDR_GROUP_ID_MASK	GENMASK(7, 0)
+#define SYSCTRL_HDR_COMMAND_MASK	GENMASK(14, 8)
+#define SYSCTRL_HDR_COMMAND_MAX		0x7f
+#define SYSCTRL_HDR_IS_RESPONSE		BIT(15)
+#define SYSCTRL_HDR_RESERVED_MASK	GENMASK(23, 16)
+#define SYSCTRL_HDR_RESULT_MASK		GENMASK(31, 24)
+
+#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
+#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
+#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
+#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
new file mode 100644
index 000000000000..91460be9e22c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_MAILBOX_H_
+#define _XE_SYSCTRL_MAILBOX_H_
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+#include "abi/xe_sysctrl_abi.h"
+
+struct xe_sysctrl;
+struct xe_sysctrl_mailbox_command;
+
+#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
+	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
+	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
+
+#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
+	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
+
+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
+int xe_sysctrl_send_command(struct xe_sysctrl *sc,
+			    struct xe_sysctrl_mailbox_command *cmd,
+			    size_t *rdata_len);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
new file mode 100644
index 000000000000..bdf1c38243d4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_MAILBOX_TYPES_H_
+#define _XE_SYSCTRL_MAILBOX_TYPES_H_
+
+#include <linux/types.h>
+
+#include "abi/xe_sysctrl_abi.h"
+
+/**
+ * struct xe_sysctrl_mailbox_command - System Controller mailbox command
+ */
+struct xe_sysctrl_mailbox_command {
+	/** @header: Application message header containing command information */
+	struct xe_sysctrl_app_msg_hdr header;
+	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
+	void *data_in;
+	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
+	size_t data_in_len;
+	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
+	void *data_out;
+	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
+	size_t data_out_len;
+};
+
+#define XE_SYSCTRL_MB_FRAME_SIZE	16
+#define XE_SYSCTRL_MB_MAX_FRAMES	64
+#define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\
+	(XE_SYSCTRL_MB_FRAME_SIZE * XE_SYSCTRL_MB_MAX_FRAMES)
+
+#define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
+
+#endif
-- 
2.43.0

