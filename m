Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531A1FD4F19
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 18:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF5E10E779;
	Tue, 10 Mar 2026 18:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MK0HBsp2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E9610E77A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773167036; x=1804703036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3+1t+fqB84d7Krnqh48Qqa1oryi8L3nUMShwiCN1Rto=;
 b=MK0HBsp2EMUu+NkZ/F3XaoQecFdalL0Ee+QUmD7wVjknTE4fBi1LdI22
 OOnzZpd+OMZa36MOezpOhUuzHvneSwXjPSIm99eVs2hqWlEMsqnY8qRP/
 0RfnoZGQnBNWg0jbtVN1xZ56I/VobCVgbaYHYv06J1LGm0QN9uVmCBMDR
 6twqPJ1TCVTu8EraWFJQrLv6aDAaRGX11qZqD45KFBXoA5MxqBVQQwm5L
 Cnj8kNQSOqY1ni7e4Jmynw3v4V1L6dRfB4Kd9MQT28k8AKqfiCLbiccDk
 GX3db/3u8fOI+Xp+knfETit3rMIBqdpwgMi///YxS/peWMibHrOa5CV87 Q==;
X-CSE-ConnectionGUID: QWEInnaMQTmFFd6J7Q4nVQ==
X-CSE-MsgGUID: 2Z5LBj/URlms8o0XzO8x+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78109818"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="78109818"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 11:23:56 -0700
X-CSE-ConnectionGUID: of9bvd3YTySA/xfTw3mptQ==
X-CSE-MsgGUID: OXIrDlaQRBywXlV6Jmc5hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="258127630"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 11:23:52 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v9 3/6] drm/xe/sysctrl: Add mailbox communication headers
Date: Tue, 10 Mar 2026 11:23:22 -0700
Message-ID: <20260310182336.611041-11-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310182336.611041-8-anoop.c.vijay@intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
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
v8: (Matt, Michal)
- Reordered patches for logical flow
- Moved ABI definitions to dedicated header

v9: (Badal)
- Renamed MKHI to SCHI (System Controller Host Interface)
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
index 000000000000..bc4793fb21e5
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
+struct xe_sysctrl_mailbox_schi_msg_hdr {
+	__le32 data;
+} __packed;
+
+struct xe_sysctrl_app_msg_hdr {
+	__le32 data;
+} __packed;
+
+#define SCHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
+#define SCHI_HDR_COMMAND_MASK		GENMASK(14, 8)
+#define SCHI_HDR_COMMAND_MAX		0x7f
+#define SCHI_HDR_IS_RESPONSE		BIT(15)
+#define SCHI_HDR_RESERVED_MASK		GENMASK(23, 16)
+#define SCHI_HDR_RESULT_MASK		GENMASK(31, 24)
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
index 000000000000..fdf8d1d4e3cd
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
+#define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	(XE_SYSCTRL_MB_FRAME_SIZE * XE_SYSCTRL_MB_MAX_FRAMES)
+
+#define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
+
+#endif
-- 
2.43.0

