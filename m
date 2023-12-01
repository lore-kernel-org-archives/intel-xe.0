Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17415C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 09:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD2410E0C4;
	Fri,  1 Dec 2023 09:27:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B672210E82D
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 09:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701422822; x=1732958822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=psTBjLuozQSjccYvVgatmdwNt58lWx1KbcigF5QY0Wk=;
 b=a6B4XPTBzRhDAU/TYILtDJ8zT6Qp0+lYq13FvJwS0Sdfjzt1hkCMsMFy
 uiYonvhgcVDLnC0JS4cZO3TgW6fwVoFrCDdzd8OSvlrYPssdfGr0MTcAm
 HkPuUI2oO/YvmJ5tK7XJDEAYXsk7+FM6LGGyTBa6g9iJzePIXVzv0yqRc
 raY2mddl0mBegKnV1hv7TXSb/NVWx0bsC2kCu8bxzE5RvcLq53/h7sWWh
 74Pa+4sEIyzkMqgCujzcahhIcNgn2b4df8he/RJq1XuAiESqd1dFyk1DZ
 RAuL8VvyfZz8P2/UbvkeCyCkjc1/pTi3krFj45se1V7o8KG49Apc+6cAu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="378499160"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="378499160"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 01:27:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="798655839"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="798655839"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga008.jf.intel.com with ESMTP; 01 Dec 2023 01:27:01 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 14:44:05 +0530
Message-Id: <20231201091405.658548-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231201091405.658548-1-animesh.manna@intel.com>
References: <20231201091405.658548-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 6/6] drm/xe/dsb: DSB implementation for xe
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

v1: Initial version.
v2: Add null check after dynamic memory allocation of vma. [Uma]

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |  1 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c | 71 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 666024f316f6..87f3fca0c0ee 100644
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
index 000000000000..27c2fb1c002a
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -0,0 +1,71 @@
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
+	if (!vma)
+		return false;
+
+	obj = xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
+				   NULL, PAGE_ALIGN(size),
+				   ttm_bo_type_kernel,
+				   XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
+				   XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(obj)) {
+		kfree(vma);
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
-- 
2.29.0

