Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415C2D58E78
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 08:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A17310E450;
	Mon,  2 Mar 2026 08:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8APFUDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C764C10E452
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772439021; x=1803975021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8M8yk6SfkJtJNb/4FrfwzqaY4JtR3KTJOMOr7zeQjUc=;
 b=J8APFUDWhnI7A/jH6O+Hxhwx/5xlSqzAx4ZaEo0OKIlcqi8/AoMeQYnR
 O3cl5rIhLya94sbuNG5Zb6aXoj1VANVMx0VeouCmPU55U6fSDnLdbg8UK
 UWGLyU0KRFqj/9hNUzcogb9JmJMm3sQPBQzoZ9sUMr2kCdzTLTiRZT4bW
 z1LL6587KoV+Dh/1I3g3Yvjn8yhQdcQjhImLTQxRwVO6BQTdSiPAy7nUU
 XyDWcCUaOqSxjTskV+baxGmN2DuHWAszCl+vBvb3mFLXMcJ9T2MXq+RFp
 PDP3xdZ8QMWXp50SuKDMzeyow7STHOT7vCbKTYUZA+NmyPW3RMVd5kMso w==;
X-CSE-ConnectionGUID: gkxGQcNiT3GhQsDFmZjcGg==
X-CSE-MsgGUID: ixS2ea+NT9Cio0vMOWH91g==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84790344"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84790344"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:10:20 -0800
X-CSE-ConnectionGUID: vm0wMKdxQKKoVc+HtPkE+Q==
X-CSE-MsgGUID: lpDxsrCfSX63QKVPQnIRPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="214079208"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:10:17 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v8 3/6] drm/xe/sysctrl: Add mailbox communication headers
Date: Mon,  2 Mar 2026 00:10:05 -0800
Message-ID: <20260302081002.3275868-11-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
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

Add ABI definitions, mailbox API, and command structures for
System Controller communication.

No functional code yet. Only protocol layer definitions are added.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v8 (Matt, Michal):
- Reordered patches for logical flow
- Moved ABI definitions to dedicated header
---
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       | 31 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       | 31 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 35 +++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h

diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
new file mode 100644
index 000000000000..8eefb0ddafd7
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
@@ -0,0 +1,31 @@
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
+struct xe_sysctrl_mailbox_mkhi_msg_hdr {
+	__le32 data;
+} __packed;
+
+struct xe_sysctrl_app_msg_hdr {
+	__le32 data;
+} __packed;
+
+#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
+#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
+#define MKHI_HDR_COMMAND_MAX		0x7F
+#define MKHI_HDR_IS_RESPONSE		BIT(15)
+#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
+#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
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
index 000000000000..32c35a6da1cb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -0,0 +1,35 @@
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
+ * @header: Application message header containing command information
+ * @data_in: Pointer to input payload data (can be NULL if no input data)
+ * @data_in_len: Size of input payload in bytes (0 if no input data)
+ * @data_out: Pointer to output buffer for response data (can be NULL if no response)
+ * @data_out_len: Size of output buffer in bytes (0 if no response expected)
+ */
+struct xe_sysctrl_mailbox_command {
+	struct xe_sysctrl_app_msg_hdr header;
+	void *data_in;
+	size_t data_in_len;
+	void *data_out;
+	size_t data_out_len;
+};
+
+#define XE_SYSCTRL_MB_FRAME_SIZE	16
+#define XE_SYSCTRL_MB_MAX_FRAMES	64
+#define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	(XE_SYSCTRL_MB_FRAME_SIZE * XE_SYSCTRL_MB_MAX_FRAMES)
+
+#define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
+
+#endif
-- 
2.43.0

