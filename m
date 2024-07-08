Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B07C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 11:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDBB10E177;
	Mon,  8 Jul 2024 11:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmNSJ7px";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E721910E167
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720437149; x=1751973149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U3e8HPODli9WZrgSovXtdynxsGdDzouHcWYunD7D6uM=;
 b=lmNSJ7pxBZfBXYXO+nrGLMlmSonw0/kawmF2NP7OfifH4oSP9Sx0R4BW
 nv82+YouKO4wXxOd2Qz3TpaIC3zW6gDNXiWeu7XMGf2qg0KK74up8kiaL
 xbTcmGZqfKBkDlrRzhS3vpwMIS2b9XxdQQKJbf4Pe/5VHIOHOCt3zY4Hc
 CflUeGM1QA8PTfCaEsfbKWAdH420QSH0T0bMjnHprxxe2OzgRSWJdFuyf
 4gBFVi6wCL/V8TTXDwmKsG2iIBDzpgzYXpvKKRDrFTkahlfu2dU+voeBq
 QGqBbNTvQVvP2Jq7n8JwN34G0yapWkNrEl7+4tpFyWb9efMJfwMfI4Wwp Q==;
X-CSE-ConnectionGUID: 7nQx98AHT9yCWu+5jFGGfQ==
X-CSE-MsgGUID: uL3W/46KQWSAqgV5Ka0sAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17448573"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="17448573"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 04:12:29 -0700
X-CSE-ConnectionGUID: UgjBnCe1RJ6Q4FXVTFPicQ==
X-CSE-MsgGUID: kQbVgU7JQHKMT+nvR8CDeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="47540171"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 04:12:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/4] drm/xe/kunit: Simplify xe_mocs live tests code layout
Date: Mon,  8 Jul 2024 13:12:10 +0200
Message-Id: <20240708111210.1154-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240708111210.1154-1-michal.wajdeczko@intel.com>
References: <20240708111210.1154-1-michal.wajdeczko@intel.com>
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

The test case logic is implemented by the functions compiled as
part of the core Xe driver module and then exported to build and
register the test suite in the live test module.

But we don't need to export individual test case functions, we may
just export the entire test suite. And we don't need to register
this test suite in a separate file, it can be done in the main
file of the live test module.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile           |  3 +--
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |  2 ++
 drivers/gpu/drm/xe/tests/xe_mocs.c          | 20 +++++++++++++++-----
 drivers/gpu/drm/xe/tests/xe_mocs_test.c     | 21 ---------------------
 drivers/gpu/drm/xe/tests/xe_mocs_test.h     | 14 --------------
 5 files changed, 18 insertions(+), 42 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 32ce1d6df0fa..0e3408f4952c 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -2,8 +2,7 @@
 
 # "live" kunit tests
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_live_test.o
-xe_live_test-y = xe_live_test_mod.o \
-	xe_mocs_test.o
+xe_live_test-y = xe_live_test_mod.o
 
 # Normal kunit tests
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index 4c1e07a0d477..5f14737c8210 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -8,10 +8,12 @@
 extern struct kunit_suite xe_bo_test_suite;
 extern struct kunit_suite xe_dma_buf_test_suite;
 extern struct kunit_suite xe_migrate_test_suite;
+extern struct kunit_suite xe_mocs_test_suite;
 
 kunit_test_suite(xe_bo_test_suite);
 kunit_test_suite(xe_dma_buf_test_suite);
 kunit_test_suite(xe_migrate_test_suite);
+kunit_test_suite(xe_mocs_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 67c65e88c384..b344608abdbf 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -6,7 +6,6 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
-#include "tests/xe_mocs_test.h"
 #include "tests/xe_pci_test.h"
 #include "tests/xe_test.h"
 
@@ -134,11 +133,10 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
 	return 0;
 }
 
-void xe_live_mocs_kernel_kunit(struct kunit *test)
+static void xe_live_mocs_kernel_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(mocs_kernel_test_run_device);
 }
-EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_kernel_kunit);
 
 static int mocs_reset_test_run_device(struct xe_device *xe)
 {
@@ -175,8 +173,20 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 	return 0;
 }
 
-void xe_live_mocs_reset_kunit(struct kunit *test)
+static void xe_live_mocs_reset_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(mocs_reset_test_run_device);
 }
-EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_reset_kunit);
+
+static struct kunit_case xe_mocs_tests[] = {
+	KUNIT_CASE(xe_live_mocs_kernel_kunit),
+	KUNIT_CASE(xe_live_mocs_reset_kunit),
+	{}
+};
+
+VISIBLE_IF_KUNIT
+struct kunit_suite xe_mocs_test_suite = {
+	.name = "xe_mocs",
+	.test_cases = xe_mocs_tests,
+};
+EXPORT_SYMBOL_IF_KUNIT(xe_mocs_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
deleted file mode 100644
index 6315886b659e..000000000000
--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
+++ /dev/null
@@ -1,21 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#include "xe_mocs_test.h"
-
-#include <kunit/test.h>
-
-static struct kunit_case xe_mocs_tests[] = {
-	KUNIT_CASE(xe_live_mocs_kernel_kunit),
-	KUNIT_CASE(xe_live_mocs_reset_kunit),
-	{}
-};
-
-static struct kunit_suite xe_mocs_test_suite = {
-	.name = "xe_mocs",
-	.test_cases = xe_mocs_tests,
-};
-
-kunit_test_suite(xe_mocs_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
deleted file mode 100644
index e7699d495411..000000000000
--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 AND MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef _XE_MOCS_TEST_H_
-#define _XE_MOCS_TEST_H_
-
-struct kunit;
-
-void xe_live_mocs_kernel_kunit(struct kunit *test);
-void xe_live_mocs_reset_kunit(struct kunit *test);
-
-#endif
-- 
2.43.0

