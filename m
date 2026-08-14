Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CD2C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A9810F6D4;
	Fri, 14 Aug 2026 17:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQ+zWk3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D2910F6CB
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727931; x=1818263931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3fYR3QiOxie50jy29EuBxqB4T8fnqgkPHBKvPDFbOmA=;
 b=iQ+zWk3fbKzsomU8abHJ6GQyLNnKs6buqOcwqUHxFD15sTxy4y9zLCeg
 77HVNWWVg5+kwoxZIeSOOc+uQLNcCr+YngxIImomtHevGEf9//bkbXMeT
 a378MbaJEzOXAd5DIBbcyj4+PC3MdLYaRsm01ze4N1xqxSTnlX8n+Gtu6
 3GRB15Vf3i9T+ZHLpKLosFWczYVVuH2Iz7a26bIOh2Uan3g1uuMq8FYaK
 tPbUdcKBUyui6UAjMZiIMBnHkksExgO/ro4oagxer0OPjsjRq4tjjrf4F
 SpmkhqiQCGQ6jyd8oFGUOvycsdAE66bpDAzptuYWtAf23xfYfrGRZTdJw g==;
X-CSE-ConnectionGUID: Y7BcHlBlTQq7ehoOf3vq8A==
X-CSE-MsgGUID: 1SA3S/P/ToqHSxnkVuso/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464062"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464062"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:51 -0700
X-CSE-ConnectionGUID: XThyWivgReKnzfNYShWtlQ==
X-CSE-MsgGUID: OdkLKz3tTMKzcL7p3uT0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946222"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 17/33] drm/xe/tests: Add kunit tests for xe_any
Date: Fri, 14 Aug 2026 19:17:43 +0200
Message-ID: <20260814171801.13347-18-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Add simple sanity tests for all xe_any macros to make sure they
are working as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: add test_if_pdev, check drm casts (Mallesh)
---
 drivers/gpu/drm/xe/tests/Makefile       |   1 +
 drivers/gpu/drm/xe/tests/xe_any_kunit.c | 213 ++++++++++++++++++++++++
 2 files changed, 214 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_any_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index f7aa47f11a36..0b809a252cfa 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -7,6 +7,7 @@ xe_live_test-y = xe_live_test_mod.o
 # Normal kunit tests
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
 xe_test-y = xe_test_mod.o \
+	xe_any_kunit.o \
 	xe_args_test.o \
 	xe_pci_test.o \
 	xe_rtp_tables_test.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_any_kunit.c b/drivers/gpu/drm/xe/tests/xe_any_kunit.c
