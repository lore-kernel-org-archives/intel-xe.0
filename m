Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C655C3DA44
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 11:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0351110E133;
	Mon,  8 Jul 2024 11:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IoBtd086";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7167110E133
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720437147; x=1751973147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZaEbmyElj4eriWZ3juwkKKoSrAOJ/eq3o1CyH5ul7YM=;
 b=IoBtd0864GjaWBWyhjw3b6X6yEzA93FxqIaJ+rtRajA72TS1lv9Uj0A8
 VcoxyIsH28g+HXeaoK/4CwdUwTGpislSRPJ8OGKAbmc1tvZANpaNFKF3i
 yrs2SJYRuuGmzm7lnjITLJfue8JkPFoFDWBj6VKnoz6pEXB1kzbdGo9Ia
 +cNNCcwfUMaASr8Z91MJf6TgysTZjUuaYDOdEcoYzjjc/e3at6NtG8KkN
 8k/zd0S27VWz0WC9QUt2JCOXxbtLo59RAevVHFRlABEVw1jmSbPj1NrsE
 6n1n67AGEKhNLZAbu6zPC6/k1pUR5pIQDIYVLiBg7uhPUhEbWpMT2UfgC Q==;
X-CSE-ConnectionGUID: nnQHZqEYS5KNZ7kPIZi9NA==
X-CSE-MsgGUID: q5JagPwEToqQd+ncG9WOgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17448557"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="17448557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 04:12:27 -0700
X-CSE-ConnectionGUID: EPbtA0T2QVKP8YnWX3AYwg==
X-CSE-MsgGUID: GlkoBmtTQAGN+1cIL7lpmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="47540137"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 04:12:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/4] drm/xe/kunit: Simplify xe_dma_buf live tests code layout
Date: Mon,  8 Jul 2024 13:12:08 +0200
Message-Id: <20240708111210.1154-3-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/tests/xe_dma_buf.c       | 16 +++++++++++++---
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c  | 20 --------------------
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h  | 13 -------------
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |  2 ++
 5 files changed, 15 insertions(+), 37 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 77331b0a04ad..c77a5882d094 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -3,7 +3,6 @@
 # "live" kunit tests
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_live_test.o
 xe_live_test-y = xe_live_test_mod.o \
-	xe_dma_buf_test.o \
 	xe_migrate_test.o \
 	xe_mocs_test.o
 
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index e7f9b531c465..6c5ef28a7f4d 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -8,7 +8,6 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
-#include "tests/xe_dma_buf_test.h"
 #include "tests/xe_pci_test.h"
 
 #include "xe_pci.h"
@@ -274,8 +273,19 @@ static int dma_buf_run_device(struct xe_device *xe)
 	return 0;
 }
 
-void xe_dma_buf_kunit(struct kunit *test)
+static void xe_dma_buf_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(dma_buf_run_device);
 }
-EXPORT_SYMBOL_IF_KUNIT(xe_dma_buf_kunit);
+
+static struct kunit_case xe_dma_buf_tests[] = {
+	KUNIT_CASE(xe_dma_buf_kunit),
+	{}
+};
+
+VISIBLE_IF_KUNIT
+struct kunit_suite xe_dma_buf_test_suite = {
+	.name = "xe_dma_buf",
+	.test_cases = xe_dma_buf_tests,
+};
+EXPORT_SYMBOL_IF_KUNIT(xe_dma_buf_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
deleted file mode 100644
index 99cdb718b6c6..000000000000
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
+++ /dev/null
@@ -1,20 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#include "xe_dma_buf_test.h"
-
-#include <kunit/test.h>
-
-static struct kunit_case xe_dma_buf_tests[] = {
-	KUNIT_CASE(xe_dma_buf_kunit),
-	{}
-};
-
-static struct kunit_suite xe_dma_buf_test_suite = {
-	.name = "xe_dma_buf",
-	.test_cases = xe_dma_buf_tests,
-};
-
-kunit_test_suite(xe_dma_buf_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
deleted file mode 100644
index e6b464ddd526..000000000000
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 AND MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef _XE_DMA_BUF_TEST_H_
-#define _XE_DMA_BUF_TEST_H_
-
-struct kunit;
-
-void xe_dma_buf_kunit(struct kunit *test);
-
-#endif
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index 3bffcbd233b2..d9da15d9fe3f 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -6,8 +6,10 @@
 #include <kunit/test.h>
 
 extern struct kunit_suite xe_bo_test_suite;
+extern struct kunit_suite xe_dma_buf_test_suite;
 
 kunit_test_suite(xe_bo_test_suite);
+kunit_test_suite(xe_dma_buf_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
-- 
2.43.0

