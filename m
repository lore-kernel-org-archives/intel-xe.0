Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE64C6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 08:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA5B10E490;
	Mon, 13 Mar 2023 08:13:37 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C25110E490
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678695215; x=1710231215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MMpRuo7LJvvUybwfEZomFY188ErrrQzS+jFzWDiOWJs=;
 b=oFyB7mF3WDQ9RQWafpacArcfk3tHeLLGj/d8eu5XWKr3lYjchvQJ42mY
 Zt/IxId4lL4mbA/rfqlbWZdxBFyWd+I6ZemXgmX7ezfBTxOlCcvk9MlkW
 SLd5G9l8c838+nbSv09HDQwFI3GyXf/BEZNAj05EVpJnWr4v4wSQs4drm
 1Ah50mXcb5IN909HVGSUArxiOH8t9+pUOSIexvodFR1RDy6pQMIeVgka2
 1S6YM1qPbbmhbciCuw8Bpbr/N1xh/tiqIBSMET5bBAQQDd8+CwE8jarB1
 lYksGvkcil5IDALQ+eR/Fsh6Jz9vOxhXOiASUWP+f8NO2+5NfhttdAoKl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="320940421"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="320940421"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="821858090"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="821858090"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.27])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:13:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 09:13:12 +0100
Message-Id: <20230313081316.2408-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230313081316.2408-1-michal.wajdeczko@intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] drm/xe: Introduce new selftests framework
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

Our initial attempt to run Kunit based tests on live devices is hard
to use and will not work well with multiple devices attached.

Instead of relying on separate test module and duplicating support
for multiple live devices in every test entry point, create new set
of helpers and use test->priv to pass reference of the device under
test (DUT) directly to every test function.

The same use pattern is supported for both mock and live selftests.

By using bus_notifier we can start testing each new bound device
separatelly, subject to filtering using dut_filter modparam.

All test cases can be included directly from .c file, allowing test
code to access and use any private functions.

As Kunit will attempt to run all suites on module load, including
our new live test suites, we may want to allow to execute them on
any available device. This is controlled by anonymous_dut modparam.

Support for either mock or live selftests, only one at time, is
controlled by new Kconfig options.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
 drivers/gpu/drm/xe/Makefile                   |  11 ++
 drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
 .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
 .../drm/xe/selftests/xe_selftests_executor.c  | 118 ++++++++++++++++++
 .../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
 .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
 .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
 .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
 drivers/gpu/drm/xe/xe_module.c                |   2 +
 10 files changed, 412 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
 create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
 create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
 create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
 create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
 create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
 create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 93b284cdd0a2..aeba43977dca 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
 
 	  If in doubt, say "N".
 
+config DRM_XE_SELFTESTS_MOCK
+	bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
+	depends on DRM_XE && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+		Choose this option to allow the driver to perform mock
+		selftests based on the Kunit framework.
+
+		Recommended for driver developers only.
+		If in doubt, say "N".
+
+config DRM_XE_SELFTESTS_LIVE
+	bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK
+	depends on DRM_XE && KUNIT && EXPERT
+	default n
+	help
+		Choose this option to allow the driver to perform live
+		selftests based on the Kunit framework.
+
+		Recommended for driver developers only.
+		If in doubt, say "N".
+
 config DRM_XE_KUNIT_TEST
         tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
 	depends on DRM_XE && KUNIT && DEBUG_FS
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b94e65c91101..b193af2d9930 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -211,6 +211,17 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
 	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
 endif
 
