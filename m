Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5557C2BB85
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 22:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6780C10E51C;
	Mon, 17 Jun 2024 22:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+vxX5Dx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88B10E522
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 22:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718663820; x=1750199820;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=S1bQkjflw23B7MTTY8WVGgcuvI3khz/tOy6+G0b+tTM=;
 b=g+vxX5Dxu6P/CDh9408YF7nnv2XV2kEhpzVXTTpbadu8Pl1z1Re2IBHI
 e70GGsuua/rWY57AVfB2T+Cvy60fNuja15Ow7Sk9h7EeBvtBhgU/FtZC2
 eOyk4xupzyRHpPX2MaLCM+v6BARAA31LKDt4szMUTTvppLhyLRLF/pDvx
 FZBz7pUi+wpqpXLFtYrg5dEM2/nfh7t08k0pLf+jgQE0rfoQsKDimjPHK
 Loi3DQesFF2qCdf5v2n5BhjVY9jg+l6fkJpecwy8i3pxLJaPFDm8w5tlg
 QlZl7gdiGPhfRODBpUmpzlJfxIqgm3MEOqsKlNf+wZp4TO0IWap88eYQq g==;
X-CSE-ConnectionGUID: aVnSy+85RoOKVAQIY8n2Qg==
X-CSE-MsgGUID: keNHhuWdTsGy0ViFTDtWAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18428969"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="18428969"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:36:59 -0700
X-CSE-ConnectionGUID: TXCibMFgQ6WAuXh6XLWTxA==
X-CSE-MsgGUID: 491D76cVS+m2oCztGRTSnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="72090769"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:36:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/17] drm/xe/perf/uapi: "Perf" layer to support multiple perf
 counter stream types
Date: Mon, 17 Jun 2024 15:36:35 -0700
Message-ID: <20240617223651.3220399-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
References: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
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

In Xe, the plan is to support multiple types of perf counter streams (OA is
only one type of these streams). Rather than introduce NxM ioctls for
these (N perf streams with M ioctl's per perf stream), we decide to
multiplex these (N different stream types and the M ops for each of these
stream types) through a single PERF ioctl. This multiplexing is the purpose
of the PERF layer.

In addition to PERF DRM ioctl's, another set of ioctl's on the PERF fd are
defined. These are expected to be common to different PERF stream types and
therefore defined at the PERF layer itself.

v2: Add param_size to 'struct drm_xe_perf_param' (Umesh)
v3: Rename 'enum drm_xe_perf_ops' to
    'enum drm_xe_perf_ioctls' (Guy Zadicario)
    Add DRM_ prefix to ioctl names to indicate uapi names
v4: Add 'enum drm_xe_perf_op' previously missed out (Guy Zadicario)
v5: Squash the ops and PERF layer patches into a single patch (Umesh)
    Remove param_size from struct 'drm_xe_perf_param' (Umesh)
v6: Add DRM_XE_PERF_IOCTL_STATUS
v7: Add DRM_XE_PERF_IOCTL_INFO
v8: Fix Copyright years, fix DRM_XE_PERF_TYPE_MAX, move '#include
    "xe_perf.h"' to xe_perf.c, add kernel doc (Michal)

Acked-by: Guy Zadicario <gzadicario@habana.ai>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  2 ++
 drivers/gpu/drm/xe/xe_perf.c   | 34 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_perf.h   | 14 ++++++++
 include/uapi/drm/xe_drm.h      | 66 ++++++++++++++++++++++++++++++++++
 5 files changed, 117 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cbf961b90237..f99492449e5d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -95,6 +95,7 @@ xe-y += xe_bb.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
+	xe_perf.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 64691a56d59c..a44093cbbb71 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -44,6 +44,7 @@
 #include "xe_module.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
+#include "xe_perf.h"
 #include "xe_pm.h"
 #include "xe_query.h"
 #include "xe_sriov.h"
@@ -141,6 +142,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
new file mode 100644
index 000000000000..2963174ecd0e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include <linux/errno.h>
+
+#include <drm/xe_drm.h>
+
+#include "xe_perf.h"
+
+/**
+ * xe_perf_ioctl - The top level perf layer ioctl
+ * @dev: @drm_device
+ * @data: pointer to struct @drm_xe_perf_param
+ * @file: @drm_file
+ *
+ * The function is called for different perf streams types and allows execution
+ * of different operations supported by those perf stream types.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_xe_perf_param *arg = data;
+
+	if (arg->extensions)
+		return -EINVAL;
+
+	switch (arg->perf_type) {
+	default:
+		return -EINVAL;
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
new file mode 100644
index 000000000000..e7e258eaf0a9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_perf.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_PERF_H_
+#define _XE_PERF_H_
+
+struct drm_device;
+struct drm_file;
+
+int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+
+#endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d7b0903c22b2..c1626027dc69 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -80,6 +80,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
+ *  - &DRM_IOCTL_XE_PERF
  */
 
 /*
@@ -100,6 +101,8 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_PERF			0x0b
+
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -113,6 +116,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1370,6 +1374,68 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/**
+ * enum drm_xe_perf_type - Perf stream types
+ */
+enum drm_xe_perf_type {
+	__DRM_XE_PERF_TYPE_MAX, /* non-ABI */
+};
+
+/**
+ * enum drm_xe_perf_op - Perf stream ops
+ */
+enum drm_xe_perf_op {
+	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
+	DRM_XE_PERF_OP_STREAM_OPEN,
+
+	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
+	DRM_XE_PERF_OP_ADD_CONFIG,
+
+	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
+	DRM_XE_PERF_OP_REMOVE_CONFIG,
+};
+
+/**
+ * struct drm_xe_perf_param - Input of &DRM_XE_PERF
+ *
+ * The perf layer enables multiplexing perf counter streams of multiple
+ * types. The actual params for a particular stream operation are supplied
+ * via the @param pointer (use __copy_from_user to get these params).
+ */
+struct drm_xe_perf_param {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
+	__u64 perf_type;
+	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
+	__u64 perf_op;
+	/** @param: Pointer to actual stream params */
+	__u64 param;
+};
+
+/**
+ * enum drm_xe_perf_ioctls - Perf fd ioctl's
+ *
+ * Information exchanged between userspace and kernel for perf fd ioctl's
+ * is stream type specific
+ */
+enum drm_xe_perf_ioctls {
+	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
+	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
+
+	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
+	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
+
+	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
+	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
+
+	/** @DRM_XE_PERF_IOCTL_STATUS: Return stream status */
+	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
+
+	/** @DRM_XE_PERF_IOCTL_INFO: Return stream info */
+	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

