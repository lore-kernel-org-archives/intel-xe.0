Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DFEFDEE2F
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 17:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8685710F1E7;
	Thu, 23 Apr 2026 17:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUdnaPFL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA0710F1E7
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 17:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776966430; x=1808502430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tMJbfVlzK9j13ezOyY3doq/iFea9675snSpQ1h9YmXU=;
 b=mUdnaPFL5vjwnAmpriwQPLBRlO3U75MlfGncZd8IM1QyQNXkmcwejO23
 hBGWXZTa6fN7xHKS4eQPelV4VqU2V3eooQfpmV18VwyGX1UPFCuaHISnQ
 bc0eNPNqXbWw2nWID8vFD5AzpxN1pk/8561Nz/IvbP5FTLyCAxnwwiqL8
 UDLvjl4vmmg0HiHEJOorgUnfaAn0rWHTCCgpY9E+SKUOFTbgDOU6Wr6VJ
 NkPvy+SHDXblic0XpawVDw2pwZBgCOc3OgxLn47/6qk3WBtyPc7sXEDpz
 fZ6gYRl056EdKJ/KZAA+ydI3GaylQXTWuiZcko9y7anesRO7ZENUyKN4B Q==;
X-CSE-ConnectionGUID: m9SZaIIqTcC7JdotzRipag==
X-CSE-MsgGUID: QBaKGgnLSDur1lEthkf6oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89407080"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="89407080"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 10:47:10 -0700
X-CSE-ConnectionGUID: 2IYjQ+soR3CshbAB5dspLA==
X-CSE-MsgGUID: nA1ncD4IRQSIE/1DceKIbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="230058615"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 10:47:06 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v2 2/2] drm/xe/xe_ras: Add RAS support for GPU health indicator
Date: Thu, 23 Apr 2026 23:09:25 +0530
Message-Id: <20260423173925.699486-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423173925.699486-1-soham.purkait@intel.com>
References: <20260423173925.699486-1-soham.purkait@intel.com>
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

GPU health indicator exposes a single sysfs interface, gpu_health,
at the device level, allowing administrators and management tools to
query the GPU health status. The interface permits both read and write
operations on PF and native functions, while on VFs it is exposed as
read-only.

The sysfs file (gpu_health) is placed at the device level and behaves as
follows:

$ cat /sys/.../device/gpu_health
ok

$ echo critical > /sys/.../device/gpu_health

$ cat /sys/.../device/gpu_health
critical

V2:
 - Return error number instead of error message in _show and
   _store. (Andi)
 - Remove redundant VF check in _store callback. (Andi)
 - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
 - Return only the current health state for sysfs read. (Andi, Rodrigo)
 - Add documentation for sysfs interface. (Andi, Rodrigo)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-ras     |  33 +++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_ras.c                   | 202 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  13 ++
 5 files changed, 252 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
new file mode 100644
index 000000000000..085cb79a6e00
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
@@ -0,0 +1,33 @@
+What:		/sys/bus/pci/drivers/.../gpu_health
+Date:		April 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		This file exposes the current GPU health state and, for Physical
+		Functions (PFs), allows GPU health state to be updated.
+
+		This sysfs file is only accessible to administrative users and is
+		present only on Intel Xe platforms that support the GPU health
+		indicator interface for RAS.
+
+		For Physical Functions (PFs), the file is read-write, while for
+		Virtual Functions (VFs), it is read-only and does not support GPU
+		health state updates.
+
+		Read return a single line containing one of the valid values for
+		the current device health state. Only for PFs, writing one of the
+		valid values updates the current device health state.
+
+		The valid values for the device health state are:
+
+			ok
+				The device is healthy and operating within normal
+				parameters.
+
+			warning
+				The device is experiencing minor issues but remains
+				operational.
+
+			critical
+				The device is in a critical state and may not be
+				operational.
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 95666f950a6f..28a09d06a44c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -112,6 +112,7 @@ xe-y += xe_bb.o \
 	xe_pxp_debugfs.o \
 	xe_pxp_submit.o \
 	xe_query.o \
+	xe_ras.o \
 	xe_range_fence.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4b45b617a039..cb5484712f1c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -62,6 +62,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_ras.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -1067,6 +1068,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
