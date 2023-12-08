Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C063C10F04
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C00D10E9D1;
	Fri,  8 Dec 2023 06:43:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189A710E9D1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017815; x=1733553815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dIhFT/Enz6I8hh62nMBU4kZ8G/clTe7m8TWxoMUnAi8=;
 b=VsPolBOcm4wh4AD2TpUzr0D5cqgEQF7R2MRccMdqj2IpKbnhwreMrdA8
 N6GgqyyZ/hmArxw+zYJZzqRlp26iXfGRJJYA5Cu7rIpKlUwA9WmoSOLWb
 B3CnSTm6wDudl1X23343LQnCkpub7FEELHaHsLw8yx6ivTHvK5Bb9H3hu
 AO58L3Y3NeWAsDgjKjsymi5IECQyHmx0zdmnMPunWqQiCyZrf0GX/evC/
 Y7DM7E8P4SEqumAkqPPo6al8/9YlY0TeG/WAgiAtUT+3yMDxLzgKgI4TB
 dKS4RhIgsBS/eHiBHN3qjjHcYXYIEuN9+wGnMd1q8XZHYLNLaGf6HsuQv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866602"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866602"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699223"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699223"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:34 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/17] drm/xe/perf/uapi: "Perf" layer to support multiple perf
 counter stream types
Date: Thu,  7 Dec 2023 22:43:13 -0800
Message-ID: <20231208064329.2387604-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Acked-by: Guy Zadicario <gzadicario@habana.ai>
---
 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  2 ++
 drivers/gpu/drm/xe/xe_perf.c   | 21 +++++++++++++
 drivers/gpu/drm/xe/xe_perf.h   | 16 ++++++++++
 include/uapi/drm/xe_drm.h      | 56 ++++++++++++++++++++++++++++++++++
 5 files changed, 96 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 87f3fca0c0ee7..b719953d9d30f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -101,6 +101,7 @@ xe-y += xe_bb.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
+	xe_perf.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8423c817111bf..35616d1a81a31 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -31,6 +31,7 @@
 #include "xe_module.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
+#include "xe_perf.h"
 #include "xe_pm.h"
 #include "xe_query.h"
 #include "xe_tile.h"
@@ -126,6 +127,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
new file mode 100644
index 0000000000000..a130076b59aa2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/errno.h>
+
+#include "xe_perf.h"
+
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
index 0000000000000..254cc7cf49fef
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_perf.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PERF_H_
+#define _XE_PERF_H_
+
+#include <drm/xe_drm.h>
+
+struct drm_device;
+struct drm_file;
+
+int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+
+#endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index eb03a49c17a13..3539e0781d700 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -108,6 +108,8 @@ struct xe_user_extension {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_PERF			0x0f
+
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -122,6 +124,7 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
 
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
@@ -1119,6 +1122,59 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
 #define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 3)
 
+/**
+ * enum drm_xe_perf_type - Perf stream types
+ */
+enum drm_xe_perf_type {
+	DRM_XE_PERF_TYPE_MAX,
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
+ * struct drm_xe_perf_param - Perf layer param
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
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

