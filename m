Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D920F10ED678
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 13:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F3A10EE53;
	Fri, 27 Mar 2026 13:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsdq1Nrl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A95410EE4E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 13:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617551; x=1806153551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bvm6CNhvAArjMF2csp72rrezKWVY0graWHJIQse6GNQ=;
 b=dsdq1NrlK+bM7MlQQTKjbA9VRYaIPWtoYwhabMZb2hxFBhRpMjBO5jtI
 ZwvP1Bcp13EZQ7p0BGHZiQZbaK7mFVHWZEa4Es0EST/MwWJxs+wjhZIn0
 spHlQDwG9xXNcVViyJ8/DjpA0ejCH//JkrY45/Rg/WK4Y4y5jwkdgA+8D
 0lTvBopjyvNY9q88SlrQUaI9xMNZK29ADXo2nG+Y+GC5wVHu30dGT2V02
 I/mZ28PWVn8F4MghXomcAk5DYoGFtcD9Bpuy0MneeSOo5/dvKKnpwsLTf
 S9XlR4OQisXaFCxzbBvQY87I75O39ITYQowix3GZtrqI74Pb0FhG5QjHy Q==;
X-CSE-ConnectionGUID: hjFE3Z66TCudaaCp3Wbquw==
X-CSE-MsgGUID: O2Cnu9uWSUiAxHYbsipO1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75656105"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75656105"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:18:57 -0700
X-CSE-ConnectionGUID: BiYFIXHBTZSHiSVCFl2TQg==
X-CSE-MsgGUID: SL1sgQJ3RnKZ+CpJ5Abxyw==
X-ExtLoop1: 1
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:18:53 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v13 3/7] drm/xe/xe_sysctrl: Add ABI and mailbox interface
 headers
Date: Fri, 27 Mar 2026 06:18:40 -0700
Message-ID: <20260327131837.2192929-12-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
References: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
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

