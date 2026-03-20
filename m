Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7D81093181
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B5810E00D;
	Fri, 20 Mar 2026 07:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M65ITi41";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB9810E00D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773991553; x=1805527553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x/fjRXwSYw7XIWlyVnIxZJ3Y6KhNC8DaizwwWcAMLKA=;
 b=M65ITi415in31soJMK45fGA55aDCxJkTanMzwyGKVu9Yxg7kSKjTo4QH
 LuCClP2EGUEEZne8uVZNgo3XXw9qGIjE2P056U3NdZQBRNWMWRa3bTdam
 ZqqZ4ZHi2X+4DfNdCCoryR4qkXsWHOHMZ9oPDZzCXQoH7GRDGEq3W1lY7
 vGAAy09s3ANvtBqgPT/iDO4Nvn9M5lv+VG6UrcEP2XX5bRxxQsodV9m3q
 UlHafcsjsvpdQ08f4OZSYY0ea9Z06SnHGjnH1D38e9pKVGzR9p3qOT3M4
 SF2vNUWSQRMC3DawQoDV4rDw2YYKdFn/lvap55V7pklw5skcxNvS4eEEk A==;
X-CSE-ConnectionGUID: Jm5lLHbeQAa3kXiQ8CCZ8g==
X-CSE-MsgGUID: deXfh7TLQi6h0h6JskBsGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62634653"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="62634653"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:25:53 -0700
X-CSE-ConnectionGUID: nx54dSbRRRaqa2sl2Q2AUw==
X-CSE-MsgGUID: sLcnL591QUymrExun5liDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227335884"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:25:49 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [RFC v1 4/5] drm/xe/fwctl: Add Xe FWCTL infrastructure support
Date: Fri, 20 Mar 2026 00:25:32 -0700
Message-ID: <20260320072528.1780651-11-anoop.c.vijay@intel.com>
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

Add core infrastructure required to support FWCTL subsystem in Xe driver.
This introduces a generic xe_fwctl device context, integrates FWCTL state
into xe_device, and sets up device registration and cleanup.

This provides foundation for future firmware-specific FWCTL handlers.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 Documentation/userspace-api/fwctl/index.rst |   1 +
 drivers/gpu/drm/xe/Kconfig                  |   1 +
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_device.c              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |   4 +
 drivers/gpu/drm/xe/xe_fwctl.c               | 200 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_fwctl.h               |  15 ++
 include/uapi/fwctl/xe.h                     |   4 +
 8 files changed, 231 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_fwctl.h

diff --git a/Documentation/userspace-api/fwctl/index.rst b/Documentation/userspace-api/fwctl/index.rst
index 316ac456ad3b..7ef115216316 100644
--- a/Documentation/userspace-api/fwctl/index.rst
+++ b/Documentation/userspace-api/fwctl/index.rst
@@ -12,3 +12,4 @@ to securely construct and execute RPCs inside device firmware.
    fwctl
    fwctl-cxl
    pds_fwctl
+   xe_fwctl
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..b215ccdc1911 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -46,6 +46,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select REGMAP if I2C
+	select FWCTL
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f9abaf687d46..6d47d5d59cf4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -47,6 +47,7 @@ xe-y += xe_bb.o \
 	xe_exec_queue.o \
 	xe_execlist.o \
 	xe_force_wake.o \
+	xe_fwctl.o \
 	xe_ggtt.o \
 	xe_gpu_scheduler.o \
 	xe_gsc.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c70d4ae413a9..8771c40d1582 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -35,6 +35,7 @@
 #include "xe_exec.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
