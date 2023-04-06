Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA499C77B6C
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 23:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8271710E2D1;
	Thu,  6 Apr 2023 23:56:40 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2E310ED67
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 23:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680825399; x=1712361399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nbCDIKFSUtpnrF4YFdtNVtPB0bjt/xHZ6spNglr7Mn0=;
 b=UFgvLsppp0JEYbubxiAswMKLfF6T0x0wh8JwDNJMSU6Phy05f4dMD+gl
 Uuyfo7TQME25sy+TDDD7dULbGB+ZWxLIkrcRqWtYozXF4J/tMpyNvpmvn
 uSo9xaqgWDuTi4hGqNm2M5CA1i35Ok1QciwmWN+f8gAjFL92HAkTKfMMV
 aWMr+9vyicQMh5LlYQ4KnYf0kUQ0JNTnFz3Il5SCpURA5VEZaK68oSvJL
 /B/yRkp1j+iN0pVAMlbDhWax8xasyB3yGH8d3s7KaxbNY71Na0vc2ET1C
 zWzuDBxvE3118gFFs6IZY7EU7PQKn5bJVvIa4PcPw7VcTZEASPOMVNbRd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344640876"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="344640876"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 16:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861587195"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="861587195"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 16:56:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 16:56:20 -0700
Message-Id: <20230406235621.1914492-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406235621.1914492-1-matthew.d.roper@intel.com>
References: <20230406235621.1914492-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 8/9] drm/xe: Add KUnit test for xe_pci.c IP
 engine lists
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a simple KUnit test to ensure that the hardware engine lists for
GMD_ID IP definitions are sensible (i.e., no graphics engines defined
for the media IP and vice versa).

Only the IP descriptors for GMD_ID platforms are checked for now.
Presumably the engine lists on older pre-GMD_ID platforms shouldn't be
changing.  We can extend the KUnit testing in the future if we decide we
want to check those as well.

v2:
 - Add missing 'const' in xe_call_for_each_media_ip to avoid compiler
   warning.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile      |  1 +
 drivers/gpu/drm/xe/tests/xe_pci.c      | 44 +++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 74 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  6 +++
 4 files changed, 125 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.c

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 56919abb3f2a..51f1a7f017d4 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
 	xe_bo_test.o \
 	xe_dma_buf_test.o \
 	xe_migrate_test.o \
+	xe_pci_test.o \
 	xe_rtp_test.o \
 	xe_wa_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index cc65ac5657b3..d357cf1cb07c 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -62,6 +62,50 @@ int xe_call_for_each_device(xe_device_fn xe_fn)
 	return ret;
 }
 
+/**
+ * xe_call_for_each_graphics_ip - Iterate over all recognized graphics IPs
+ * @xe_fn: Function to call for each device.
+ *
+ * This function iterated over the descriptors for all graphics IPs recognized
+ * by the driver and calls @xe_fn: for each one of them.
+ */
+void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn)
+{
+	const struct xe_graphics_desc *ip, *last = NULL;
+
+	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
+		ip = graphics_ip_map[i].ip;
+		if (ip == last)
+			continue;
+
+		xe_fn(ip);
+		last = ip;
+	}
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_graphics_ip);
+
+/**
+ * xe_call_for_each_media_ip - Iterate over all recognized media IPs
+ * @xe_fn: Function to call for each device.
+ *
+ * This function iterated over the descriptors for all media IPs recognized
+ * by the driver and calls @xe_fn: for each one of them.
+ */
+void xe_call_for_each_media_ip(xe_media_fn xe_fn)
+{
+	const struct xe_media_desc *ip, *last = NULL;
+
+	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
+		ip = media_ip_map[i].ip;
+		if (ip == last)
+			continue;
+
+		xe_fn(ip);
+		last = ip;
+	}
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
+
 int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 			    enum xe_subplatform subplatform)
 {
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
new file mode 100644
index 000000000000..9c6f6c2c6c6e
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
+
+#include <kunit/test.h>
+
+#include "tests/xe_test.h"
+
+#include "xe_device.h"
+#include "xe_pci_test.h"
+#include "xe_pci_types.h"
+
+static void check_graphics_ip(const struct xe_graphics_desc *graphics)
+{
+	struct kunit *test = xe_cur_kunit();
+	u64 mask = graphics->hw_engine_mask;
+
+	/* RCS, CCS, and BCS engines are allowed on the graphics IP */
+	mask &= ~(XE_HW_ENGINE_RCS_MASK |
+		  XE_HW_ENGINE_CCS_MASK |
+		  XE_HW_ENGINE_BCS_MASK);
+
+	/* Any remaining engines are an error */
+	KUNIT_ASSERT_EQ(test, mask, 0);
+}
+
+static void check_media_ip(const struct xe_media_desc *media)
+{
+	struct kunit *test = xe_cur_kunit();
+	u64 mask = media->hw_engine_mask;
+
+	/*
+	 * VCS and VECS engines are allowed on the media IP
+	 *
+	 * TODO:  Add GSCCS once support is added to the driver.
+	 */
+	mask &= ~(XE_HW_ENGINE_VCS_MASK |
+		  XE_HW_ENGINE_VECS_MASK);
+
+	/* Any remaining engines are an error */
+	KUNIT_ASSERT_EQ(test, mask, 0);
+}
+
+static void xe_gmdid_graphics_ip(struct kunit *test)
+{
+	xe_call_for_each_graphics_ip(check_graphics_ip);
+}
+
+static void xe_gmdid_media_ip(struct kunit *test)
+{
+	xe_call_for_each_media_ip(check_media_ip);
+}
+
+static struct kunit_case xe_pci_tests[] = {
+	KUNIT_CASE(xe_gmdid_graphics_ip),
+	KUNIT_CASE(xe_gmdid_media_ip),
+	{}
+};
+
+static struct kunit_suite xe_pci_test_suite = {
+	.name = "xe_pci",
+	.test_cases = xe_pci_tests,
+};
+
+kunit_test_suite(xe_pci_test_suite);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 43294e8c62bb..cc0f1d141a4d 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -9,6 +9,8 @@
 #include "xe_platform_types.h"
 
 struct xe_device;
+struct xe_graphics_desc;
+struct xe_media_desc;
 
 /*
  * Some defines just for clarity: these mean the test doesn't care about what
@@ -18,8 +20,12 @@ struct xe_device;
 #define XE_TEST_SUBPLATFORM_ANY	XE_SUBPLATFORM_UNINITIALIZED
 
 typedef int (*xe_device_fn)(struct xe_device *);
+typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
+typedef void (*xe_media_fn)(const struct xe_media_desc *);
 
 int xe_call_for_each_device(xe_device_fn xe_fn);
+void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
+void xe_call_for_each_media_ip(xe_media_fn xe_fn);
 
 int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 			    enum xe_subplatform subplatform);
-- 
2.39.2

