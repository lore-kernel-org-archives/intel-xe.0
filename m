Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37E9CFC51D
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 04:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9641F10E175;
	Sat, 22 Nov 2025 04:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSvcafQK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141D810E175
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 04:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763787504; x=1795323504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vf32MH6ikUEGqSzV+cy+J2uxADBrXEPLs7izJFL0u1k=;
 b=bSvcafQKNW4uFLkfladL04moxjvVYMVyYXDLtjKoV7N8tfZJJ1rjus5x
 hMiA5WfsTN6vb0SXp73w+JbiK/irW5KX4dxzRb7CHnEHi4oPGHvA9Fd4l
 RYAZref2i3kvxSJCPU63rPyUnmrHjP2JH+wJV7yCCYAfvAd/p2FdajxlP
 cw35GmCPnruvHH25jMldA1nKL9rVZxnXycIuHt4xKsw9UgIVhjMxuImMn
 bjrDaWZRhpQcsSkO1yVhjeBRcUiQMZO5FXMxPB9aUwERuWq2lyBANpuRY
 BoYf+RlJLuOeMLSiRn0eH6s61VzqdGk5KirJsYZ1jCFBUxNik8HPbuOHL A==;
X-CSE-ConnectionGUID: lXxzEqS2TgefihVSRgdmFw==
X-CSE-MsgGUID: 2hAg61TiQ1eC2s3pxsIAXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65921457"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="65921457"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:58:24 -0800
X-CSE-ConnectionGUID: Ex9o3ONRTEWEeFZCIsUnHw==
X-CSE-MsgGUID: HAW4CWhdSvGw+vy/B6AXaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191976554"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:58:20 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, mohamed.mansoor.v@intel.com, kam.nasim@intel.com,
 anoop.c.vijay@intel.com
Subject: [RFC 2/5] drm/xe/soc_remapper: Use SoC remapper herlper from VSEC code
Date: Fri, 21 Nov 2025 20:58:04 -0800
Message-ID: <20251122045803.3616201-9-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Since different drivers can use SoC remapper, modify VSEC code to
access SoC remapper via a helper that would synchronize such accesses.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h               |  3 ---
 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.c           | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h           |  1 +
 drivers/gpu/drm/xe/xe_vsec.c                   |  4 ++--
 5 files changed, 34 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 0f79c0714454..240d57993ea6 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -18,9 +18,6 @@
 #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
 #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
 
-#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
-#define   SG_REMAP_BITS			REG_GENMASK(31, 24)
-
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
 #define BMG_G6_RESIDENCY_OFFSET		(0x538)
diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
new file mode 100644
index 000000000000..9edf234227a9
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef _XE_SOC_REMAPPER_REGS_H_
+#define _XE_SOC_REMAPPER_REGS_H_
+
+#include "xe_regs.h"
+
+#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
+#define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
index f5a02abd6ab1..85d37a86117a 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.c
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -5,8 +5,26 @@
 
 #include <linux/spinlock.h>
 
+#include "regs/xe_soc_remapper_regs.h"
+#include "xe_mmio.h"
 #include "xe_soc_remapper.h"
 
+static void xe_soc_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
+				       u32 mask, u32 val)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&xe->soc_remapper.lock, flags);
+	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
+	spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
+}
+
+void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
+{
+	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_TELEM_MASK,
+				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
+}
+
 int xe_soc_remapper_init(struct xe_device *xe)
 {
 	spin_lock_init(&xe->soc_remapper.lock);
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
index 3cfd44f1fd74..75431b94e66a 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.h
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
@@ -11,5 +11,6 @@
 #include "xe_device_types.h"
 
 int xe_soc_remapper_init(struct xe_device *xe);
+void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 8f23a27871b6..3e217fb75394 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -16,6 +16,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
+#include "xe_soc_remapper.h"
 #include "xe_vsec.h"
 
 #include "regs/xe_pmt.h"
@@ -163,8 +164,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 		return -ENODATA;
 
 	/* set SoC re-mapper index register based on GUID memory region */
-	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
-		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
+	xe_soc_remapper_set_telem_region(xe, mem_region);
 
 	memcpy_fromio(data, telem_addr, count);
 	xe_pm_runtime_put(xe);
-- 
2.43.0

