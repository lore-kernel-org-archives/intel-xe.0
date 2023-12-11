Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE822C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 20:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACB110E4EC;
	Mon, 11 Dec 2023 20:04:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B1D10E4FD
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702325086; x=1733861086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5yMyXkYj2BuvjvcJBeXWKdTyaowmh/dp59ZBZZxYnoc=;
 b=NZChbA+nIww6NjyRE1gzKRgfdy5Dsot8Yt51i3RT+gQviZj1CSXQxo7R
 nsCzWkrGdJl+0/AAeIc8gHu3Nx716kx7Aq+iUFXtdPQJPyrAyXHgw/tuO
 T5bLUP7cgY4EOXDVJ96SFN0wYMLPk8IxZheHtTSlo0vVZ4deFVgiQEpMR
 BPseuTXAl4Qicg0gESiyR9iEyiOr0jSo7jN17E1pKfYdp4kYqx8JY/kpF
 lHHRSq19NPR58Rs0RAchSN2qrOABiCi5T3/J3PjXpDWplerfamPM1WDgC
 jVptprmQop2cear//AVKid9b9PCp9wUn3OtdIxPwbkM5Y0rLgj0IQdXjX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="480900347"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="480900347"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 12:04:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="807440690"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="807440690"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.141])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 12:04:45 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 5/9] drm/xe/kunit: Define helper functions to allocate mock
 device
Date: Mon, 11 Dec 2023 21:04:20 +0100
Message-Id: <20231211200424.1703-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231211200424.1703-1-michal.wajdeczko@intel.com>
References: <20231211200424.1703-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There will be more KUnit tests added that will require mock device.
Define generic helper functions to avoid code duplications.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |  3 +
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 85 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h | 19 +++++
 3 files changed, 107 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0c2e247dc188..14857923d217 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -145,6 +145,9 @@ xe-$(CONFIG_PCI_IOV) += \
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
index 000000000000..236f24d3ca17
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -0,0 +1,85 @@
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
+ * __xe_kunit_helper_alloc_xe_device - Allocate a mock &xe_device for a KUnit test
+ * @test: the &kunit where this &xe_device will be used
+ * @data: the &xe_pci_fake_data with desired variant of the mock device (optional)
+ *
+ * This function creates a &xe_device based on parameters from @data.
+ * This allocation is managed. See drm_kunit_helper_alloc_device() and
+ * drm_kunit_helper_alloc_drm_device() for details.
+ *
+ * Return: A pointer to mock &xe_device described by &data
+ */
+struct xe_device *__xe_kunit_helper_alloc_xe_device(struct kunit *test,
+						    struct xe_pci_fake_data *data)
+{
+	struct xe_device *xe;
+	struct device *dev;
+	int err;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	xe = drm_kunit_helper_alloc_drm_device(test, dev,
+					       struct xe_device,
+					       drm, DRIVER_GEM);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
+
+	test->priv = data;
+	err = xe_pci_fake_device_init(xe);
+	test->priv = NULL;
+	KUNIT_ASSERT_EQ(test, 0, err);
+
+	xe->drm.dev = dev;
+	return xe;
+}
+EXPORT_SYMBOL_IF_KUNIT(__xe_kunit_helper_alloc_xe_device);
+
+/**
+ * xe_kunit_helper_alloc_xe_device - Allocate a mock &xe_device for KUnit test.
+ * @test: the &kunit where this &xe_device will be used
+ *
+ * See __xe_kunit_helper_alloc_xe_device() for details.
+ *
+ * Return: A pointer to default mock &xe_device.
+ */
+struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test)
+{
+	return __xe_kunit_helper_alloc_xe_device(test, NULL);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
+
+/**
+ * xe_kunit_helper_xe_device_test_init - Allocate a mock &xe_device for KUnit test.
+ * @test: the &kunit where this fake &xe_device will be used
+ *
+ * This function allocates a default mock &xe_device and stores its pointer as
+ * &kunit.priv to allow test code to access it.
+ *
+ * This function can be directly used as custom implementation of &kunit_suite.init.
+ *
+ * See xe_kunit_helper_alloc_xe_device() for details.
+ *
+ * Return: Always 0.
+ */
+int xe_kunit_helper_xe_device_test_init(struct kunit *test)
+{
+	test->priv = xe_kunit_helper_alloc_xe_device(test);
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
new file mode 100644
index 000000000000..1bbd0a58c1b2
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_KUNIT_HELPERS_H_
+#define _XE_KUNIT_HELPERS_H_
+
+struct kunit;
+struct xe_device;
+struct xe_pci_fake_data;
+
+struct xe_device *__xe_kunit_helper_alloc_xe_device(struct kunit *test,
+						    struct xe_pci_fake_data *data);
+struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test);
+
+int xe_kunit_helper_xe_device_test_init(struct kunit *test);
+
+#endif
-- 
2.25.1