+#include "xe_fwctl.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
@@ -996,6 +997,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
+	err = xe_fwctl_init(xe);
+	if (err)
+		goto err_unregister_display;
+
 	err = xe_hwmon_register(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 150c76b2acaf..78262e60d7a2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -38,6 +38,7 @@
 struct drm_pagemap_shrinker;
 struct intel_display;
 struct intel_dg_nvm_dev;
+struct xe_fwctl;
 struct xe_ggtt;
 struct xe_i2c;
 struct xe_pat_ops;
@@ -514,6 +515,9 @@ struct xe_device {
 	/** @sc: System Controller */
 	struct xe_sysctrl sc;
 
+	/** @fwctl: FWCTL device for firmware management */
+	struct xe_fwctl *fwctl;
+
 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
 	u32 atomic_svm_timeslice_ms;
 
diff --git a/drivers/gpu/drm/xe/xe_fwctl.c b/drivers/gpu/drm/xe/xe_fwctl.c
new file mode 100644
index 000000000000..72124b5b3c87
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_fwctl.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+/**
+ * DOC: Xe FWCTL
+ *
+ * Xe FWCTL implements generic FWCTL IOCTLs to provide userspace access to
+ * firmware management interfaces on Intel Xe discrete GPUs.
+ *
+ * Driver registers a FWCTL device during xe_device initialization and
+ * dispatches firmware RPCs to an appropriate handler based on firmware_type
+ * field in RPC header.
+ *
+ * Each firmware type implements xe_fw_ops interface, providing:
+ *  - validate_scope(): Validate whether RPC command is allowed for requested
+ *    access scope (CONFIGURATION, DEBUG_READ_ONLY, DEBUG_WRITE_FULL).
+ *  - rpc(): Execute firmware RPC and return response.
+ *
+ * Userspace should first issue FWCTL_INFO ioctl and check capability flags to
+ * determine supported firmware types and commands.
+ *
+ * After verifying support, userspace may issue FWCTL_RPC with input and output
+ * buffers pointing to struct fwctl_rpc_xe or firmware‑specific RPC structure
+ * allocated by userspace. Input and output lengths must match structure size.
+ *
+ * Unsupported or invalid commands return -EBADMSG.
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *
+ *   struct fwctl_info_xe xe_info = {0};
+ *   struct fwctl_info info = {
+ *           .size = sizeof(info),
+ *           .device_data_len = sizeof(xe_info),
+ *           .out_device_data = (uint64_t)&xe_info,
+ *   };
+ *
+ *   int fd = open("/dev/fwctl/fwctl0", O_RDWR);
+ *   ioctl(fd, FWCTL_INFO, &info);
+ *
+ *   struct xe_sysctrl_rpc req = { ... };
+ *   struct xe_sysctrl_rpc resp = {0};
+ *   struct fwctl_rpc rpc = {
+ *           .size = sizeof(struct fwctl_rpc),
+ *           .scope = FWCTL_RPC_DEBUG_READ_ONLY,
+ *           .in_len = sizeof(req),
+ *           .out_len = sizeof(resp),
+ *           .in = (uint64_t)&req,
+ *           .out = (uint64_t)&resp,
+ *   };
+ *
+ *   ioctl(fd, FWCTL_RPC, &rpc);
+ */
+
+#include <linux/fwctl.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+
+#include <uapi/fwctl/fwctl.h>
+#include <uapi/fwctl/xe.h>
+
+#include "xe_device.h"
+#include "xe_fwctl.h"
+#include "xe_fwctl_types.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+
+DEFINE_FREE(xe_fwctl, struct xe_fwctl *, if (_T) fwctl_put(&_T->fwctl))
+
+static const struct xe_fw_ops *fw_ops_table[XE_FW_MAX] = {
+	/* [XE_FW_...] = &ops, */
+};
+
+static int xe_fwctl_uctx_open(struct fwctl_uctx *uctx)
+{
+	struct xe_fwctl *fwctl = container_of(uctx->fwctl,
+					       struct xe_fwctl,
+					       fwctl);
+	struct xe_device *xe = fwctl->xe;
+
+	xe_pm_runtime_get(xe);
+
+	return 0;
+}
+
+static void xe_fwctl_uctx_close(struct fwctl_uctx *uctx)
+{
+	struct xe_fwctl *fwctl = container_of(uctx->fwctl,
+					       struct xe_fwctl,
+					       fwctl);
+	struct xe_device *xe = fwctl->xe;
+
+	xe_pm_runtime_put(xe);
+}
+
+static void *xe_fwctl_info(struct fwctl_uctx *uctx, size_t *length)
+{
+	struct xe_fwctl *fwctl = container_of(uctx->fwctl,
+					      struct xe_fwctl,
+					      fwctl);
+	struct xe_device *xe = fwctl->xe;
+	struct fwctl_info_xe *info;
+
+	info = kzalloc_obj(*info);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	info->fw_caps = 0;
+	info->platform = xe->info.platform;
+
+	*length = sizeof(*info);
+	return info;
+}
+
+static void *xe_fwctl_rpc(struct fwctl_uctx *uctx,
+			  enum fwctl_rpc_scope scope,
+			  void *rpc_in, size_t in_len,
+			  size_t *out_len)
+{
+	struct xe_fwctl *fwctl = container_of(uctx->fwctl,
+					      struct xe_fwctl,
+					      fwctl);
+	struct xe_device *xe = fwctl->xe;
+	const struct fwctl_rpc_xe *hdr = rpc_in;
+	const struct xe_fw_ops *ops;
+	void *resp;
+
+	if (in_len < sizeof(*hdr))
+		return ERR_PTR(-EMSGSIZE);
+
+	if (hdr->firmware_type >= XE_FW_MAX)
+		return ERR_PTR(-EINVAL);
+
+	ops = fw_ops_table[hdr->firmware_type];
+	if (!ops)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (ops->validate_scope &&
+	    !ops->validate_scope(rpc_in, in_len, scope))
+		return ERR_PTR(-EBADMSG);
+
+	resp = ops->rpc(xe, scope, rpc_in, in_len, out_len);
+	if (IS_ERR(resp))
+		xe_err(xe, "FWCTL RPC failed: fw=%s err=%ld\n",
+		       ops->name ?: "unknown", PTR_ERR(resp));
+
+	return resp;
+}
+
+static const struct fwctl_ops xe_fwctl_ops = {
+	.device_type = FWCTL_DEVICE_TYPE_XE,
+	.uctx_size = sizeof(struct xe_fwctl_uctx),
+	.open_uctx = xe_fwctl_uctx_open,
+	.close_uctx = xe_fwctl_uctx_close,
+	.info = xe_fwctl_info,
+	.fw_rpc = xe_fwctl_rpc,
+};
+
+static void xe_fwctl_fini(void *dev)
+{
+	struct xe_fwctl *fwctl = dev;
+
+	fwctl_unregister(&fwctl->fwctl);
+	fwctl_put(&fwctl->fwctl);
+}
+
+/**
+ * xe_fwctl_init() - Initialize FWCTL for Xe device
+ * @xe: xe device instance
+ *
+ * Creates and registers FWCTL device for firmware management.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_fwctl_init(struct xe_device *xe)
+{
+	struct xe_fwctl *fwctl __free(xe_fwctl) =
+		fwctl_alloc_device(xe->drm.dev, &xe_fwctl_ops,
+				   struct xe_fwctl, fwctl);
+
+	int ret;
+
+	if (!fwctl)
+		return -ENOMEM;
+
+	fwctl->xe = xe;
+
+	ret = fwctl_register(&fwctl->fwctl);
+	if (ret)
+		return ret;
+
+	xe->fwctl = fwctl;
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_fwctl_fini,
+					no_free_ptr(fwctl));
+}
+
+MODULE_IMPORT_NS("FWCTL");
diff --git a/drivers/gpu/drm/xe/xe_fwctl.h b/drivers/gpu/drm/xe/xe_fwctl.h
new file mode 100644
index 000000000000..190405720892
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_fwctl.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_FWCTL_H_
+#define _XE_FWCTL_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+int xe_fwctl_init(struct xe_device *xe);
+
+#endif
diff --git a/include/uapi/fwctl/xe.h b/include/uapi/fwctl/xe.h
index fb5612dec610..3720f188a7ec 100644
--- a/include/uapi/fwctl/xe.h
+++ b/include/uapi/fwctl/xe.h
@@ -16,6 +16,10 @@
  * through the kernel FWCTL framework.
  */
 
+enum xe_firmware_type {
+	XE_FW_MAX = 1,
+};
+
 /**
  * struct fwctl_info_xe - FWCTL Information struct for Xe
  *
-- 
2.43.0

