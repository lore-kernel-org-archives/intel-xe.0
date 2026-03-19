Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0AF10854D2
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 17:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE13D10E960;
	Thu, 19 Mar 2026 17:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNGmEm03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD1410E95F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773941451; x=1805477451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bvm6CNhvAArjMF2csp72rrezKWVY0graWHJIQse6GNQ=;
 b=HNGmEm03PSaNN/DwiTxAgIV/ClpRrA2yG221ul6dPuWLVZ14nMYZHug2
 pPYxC/PTxTHX+u8OadYSeEgU8IuRkVI6t35CgNaECmGPPSHVa72wwHc7U
 XpZP01DVmkkMNh6WOEVs6EA9kGkkNx8gOQdT4WunxjwgjGh6yH+xkUMcJ
 9xLiXW+WJ45C8Ziapk36jY+Y3NF13IwoYeLF7/WUORqb582nOQ9DhIX5S
 z97CV14MHrrWTEiA1c5JjiVNCRTxgvxrnwiAqTbEX+UMhlpwNOov1Wd8o
 E1ZRDlSwjYvdZOeikERAxkgoWCZ0xVpALDMjGwZhBfclFThP7tvdGDJoe g==;
X-CSE-ConnectionGUID: PXavNjm9Sfq2lMpaowWYFw==
X-CSE-MsgGUID: PoBpbn1FQfKi8X6UBU1Pjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86385136"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="86385136"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 10:30:51 -0700
X-CSE-ConnectionGUID: GReEAwQ3QAeLwkIv5YFZhA==
X-CSE-MsgGUID: T1C0EXL1RvK4ycjyvN0ZFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="260925230"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 10:30:47 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v11 3/7] drm/xe/xe_sysctrl: Add ABI and mailbox interface
 headers
Date: Thu, 19 Mar 2026 10:30:33 -0700
Message-ID: <20260319173031.1320708-12-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319173031.1320708-9-anoop.c.vijay@intel.com>
References: <20260319173031.1320708-9-anoop.c.vijay@intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

v11: (Umesh)
- Improve struct member spacing for readability
- Updated System Controller ABI doc
---
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       | 65 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       | 31 +++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 40 ++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h

diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
new file mode 100644
index 000000000000..4cbde267ac44
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
@@ -0,0 +1,65 @@
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
+ * drm/xe to communicate with System Controller firmware on Intel Xe3p
+ * discrete GPU platforms.
+ *
+ * System Controller (sysctrl) is a firmware-managed entity on Intel
+ * dGPUs responsible for certain low-level platform management
+ * functions.
+ *
+ * Communication protocol:
+ *
+ * Communication uses a mailbox interface with messages composed of:
+ *
+ * - Application message header (struct xe_sysctrl_app_msg_hdr)
+ *   containing group_id, command, and version
+ * - Variable-length, command-specific payload
+ *
+ * Message header format:
+ *
+ * The 32-bit application message header is packed as:
+ *
+ * - Bits [7:0]   : Group ID identifying command group
+ * - Bits [15:8]  : Command identifier within group
+ * - Bits [23:16] : Command version for interface compatibility
+ * - Bits [31:24] : Reserved, must be zero
+ *
+ * This header defines firmware ABI message formats and constants shared
+ * between driver and System Controller firmware.
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
index 000000000000..89456aec6097
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -0,0 +1,40 @@
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
+
+	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
+	void *data_in;
+
+	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
+	size_t data_in_len;
+
+	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
+	void *data_out;
+
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

