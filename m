Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188C4CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 12:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7258113BA8;
	Fri,  5 Apr 2024 12:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h19SD7jf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50500113BA8
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712320533; x=1743856533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XV+dEatvb0T9GbB7aO+YaUclksVaKezrJhxTovuSr/w=;
 b=h19SD7jf5uepYRL6GZDcPwTX6zBQHd4o0kxQeqK1rcwoAWrXpxSfScA+
 cUGtPLMoPCZ/YcbiXtyUjbOaNZpGIjukfut4Xo+LCJ+IOkJhYh1hLDSRj
 i+/DInRsqk8WWRTp2+4IHteEeJDICSO/Jp/S0vK5hHqK9BIDm3ZtVDsUK
 DAJZbfL3xyBnafPVm8/xWmi1cpvJCZGsJFXK2bqDh7pc/lFeUmhtwBPjr
 +6jeiP34P0bVzFOTF2/8AWS68lIGfbyUUx3MuuVBNSGsgVZ5AZ4y4RXAD
 G34JCdY3lnmCrWiZwQtPBkwGoANaExj7iqbQYYlcdRhDkXMDLgIoyYQ15 A==;
X-CSE-ConnectionGUID: jXw16lJhQcKuhCgBtnUYkA==
X-CSE-MsgGUID: LDqbNHZlRQSqasavvAwuaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7486181"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7486181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:35:32 -0700
X-CSE-ConnectionGUID: GtS9vXl5QlCK6lxqUPJ4kg==
X-CSE-MsgGUID: C4hozGUQR26WqFttoQDYqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23874120"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:35:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Move PTE/PDE bit definitions to proper header
Date: Fri,  5 Apr 2024 14:35:20 +0200
Message-Id: <20240405123520.847-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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

We already have dedicated header for GGTT/PPGTT definitions.
It's also cleaner to separate them from implementation macros.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h         | 21 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h                    | 21 -------------------
 drivers/gpu/drm/xe/xe_migrate.c               |  1 +
 drivers/gpu/drm/xe/xe_pt.c                    |  1 +
 drivers/gpu/drm/xe/xe_vm.c                    |  1 +
 6 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 7132cd5d9545..9693c56d386b 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -6,6 +6,7 @@
 /* for ioread64 */
 #include <linux/io-64-nonatomic-lo-hi.h>
 
+#include "regs/xe_gtt_defs.h"
 #include "xe_ggtt.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 9196d71bad37..558519ce48c7 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -11,4 +11,25 @@
 
 #define GUC_GGTT_TOP		0xFEE00000
 
+#define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
+#define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
+#define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)
+#define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
+#define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
+#define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
+
+#define XE_PDE_PS_2M			BIT_ULL(7)
+#define XE_PDPE_PS_1G			BIT_ULL(7)
+#define XE_PDE_IPS_64K			BIT_ULL(11)
+
+#define XE_GGTT_PTE_DM			BIT_ULL(1)
+#define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
+#define XE_PPGTT_PTE_DM			BIT_ULL(11)
+#define XE_PDE_64K			BIT_ULL(6)
+#define XE_PTE_PS64			BIT_ULL(8)
+#define XE_PTE_NULL			BIT_ULL(9)
+
+#define XE_PAGE_PRESENT			BIT_ULL(0)
+#define XE_PAGE_RW			BIT_ULL(1)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index bae042b35fa8..4824ab145bc4 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -50,13 +50,6 @@
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
 
-#define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
-#define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
-#define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)
-#define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
-#define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
-#define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
-
 #define XE_PTE_SHIFT			12
 #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
 #define XE_PTE_MASK			(XE_PAGE_SIZE - 1)
@@ -69,20 +62,6 @@
 #define XE_64K_PTE_MASK			(XE_64K_PAGE_SIZE - 1)
 #define XE_64K_PDE_MASK			(XE_PDE_MASK >> 4)
 
-#define XE_PDE_PS_2M			BIT_ULL(7)
-#define XE_PDPE_PS_1G			BIT_ULL(7)
-#define XE_PDE_IPS_64K			BIT_ULL(11)
-
-#define XE_GGTT_PTE_DM			BIT_ULL(1)
-#define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
-#define XE_PPGTT_PTE_DM			BIT_ULL(11)
-#define XE_PDE_64K			BIT_ULL(6)
-#define XE_PTE_PS64			BIT_ULL(8)
-#define XE_PTE_NULL			BIT_ULL(9)
-
-#define XE_PAGE_PRESENT			BIT_ULL(0)
-#define XE_PAGE_RW			BIT_ULL(1)
-
 #define XE_PL_SYSTEM		TTM_PL_SYSTEM
 #define XE_PL_TT		TTM_PL_TT
 #define XE_PL_VRAM0		TTM_PL_VRAM
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 524b0198fcae..fe713d57cbf6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -16,6 +16,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_gpu_commands.h"
+#include "regs/xe_gtt_defs.h"
 #include "tests/xe_test.h"
 #include "xe_assert.h"
 #include "xe_bb.h"
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 271f13eeb852..5b7930f46cf3 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -5,6 +5,7 @@
 
 #include "xe_pt.h"
 
+#include "regs/xe_gtt_defs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2a431690d245..fff10e1717ff 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -21,6 +21,7 @@
 
 #include <generated/xe_wa_oob.h>
 
+#include "regs/xe_gtt_defs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
-- 
2.43.0

