Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151ACF8A152
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 09:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A2910E023;
	Thu, 16 Apr 2026 09:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jilRAQ6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC65510E184
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776332969; x=1807868969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lbdHEqDPSCZPnIeX3syVEX2jgt0SZhvjPdY5N/8AamM=;
 b=jilRAQ6tX2jJAwxjQ1GqyUaGgAsbKmvy6AoyXj4Gl5hVOeHz1JCLwb2c
 1/y/Px4ZaziuHXTsdPOCxKiPKO1MMaHuXdWZz11Vlw9UEZa1HyynKfLy8
 cqm06YGjhmuqp1ouh8S2isuE8yWvcs61Vh51Hd5s42P6knvG8Lgj0R/WM
 qry3IH/KvzthoQjbkEYtjlR3FCG0p7g2eKnOarZB90RCD/F3D4xXUWzqo
 uy84B4ur04irfD1IaYZsUkb05ndySYqfoD2F91Idg72X4FsCKmgv3SsA/
 w48deIgkBeckwMnzK0ogG9TUTUPlqt/GNS0Mzvht6BiyWSP50GhdU6JVT w==;
X-CSE-ConnectionGUID: LQatEtqaRPelOyTX9ovd4A==
X-CSE-MsgGUID: rBR6D825RDeguUEeDMeNeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76360095"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="76360095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:49:28 -0700
X-CSE-ConnectionGUID: QJNmdQO1SGqRbNCUSEFO6w==
X-CSE-MsgGUID: Nmyooaz0QOyH7VyBeANzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235068595"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:43:39 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v1 2/2] drm/xe/xe_ras: Add RAS support for GPU health indicator
Date: Thu, 16 Apr 2026 15:06:10 +0530
Message-Id: <20260416093610.4085667-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260416093610.4085667-1-soham.purkait@intel.com>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
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

v1:
 - gpu_health is read-write on PFs and native functions. It is read-only
   on VFs. VF write attempts are rejected.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_device.c |   3 +
 drivers/gpu/drm/xe/xe_ras.c    | 181 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h    |  13 +++
 4 files changed, 198 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e42e582aca5c..4bf98c3c9b25 100644
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
index 000000000000..925ef7738e6b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_printk.h"
+#include "xe_ras.h"
+#include "xe_ras_types.h"
+#include "xe_sriov.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+
+static const char * const gpu_health_states[] = { "ok", "warning", "critical" };
+static const char * const gpu_health_fmt[] = {
+	"[%s] %s %s\n",
+	"%s [%s] %s\n",
+	"%s %s [%s]\n",
+};
+
+static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
+				    u32 cmd_mask, void *request, size_t request_len,
+				    void *response, size_t response_len)
+{
+	struct xe_sysctrl_app_msg_hdr hdr = {0};
+	u32 req_hdr;
+
+	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
+		  FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
+
+	hdr.data = req_hdr;
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
+	u8 health;
+	int ret;
+	size_t rlen = 0;
+
+	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_HEALTH, &request,
+				sizeof(request), &response, sizeof(response));
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
+		return -EIO;
+	}
+	if (rlen != sizeof(response)) {
+		xe_err(xe,
+		       "[RAS]: invalid Sysctrl response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+	if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
+		xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
+		       response.current_health);
+		return -EIO;
+	}
+
+	health = response.current_health;
+
+	xe_dbg(xe, "[RAS]: current GPU health state = %d (%s)\n",
+	       health, gpu_health_states[health]);
+
+	return sysfs_emit(buf, gpu_health_fmt[health],
+			  gpu_health_states[0],
+			  gpu_health_states[1],
+			  gpu_health_states[2]);
+}
+
+static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_health_set_input request = {0};
+	struct xe_ras_health_set_response response = {0};
+	u8 health;
+	int ret;
+	size_t rlen = 0;
+	int state;
+
+	if (IS_SRIOV_VF(xe)) {
+		xe_dbg(xe, "[RAS]: GPU health state update rejected on VF\n");
+		return -EPERM;
+	}
+
+	state = sysfs_match_string(gpu_health_states,
+				   buf);
+	if (state < 0)
+		return -EINVAL;
+
+	request.new_health = (xe_ras_health_status_t)state;
+
+	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_SET_HEALTH, &request,
+				sizeof(request), &response, sizeof(response));
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
+		return -EIO;
+	}
+	if (rlen != sizeof(response)) {
+		xe_err(xe,
+		       "[RAS]: invalid Sysctrl response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+	if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
+		xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
+		       response.current_health);
+		return -EIO;
+	}
+
+	health = response.current_health;
+
+	xe_dbg(xe, "[RAS]: current GPU health state=%d (%s)\n",
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
+static void gpu_health_indicator_sysfs_init(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	int err;
+
+	err = device_create_file(dev, gpu_health_attr(xe));
+	if (err)
+		goto err;
+
+	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
+	if (err)
+		goto err;
+
+	return;
+
+err:
+	xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", err);
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
+	if (!xe->info.has_sysctrl)
+		return;
+
+	gpu_health_indicator_sysfs_init(xe);
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

