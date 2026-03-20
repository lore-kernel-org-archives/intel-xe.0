Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FE91093181
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BD410E95A;
	Fri, 20 Mar 2026 07:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2ekz7dv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1E910E95A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 07:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773991558; x=1805527558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aKMg1wqh3aLblQObZguXMdwBHqhsJEUHHZLWhZkxlgM=;
 b=L2ekz7dvelAfNp9uAhGtowG+5Znzh1Al3tqVFCiFNgDzdjC7bDpvA7dt
 WK5wvFVk0w3qIwUi9OJvsCwtgcTDLuMhG79tFxumvh1dJLeiIl3UeYYYX
 yASr8iMOQO8WLbgiijyiVq3NdEXu+Y+lndZJgZ0kbFSawoa8f1kQ2vpoE
 ZS7MbnPNMbJu1+6/Ijnq78mM/8K5fyz38iGHxx7v1/A5Vm1TtscTNR5VI
 1OsD8KsoanHLGGiZjrslGj99Q0qqhTJtI1JHolWD42lXcrAczaMiGVWWn
 RnCuBIqA5KXex7G68guby/KKeFFwTqDjhTyQ+Rf9XCOI+tWyJVoNxnTxj Q==;
X-CSE-ConnectionGUID: qKa6hFrbQ96fo0lhX6qoAw==
X-CSE-MsgGUID: QF4895gYQQmG1+hlBfo/kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62634656"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="62634656"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:25:57 -0700
X-CSE-ConnectionGUID: O+7ltukeSZuRO+8UplAd3Q==
X-CSE-MsgGUID: i6tB0g0VSSyU1NLDd47cZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227335895"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:25:53 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [RFC v1 5/5] drm/xe/fwctl: Add System Controller FWCTL RPC handler
Date: Fri, 20 Mar 2026 00:25:33 -0700
Message-ID: <20260320072528.1780651-12-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
References: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
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

Add FWCTL RPC handler for Xe System Controller firmware.

Implement xe_fw_ops to route FWCTL RPCs to System Controller mailbox,
allowing userspace to issue System Controller commands via FWCTL.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/Makefile             |   1 +
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h |  29 +++++
 drivers/gpu/drm/xe/xe_fwctl.c           |  10 +-
 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c   | 136 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c |  31 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |   2 +
 include/uapi/fwctl/xe.h                 |  25 ++++-
 7 files changed, 231 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 6d47d5d59cf4..f5d7109893c8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -125,6 +125,7 @@ xe-y += xe_bb.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_sysctrl.o \
+	xe_sysctrl_fwctl.o \
 	xe_sysctrl_mailbox.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
index 4cbde267ac44..b80e01e8ae37 100644
--- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
@@ -62,4 +62,33 @@ struct xe_sysctrl_app_msg_hdr {
 #define APP_HDR_VERSION_MASK		GENMASK(23, 16)
 #define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
 
+/** System Controller FSP Runtime command group */
+#define XE_SYSCTRL_GROUP_FSP_RUNTIME    0x31
+
+/*
+ * XE_SYSCTRL_CMD_GET_FEATURE_CFG - Query feature configuration
+ *
+ * Return platform feature capability and configuration state.
+ *
+ * Group: XE_SYSCTRL_GROUP_FSP_RUNTIME (0x31)
+ * Command: 0x10
+ */
+#define XE_SYSCTRL_CMD_GET_FEATURE_CFG    0x10
+
+/**
+ * DOC: XE_SYSCTRL_CMD_GET_FEATURE_CFG response
+ *
+ * Returns 5 DWORDs:
+ *   DW0: Supported features
+ *   DW1: Enabled features
+ *   DW2: Software-configurable features
+ *   DW3: Pending state (effective after reboot)
+ *   DW4: Default (factory) state
+ *
+ * Each DWORD is a feature bitmap.
+ */
+#define XE_SYSCTRL_GET_FEATURE_CFG_NUM_DWORDS    5
+#define XE_SYSCTRL_GET_FEATURE_CFG_RESP_BYTES    \
+	(XE_SYSCTRL_GET_FEATURE_CFG_NUM_DWORDS * sizeof(__u32))
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_fwctl.c b/drivers/gpu/drm/xe/xe_fwctl.c
index 72124b5b3c87..2e8faa027487 100644
--- a/drivers/gpu/drm/xe/xe_fwctl.c
+++ b/drivers/gpu/drm/xe/xe_fwctl.c
@@ -67,10 +67,12 @@
 #include "xe_pm.h"
 #include "xe_printk.h"
 
+extern const struct xe_fw_ops xe_sysctrl_fw_ops;
+
 DEFINE_FREE(xe_fwctl, struct xe_fwctl *, if (_T) fwctl_put(&_T->fwctl))
 
 static const struct xe_fw_ops *fw_ops_table[XE_FW_MAX] = {
-	/* [XE_FW_...] = &ops, */
+	[XE_FW_SYSCTRL] = &xe_sysctrl_fw_ops,
 };
 
 static int xe_fwctl_uctx_open(struct fwctl_uctx *uctx)
@@ -102,12 +104,16 @@ static void *xe_fwctl_info(struct fwctl_uctx *uctx, size_t *length)
 					      fwctl);
 	struct xe_device *xe = fwctl->xe;
 	struct fwctl_info_xe *info;
