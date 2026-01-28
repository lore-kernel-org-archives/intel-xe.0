Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE96BD3568C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 08:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B423210E627;
	Wed, 28 Jan 2026 08:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwJR3B5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ADC10E627
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769588070; x=1801124070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mQsy4Pbh1TimRxrPbPLOq8EaJAW0Dn/NrfovTXNF+Zo=;
 b=TwJR3B5RA2jbhK3cCgR2VH1yI154237CkyvwYX38y5WL8/lSdJAtiUj/
 uppFaKMqeUYf1SHGl2+hOFlbHj6JZMXaJFzNjc+k31nmIwuiwFsGPJW3N
 k/42jSBNXqpmqHSC5PwNE1RXs0Aiv1+T5ntlVVKt57q3nAyZzushiKmca
 9b4v78znzDkTC0WgCyxv3YIHkUPSTOZM/4QLBlPZT99AutjfBcI5rcbDB
 9Ac4Y4gguoOJe5GCVxy6QM8+BabBcTsEnSJv4LCx6nZHAYYhueTumZbiV
 8TwAMXxhixOVDWozSdS8kA5uNTmnPQz3ILURGIWXfUhhCEoxkSr8lm5L3 g==;
X-CSE-ConnectionGUID: gcIGuPSUQqC9KzWluBzVkg==
X-CSE-MsgGUID: vibIIQy/Rma73SYtOI6GWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74643486"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74643486"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:14:17 -0800
X-CSE-ConnectionGUID: IBxBhezST0SMQ5ubFCZ7Pg==
X-CSE-MsgGUID: GlcQVpd+QZKSXVIQpyaJgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231156820"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:14:14 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v6 2/6] drm/xe/sysctrl: Add System Controller types and
 structures
Date: Wed, 28 Jan 2026 00:14:04 -0800
Message-ID: <20260128081403.3138456-10-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
References: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
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

Add type definitions and header declarations for System
Controller mailbox communication protocol.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v4: (Matt, Mike)
- Add domain-specific MMIO accessor
- Change phase_bit type from u32 to bool

v6: (Matt)
- Add mailbox protocol constants
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       | 35 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 42 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         | 33 +++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
new file mode 100644
index 000000000000..2b64165c8e76
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __XE_SYSCTRL_MAILBOX_H__
+#define __XE_SYSCTRL_MAILBOX_H__
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+struct xe_sysctrl;
+struct xe_device;
+struct xe_sysctrl_mailbox_command;
+
+#define APP_HDR_GROUP_ID_MASK			GENMASK(7, 0)
+#define APP_HDR_COMMAND_MASK			GENMASK(15, 8)
+#define APP_HDR_VERSION_MASK			GENMASK(23, 16)
+#define APP_HDR_RESERVED_MASK			GENMASK(31, 24)
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
+int xe_sysctrl_send_command(struct xe_device *xe,
+			    struct xe_sysctrl_mailbox_command *cmd,
+			    size_t *rdata_len);
+
+#endif /* __XE_SYSCTRL_MAILBOX_H__ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
new file mode 100644
index 000000000000..ce10924c5881
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __XE_SYSCTRL_MAILBOX_TYPES_H__
+#define __XE_SYSCTRL_MAILBOX_TYPES_H__
+
+#include <linux/types.h>
+
+struct xe_sysctrl_mailbox_mkhi_msg_hdr {
+	__le32 data;
+} __packed;
+
+struct xe_sysctrl_mailbox_app_msg_hdr {
+	__le32 data;
+} __packed;
+
+struct xe_sysctrl_mailbox_command {
+	/** @header: Application message header containing command information */
+	struct xe_sysctrl_mailbox_app_msg_hdr header;
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
+#define SYSCTRL_MB_FRAME_SIZE			16
+#define SYSCTRL_MB_MAX_FRAMES			64
+#define SYSCTRL_MB_MAX_MESSAGE_SIZE		(SYSCTRL_MB_FRAME_SIZE * SYSCTRL_MB_MAX_FRAMES)
+
+#define SYSCTRL_MB_DEFAULT_TIMEOUT_MS		500
+
+#endif /* __XE_SYSCTRL_MAILBOX_TYPES_H__ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
new file mode 100644
index 000000000000..d4a362564925
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_TYPES_H_
+#define _XE_SYSCTRL_TYPES_H_
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+struct xe_mmio;
+
+/**
+ * struct xe_sysctrl - System Controller driver context
+ */
+struct xe_sysctrl {
+	/** @mmio: MMIO region for system control registers */
+	struct xe_mmio *mmio;
+
+	/** @cmd_lock: Mutex protecting mailbox command operations */
+	struct mutex cmd_lock;
+
+	/**
+	 * @phase_bit: MKHI message boundary phase toggle bit
+	 *
+	 * Phase bit alternates between 0 and 1 for consecutive
+	 * messages to help distinguish message boundaries.
+	 */
+	bool phase_bit;
+};
+
+#endif /* _XE_SYSCTRL_TYPES_H_ */
-- 
2.43.0

