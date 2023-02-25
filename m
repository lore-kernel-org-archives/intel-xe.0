Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B57C7EE30
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D6010E5E3;
	Sat, 25 Feb 2023 00:16:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FFC10E127
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284188; x=1708820188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i3LmIDOtISLyP57g1wgsLVLEkDyHheO4YHwXanDIEWU=;
 b=RkJeE/nuS9QuthdrHEYTKcJr3Dmf4zQ9fFe0oc2lw86+PR5oihS5gmMq
 CF3C6/A1NddiyEQWmDuEbMIzgF4Mo99WX+KKzvBqEFSCHgqSg+QRTuxPl
 rkxZneoQIHouyp2yORW3AvMzY4XW03L69kheNMKFGta7rIoU1V01iIsCn
 NlQvsPpUO6TKMrBlOdftZZ9S+VMH20YF4A1YwRFqvTIZ2knIVu34p7fAG
 j3ThBAH/EZa05cQhFA9vm7eV8ikNDPUHL01dTUmduKXkAjZXwFJh3J2HJ
 rNes0czKk1J6avR8eqNuQGgX/0yQIZ1yjx5OWle/samcesXvL/lSwJmzd A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332297347"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="332297347"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="761956581"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="761956581"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:21 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 16:15:41 -0800
Message-Id: <20230225001548.1743820-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230225001548.1743820-1-lucas.demarchi@intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 05/12] drm/xe: Remove dependency on
 intel_lrc_reg.h
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Create regs/xe_lrc_layout.h file with all the offsets used by the xe
driver. Eventually the xe driver may use a different way to define them
since it doesn't supported below gen12.

v2: Rename file to intel_lrc_layout.h since it's not really about
    registers (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_execlist.c        |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |  3 +--
 drivers/gpu/drm/xe/xe_lrc.c             |  2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c        |  2 +-
 5 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_lrc_layout.h

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
new file mode 100644
index 000000000000..4be81abc86ad
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_LRC_LAYOUT_H_
+#define _XE_LRC_LAYOUT_H_
+
+#define CTX_CONTEXT_CONTROL		(0x02 + 1)
+#define CTX_RING_HEAD			(0x04 + 1)
+#define CTX_RING_TAIL			(0x06 + 1)
+#define CTX_RING_START			(0x08 + 1)
+#define CTX_RING_CTL			(0x0a + 1)
+#define CTX_PDP0_UDW			(0x30 + 1)
+#define CTX_PDP0_LDW			(0x32 + 1)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 8a7e0d86fed9..ba9f72694277 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -9,6 +9,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_lrc_layout.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine.h"
@@ -22,7 +23,6 @@
 #include "xe_sched_job.h"
 
 #include "gt/intel_gpu_commands.h"
-#include "gt/intel_lrc_reg.h"
 #include "i915_reg.h"
 
 #define XE_EXECLIST_HANG_LIMIT 1
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index aca41ecedf7d..5eb11d56e9da 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_lrc_layout.h"
 #include "xe_device.h"
 #include "xe_engine.h"
 #include "xe_force_wake.h"
@@ -31,8 +32,6 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
-#include "gt/intel_lrc_reg.h"
-
 static struct xe_gt *
 guc_to_gt(struct xe_guc *guc)
 {
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index bf12f71fbe72..5baa3cf53852 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -7,6 +7,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_lrc_layout.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine_types.h"
@@ -16,7 +17,6 @@
 #include "xe_vm.h"
 
 #include "gt/intel_gpu_commands.h"
-#include "gt/intel_lrc_reg.h"
 #include "i915_reg.h"
 
 #define GEN8_CTX_VALID				(1 << 0)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 61f22bcec82c..276fc9691986 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -6,6 +6,7 @@
 #include "xe_ring_ops.h"
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_lrc_layout.h"
 #include "xe_engine_types.h"
 #include "xe_gt.h"
 #include "xe_lrc.h"
@@ -14,7 +15,6 @@
 #include "xe_vm_types.h"
 
 #include "gt/intel_gpu_commands.h"
-#include "gt/intel_lrc_reg.h"
 #include "i915_reg.h"
 
 static u32 preparser_disable(bool state)
-- 
2.39.0