+	u32 fw_caps = 0;
 
 	info = kzalloc_obj(*info);
 	if (!info)
 		return ERR_PTR(-ENOMEM);
 
-	info->fw_caps = 0;
+	if (xe->info.has_sysctrl && fw_ops_table[XE_FW_SYSCTRL])
+		fw_caps |= BIT(XE_FWCTL_CAP_SYSCTRL);
+
+	info->fw_caps = fw_caps;
 	info->platform = xe->info.platform;
 
 	*length = sizeof(*info);
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
new file mode 100644
index 000000000000..ebdbe6d1dfd8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * DOC: Xe System Controller FWCTL backend
+ *
+ * Implement FWCTL support for Xe System Controller firmware.
+ *
+ * Provide xe_fw_ops implementation to route FWCTL RPCs to System Controller
+ * mailbox using struct xe_sysctrl_rpc.
+ *
+ * validate_scope() enforces required access level for System Controller
+ * commands. rpc() executes mailbox transactions and returns responses to
+ * FWCTL core.
+ *
+ * See xe_fwctl.c for generic FWCTL documentation and userspace usage.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/err.h>
+#include <linux/vmalloc.h>
+
+#include <uapi/fwctl/xe.h>
+
+#include "abi/xe_sysctrl_abi.h"
+#include "xe_device.h"
+#include "xe_fwctl_types.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+#include "xe_printk.h"
+
+static bool xe_sysctrl_validate_scope(void *rpc_in, size_t in_len,
+				      enum fwctl_rpc_scope scope)
+{
+	struct xe_sysctrl_rpc *req = rpc_in;
+
+	if (in_len < sizeof(*req))
+		return false;
+
+	if (req->hdr.firmware_type != XE_FW_SYSCTRL)
+		return false;
+
+	switch (req->group_id) {
+	case XE_SYSCTRL_GROUP_FSP_RUNTIME:
+		switch (req->command) {
+		case XE_SYSCTRL_CMD_GET_FEATURE_CFG:
+			return scope >= FWCTL_RPC_CONFIGURATION;
+		default:
+			return false;
+		}
+
+	default:
+		return false;
+	}
+}
+
+static void *xe_sysctrl_rpc(struct xe_device *xe,
+			    enum fwctl_rpc_scope scope,
+			    void *rpc_in, size_t in_len,
+			    size_t *out_len)
+{
+	struct xe_sysctrl_rpc *req = rpc_in;
+	struct xe_sysctrl_mailbox_command cmd = {};
+	size_t in_payload, out_payload = 0;
+	size_t expected_resp_len, resp_size;
+	int ret;
+
+	if (!xe->info.has_sysctrl)
+		return ERR_PTR(-ENODEV);
+
+	if (in_len < sizeof(*req))
+		return ERR_PTR(-EINVAL);
+
+	if (req->hdr.firmware_type != XE_FW_SYSCTRL)
+		return ERR_PTR(-EBADMSG);
+
+	in_payload = in_len - sizeof(*req);
+	if (in_payload > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE)
+		return ERR_PTR(-EMSGSIZE);
+
+	ret = xe_sysctrl_get_response_len(req->group_id, req->command,
+					  req->version, in_payload,
+					  &expected_resp_len);
+	if (ret)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (expected_resp_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE)
+		return ERR_PTR(-EMSGSIZE);
+
+	resp_size = sizeof(*req) + expected_resp_len;
+	if (*out_len < resp_size)
+		return ERR_PTR(-EMSGSIZE);
+
+	struct xe_sysctrl_rpc *resp __free(kvfree) = kvzalloc(resp_size, GFP_KERNEL);
+	if (!resp)
+		return ERR_PTR(-ENOMEM);
+
+	cmd.header.data = cpu_to_le32(FIELD_PREP(APP_HDR_GROUP_ID_MASK, req->group_id) |
+				      FIELD_PREP(APP_HDR_COMMAND_MASK, req->command) |
+				      FIELD_PREP(APP_HDR_VERSION_MASK, req->version));
+
+	cmd.data_in = in_payload ? req->payload : NULL;
+	cmd.data_in_len = in_payload;
+
+	cmd.data_out = expected_resp_len ? resp->payload : NULL;
+	cmd.data_out_len = expected_resp_len;
+
+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_payload);
+	if (ret) {
+		xe_err(xe, "sysctrl fwctl RPC failed: group=0x%02x cmd=0x%02x err=%d\n",
+		       req->group_id, req->command, ret);
+		return ERR_PTR(ret);
+	}
+
+	if (out_payload > expected_resp_len)
+		return ERR_PTR(-EIO);
+
+	resp->hdr.firmware_type = XE_FW_SYSCTRL;
+	resp->group_id = req->group_id;
+	resp->command  = req->command;
+	resp->version  = req->version;
+	resp->reserved = 0;
+
+	*out_len = sizeof(*resp) + out_payload;
+
+	return no_free_ptr(resp);
+}
+
+const struct xe_fw_ops xe_sysctrl_fw_ops = {
+	.name = "sysctrl",
+	.rpc = xe_sysctrl_rpc,
+	.validate_scope = xe_sysctrl_validate_scope,
+};
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index b10c8b7e0c40..418ab672528f 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -293,6 +293,37 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
 	return 0;
 }
 
