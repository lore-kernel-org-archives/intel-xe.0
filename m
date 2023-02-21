Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3005CC678DB
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 19:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34A010E831;
	Tue, 21 Feb 2023 19:41:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D754810E803
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677008478; x=1708544478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0/umr1bNn389M0DWm5cPCld5j1aff7A7Q96n7x12zxM=;
 b=RaJKXI1OuDeyBWAMUKfBEkDxfrbEXTJMkxISIH7kZVuSnx4sg8xyYmce
 Vz6YiS9CB6Ot1VSorjeF6PLaoDuKSWxsuy8GSIA8w/QI5OAvPci1arPxw
 MBfB49XVIlvdUKAmilLIRjv4l1BI/pNpR4+Hs3LB6bZboBlpkbtXMMibi
 HeQGDBPpIC4ErgTG6xHN1NRShAh0lrNFebY9gKjqvTZ0AcJkTJWX6omPl
 gcOZzsRSHFQDLo31HcsHGH4biXRgcQ0VqIEIVX2nOOrhf8qIEHefOUfWf
 zCHogsR3RnDd3j0I588CcTXGHUsyTMjh0xYZlG92fqWpMw2sMt21aynkO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332735701"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332735701"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621622205"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="621622205"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 11:39:55 -0800
Message-Id: <20230221194002.819026-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221194002.819026-1-lucas.demarchi@intel.com>
References: <20230221194002.819026-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 06/13] drm/xe: Remove dependency on
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
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Create regs/xe_lrc_regs.h file with all the registers used by the xe
driver. Eventually the registers may be defined in a different way and
since xe doesn't supported below gen12, the number of registers touched
is much smaller, so create a new header.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_regs.h | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_execlist.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c    |  3 +--
 drivers/gpu/drm/xe/xe_lrc.c           |  2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c      |  2 +-
 5 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_lrc_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_regs.h b/drivers/gpu/drm/xe/regs/xe_lrc_regs.h
new file mode 100644
index 000000000000..e8a13fa6722b
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_regs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_LRC_REGS_H_
+#define _XE_LRC_REGS_H_
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
index 8a7e0d86fed9..84d3db9c8518 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_engine_regs.h"
+#include "regs/xe_lrc_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -22,7 +23,6 @@
 #include "xe_sched_job.h"
 
 #include "gt/intel_gpu_commands.h"
-#include "gt/intel_lrc_reg.h"
 #include "i915_reg.h"
 
 #define XE_EXECLIST_HANG_LIMIT 1
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index aca41ecedf7d..fb0b6a8a742a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_lrc_regs.h"
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
index bf12f71fbe72..a6b1453ccf9c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -6,6 +6,7 @@
 #include "xe_lrc.h"
 
 #include "regs/xe_engine_regs.h"
+#include "regs/xe_lrc_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -16,7 +17,6 @@
 #include "xe_vm.h"
 
 #include "gt/intel_gpu_commands.h"
-#include "gt/intel_lrc_reg.h"
 #include "i915_reg.h"
 
 #define GEN8_CTX_VALID				(1 << 0)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 61f22bcec82c..663910712035 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -5,6 +5,7 @@
 
 #include "xe_ring_ops.h"
 
+#include "regs/xe_lrc_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_engine_types.h"
 #include "xe_gt.h"
@@ -14,7 +15,6 @@
 #include "xe_vm_types.h"
 
 #include "gt/intel_gpu_commands.h"
-#include "gt/intel_lrc_reg.h"
 #include "i915_reg.h"
 
 static u32 preparser_disable(bool state)
-- 
2.39.0