+	xe_ras_init(xe);
+
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
new file mode 100644
index 000000000000..25609257bd07
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/minmax.h>
+
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+#include "xe_ras.h"
+#include "xe_ras_types.h"
+#include "xe_sriov.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+
+static const char * const gpu_health_states[] = {
+	[XE_RAS_HEALTH_STATUS_OK]		= "ok",
+	[XE_RAS_HEALTH_STATUS_WARNING]		= "warning",
+	[XE_RAS_HEALTH_STATUS_CRITICAL]		= "critical"
+};
+
+static const int ras_status_to_errno_map[] = {
+	[XE_RAS_STATUS_SUCCESS]			= 0,
+	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
+	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
+	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
+	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
+	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENAVAIL,
+	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -EREMOTEIO
+};
+
+static int ras_status_to_errno(u32 status)
+{
+	status = min_t(u32, status, XE_RAS_STATUS_UNKNOWN_ERROR);
+	return ras_status_to_errno_map[status];
+}
+
+static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
+				    u32 cmd_mask, void *request, size_t request_len,
+				    void *response, size_t response_len)
+{
+	struct xe_sysctrl_app_msg_hdr hdr = {0};
+
+	hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
+		   FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
+
+	command->header = hdr;
+	command->data_in = request;
+	command->data_in_len = request_len;
+	command->data_out = response;
+	command->data_out_len = response_len;
+}
+
+static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_health_get_response response = {0};
+	struct xe_ras_health_get_input request = {0};
+	enum xe_sysctrl_mailbox_command_id cmd = XE_SYSCTRL_CMD_GET_HEALTH;
+	enum xe_ras_health_status health;
+	int ret;
+	size_t rlen = 0;
+
+	prepare_sysctrl_command(&command, cmd, &request,
+				sizeof(request), &response, sizeof(response));
+	guard(xe_pm_runtime)(xe);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret)
+		return ret;
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe,
+		       "[RAS][GET_HEALTH]: invalid Sysctrl response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EPROTO;
+	}
+	if (response.current_health > XE_RAS_HEALTH_STATUS_CRITICAL) {
+		xe_err(xe, "[RAS][GET_HEALTH]: invalid health state %u from Sysctrl\n",
+		       response.current_health);
+		return -EPROTO;
+	}
+
+	health = (enum xe_ras_health_status)response.current_health;
+
+	xe_dbg(xe, "[RAS][GET_HEALTH]: current GPU health state = %d (%s)\n",
+	       health, gpu_health_states[health]);
+
+	return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
+}
+
+static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_health_set_input request = {0};
+	struct xe_ras_health_set_response response = {0};
+	enum xe_sysctrl_mailbox_command_id cmd = XE_SYSCTRL_CMD_SET_HEALTH;
+	enum xe_ras_health_status health;
+	int ret;
+	size_t rlen = 0;
+	int state;
+	int ras_status;
+
+	state = sysfs_match_string(gpu_health_states,
+				   buf);
+	if (state < 0)
+		return -EINVAL;
+
+	request.new_health = (u8)state;
+
+	prepare_sysctrl_command(&command, cmd, &request,
+				sizeof(request), &response, sizeof(response));
+	guard(xe_pm_runtime)(xe);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret)
+		return ret;
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe,
+		       "[RAS][SET_HEALTH]: invalid Sysctrl response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EPROTO;
+	}
+
+	ras_status = ras_status_to_errno(response.operation_status);
+	if (ras_status) {
+		xe_err(xe,
+		       "[RAS][SET_HEALTH]: cmd 0x%x failed: fw_status=%u errno=%pe\n",
+		       cmd, response.operation_status, ERR_PTR(ras_status));
+		return ras_status;
+	}
+
+	if (response.current_health > XE_RAS_HEALTH_STATUS_CRITICAL) {
+		xe_err(xe, "[RAS][SET_HEALTH]: invalid health state %u from Sysctrl\n",
+		       response.current_health);
+		return -EPROTO;
+	}
+
+	health = (enum xe_ras_health_status)response.current_health;
+
+	xe_dbg(xe, "[RAS][SET_HEALTH]: current GPU health state=%d (%s)\n",
+	       health, gpu_health_states[health]);
+
+	return count;
+}
+
+static struct device_attribute dev_attr_gpu_health_rw =
+	__ATTR_RW_MODE(gpu_health, 0600);
+
+static struct device_attribute dev_attr_gpu_health_ro =
+	__ATTR_RO_MODE(gpu_health, 0400);
+
+static struct device_attribute *gpu_health_attr(struct xe_device *xe)
+{
+	return IS_SRIOV_VF(xe) ? &dev_attr_gpu_health_ro : &dev_attr_gpu_health_rw;
+}
+
+static void gpu_health_sysfs_fini(void *arg)
+{
+	struct device *dev = arg;
+	struct xe_device *xe = kdev_to_xe_device(dev);
+
+	device_remove_file(dev, gpu_health_attr(xe));
+}
+
+static int gpu_health_indicator_sysfs_init(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	int err;
+
+	err = device_create_file(dev, gpu_health_attr(xe));
+	if (err)
+		return err;
+
+	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+/**
+ * xe_ras_init - Initialize Xe RAS
+ * @xe: xe device instance
+ *
+ * Initialize Xe RAS
+ */
+void xe_ras_init(struct xe_device *xe)
+{
+	int ret;
+
+	if (!xe->info.has_sysctrl)
+		return;
+
+	ret = gpu_health_indicator_sysfs_init(xe);
+	if (ret)
+		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
new file mode 100644
index 000000000000..14cb973603e7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_H_
+#define _XE_RAS_H_
+
+struct xe_device;
+
+void xe_ras_init(struct xe_device *xe);
+
+#endif
-- 
2.34.1