+/**
+ * xe_sysctrl_get_response_len - Get expected response length for a command
+ * @group_id: Command group ID
+ * @command: Command ID
+ * @version: Command version
+ * @in_len: Input payload length
+ * @out_len: Pointer to store expected output length
+ *
+ * Returns: 0 on success, -EOPNOTSUPP if command is unknown
+ */
+int xe_sysctrl_get_response_len(u8 group_id, u8 command, u8 version,
+				size_t in_len, size_t *out_len)
+{
+	(void)version;
+	(void)in_len;
+
+	switch (group_id) {
+	case XE_SYSCTRL_GROUP_FSP_RUNTIME:
+		switch (command) {
+		case XE_SYSCTRL_CMD_GET_FEATURE_CFG:
+			*out_len = XE_SYSCTRL_GET_FEATURE_CFG_RESP_BYTES;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 /**
  * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
  * @sc: System controller structure
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
index 91460be9e22c..f219ad738b81 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -23,6 +23,8 @@ struct xe_sysctrl_mailbox_command;
 #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
 	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
 
+int xe_sysctrl_get_response_len(u8 group_id, u8 command, u8 version,
+				size_t in_len, size_t *out_len);
 void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
 int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 			    struct xe_sysctrl_mailbox_command *cmd,
diff --git a/include/uapi/fwctl/xe.h b/include/uapi/fwctl/xe.h
index 3720f188a7ec..2a1e559f94f2 100644
--- a/include/uapi/fwctl/xe.h
+++ b/include/uapi/fwctl/xe.h
@@ -16,8 +16,13 @@
  * through the kernel FWCTL framework.
  */
 
+enum xe_fwctl_capabilities {
+	XE_FWCTL_CAP_SYSCTRL = 0,
+};
+
 enum xe_firmware_type {
-	XE_FW_MAX = 1,
+	XE_FW_SYSCTRL = 0,
+	XE_FW_MAX,
 };
 
 /**
@@ -39,4 +44,22 @@ struct fwctl_rpc_xe {
 	__u32 firmware_type;
 };
 
+/**
+ * struct xe_sysctrl_rpc - System Controller RPC
+ * @hdr: Common Xe RPC header (firmware_type = XE_FW_SYSCTRL)
+ * @group_id: Command group identifier
+ * @command: Command code
+ * @version: Command version
+ * @reserved: Reserved for alignment, must be 0
+ * @payload: Variable-length command-specific payload
+ */
+struct xe_sysctrl_rpc {
+	struct fwctl_rpc_xe hdr;
+	__u8 group_id;
+	__u8 command;
+	__u8 version;
+	__u8 reserved;
+	__u8 payload[];
+};
+
 #endif
-- 
2.43.0

