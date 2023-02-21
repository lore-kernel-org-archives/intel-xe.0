Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82EBC678D5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 19:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87810E357;
	Tue, 21 Feb 2023 19:41:20 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6CD10E366
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677008478; x=1708544478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0+Eg8qLRXK3B+uc4QJ9UrFwSASQ+iSRAO4lsxkAiakI=;
 b=huaegOC6Upp6k8oL3ud2yvUf//Hp4RyXF9aMDnvJ+csPXFQ8qxylCyDo
 +W+hkQbgGn+1QXa3kCsqmD3Vz3H74KdeaZa4xWbINKEJGNHjyPD7nybSi
 rrsMFBSzVeWORzCWHvJ5IuICpBY6facIZy5sjyMCaoPB8o0iTlnFILij2
 QWLYuBlv8VpAB7Bp3daZmyDDsM1a9vwR6mvJBjj0S8J9Sm4kMzC2qZ+s9
 zdh5tGQGhm+uj74ZBxF1Ej+uRj2gHWr7dlW69E3BWgfd9kXnaABCk6gCf
 68jNKfTuqJUenuO+/7Ezky5W8Kt+MvG6PDtW8mBrsH096RMGwcjtUQiqx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332735698"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332735698"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621622197"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="621622197"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 11:39:53 -0800
Message-Id: <20230221194002.819026-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221194002.819026-1-lucas.demarchi@intel.com>
References: <20230221194002.819026-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 04/13] drm/xe: Remove dependency on
 intel_engine_regs.h
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

Create regs/xe_engine_regs.h file with all the registers and bit
definitions used by the xe driver. Eventually the registers may be
defined in a different way and since xe doesn't supported below gen12,
the number of registers touched is much smaller, so create a new header.

The definitions themselves are direct copy from the
gt/intel_engine_regs.h file, just sorting the registers by address.
Cleaning those up and adhering to a common coding style is left for
later.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 98 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c          |  5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c             |  2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c           |  2 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c    |  2 +-
 drivers/gpu/drm/xe/xe_wa.c               |  2 +-
 9 files changed, 109 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_engine_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