new file mode 100644
index 000000000000..0a5f28894cd2
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_any_kunit.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "tests/xe_kunit_helpers.h"
+#include "tests/xe_pci_test.h"
+#include "xe_any.h"
+#include "xe_device.h"
+
+static void test_to_xe(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile->primary_gt;
+	struct drm_device *drm = &xe->drm;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	const struct xe_device *cxe = xe;
+	const struct xe_tile *ctile = tile;
+	const struct xe_gt *cgt = gt;
+
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(xe));
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(tile));
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(gt));
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(drm));
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(dev));
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(pdev));
+
+	KUNIT_EXPECT_PTR_EQ(test, cxe, xe_any_to_xe(cxe));
+	KUNIT_EXPECT_PTR_EQ(test, cxe, xe_any_to_xe(ctile));
+	KUNIT_EXPECT_PTR_EQ(test, cxe, xe_any_to_xe(cgt));
+}
+
+static void test_to_pdev(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile->primary_gt;
+	struct drm_device *drm = &xe->drm;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(xe));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(tile));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(gt));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(drm));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(dev));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(pdev));
+
+	/* mimic early probe stage */
+	dev_set_drvdata(xe->drm.dev, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(dev));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(pdev));
+}
+
+static void test_to_dev(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile->primary_gt;
+	struct drm_device *drm = &xe->drm;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(xe));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(tile));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(gt));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(drm));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(dev));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(pdev));
+
+	/* mimic early probe stage */
+	dev_set_drvdata(xe->drm.dev, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(dev));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(pdev));
+}
+
+static void test_to_drm(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile->primary_gt;
+	struct drm_device *drm = &xe->drm;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(xe));
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(tile));
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(gt));
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(drm));
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(dev));
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(pdev));
+}
+
+static void test_if_pdev(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile->primary_gt;
+	struct drm_device *drm = &xe->drm;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_TRUE(test, xe && drm && tile && gt && dev && pdev);
+	KUNIT_EXPECT_NULL(test, xe_any_if_pdev(xe));
+	KUNIT_EXPECT_NULL(test, xe_any_if_pdev(tile));
+	KUNIT_EXPECT_NULL(test, xe_any_if_pdev(gt));
+	KUNIT_EXPECT_NULL(test, xe_any_if_pdev(drm));
+	KUNIT_EXPECT_NULL(test, xe_any_if_pdev(dev));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_if_pdev(pdev));
+}
+
+static void test_if_xe(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile->primary_gt;
+	struct drm_device *drm = &xe->drm;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_TRUE(test, xe && drm && tile && gt && dev && pdev);
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_if_xe(xe));
+	KUNIT_EXPECT_NULL(test, xe_any_if_xe(tile));
+	KUNIT_EXPECT_NULL(test, xe_any_if_xe(gt));
+	KUNIT_EXPECT_NULL(test, xe_any_if_xe(drm));
+	KUNIT_EXPECT_NULL(test, xe_any_if_xe(dev));
+	KUNIT_EXPECT_NULL(test, xe_any_if_xe(pdev));
+}
+
+static void test_if_tile(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile->primary_gt;
+	struct drm_device *drm = &xe->drm;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_TRUE(test, xe && drm && tile && gt && dev && pdev);
+	KUNIT_EXPECT_NULL(test, xe_any_if_tile(xe));
+	KUNIT_EXPECT_PTR_EQ(test, tile, xe_any_if_tile(tile));
+	KUNIT_EXPECT_NULL(test, xe_any_if_tile(gt));
+	KUNIT_EXPECT_NULL(test, xe_any_if_tile(drm));
+	KUNIT_EXPECT_NULL(test, xe_any_if_tile(dev));
+	KUNIT_EXPECT_NULL(test, xe_any_if_tile(pdev));
+}
+
+static void test_if_gt(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile->primary_gt;
+	struct drm_device *drm = &xe->drm;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_TRUE(test, xe && drm && tile && gt && dev && pdev);
+	KUNIT_EXPECT_NULL(test, xe_any_if_gt(xe));
+	KUNIT_EXPECT_NULL(test, xe_any_if_gt(tile));
+	KUNIT_EXPECT_PTR_EQ(test, gt, xe_any_if_gt(gt));
+	KUNIT_EXPECT_NULL(test, xe_any_if_gt(drm));
+	KUNIT_EXPECT_NULL(test, xe_any_if_gt(dev));
+	KUNIT_EXPECT_NULL(test, xe_any_if_gt(pdev));
+}
+
+static void test_to_id(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile->primary_gt;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	const struct xe_device *cxe = xe;
+	const struct xe_tile *ctile = tile;
+	const struct xe_gt *cgt = gt;
+
+	tile->id = 1;
+	gt->info.id = 2;
+
+	KUNIT_EXPECT_EQ(test, 0, xe_any_id(xe));
+	KUNIT_EXPECT_EQ(test, 1, xe_any_id(tile));
+	KUNIT_EXPECT_EQ(test, 2, xe_any_id(gt));
+	KUNIT_EXPECT_EQ(test, 0, xe_any_id(dev));
+	KUNIT_EXPECT_EQ(test, 0, xe_any_id(pdev));
+	KUNIT_EXPECT_EQ(test, 0, xe_any_id(cxe));
+	KUNIT_EXPECT_EQ(test, 1, xe_any_id(ctile));
+	KUNIT_EXPECT_EQ(test, 2, xe_any_id(cgt));
+}
+
+static struct kunit_case xe_any_tests[] = {
+	KUNIT_CASE(test_to_xe),
+	KUNIT_CASE(test_to_dev),
+	KUNIT_CASE(test_to_pdev),
+	KUNIT_CASE(test_to_drm),
+	KUNIT_CASE(test_if_pdev),
+	KUNIT_CASE(test_if_xe),
+	KUNIT_CASE(test_if_tile),
+	KUNIT_CASE(test_if_gt),
+	KUNIT_CASE(test_to_id),
+	{}
+};
+
+static struct kunit_suite xe_any_test_suite = {
+	.name = "xe_any",
+	.test_cases = xe_any_tests,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+
+kunit_test_suite(xe_any_test_suite);
-- 
2.47.1

