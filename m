Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3623ECEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 20:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E125610E1CB;
	Mon, 17 Nov 2025 20:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LjX56Gja";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEBE10E076
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 20:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763412802; x=1794948802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3W5y84C5KeMxKI1bNp8hL9gscam3Lv9bh3hM6Q3mJW0=;
 b=LjX56GjaossR+FYjKq+H4JPv3SIpxoMJLsSsuRHTUdEC+Cam63qvpQGA
 Pnq6DFK2Jht+9MoRgpnpezMMAq7KIqsHlHaQneVaB7+oB41kTW/qGPvZx
 rdYenPfhYzn97gHSzAxBjmlyRKPLTdzGEr/zuhUlSJAa6DGAEJ+b/DcuO
 oN17ckK+pFKbAbrIscpLagZ5rJ3Hs73HLs6tmMh3rNtqIgysVxrUcBv5e
 F8LB0LTZPX/6zlzkxUs2WMg7kpTCKoWQZY3bD7Wm00qfj/H5hNDDp2fqz
 ru9OKnFSpQW/C/HyTXRWvAbF/9sk2EWMNuTeCKx1zTMiMcNerWSbqqxCt A==;
X-CSE-ConnectionGUID: RjOtDzqiTWqBGzIE8py1KQ==
X-CSE-MsgGUID: tAam/3ICSX+e4+HnoQHxig==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65516553"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65516553"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:53:21 -0800
X-CSE-ConnectionGUID: lBC31NBMRgG5ObRplnG++A==
X-CSE-MsgGUID: JeXQJRkFQCOSd7GZl9JBAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190227341"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:53:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, lucas.demarchi@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2 2/4] drm/xe/soc_remapper: Use SoC remapper herlper from
 VSEC code
Date: Mon, 17 Nov 2025 12:53:18 -0800
Message-ID: <20251117205315.1458477-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
References: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
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

Since different drivers can use SoC remapper, modify VSEC code to
access SoC remapper via a helper that would synchronize such accesses.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: (Lucas)
- retain comment
- s/BITS/MASK/
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

