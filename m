Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAACAC636D7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 05:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAC110E00C;
	Thu, 23 Feb 2023 05:01:14 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857D710E00C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 05:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677128472; x=1708664472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZbqxGOv/BBgrQLHporT3+NH6fc/uPDWW0dRNh6h7QVY=;
 b=CEVqAyTYjevLl7Cjuk+1F3eeS1KwqqQAT4nicSpOMp7rmhh/ArmTR9NH
 WXlxvTrl7Z2FIjTHkEf/+jOlM2uuwiuf6U8NefxfNeakpLPvDp+Q9rtA5
 wF8u7toBJyPj/aWcReJoWPMyUdkJTAfsjWg7wLmy8tQhkjI7M+QkEoRp6
 0v+U+hcSWfgG1KS5aMm9CunjyjPjiyR0UKs5svtlcmP7s/25fxiSSiShZ
 VPw2vU6QLwRJ+G6OqGu64Ojf3wBpXSYPNlPI++GxlXuTog7nlUozdS3hr
 R017tMy+ay/jeDkd9vhESoq1dbA/D+udHiaFeAe6yLphnbdPUSOeitNGG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="335318155"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="335318155"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 21:01:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="846418930"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="846418930"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 21:01:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Feb 2023 21:00:35 -0800
Message-Id: <20230223050035.1009541-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix kunit integration due to missing
 prototypes
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
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In order to avoid  -Werror=missing-prototypes, add the prototypes
in a separate tests/<test-name>_test.h file that is included by both
the implementation (tests/xe_<testname>.c, injected in xe.ko) and the
kunit module (tests/xe_<testname>_test.c -> xe-<testname>-test.ko).

v2: Add header and don't add ifdef to files that are already not built
when not using kunit (Matt Auld)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c           |  2 ++
 drivers/gpu/drm/xe/tests/xe_bo_test.c      |  5 ++---
 drivers/gpu/drm/xe/tests/xe_bo_test.h      | 14 ++++++++++++++
 drivers/gpu/drm/xe/tests/xe_dma_buf.c      |  2 ++
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c |  4 ++--
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h | 13 +++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate.c      |  2 ++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |  4 ++--
 drivers/gpu/drm/xe/tests/xe_migrate_test.h | 13 +++++++++++++
 9 files changed, 52 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.h

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 87ac21cc8ca9..f03fb907b59a 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -5,6 +5,8 @@
 
 #include <kunit/test.h>
 
+#include "tests/xe_bo_test.h"
+
 #include "xe_bo_evict.h"
 #include "xe_pci.h"
 
diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/tests/xe_bo_test.c
index c8fa29b0b3b2..92dda4fca21b 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
@@ -3,10 +3,9 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <kunit/test.h>
+#include "xe_bo_test.h"
 
-void xe_ccs_migrate_kunit(struct kunit *test);
-void xe_bo_evict_kunit(struct kunit *test);
+#include <kunit/test.h>
 
 static struct kunit_case xe_bo_tests[] = {
 	KUNIT_CASE(xe_ccs_migrate_kunit),
diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.h b/drivers/gpu/drm/xe/tests/xe_bo_test.h
new file mode 100644
index 000000000000..d751a618c0c8
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_bo_test.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_BO_TEST_H__
+#define __XE_BO_TEST_H__
+
+struct kunit;
+
+void xe_ccs_migrate_kunit(struct kunit *test);
+void xe_bo_evict_kunit(struct kunit *test);
+
+#endif
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 615d22e3f731..e66a8361ae1f 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -5,6 +5,8 @@
 
 #include <kunit/test.h>
 
+#include "tests/xe_dma_buf_test.h"
+
 #include "xe_pci.h"
 
 static bool p2p_enabled(struct dma_buf_test_params *params)
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
index 7bb292da1193..a1adfd1e1605 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
@@ -3,9 +3,9 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <kunit/test.h>
+#include "xe_dma_buf_test.h"
 
-void xe_dma_buf_kunit(struct kunit *test);
+#include <kunit/test.h>
 
 static struct kunit_case xe_dma_buf_tests[] = {
 	KUNIT_CASE(xe_dma_buf_kunit),
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
new file mode 100644
index 000000000000..4e9a8bef5751
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_DMA_BUF_TEST_H__
+#define __XE_DMA_BUF_TEST_H__
+
+struct kunit;
+
+void xe_dma_buf_kunit(struct kunit *test);
+
+#endif
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 03a60d5b42f1..0de17e90aba9 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -5,6 +5,8 @@
 
 #include <kunit/test.h>
 
+#include "tests/xe_migrate_test.h"
+
 #include "xe_pci.h"
 
 static bool sanity_fence_failed(struct xe_device *xe, struct dma_fence *fence,
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
index ad779e2bd071..d6be360c3b6d 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
@@ -3,9 +3,9 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <kunit/test.h>
+#include "xe_migrate_test.h"
 
-void xe_migrate_sanity_kunit(struct kunit *test);
+#include <kunit/test.h>
 
 static struct kunit_case xe_migrate_tests[] = {
 	KUNIT_CASE(xe_migrate_sanity_kunit),
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.h b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
new file mode 100644
index 000000000000..db1f8ef035bb
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_MIGRATE_TEST_H__
+#define __XE_MIGRATE_TEST_H__
+
+struct kunit;
+
+void xe_migrate_sanity_kunit(struct kunit *test);
+
+#endif
-- 
2.39.0

