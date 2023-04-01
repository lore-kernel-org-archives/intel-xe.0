Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951F8C76196
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 08:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D7410E096;
	Sat,  1 Apr 2023 08:52:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D28910E080
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680339161; x=1711875161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=152nbwO+XlQzkyMVMijVbCekzG+EPA1Pxcmoo03JKeU=;
 b=O1smD2+on7LnPTY3CKqwGMwEDSE+nqt7VDnILNj4kh0pFYYj7xlWvrD0
 azJM7J5rxf08kvu1hD6i7Xqb1JPh8YaicUanpOpcBLmeK/ZJtM16/U90x
 xI9V+Hzz+qtReHD/YYqYt/EdhjYBuAT0Vp+hTYg3VtmWSZCw1canpUL9m
 TxjjOxMuiKIY21Id1dYla11k3bU/bIM09CJ2R1npOCmS7WfZm4z0xs1Tn
 MQIoZWlhrvfkHd8L+l5ghw2XVb3In8bjD4k+dCtCSzbvvb801LYHTpgir
 2uKkhs3D1MRbv/izcuyixKzeBno7lsrFQOnvrQx0qG8eUYmLK14EI73LW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="341651172"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="341651172"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="685369571"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="685369571"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:52:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat,  1 Apr 2023 01:51:47 -0700
Message-Id: <20230401085151.1786204-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230401085151.1786204-1-lucas.demarchi@intel.com>
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/7] drm/xe: Use symbol namespace for kunit
 tests
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
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal@hardline.pl>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of simply using EXPORT_SYMBOL() to export the functions needed
in xe.ko to be be called across modules, use EXPORT_SYMBOL_IF_KUNIT()
which will export the symbol under the EXPORTED_FOR_KUNIT_TESTING
namespace.

This avoids accidentally "leaking" these functions and letting them be
called from outside the kunit tests. If these functiosn are accidentally
called from another module, they receive a modpost error like below:

	ERROR: modpost: module XXXXXXX uses symbol
	xe_ccs_migrate_kunit from namespace EXPORTED_FOR_KUNIT_TESTING,
	but does not import it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c           | 5 +++--
 drivers/gpu/drm/xe/tests/xe_bo_test.c      | 1 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c      | 3 ++-
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c | 1 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 3 ++-
 drivers/gpu/drm/xe/tests/xe_migrate_test.c | 1 +
 6 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index aa433a7b59b7..9bd381e5b7a6 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -4,6 +4,7 @@
  */
 
 #include <kunit/test.h>
+#include <kunit/visibility.h>
 
 #include "tests/xe_bo_test.h"
 #include "tests/xe_pci_test.h"
@@ -166,7 +167,7 @@ void xe_ccs_migrate_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(ccs_test_run_device);
 }
-EXPORT_SYMBOL(xe_ccs_migrate_kunit);
+EXPORT_SYMBOL_IF_KUNIT(xe_ccs_migrate_kunit);
 
 static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kunit *test)
 {
@@ -304,4 +305,4 @@ void xe_bo_evict_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(evict_test_run_device);
 }
-EXPORT_SYMBOL(xe_bo_evict_kunit);
+EXPORT_SYMBOL_IF_KUNIT(xe_bo_evict_kunit);
diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/tests/xe_bo_test.c
index 92dda4fca21b..1c868e3635bc 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
@@ -22,3 +22,4 @@ kunit_test_suite(xe_bo_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index cf9dddf1a8d7..513a3b3362e9 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -4,6 +4,7 @@
  */
 
 #include <kunit/test.h>
+#include <kunit/visibility.h>
 
 #include "tests/xe_dma_buf_test.h"
 #include "tests/xe_pci_test.h"
@@ -259,4 +260,4 @@ void xe_dma_buf_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(dma_buf_run_device);
 }
-EXPORT_SYMBOL(xe_dma_buf_kunit);
+EXPORT_SYMBOL_IF_KUNIT(xe_dma_buf_kunit);
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
index a1adfd1e1605..35312bfd5fb7 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
@@ -21,3 +21,4 @@ kunit_test_suite(xe_dma_buf_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index d410305c9b59..95985c9c9392 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -4,6 +4,7 @@
  */
 
 #include <kunit/test.h>
+#include <kunit/visibility.h>
 
 #include "tests/xe_migrate_test.h"
 #include "tests/xe_pci_test.h"
@@ -407,4 +408,4 @@ void xe_migrate_sanity_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(migrate_test_run_device);
 }
-EXPORT_SYMBOL(xe_migrate_sanity_kunit);
+EXPORT_SYMBOL_IF_KUNIT(xe_migrate_sanity_kunit);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
index d6be360c3b6d..39179eae890b 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
@@ -21,3 +21,4 @@ kunit_test_suite(xe_migrate_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
-- 
2.39.0

