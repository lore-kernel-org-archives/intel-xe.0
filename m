Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DB3C64ED8
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 00:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C6B10E3C9;
	Fri, 17 Feb 2023 00:53:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D0B10E3BB
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 00:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676595185; x=1708131185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=is9DUWs5/NfzTGqthCmLdSCZRXK7xqxfeNwiNsU3POE=;
 b=InwNs+QPNIp9gS2cw5SAFuoKvHAGlQU0aCpsvdT1w3wJWHD7cPfBW+87
 iiSabSh88YJup8Y+neWWL3Puc2sqz9BcwwFI2HUdUul9J2tehTKWcvFx2
 hccwm6Z8nT/WV6W5jojKutxiItN5eNKMkw3ke3Ss1jziWKAO9NrsXmn1i
 yITA1MT4pLY606xe9OyZQK8xos14+B0slp/DrDUNIhHVTzqmh8f8IlZGo
 8nHomlIv8fYBY43CoTgreI1PvNbxE5YhPARxyEBMDpG+LYZjDr0xzZZSx
 HpxytVJxz/t40FsO/97uKpzzhatkM6b3kQyPmXnMe87qIlFNCl72K/JDy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329602203"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="329602203"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672417784"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="672417784"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 16:52:21 -0800
Message-Id: <20230217005226.106499-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217005226.106499-1-lucas.demarchi@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/11] drm/xe: Remove dependency on
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
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
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
index b426f8000070..ea551dc922cc 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -7,6 +7,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_engine_regs.h"
+#include "regs/xe_lrc_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -21,7 +22,6 @@
 #include "xe_sched_job.h"
 
 #include "gt/intel_gpu_commands.h"
-#include "gt/intel_lrc_reg.h"
 #include "i915_reg.h"
 
 #define XE_EXECLIST_HANG_LIMIT 1
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 305a0e061778..451c9e1c43ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_lrc_regs.h"
 #include "xe_device.h"
 #include "xe_engine.h"
 #include "xe_force_wake.h"
@@ -30,8 +31,6 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
-#include "gt/intel_lrc_reg.h"
-
 static struct xe_gt *
 guc_to_gt(struct xe_guc *guc)
 {
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8e341d11f2e3..af6fe47a0495 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -5,6 +5,7 @@
 #include "xe_lrc.h"
 
 #include "regs/xe_engine_regs.h"
+#include "regs/xe_lrc_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -15,7 +16,6 @@
 #include "xe_vm.h"
 
 #include "gt/intel_gpu_commands.h"
-#include "gt/intel_lrc_reg.h"
 #include "i915_reg.h"
 
 #define GEN8_CTX_VALID				(1 << 0)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a7ab0d4451f0..0a1e32ab9758 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -4,6 +4,7 @@
  */
 #include "xe_ring_ops.h"
 
+#include "regs/xe_lrc_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_engine_types.h"
 #include "xe_gt.h"
@@ -13,7 +14,6 @@
 #include "xe_vm_types.h"
 
 #include "gt/intel_gpu_commands.h"
-#include "gt/intel_lrc_reg.h"
 #include "i915_reg.h"
 
 static u32 preparser_disable(bool state)
-- 
2.39.0

