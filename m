Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CC5C982C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B3610E26B;
	Fri, 16 Jan 2026 22:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLItRdXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D10410E264
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601567; x=1800137567;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=EsFY7IRT/E+50sRi0n+9sRnZEOu8HEI6hi2b0z+l5Rs=;
 b=dLItRdXCqx5lNByxEfFUzTRARI5TcGoTch6QYTa+P1jym91c8vSQfZvI
 29fp9JEIIlGG3yNNtt/qbMIBXvTliRCdmgQZ9h3aM8Ylmc1eQBIS6g/lg
 IwX0y5tZFU/RZg0qYZkhb/QO7Gd7c57kOSNa2XZNBLpljAJUg4RYoFptN
 B5HqQc1GqGbiJMsQN3quvuY7M5MbviE4yg65yqfbsFehJAUWzAkbIPDvi
 HP3TXg/utqJDKnXPYas8WCXe1sa/+6q6rsuHBZak8zaMDzj0q1BimZDBm
 NL+c+8vsPktZDdicFPSGQppPAnoSq0pcjrtclU0Zj0pPhxxY4BhB9fksj w==;
X-CSE-ConnectionGUID: t5Q8jZ7WS5K/6UktzCvLzw==
X-CSE-MsgGUID: CnMS/RnbROGDi/uJE1qvWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123025"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123025"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:47 -0800
X-CSE-ConnectionGUID: 8FppPmfnSAWyrYgZZx8SxQ==
X-CSE-MsgGUID: e7slH1ipTTOiK7xS3AUGRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961794"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:47 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:14 -0300
Subject: [PATCH 06/12] drm/xe/kunit: Allow intercepting MMIO operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-rtp-mcr-check-v1-6-d420b9c1a327@intel.com>
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

While we do not want regular Xe KUnit tests to try to perform MMIO
operations, for reasonably simple cases, it would be nice to allow the
test to intercept and simulate MMIO operations.  That would be less
intrusive than injecting more static stubs into the driver code or
having to refactor it to accommodate for a test.

Thus, let's add the infrastructure to allow that.  Let's implement that
today with the help of KUnit's static stubbing.  In the future, when/if
we get all tests to have a common type for test->priv, we could change
the framework to use that instead.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile            |   1 +
 drivers/gpu/drm/xe/tests/xe_kunit_mmio.c     |  77 +++++++++++++++---
 drivers/gpu/drm/xe/tests/xe_kunit_mmio.h     |  23 +++++-
 drivers/gpu/drm/xe/tests/xe_mmio_intercept.c | 116 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_mmio_intercept.h |  26 ++++++
 drivers/gpu/drm/xe/xe_mmio.c                 |  12 ++-
 6 files changed, 236 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 8f3a594449c8..690e1e12232c 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -8,6 +8,7 @@ xe_live_test-y = xe_live_test_mod.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
 xe_test-y = xe_test_mod.o \
 	xe_args_test.o \
+	xe_mmio_intercept.o \
 	xe_kunit_mmio.o \
 	xe_pci_test.o \
 	xe_rtp_test.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c
index debf8bd3f9dd..ad58970e3ee7 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c
@@ -10,26 +10,77 @@
 
 #include "tests/xe_kunit_helpers.h"
 #include "tests/xe_kunit_mmio.h"
+#include "tests/xe_mmio_intercept.h"
 #include "xe_device_types.h"
 
-/**
- * xe_kunit_mmio_abort_if_not_live_test - Abort test execution if not in a live test.
- * @mmio: MMIO target
- * @reg: Register on which an MMIO operation is about to be performed
- *
- * This function must be called from xe_mmio functions that perform MMIO
- * operations on the hardware.  If the current process is a kunit test and it is
- * not a live test, it will cause a warn and abort the test; otherwise it does
- * nothing.
- */
-void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct xe_reg reg)
+static void abort_if_not_live_test(struct kunit *test,
+				   struct xe_mmio *mmio, struct xe_reg reg)
 {
 	struct xe_device *xe = tile_to_xe(mmio->tile);
-	struct kunit *test = kunit_get_current_test();
 
-	if (!test || xe_kunit_is_live_test(test))
+	if (xe_kunit_is_live_test(test))
 		return;
 
 	drm_WARN(&xe->drm, true, "MMIO function called on reg 0x%x\n", reg.addr);
 	KUNIT_FAIL_AND_ABORT(test, "MMIO function called on reg 0x%x\n", reg.addr);
 }
