Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E08C3DA60
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1391B10E8DF;
	Tue, 16 Jul 2024 21:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVrx3OS8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E09410E8E1
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721165998; x=1752701998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gt1hOK1E7Of3frcWf/UVC3Cn1IIvlgaLDI2Sx0eT4cs=;
 b=iVrx3OS8aZi0Gp8+z3t4IqiBHzalJe7NghA82XzUohnTBqYEgyPCidob
 qdm6WQ7cgWfpq5PONH0M2RjnFUJDTZlAOxiWq8A0XkSh/Iik+FUcqoQmR
 DLBckYMsHUidpEWg7G9RuMCvixePfGj5Lrf5lfcbIRCC+tT7dIiu6QxnL
 nA2gpb8qxFKCuOn3ktelIvHeLkM3+8+/p9gLomucd6AynkIZ3awQeOMbX
 kHGcZUpTA3vNMUNY8zAR+IKORWyqIbgz2k3HqGrQcExJBBauievZHq6WH
 8K4NcZLZYREfEDzqijqq6ZSj8hsytTpECgL7tCF5LhWgjRhL4c3JbgFMs A==;
X-CSE-ConnectionGUID: 9uDd5rQvQJCUfGTZ9AlQnA==
X-CSE-MsgGUID: 2sdaqvZ5SI2grbgEurD1jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44063150"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="44063150"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:39:58 -0700
X-CSE-ConnectionGUID: jgZnWVleROGRisNz67w4fg==
X-CSE-MsgGUID: ki4gKJhiQ9m6mdRLr8D/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="73364361"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.36.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:39:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/7] drm/xe/tests: Add helpers for use in live tests
Date: Tue, 16 Jul 2024 23:38:56 +0200
Message-Id: <20240716213901.398-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240716213901.398-1-michal.wajdeczko@intel.com>
References: <20240716213901.398-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

Instead of iterating over available Xe devices within a testcase,
without being able to distinguish potential failures from different
devices on system with many Xe devices, introduce helpers that will
allow to treat each Xe device as a parameter for the testcase like:

static void bar(struct kunit *test)
{
	struct xe_device *xe = test->priv;
	...
}

struct kunit_case foo_live_tests[] = {
	KUNIT_CASE_PARAM(bar, xe_pci_live_device_gen_param),
	{}
};

struct kunit_suite foo_suite = {
	.name = "foo_live",
	.test_cases = foo_live_tests,
	.init = xe_kunit_helper_xe_device_live_test_init,
	.exit = xe_kunit_helper_xe_device_live_test_exit,
};

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 55 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  3 ++
 drivers/gpu/drm/xe/tests/xe_pci.c           | 30 +++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h      |  2 +
 4 files changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index fefe79b3b75a..d68d887a2646 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -12,7 +12,9 @@
 
 #include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_pm.h"
 
 /**
  * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
@@ -88,3 +90,56 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test)
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
+
+/**
+ * xe_kunit_helper_xe_device_live_test_init - Prepare a &xe_device for
+ *                                            use in a live KUnit test.
+ * @test: the &kunit where live &xe_device will be used
+ *
+ * This function expects pointer to the &xe_device in the &test.param_value,
+ * like it is prepared by the &xe_pci_live_device_gen_param and stores that
+ * pointer as &kunit.priv to allow the test code to access it.
+ *
+ * This function makes sure that device is not wedged and then resumes it
+ * to avoid waking up the device inside the test.
+ *
+ * This function can be used as custom implementation of &kunit_suite.init
+ * but must be accompanied by the &xe_kunit_helper_xe_device_live_test_exit().
+ *
+ * This function uses KUNIT_ASSERT to detect any failures.
+ *
+ * Return: Always 0.
+ */
+int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
+{
+	struct xe_device *xe;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test->param_value);
+	xe = xe_device_const_cast(test->param_value);
+
+	kunit_info(test, "running on %s device\n", xe->info.platform_name);
+
+	KUNIT_ASSERT_FALSE(test, xe_device_wedged(xe));
+	xe_pm_runtime_get(xe);
+
+	test->priv = xe;
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_live_test_init);
+
+/**
+ * xe_kunit_helper_xe_device_live_test_exit - Cleanup a live KUnit test.
+ * @test: the &kunit where live &xe_device was used
+ *
+ * This function accompanies the &xe_kunit_helper_xe_device_live_test_init()
+ * and should be used as custom implementation of &kunit_suite.exit.
+ */
+void xe_kunit_helper_xe_device_live_test_exit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
+	xe_pm_runtime_put(xe);
+	KUNIT_EXPECT_FALSE(test, xe_device_wedged(xe));
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_live_test_exit);
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
index 067a1babf049..cc59ba23ade0 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
@@ -14,4 +14,7 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
 						  struct device *dev);
 int xe_kunit_helper_xe_device_test_init(struct kunit *test);
 
+int xe_kunit_helper_xe_device_live_test_init(struct kunit *test);
+void xe_kunit_helper_xe_device_live_test_exit(struct kunit *test);
+
 #endif
diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index f62809ca8b51..ab570dbb71ac 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -167,3 +167,33 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
+
+/**
+ * xe_pci_live_device_gen_param - Helper to iterate Xe devices as a KUnit parameters
+ * @prev: the previously returned value, or NULL for the first iteration
+ * @desc: the buffer for a parameter name
+ *
+ * Iterates over the available Xe devices on the system. Uses the device name
+ * as the parameter name.
+ *
+ * To be used only as a parameter generator function in &KUNIT_CASE_PARAM.
+ *
+ * Return: pointer to the next &struct xe_device ready to be used as a parameter
+ *         or NULL if there are no more Xe devices on the system.
+ */
+const void *xe_pci_live_device_gen_param(const void *prev, char *desc)
+{
+	const struct xe_device *xe = prev;
+	struct device *dev = xe ? xe->drm.dev : NULL;
+	struct device *next;
+
+	next = driver_find_next_device(&xe_pci_driver.driver, dev);
+	if (dev)
+		put_device(dev);
+	if (!next)
+		return NULL;
+
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", dev_name(next));
+	return pdev_to_xe_device(to_pci_dev(next));
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_pci_live_device_gen_param);
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index f40dcec83992..3e2558bc3c90 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -35,4 +35,6 @@ struct xe_pci_fake_data {
 
 int xe_pci_fake_device_init(struct xe_device *xe);
 
+const void *xe_pci_live_device_gen_param(const void *prev, char *desc);
+
 #endif
-- 
2.43.0

