Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2176AC3DA42
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 11:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F3A10E0D1;
	Mon,  8 Jul 2024 11:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AlVbYBym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7410E12D
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720437146; x=1751973146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gmxfx/vmult3SnPUm5jXQOiNZktAVWgr16/Z0qah1nE=;
 b=AlVbYBym3o9XEX5YpZJWGLHYKW7MDZawmFtN7zipgFpSIAbchb9m0fvW
 L+GxAKBI7yEd/qrEHlRm8WOtnl5OQUD7rfxiAplanBlMOCh894ziCR3P5
 lIeOCYfRHGX5w2iEtoTwczClCGD4ox5W8fmPgXAympULhCdiNLnwaFPbI
 FGyYZKCqQuBt7LLLJtPQ7eedI/RzpyQykaSPLSjsG3y+f/UGMsSWLQZ4f
 t28NF2d2NYp3Kjo64JctvPjJ1geLrWA7eTdHxwx9vCqT5z1bmNkyeifNX
 0E0YDoxQuS/6xIbt1I1VwFUA+P4GVDKY5dtHD1m4bAYOcDTi9wx+AUWva w==;
X-CSE-ConnectionGUID: oKXHV888QjCdNbhQgfXLag==
X-CSE-MsgGUID: UMEtpHBXSHOlGy+psDqePg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17448551"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="17448551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 04:12:26 -0700
X-CSE-ConnectionGUID: e+HQ4FslQR+Ec4lQIAPEiQ==
X-CSE-MsgGUID: EtE0dXixSkmGS+WDN5nmhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="47540111"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 04:12:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/4] drm/xe/kunit: Simplify xe_bo live tests code layout
Date: Mon,  8 Jul 2024 13:12:07 +0200
Message-Id: <20240708111210.1154-2-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/tests/Makefile           |  1 -
 drivers/gpu/drm/xe/tests/xe_bo.c            | 20 +++++++++++++++-----
 drivers/gpu/drm/xe/tests/xe_bo_test.c       | 21 ---------------------
 drivers/gpu/drm/xe/tests/xe_bo_test.h       | 14 --------------
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |  5 +++++
 5 files changed, 20 insertions(+), 41 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.h

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 6e58931fddd4..77331b0a04ad 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -3,7 +3,6 @@
 # "live" kunit tests
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_live_test.o
 xe_live_test-y = xe_live_test_mod.o \
-	xe_bo_test.o \
 	xe_dma_buf_test.o \
 	xe_migrate_test.o \
 	xe_mocs_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9f3c02826464..2a9a97f2c07d 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -6,7 +6,6 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
-#include "tests/xe_bo_test.h"
 #include "tests/xe_pci_test.h"
 #include "tests/xe_test.h"
 
@@ -177,11 +176,10 @@ static int ccs_test_run_device(struct xe_device *xe)
 	return 0;
 }
 
-void xe_ccs_migrate_kunit(struct kunit *test)
+static void xe_ccs_migrate_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(ccs_test_run_device);
 }
-EXPORT_SYMBOL_IF_KUNIT(xe_ccs_migrate_kunit);
 
 static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struct kunit *test)
 {
@@ -345,8 +343,20 @@ static int evict_test_run_device(struct xe_device *xe)
 	return 0;
 }
 
-void xe_bo_evict_kunit(struct kunit *test)
+static void xe_bo_evict_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(evict_test_run_device);
 }
-EXPORT_SYMBOL_IF_KUNIT(xe_bo_evict_kunit);
+
+static struct kunit_case xe_bo_tests[] = {
+	KUNIT_CASE(xe_ccs_migrate_kunit),
+	KUNIT_CASE(xe_bo_evict_kunit),
+	{}
+};
+
+VISIBLE_IF_KUNIT
+struct kunit_suite xe_bo_test_suite = {
+	.name = "xe_bo",
+	.test_cases = xe_bo_tests,
+};
+EXPORT_SYMBOL_IF_KUNIT(xe_bo_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/tests/xe_bo_test.c
deleted file mode 100644
index a324cde77db8..000000000000
--- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
+++ /dev/null
@@ -1,21 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#include "xe_bo_test.h"
-
-#include <kunit/test.h>
-
-static struct kunit_case xe_bo_tests[] = {
-	KUNIT_CASE(xe_ccs_migrate_kunit),
-	KUNIT_CASE(xe_bo_evict_kunit),
-	{}
-};
-
-static struct kunit_suite xe_bo_test_suite = {
-	.name = "xe_bo",
-	.test_cases = xe_bo_tests,
-};
-
-kunit_test_suite(xe_bo_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.h b/drivers/gpu/drm/xe/tests/xe_bo_test.h
deleted file mode 100644
index 0113ab45066a..000000000000
--- a/drivers/gpu/drm/xe/tests/xe_bo_test.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 AND MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef _XE_BO_TEST_H_
-#define _XE_BO_TEST_H_
-
-struct kunit;
-
-void xe_ccs_migrate_kunit(struct kunit *test);
-void xe_bo_evict_kunit(struct kunit *test);
-
-#endif
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index eb1ea99a5a8b..3bffcbd233b2 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -3,6 +3,11 @@
  * Copyright © 2023 Intel Corporation
  */
 #include <linux/module.h>
+#include <kunit/test.h>
+
+extern struct kunit_suite xe_bo_test_suite;
+
+kunit_test_suite(xe_bo_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
-- 
2.43.0