+
+bool xe_kunit_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg, u8 *val)
+{
+	struct kunit *test = kunit_get_current_test();
+
+	if (!test)
+		return false;
+
+	if (xe_mmio_intercept_read8(test, mmio, reg, val))
+		return true;
+
+	abort_if_not_live_test(test, mmio, reg);
+
+	return false;
+}
+
+bool xe_kunit_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg, u16 *val)
+{
+	struct kunit *test = kunit_get_current_test();
+
+	if (!test)
+		return false;
+
+	if (xe_mmio_intercept_read16(test, mmio, reg, val))
+		return true;
+
+	abort_if_not_live_test(test, mmio, reg);
+
+	return false;
+}
+
+bool xe_kunit_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg, u32 *val)
+{
+	struct kunit *test = kunit_get_current_test();
+
+	if (!test)
+		return false;
+
+	if (xe_mmio_intercept_read32(test, mmio, reg, val))
+		return true;
+
+	abort_if_not_live_test(test, mmio, reg);
+
+	return false;
+}
+
+bool xe_kunit_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
+{
+	struct kunit *test = kunit_get_current_test();
+
+	if (!test)
+		return false;
+
+	if (xe_mmio_intercept_write32(test, mmio, reg, val))
+		return true;
+
+	abort_if_not_live_test(test, mmio, reg);
+
+	return false;
+}
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h
index d46ac2b82969..9cb792a0a156 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h
@@ -14,12 +14,31 @@ struct xe_mmio;
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 
-void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct xe_reg reg);
+bool xe_kunit_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg, u8 *val);
+bool xe_kunit_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg, u16 *val);
+bool xe_kunit_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg, u32 *val);
+bool xe_kunit_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
 
 #else
 
