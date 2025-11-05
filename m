Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BF9CCFA1E
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A0810E7D3;
	Wed,  5 Nov 2025 23:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtYSc3bl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3F510E7D1
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 23:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762386481; x=1793922481;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=F6bnLKgtiX7vLXzra3ACnwMdn4qlVH3Fsv6cpqOLCLw=;
 b=XtYSc3blRWVcSYqQTLOYSWKBGsaFlz9SOEgtx3k29tKDwYEpmPcQA4fK
 QIqT+4dxw+e7bnZaawoTcJCEBH4qoQ43oDqxpmAxQ3iwpsMgk2IRnoOLB
 augTXxRi2xO9Icm7cqptm/PUJHJ1ri43fReYAwuKFbGwEPrSzKAHymULA
 ZuBFkNTUHYPQm1pvfeQ1vo6crMaRgZoJ+GrxNjbVuo9mB5Yj1SgmIFd8k
 rAYMMuU5v6ozeXkhw7OBtZO1xX2JzVxvvSwGzAszg9l6lw8bLBMu8vz+9
 BL3XVPzmrXCmedenTiRLzmBOHVeGhj9U7egvjCgmhJI8dKUvIQdjH1tTQ w==;
X-CSE-ConnectionGUID: cUo8Nse8T/+ilxJnNNI2mA==
X-CSE-MsgGUID: pKCMcu/PSMyu2jw9olq6Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="89980377"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="89980377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:48:00 -0800
X-CSE-ConnectionGUID: kARquK6qRNaA/kf1AZCyYA==
X-CSE-MsgGUID: WeDWo5uJRhul7UYkx983hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="188319623"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:48:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	badal.nilawar@intel.com
Subject: [PATCH 1/4] drm/xe/vsec: Refactor to move remapper logic outside vsec
 code
Date: Wed,  5 Nov 2025 15:47:55 -0800
Message-ID: <20251105234753.603647-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
References: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
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

PMT is not the only user of SoC remapper, so move the remapper code
oustide the vsec implementation so that it can be used by other drivers
when needed.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |  1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  3 ---
 drivers/gpu/drm/xe/regs/xe_remapper_regs.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_remapper.c           | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_remapper.h           | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.c               |  5 ++---
 6 files changed, 47 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_remapper_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_remapper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3fbec058facc..765dc35ae2a3 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -109,6 +109,7 @@ xe-y += xe_bb.o \
 	xe_range_fence.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
+	xe_remapper.o \
 	xe_ring_ops.o \
 	xe_rtp.o \
 	xe_sa.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 264e9baf949c..ffef22a0dff9 100644
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
diff --git a/drivers/gpu/drm/xe/regs/xe_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_remapper_regs.h
new file mode 100644
index 000000000000..96bfc445555e
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_remapper_regs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef _XE_REMAPPER_REGS_H_
+#define _XE_REMAPPER_REGS_H_
+
+#include "xe_regs.h"
+
+#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
+#define   SG_REMAP_TELEM_BITS		REG_GENMASK(31, 24)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_remapper.c b/drivers/gpu/drm/xe/xe_remapper.c
new file mode 100644
index 000000000000..1374fc2f4dda
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_remapper.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include "regs/xe_remapper_regs.h"
+#include "xe_mmio.h"
+#include "xe_remapper.h"
+
+void xe_remapper_set_telem_region(struct xe_device *xe, u32 index)
+{
+	xe_mmio_rmw32(xe_root_tile_mmio(xe),
+		      SG_REMAP_INDEX1,
+		      SG_REMAP_TELEM_BITS,
+		      REG_FIELD_PREP(SG_REMAP_TELEM_BITS, index));
+}
diff --git a/drivers/gpu/drm/xe/xe_remapper.h b/drivers/gpu/drm/xe/xe_remapper.h
new file mode 100644
index 000000000000..df6b726a97a7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_remapper.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_REMAPPER_H_
+#define _XE_REMAPPER_H_
+
+#include <linux/types.h>
+
+#include "xe_device_types.h"
+
+void xe_remapper_set_telem_region(struct xe_device *xe, u32 index);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 8f23a27871b6..81b1c0fe20b8 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -16,6 +16,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
+#include "xe_remapper.h"
 #include "xe_vsec.h"
 
 #include "regs/xe_pmt.h"
@@ -162,9 +163,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
 
-	/* set SoC re-mapper index register based on GUID memory region */
-	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
-		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
+	xe_remapper_set_telem_region(xe, mem_region);
 
 	memcpy_fromio(data, telem_addr, count);
 	xe_pm_runtime_put(xe);
-- 
2.43.0

