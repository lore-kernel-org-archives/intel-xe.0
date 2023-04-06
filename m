Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5774C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEA410ED00;
	Thu,  6 Apr 2023 20:33:49 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B92610ED00
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680813228; x=1712349228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f4oDDGlx3/x8RC1BbHpUS0Dpno/dz9qXYuyilDmtYkI=;
 b=emDE311KTbBxjQobYO+alA5qhLm/Xi00+lcvXyEdqhWCUHoVOKNor+td
 22TX/2Rr82lAHqhqd+54wt1Bl4BLS9PvQfMqxiwAwAxLbcK3QSNP6laXQ
 6x78yemItHamR+PPqMwZUTdFab3epb7LSY5uqA0t3bVIE+d4rJvqdaP8e
 redb6mzdSYFVZVG29qzuJg12D4mf6rsy2LZbaRJ5GjG64uwR0l+uy0zSg
 CHigjzpQ0tyJxTeM/sdlswXnzYkhCSXGJFTq6KRzgO9ZopPbD2RdwBDnP
 MGCAVuVfQ/4Gpai4y6qn3f82WolRT0lIUfkhEchOzmAQM0CYf8UrKq4G5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370671653"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="370671653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861532187"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="861532187"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:33:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 13:33:31 -0700
Message-Id: <20230406203331.1802261-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406201845.1797532-9-matthew.d.roper@intel.com>
References: <20230406201845.1797532-9-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2.1 8/9] drm/xe: Add KUnit test for xe_pci.c IP
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
 drivers/gpu/drm/xe/tests/xe_pci.c      | 42 +++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 74 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  6 +++
 drivers/gpu/drm/xe/xe_pci.c            | 29 +---------
 drivers/gpu/drm/xe/xe_pci_types.h      | 39 ++++++++++++++
 6 files changed, 163 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_types.h

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
index cc65ac5657b3..8f7965c706cd 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -62,6 +62,48 @@ int xe_call_for_each_device(xe_device_fn xe_fn)
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
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 32d177c22a0b..c10f2d45ae91 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -21,6 +21,7 @@
 #include "xe_drv.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_pci_types.h"
 #include "xe_pm.h"
 #include "xe_step.h"
 
@@ -42,34 +43,6 @@ struct xe_gt_desc {
 	u32 mmio_adj_offset;
 };
 
-struct xe_graphics_desc {
-	const char *name;
-	u8 ver;
-	u8 rel;
-
-	u8 dma_mask_size;	/* available DMA address bits */
-	u8 vm_max_level;
-	u8 vram_flags;
-
-	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
-
-	u8 max_remote_tiles:2;
-
-	u8 has_asid:1;
-	u8 has_flat_ccs:1;
-	u8 has_link_copy_engine:1;
-	u8 has_range_tlb_invalidation:1;
-	u8 supports_usm:1;
-};
-
-struct xe_media_desc {
-	const char *name;
-	u8 ver;
-	u8 rel;
-
-	u64 hw_engine_mask;	/* hardware engines provided by media IP */
-};
-
 struct xe_device_desc {
 	const struct xe_graphics_desc *graphics;
 	const struct xe_media_desc *media;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
new file mode 100644
index 000000000000..e479c1c4ed30
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PCI_TYPES_H_
+#define _XE_PCI_TYPES_H_
+
+#include <linux/types.h>
+
+struct xe_graphics_desc {
+	const char *name;
+	u8 ver;
+	u8 rel;
+
+	u8 dma_mask_size;	/* available DMA address bits */
+	u8 vm_max_level;
+	u8 vram_flags;
+
+	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
+
+	u8 max_remote_tiles:2;
+
+	u8 has_asid:1;
+	u8 has_flat_ccs:1;
+	u8 has_link_copy_engine:1;
+	u8 has_range_tlb_invalidation:1;
+	u8 supports_usm:1;
+};
+
+struct xe_media_desc {
+	const char *name;
+	u8 ver;
+	u8 rel;
+
+	u64 hw_engine_mask;	/* hardware engines provided by media IP */
+};
+
+#endif
-- 
2.39.2