-static void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct xe_reg reg)
+static inline bool xe_kunit_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg, u8 *val)
 {
+	return false;
+}
+
+static inline bool xe_kunit_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg, u16 *val)
+{
+	return false;
+}
+
+static inline bool xe_kunit_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg, u32 *val)
+{
+	return false;
+}
+
+static inline bool xe_kunit_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
+{
+	return false;
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/tests/xe_mmio_intercept.c b/drivers/gpu/drm/xe/tests/xe_mmio_intercept.c
new file mode 100644
index 000000000000..b081fb109dc1
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_mmio_intercept.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/static_stub.h>
+
+#include "tests/xe_mmio_intercept.h"
+
+/*
+ * DOC: Intercepting Xe MMIO in KUnit tests
+ *
+ * This provides a framework to allow Xe KUnit tests to intercept MMIO
+ * operations from the Xe driver.  This is especially useful for non-live tests,
+ * which are usually run on User-Mode Linux and don't have access to the real
+ * hardware.
+ *
+ * This was implemented with the help of KUnit's static stub API.  In order to
+ * be able to intercept an MMIO operation, the test needs to implement one or
+ * more "replacement functions" with the same signature of the respective
+ * ``xe_mmio_intercept_*()`` functions and activate the static stub to replace
+ * them.
+ *
+ * If the replacement function successfully "intercepts" an MMIO operation (e.g.
+ * matches a register of interest and handles the operation), then it must
+ * return true to indicate that, otherwise it must return false.
+ *
+ * When false is returned and the test is not a live one, then a warn with a
+ * stack trace is generated (as a debug aid) and the test is aborted.  The
+ * rationale behind that behavior is that usually non-live tests are run in
+ * virtual machines (like User-Mode Linux) and, as such, attempting a real MMIO
+ * operation would likely fail.
+ *
+ * When a read operation gets intercepted, then ``*val`` must be updated with
+ * the value that the original MMIO function must return as a result of the
+ * read.
+ *
+ * Example:
+ *
+ * .. code-block:: c
+ *
+ *	static bool my_test_mmio_intercept_read32(struct kunit *test,
+ *						  struct xe_mmio *mmio,
+ *						  struct xe_reg reg,
+ *						  u32 *val)
+ *	{
+ *		if (reg.raw == SOME_REGISTER.raw) {
+ *			// Get value from somewhere (e.g. some member in
+ *			// test->priv) or use a constant value.
+ *			*val = ...;
+ *
+ *			return true;
+ *		}
+ *
+ *		return false;
+ *	}
+ *
+ *	static bool my_test_mmio_intercept_write32(struct kunit *test,
+ *						   struct xe_mmio *mmio,
+ *						   struct xe_reg reg,
+ *						   u32 val)
+ *	{
+ *		if (reg.raw == SOME_REGISTER.raw) {
+ *			// Do something with val (e.g. store it somewhere in
+ *			// test->priv) or simply ignore it.
+ *			...
+ *
+ *			return true;
+ *		}
+ *
+ *		return false;
+ *	}
+ *
+ *	static int my_test_init(struct kunit *test)
+ *	{
+ *		...
+ *
+ *		kunit_activate_static_stub(test,
+ *					   xe_mmio_intercept_read32,
+ *					   my_test_mmio_intercept_read32);
+ *
+ *		...
+ *	}
+ */
+
+bool xe_mmio_intercept_read8(struct kunit *test, struct xe_mmio *mmio,
+			     struct xe_reg reg, u8 *val)
+{
+	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_intercept_read8, test, mmio, reg, val);
+
+	return false;
+}
+
+bool xe_mmio_intercept_read16(struct kunit *test, struct xe_mmio *mmio,
+			      struct xe_reg reg, u16 *val)
+{
+	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_intercept_read16, test, mmio, reg, val);
+
+	return false;
+}
+
+bool xe_mmio_intercept_read32(struct kunit *test, struct xe_mmio *mmio,
+			      struct xe_reg reg, u32 *val)
+{
+	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_intercept_read32, test, mmio, reg, val);
+
+	return false;
+}
+
+bool xe_mmio_intercept_write32(struct kunit *test, struct xe_mmio *mmio,
+			       struct xe_reg reg, u32 val)
+{
+	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_intercept_write32, test, mmio, reg, val);
+
+	return false;
+}
diff --git a/drivers/gpu/drm/xe/tests/xe_mmio_intercept.h b/drivers/gpu/drm/xe/tests/xe_mmio_intercept.h
new file mode 100644
index 000000000000..c68d01c04c35
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_mmio_intercept.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_MMIO_INTERCEPT_H_
+#define _XE_MMIO_INTERCEPT_H_
+
+#include <linux/types.h>
+
+#include "regs/xe_reg_defs.h"
+
+struct kunit;
+
+struct xe_mmio;
+
+bool xe_mmio_intercept_read8(struct kunit *test, struct xe_mmio *mmio,
+			     struct xe_reg reg, u8 *val);
+bool xe_mmio_intercept_read16(struct kunit *test, struct xe_mmio *mmio,
+			      struct xe_reg reg, u16 *val);
+bool xe_mmio_intercept_read32(struct kunit *test, struct xe_mmio *mmio,
+			      struct xe_reg reg, u32 *val);
+bool xe_mmio_intercept_write32(struct kunit *test, struct xe_mmio *mmio,
+			       struct xe_reg reg, u32 val);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 0f9a1d5453df..20cd06728984 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -147,7 +147,8 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u8 val;
 
-	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
+	if (xe_kunit_mmio_read8(mmio, reg, &val))
+		return val;
 
 	mmio_flush_pending_writes(mmio);
 
@@ -162,7 +163,8 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u16 val;
 
-	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
+	if (xe_kunit_mmio_read16(mmio, reg, &val))
+		return val;
 
 	mmio_flush_pending_writes(mmio);
 
@@ -176,7 +178,8 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
-	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
+	if (xe_kunit_mmio_write32(mmio, reg, val))
+		return;
 
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
@@ -192,7 +195,8 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u32 val;
 
-	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
+	if (xe_kunit_mmio_read32(mmio, reg, &val))
+		return val;
 
 	mmio_flush_pending_writes(mmio);
 

-- 
2.52.0

