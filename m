Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5D5C982C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73E510E264;
	Fri, 16 Jan 2026 22:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlzTYwlt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786B810E0FB
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601566; x=1800137566;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=HUT0LkCSfrR3KLxVkSQwY+fXzSWAqDLjcMAN6qoYXuc=;
 b=LlzTYwlt5rzSpxupuB02JmVMxczz+JSgygfIfv4eEYzxvluq+cMG4qqR
 UkFR0Tfb9UdIsdOahU5xzknzm+WYV2Np/7pg32Jo+mvHzatBhVhXT8j0u
 fkB2vtiTCI7c93ky8u75ccyCN4W5Z6EqByTUcGw8AjBCLr9Ze+tI6sxbA
 sCMFJZFebDwYa9RHZNrKrbvbNwUe25zUV04BD29gQ2nqfrqlK/1iTK/np
 BgQ1bqAhW52Rfpml9S3mF+v/qbTBrqb6eLC8rAR4eiH6mfTLf05glUZw3
 gaBtOhfmis/RXxUK0fkHRabcy1Oo0O/aZOI63qxF+BxNjg4u7uRFO/Tzs A==;
X-CSE-ConnectionGUID: YylTrYymTaGJRsRo6DzQiw==
X-CSE-MsgGUID: mPmUwHf7RvexgMZTPURz4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123024"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123024"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:46 -0800
X-CSE-ConnectionGUID: MJWCwE7BRMqBW2YoPNud7w==
X-CSE-MsgGUID: 2quNkZ3nTq6baRFzNUeQnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961788"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:46 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:13 -0300
Subject: [PATCH 05/12] drm/xe/kunit: Abort test if MMIO operation is attempted
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-rtp-mcr-check-v1-5-d420b9c1a327@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Regular Xe KUnit tests (i.e. not the live ones) are usually run in
User-Mode Linux and do not have access to the real hardware and, as
such, should not attempt to do MMIO operations. If some test ends up
exercising a path that contains MMIO operations, the test should be
rewritten in a way that the MMIO is skipped or simulated (e.g. via a
static stub).

Let's make sure to abort the test if MMIO is attempted on non-live
tests.  Before aborting, use drm_WARN() to cause a stack trace to be
logged as a debug aid to the developer.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile        |  1 +
 drivers/gpu/drm/xe/tests/xe_kunit_mmio.c | 35 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_mmio.h | 27 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.c             |  9 ++++++++
 4 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 0e3408f4952c..8f3a594449c8 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -8,6 +8,7 @@ xe_live_test-y = xe_live_test_mod.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
 xe_test-y = xe_test_mod.o \
 	xe_args_test.o \
+	xe_kunit_mmio.o \
 	xe_pci_test.o \
 	xe_rtp_test.o \
 	xe_wa_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c
new file mode 100644
index 000000000000..debf8bd3f9dd
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+#include <kunit/test-bug.h>
+
+#include <drm/drm_print.h>
+
+#include "tests/xe_kunit_helpers.h"
+#include "tests/xe_kunit_mmio.h"
+#include "xe_device_types.h"
+
+/**
+ * xe_kunit_mmio_abort_if_not_live_test - Abort test execution if not in a live test.
+ * @mmio: MMIO target
+ * @reg: Register on which an MMIO operation is about to be performed
+ *
+ * This function must be called from xe_mmio functions that perform MMIO
+ * operations on the hardware.  If the current process is a kunit test and it is
+ * not a live test, it will cause a warn and abort the test; otherwise it does
+ * nothing.
+ */
+void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct xe_reg reg)
+{
+	struct xe_device *xe = tile_to_xe(mmio->tile);
+	struct kunit *test = kunit_get_current_test();
+
+	if (!test || xe_kunit_is_live_test(test))
+		return;
+
+	drm_WARN(&xe->drm, true, "MMIO function called on reg 0x%x\n", reg.addr);
+	KUNIT_FAIL_AND_ABORT(test, "MMIO function called on reg 0x%x\n", reg.addr);
+}
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h
new file mode 100644
index 000000000000..d46ac2b82969
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_KUNIT_MMIO_H_
+#define _XE_KUNIT_MMIO_H_
+
+#include <linux/types.h>
+
+#include "regs/xe_reg_defs.h"
+
+struct xe_mmio;
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+
+void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct xe_reg reg);
+
+#else
+
+static void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct xe_reg reg)
+{
+}
+
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index bcb6674b7dac..0f9a1d5453df 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -14,6 +14,7 @@
 #include <drm/drm_print.h>
 
 #include "regs/xe_bars.h"
+#include "tests/xe_kunit_mmio.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_sriov.h"
@@ -146,6 +147,8 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u8 val;
 
+	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
+
 	mmio_flush_pending_writes(mmio);
 
 	val = readb(mmio->regs + addr);
@@ -159,6 +162,8 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u16 val;
 
+	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
+
 	mmio_flush_pending_writes(mmio);
 
 	val = readw(mmio->regs + addr);
@@ -171,6 +176,8 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
+	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
+
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
@@ -185,6 +192,8 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u32 val;
 
+	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
+
 	mmio_flush_pending_writes(mmio);
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))

-- 
2.52.0