+xe-$(CONFIG_DRM_XE_SELFTESTS_MOCK) += \
+	selftests/xe_selftests_mock.o \
+
+xe-$(CONFIG_DRM_XE_SELFTESTS_LIVE) += \
+	selftests/xe_selftests_auto.o \
+	selftests/xe_selftests_executor.o \
+	selftests/xe_selftests_params.o \
+
+xe-$(CONFIG_KUNIT) += \
+	selftests/xe_selftests_helpers.o \
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests.h b/drivers/gpu/drm/xe/selftests/xe_selftests.h
new file mode 100644
index 000000000000..6b13b998e789
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/xe_selftests.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_SELFTESTS_H_
+#define _XE_SELFTESTS_H_
+
+struct kunit_suite;
+struct kunit;
+
+int xe_selftests_run(const char *dev_name);
+
+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
+int init_xe_live_selftest_suite(struct kunit_suite *suite);
+#endif
+
+int init_xe_device_selftest(struct kunit *test);
+void exit_xe_device_selftest(struct kunit *test);
+
+int init_xe_gt_selftest(struct kunit *test);
+void exit_xe_gt_selftest(struct kunit *test);
+
+int init_xe_guc_selftest(struct kunit *test);
+void exit_xe_guc_selftest(struct kunit *test);
+
+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
+int xe_selftests_module_init(void);
+void xe_selftests_module_exit(void);
+#else
+static inline int xe_selftests_module_init(void) { return 0; }
+static inline void xe_selftests_module_exit(void) { }
+#endif
+
+#endif /* _XE_SELFTESTS_H_ */
diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
new file mode 100644
index 000000000000..ef98f3599eac
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/glob.h>
+#include <linux/pci.h>
+
+#include "xe_drv.h"
+#include "selftests/xe_selftests.h"
+#include "selftests/xe_selftests_internal.h"
+
+static int bus_cb(struct notifier_block *nb, unsigned long action, void *data)
+{
+	struct device *dev = data;
+	struct device_driver *drv = dev->driver;
+
+	if (action != BUS_NOTIFY_BOUND_DRIVER)
+		return 0;
+
+	if (strcmp(DRIVER_NAME, drv->name))
+		return 0;
+
+	/* only matching DUT names will be tested */
+	if (!dut_filter || !glob_match(dut_filter, dev_name(dev)))
+		return 0;
+
+	xe_selftests_run(dev_name(dev));
+
+	return 0;
+}
+
+static struct notifier_block nb = {
+	.notifier_call = bus_cb,
+};
+
+int xe_selftests_module_init(void)
+{
+	return bus_register_notifier(&pci_bus_type, &nb);
+}
+
+void xe_selftests_module_exit(void)
+{
+	bus_unregister_notifier(&pci_bus_type, &nb);
+}
diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c b/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
new file mode 100644
index 000000000000..93c3360c9631
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/glob.h>
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_drv.h"
+
+#include "selftests/xe_selftests.h"
+#include "selftests/xe_selftests_internal.h"
+
+#define DUT_NAME_LEN 32
+static char dut_name[DUT_NAME_LEN];
+
+/* protects @dut_name during live test execution */
+static DEFINE_MUTEX(dut_mutex);
+
+static int match_dev_any(struct device *dev, const void *data)
+{
+	return 1;
+}
+
+static int match_dev_by_name(struct device *dev, const void *data)
+{
+	const char *name = data;
+	return !strcmp(dev_name(dev), name);
+}
+
+struct xe_device *get_xe_dut(void)
+{
+	struct device_driver *drv;
+	struct device *dev;
+
+	if (!anonymous_dut && !mutex_is_locked(&dut_mutex))
+		return ERR_PTR(-ENOTTY);
+
+	drv = driver_find(DRIVER_NAME, &pci_bus_type);
+	dev = driver_find_device(drv, NULL, dut_name,
+				 mutex_is_locked(&dut_mutex) ? match_dev_by_name : match_dev_any);
+	if (!dev)
+		return ERR_PTR(-ENODEV);
+
+	return to_xe_device(dev_get_drvdata(dev));
+}
+
+void put_xe_dut(struct xe_device *xe)
+{
+	put_device(xe->drm.dev);
+}
+
+static int run_test_suites(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	struct device_driver *drv = dev->driver;
+	struct module *mod = drv->owner;
+	struct kunit_suite **suites = mod->kunit_suites;
+	int num_suites = mod->num_kunit_suites;
+	int i;
+
+	pr_info("TAP version 14\n");
+	pr_info("1..%u\n", num_suites);
+
+	/* reset kunit_suite_counter at the start */
+	__kunit_test_suites_exit(NULL, 0);
+
+	for (i = 0; i < num_suites; i++) {
+		kunit_run_tests(suites[i]);
+	}
+
+	/* reset kunit_suite_counter at the end */
+	__kunit_test_suites_exit(NULL, 0);
+
+	return num_suites;
+}
+
+/**
+ * xe_selftests_run - Run selftests on selected device
+ * @dev_name: The device name on which selftests should be run
+ *
+ * This function starts Kunit suites with live selftests on selected
+ * device (DUT).
+ *
+ * Return: 0 on success,
+ *   -EINVAL if no device name was provided,
+ *   -EBUSY if tests are already running,
+ *   -ENODEV if device was not found
+ *   or any other negative error code on failure.
+ */
+int xe_selftests_run(const char *dev_name)
+{
+	struct xe_device *xe;
+	int ret;
+
+	if (!dev_name)
+		return -EINVAL;
+	if (!mutex_trylock(&dut_mutex))
+		return -EBUSY;
+	strscpy(dut_name, dev_name, sizeof(dut_name));
+
+	xe = get_xe_dut();
+	if (IS_ERR(xe)) {
+		ret = PTR_ERR(xe);
+		goto cleanup;
+	}
+
+	ret = run_test_suites(xe);
+
+	put_xe_dut(xe);
+
+cleanup:
+	strscpy(dut_name, "", sizeof(dut_name));
+	mutex_unlock(&dut_mutex);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c b/drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
new file mode 100644
index 000000000000..837d28871686
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/mutex.h>
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "selftests/xe_selftests_internal.h"
+
+static struct xe_device *__get_xe(void)
+{
+	struct xe_device *xe = ERR_PTR(-ENOTTY);
+
+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_MOCK)
+	xe = get_xe_mock();
+#elif IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
+	xe = get_xe_dut();
+#endif
+	return xe;
+}
+
+static void __put_xe(struct xe_device *xe)
+{
+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_MOCK)
+	put_xe_mock(xe);
+#elif IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
+	put_xe_dut(xe);
+#endif
+}
+
+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
+int init_xe_live_selftest_suite(struct kunit_suite *suite)
+{
+	struct xe_device *xe = get_xe_dut();
+
+	if (IS_ERR(xe))
+		return PTR_ERR(xe);
+
+	kunit_info(suite, "DUT %s", dev_name(xe->drm.dev));
+	put_xe_dut(xe);
+	return 0;
+}
+#endif
+
+int init_xe_device_selftest(struct kunit *test)
+{
+	struct xe_device *xe = __get_xe();
+
+	if (IS_ERR(xe))
+		return PTR_ERR(xe);
+
+	test->priv = xe;
+	return 0;
+}
+
+void exit_xe_device_selftest(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	__put_xe(xe);
+}
+
+int init_xe_gt_selftest(struct kunit *test)
+{
+	struct xe_device *xe = __get_xe();
+
+	if (IS_ERR(xe))
+		return PTR_ERR(xe);
+
+	test->priv = to_gt(xe);
+	return 0;
+}
+
+void exit_xe_gt_selftest(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	__put_xe(gt->xe);
+}
+
+int init_xe_guc_selftest(struct kunit *test)
+{
+	struct xe_device *xe = __get_xe();
+
+	if (IS_ERR(xe))
+		return PTR_ERR(xe);
+
+	test->priv = &to_gt(xe)->uc.guc;
+	return 0;
+}
+
+void exit_xe_guc_selftest(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_gt *gt = container_of(guc, struct xe_gt, uc.guc);
+
+	__put_xe(gt->xe);
+}
diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_internal.h b/drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
new file mode 100644
index 000000000000..841c1a497eed
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_SELFTEST_INTERNAL_H_
+#define _XE_SELFTEST_INTERNAL_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+extern char *dut_filter;
+extern bool anonymous_dut;
+
+struct xe_device *get_xe_dut(void);
+void put_xe_dut(struct xe_device *xe);
+
+struct xe_device *get_xe_mock(void);
+void put_xe_mock(struct xe_device *xe);
+
+#endif /* _XE_SELFTEST_INTERNAL_H_ */
diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_mock.c b/drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
new file mode 100644
index 000000000000..c1515e451e99
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_device_types.h"
+
+#define MOCK_DEV_NAME "MOCK:DEBUG.0"
+static struct device __mock_device = {
+	.init_name = MOCK_DEV_NAME,
+};
+
+struct xe_device *get_xe_mock(void)
+{
+	struct xe_device *xe = kzalloc(sizeof(*xe), GFP_KERNEL);
+
+	if (!xe)
+		return ERR_PTR(-ENOMEM);
+
+	xe->drm.dev = &__mock_device;
+
+	xe->gt[0].info.id = 0;
+	xe->gt[0].info.type = XE_GT_TYPE_MAIN;
+	xe->gt[0].xe = xe;
+
+	return xe;
+}
+
+void put_xe_mock(struct xe_device *xe)
+{
+	kfree(xe);
+}
diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_params.c b/drivers/gpu/drm/xe/selftests/xe_selftests_params.c
new file mode 100644
index 000000000000..e6e28cc91901
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/xe_selftests_params.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/module.h>
+
+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
+
+char *dut_filter;
+module_param_named(dut_filter, dut_filter, charp, 0644);
+MODULE_PARM_DESC(dut_filter,
+		 "The pattern of the names of devices on which we want to run tests automatically. "
+		 "If <none> is specified (default) then no devices will be tested automatically. "
+		 "If '*' is specified then all new bound devices will be tested.\n");
+
+bool anonymous_dut;
+module_param_named(anonymous_dut, anonymous_dut, bool, 0600);
+MODULE_PARM_DESC(anonymous_dut,
+		 "Enables selftests to be run without providing explicit DUT name (like during "
+		 "selftests execution triggered by the Kunit module notifier). Default is off.\n");
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 6860586ce7f8..f76d69f7f5ad 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -13,6 +13,7 @@
 #include "xe_module.h"
 #include "xe_pci.h"
 #include "xe_sched_job.h"
+#include "selftests/xe_selftests.h"
 
 bool enable_guc = true;
 module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
@@ -45,6 +46,7 @@ struct init_funcs {
 static const struct init_funcs init_funcs[] = {
 	MAKE_INIT_EXIT_FUNCS(hw_fence),
 	MAKE_INIT_EXIT_FUNCS(sched_job),
+	MAKE_INIT_EXIT_FUNCS(selftests),
 };
 
 static int __init xe_init(void)
-- 
2.25.1

