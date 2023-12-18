Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225C1C46CD3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D407610E3B6;
	Mon, 18 Dec 2023 19:07:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1E610E371
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926403; x=1734462403;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0xOR+DwY+zAloK80OncXTn+oMh1qalor0xFJCwU9irU=;
 b=keplRyYJ7ELtC3Pi876oyAdTu4WRssDyEh0DW1YG82HS5hHeilYpmI0j
 1eqmvqWmwBa8TmIqU4cwfby1F8yMP+KQF34mS9nn05QA+PUPMhwwJB1sN
 4z4o70c2ip3xAgDdXDPGgZ/bGMaxUYgmvpFo3jfhY7+bQblK/C7WLF5Yh
 fjDbPQK39hMxPvkTB6veL8/3RNBQ8oQHh//O2ZpLWOrCgdtDolbPhneuI
 ktok5L8fLOX1KPPAahkk0Ivqev4IBy+qE1x5oqaRI7lWQg5+DOkBh8Mhp
 mOD0w4X/PpM36Y5GVJL6cXbnZ3fwcpqAaOy6QzXrwaDwDLcD4/lwFzxza g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="399382192"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="399382192"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="866330873"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="866330873"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:42 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 05/10] drm/xe/kunit: Define helper functions to allocate
 fake xe device
Date: Mon, 18 Dec 2023 20:06:24 +0100
Message-Id: <20231218190629.502-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218190629.502-1-michal.wajdeczko@intel.com>
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
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

There will be more KUnit tests added that will require fake device.
Define generic helper functions to avoid code duplications.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |  3 +
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 80 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h | 17 +++++
 3 files changed, 100 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index d29649b788c5..b0190c975841 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -154,6 +154,9 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt_2l.o \
 	xe_lmtt_ml.o
 
+xe-$(CONFIG_DRM_XE_KUNIT_TEST) += \
+	tests/xe_kunit_helpers.o
+
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/display/ext \
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
new file mode 100644
index 000000000000..6d72dbf06139
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <kunit/test.h>
+#include <kunit/static_stub.h>
+#include <kunit/visibility.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
+
+#include "tests/xe_kunit_helpers.h"
+#include "tests/xe_pci_test.h"
+#include "xe_device_types.h"
+
+/**
+ * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
+ * @test: the &kunit where this &xe_device will be used
+ * @dev: The parent device object
+ *
+ * This function allocates xe_device using drm_kunit_helper_alloc_device().
+ * The xe_device allocation is managed by the test.
+ *
+ * @dev should be allocated using drm_kunit_helper_alloc_device().
+ *
+ * This function uses KUNIT_ASSERT to detect any allocation failures.
+ *
+ * Return: A pointer to the new &xe_device.
+ */
+struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
+						  struct device *dev)
+{
+	struct xe_device *xe;
+
+	xe = drm_kunit_helper_alloc_drm_device(test, dev,
+					       struct xe_device,
+					       drm, DRIVER_GEM);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
+	return xe;
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
+
+/**
+ * xe_kunit_helper_xe_device_test_init - Prepare a &xe_device for a KUnit test.
+ * @test: the &kunit where this fake &xe_device will be used
+ *
+ * This function allocates and initializes a fake &xe_device and stores its
+ * pointer as &kunit.priv to allow the test code to access it.
+ *
+ * This function can be directly used as custom implementation of
+ * &kunit_suite.init.
+ *
+ * It is possible to prepare specific variant of the fake &xe_device by passing
+ * in &kunit.priv pointer to the struct xe_pci_fake_data supplemented with
+ * desired parameters prior to calling this function.
+ *
+ * This function uses KUNIT_ASSERT to detect any failures.
+ *
+ * Return: Always 0.
+ */
+int xe_kunit_helper_xe_device_test_init(struct kunit *test)
+{
+	struct xe_device *xe;
+	struct device *dev;
+	int err;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	xe = xe_kunit_helper_alloc_xe_device(test, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
+
+	err = xe_pci_fake_device_init(xe);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	test->priv = xe;
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
new file mode 100644
index 000000000000..067a1babf049
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_KUNIT_HELPERS_H_
+#define _XE_KUNIT_HELPERS_H_
+
+struct device;
+struct kunit;
+struct xe_device;
+
+struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
+						  struct device *dev);
+int xe_kunit_helper_xe_device_test_init(struct kunit *test);
+
+#endif
-- 
2.25.1