new file mode 100644
index 000000000000..6dfa3cf2fd43
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_ENGINE_REGS_H_
+#define _XE_ENGINE_REGS_H_
+
+#include <asm/page.h>
+
+#include "i915_reg_defs.h"
+
+#define RING_TAIL(base)				_MMIO((base) + 0x30)
+
+#define RING_HEAD(base)				_MMIO((base) + 0x34)
+#define   HEAD_ADDR				0x001FFFFC
+
+#define RING_START(base)			_MMIO((base) + 0x38)
+
+#define RING_CTL(base)				_MMIO((base) + 0x3c)
+#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
+#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
+
+#define RING_PSMI_CTL(base)			_MMIO((base) + 0x50)
+#define   GEN8_RC_SEMA_IDLE_MSG_DISABLE			REG_BIT(12)
+#define   GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
+
+#define RING_ACTHD_UDW(base)			_MMIO((base) + 0x5c)
+#define RING_DMA_FADD_UDW(base)			_MMIO((base) + 0x60)
+#define RING_IPEIR(base)			_MMIO((base) + 0x64)
+#define RING_IPEHR(base)			_MMIO((base) + 0x68)
+#define RING_ACTHD(base)			_MMIO((base) + 0x74)
+#define RING_DMA_FADD(base)			_MMIO((base) + 0x78)
+#define RING_HWS_PGA(base)			_MMIO((base) + 0x80)
+#define IPEIR(base)				_MMIO((base) + 0x88)
+#define IPEHR(base)				_MMIO((base) + 0x8c)
+#define RING_HWSTAM(base)			_MMIO((base) + 0x98)
+#define RING_MI_MODE(base)			_MMIO((base) + 0x9c)
+#define RING_NOPID(base)			_MMIO((base) + 0x94)
+
+#define RING_IMR(base)				_MMIO((base) + 0xa8)
+#define   RING_MAX_NONPRIV_SLOTS  12
+
+#define RING_EIR(base)				_MMIO((base) + 0xb0)
+#define RING_EMR(base)				_MMIO((base) + 0xb4)
+#define RING_ESR(base)				_MMIO((base) + 0xb8)
+#define RING_BBADDR(base)			_MMIO((base) + 0x140)
+#define RING_BBADDR_UDW(base)			_MMIO((base) + 0x168)
+#define RING_EXECLIST_STATUS_LO(base)		_MMIO((base) + 0x234)
+#define RING_EXECLIST_STATUS_HI(base)		_MMIO((base) + 0x234 + 4)
+
+#define RING_CONTEXT_CONTROL(base)		_MMIO((base) + 0x244)
+#define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
+#define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
+
+#define RING_MODE_GEN7(base)			_MMIO((base) + 0x29c)
+#define   GEN11_GFX_DISABLE_LEGACY_MODE		(1 << 3)
+
+#define RING_TIMESTAMP(base)			_MMIO((base) + 0x358)
+
+#define RING_TIMESTAMP_UDW(base)		_MMIO((base) + 0x358 + 4)
+#define   RING_VALID_MASK			0x00000001
+#define   RING_VALID				0x00000001
+#define   STOP_RING				REG_BIT(8)
+#define   TAIL_ADDR				0x001FFFF8
+
+#define RING_CTX_TIMESTAMP(base)		_MMIO((base) + 0x3a8)
+
+#define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4d0) + (i) * 4)
+#define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
+#define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
+#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)
+#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	(1 << 28)
+#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	(2 << 28)
+#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	(3 << 28)
+#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	(3 << 28)
+#define   RING_FORCE_TO_NONPRIV_RANGE_1		(0 << 0)
+#define   RING_FORCE_TO_NONPRIV_RANGE_4		(1 << 0)
+#define   RING_FORCE_TO_NONPRIV_RANGE_16	(2 << 0)
+#define   RING_FORCE_TO_NONPRIV_RANGE_64	(3 << 0)
+#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	(3 << 0)
+#define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_MASK | \
+						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
+						 RING_FORCE_TO_NONPRIV_DENY)
+#define   RING_MAX_NONPRIV_SLOTS  12
+
+#define RING_EXECLIST_SQ_CONTENTS(base)		_MMIO((base) + 0x510)
+
+#define RING_EXECLIST_CONTROL(base)		_MMIO((base) + 0x550)
+#define	  EL_CTRL_LOAD				REG_BIT(0)
+
+#define VDBOX_CGCTL3F10(base)			_MMIO((base) + 0x3f10)
+#define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
+
+#define VDBOX_CGCTL3F18(base)			_MMIO((base) + 0x3f18)
+#define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 366379d3dfa8..797f7d41fc39 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_engine_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine.h"
@@ -19,7 +20,6 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 
-#include "gt/intel_engine_regs.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_lrc_reg.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index a4e947f0c557..49b64b9fc228 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -5,8 +5,11 @@
 
 #include "xe_guc_ads.h"
 
+#include "xe_guc_ads.h"
+
 #include <drm/drm_managed.h>
 
+#include "regs/xe_engine_regs.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
@@ -17,9 +20,9 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 
-#include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 
+
 /* Slack of a few additional entries per engine */
 #define ADS_REGSET_EXTRA_MAX	8
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1ca7a89b4fbd..749b083aea8a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_engine_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_execlist.h"
@@ -21,7 +22,6 @@
 #include "xe_sched_job.h"
 #include "xe_wa.h"
 
-#include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 #include "i915_reg.h"
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index ed6fcf7620e1..887d9189fcec 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -5,6 +5,7 @@
 
 #include "xe_lrc.h"
 
+#include "regs/xe_engine_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine_types.h"
@@ -13,7 +14,6 @@
 #include "xe_map.h"
 #include "xe_vm.h"
 
-#include "gt/intel_engine_regs.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_lrc_reg.h"
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 9b56c88a8022..8cd27ac590e7 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -8,13 +8,13 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include "regs/xe_engine_regs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
 
-#include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 #include "i915_reg.h"
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 2de576c5fa74..2932729091e8 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -12,6 +12,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "regs/xe_engine_regs.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -20,7 +21,6 @@
 #include "xe_mmio.h"
 #include "xe_rtp_types.h"
 
-#include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 
 #define XE_REG_SR_GROW_STEP_DEFAULT	16
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index f6ce801215e7..5aa73c1c4097 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -5,11 +5,11 @@
 
 #include "xe_reg_whitelist.h"
 
+#include "regs/xe_engine_regs.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
 
-#include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 
 #undef _MMIO
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 9d2e4555091c..92065341c001 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -7,6 +7,7 @@
 
 #include <linux/compiler_types.h>
 
+#include "regs/xe_engine_regs.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -16,7 +17,6 @@
 #include "xe_rtp.h"
 #include "xe_step.h"
 
-#include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 #include "i915_reg.h"
 
-- 
2.39.0

