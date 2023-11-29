Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2B1C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 14:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5592F10E205;
	Wed, 29 Nov 2023 14:11:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5115E10E1F6
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 14:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701267058; x=1732803058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YNIq0Ap6nqD3oPqGm76Hm+KZRKf+wCL5tMfpiXXhQes=;
 b=m6Cb2ewF7yGUywQUhzXTXLqLPbhcGQcxKUigEXGL/l8V9Pahdfmv4eci
 x6vMTQQgB94xNMTLCaBCihjwtb2mE8mrt1SwDUEcY/CNjilTNen8yk0k+
 L02BHn2CtIIXCFObHp7PA6Iz7zrGtTDkVapl5MCO356UgN/q7bHlpqJ4G
 NtEazfXQ6bNms9vVRUAbSJ0b8+bouyDEJDCQGxwE1uvExloq5m807fNvz
 6tTbIK6Bgv3npiwf56wt/lZgW66aAnT3aZIDiFZC8VgYIK6sL1PPnBvxQ
 NtJYWB9b1L8ePFu/TjhwsWCpQO7jqm6DSgkgCY5EdMNY9H+4Vn1nW2x7R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="52691"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="52691"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 06:03:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745269777"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="745269777"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 06:03:51 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Nov 2023 19:20:54 +0530
Message-Id: <20231129135054.564076-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231129135054.564076-1-animesh.manna@intel.com>
References: <20231129135054.564076-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 6/6] drm/xe/dsb: DSB implementation for xe
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

Add xe specific DSB buffer handling methods.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |  1 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c | 70 ++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 99c1d2a67ae1..fdbac55ee3bc 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -166,6 +166,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_plane_initial.o \
 	display/xe_display_rps.o \
 	display/xe_display_misc.o \
+	display/xe_dsb_buffer.o \
 	display/intel_fbdev_fb.o \
 	display/ext/i915_irq.o \
 	display/ext/i915_utils.o
diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
new file mode 100644
index 000000000000..dc91eb425e0d
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023, Intel Corporation.
+ */
+
+#include "i915_drv.h"
+#include "i915_vma.h"
+#include "intel_display_types.h"
+#include "intel_dsb_buffer.h"
+#include "xe_bo.h"
+#include "xe_gt.h"
+
+u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buffer *dsb_buf)
+{
+	return xe_bo_ggtt_addr(dsb_buf->vma->bo);
+}
+
+void intel_dsb_buffer_write(struct intel_dsb_buffer *dsb_buf, u32 idx, u32 val)
+{
+	iosys_map_wr(&dsb_buf->vma->bo->vmap, idx * 4, u32, val);
+}
+
+u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb_buf, u32 idx)
+{
+	return iosys_map_rd(&dsb_buf->vma->bo->vmap, idx * 4, u32);
+}
+
+void intel_dsb_buffer_memset(struct intel_dsb_buffer *dsb_buf, u32 idx, u32 val, size_t size)
+{
+	WARN_ON(idx > (dsb_buf->buf_size - size) / sizeof(*dsb_buf->cmd_buf));
+
+	iosys_map_memset(&dsb_buf->vma->bo->vmap, idx * 4, val, size);
+}
+
+bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_buffer *dsb_buf, size_t size)
+{
+	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_gem_object *obj;
+	struct i915_vma *vma;
+
+	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+
+	obj = xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
+				   NULL, PAGE_ALIGN(size),
+				   ttm_bo_type_kernel,
+				   XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
+				   XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(obj)) {
+		kfree(dsb_buf->vma);
+		return false;
+	}
+
+	vma->bo = obj;
+	dsb_buf->vma = vma;
+	dsb_buf->buf_size = size;
+
+	return true;
+}
+
+void intel_dsb_buffer_cleanup(struct intel_dsb_buffer *dsb_buf)
+{
+	xe_bo_unpin_map_no_vm(dsb_buf->vma->bo);
+	kfree(dsb_buf->vma);
+}
+
+void intel_dsb_buffer_flush_map(struct intel_dsb_buffer *dsb_buf)
+{
+	/* TODO: add xe specific flush_map() for dsb buffer object. */
+}
+
-- 
2.29.0

