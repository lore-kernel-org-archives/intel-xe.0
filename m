Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11790CD6E7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 11:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C760910E498;
	Fri,  5 Jun 2026 11:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kqb06Z2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B35810E488
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780658849; x=1812194849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NQldeO7LUEj9ZCrTHud2Uu6iYu1HHNXC/mXVO3BoWKA=;
 b=Kqb06Z2SIpZ/4UW4ln67iik5KZ7ujS9usRvgUhmVsQAqpxol6GYin0Hi
 XbAmyXbSpmgNCKk+I+/DQOBgZGl8VQz091seSIDndoT3thOnTcZxozoha
 nYNMpwRjIVgHxkPHeuuSxudPKyFVIze4dxciVMLJ+wY42l7coija6QAkB
 gy0havQT7+Y1RnZVrA/Cp0I59QUS3g+xW8P5lDsTi7aSPKTymahwtQooa
 W+0k66bMxgQPWY2c93AjewKELZB7Mfk14CPZj0F1fEb+vU/HePlgQrWFa
 /g71qBy3nl4I2RSZVQz52pQVSYhNqDVjCRZy2FBEXLhV6yuvoHOSV/Oin Q==;
X-CSE-ConnectionGUID: O/pNjY1pTHSncAx/0CP/Yg==
X-CSE-MsgGUID: fW2OZfmMSZieFUXBoNumZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="69025036"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="69025036"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:27:29 -0700
X-CSE-ConnectionGUID: xUGiypmdRo6VUkjSUDXgdg==
X-CSE-MsgGUID: TdtC+DZyRnSxvZAgL3JA6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249748596"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.251])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:27:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC PATCH] drm/xe/tests: Add drm_exec locking benchmark kunit test
Date: Fri,  5 Jun 2026 13:27:00 +0200
Message-ID: <20260605112700.181040-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605112700.181040-1-thomas.hellstrom@linux.intel.com>
References: <20260605112700.181040-1-thomas.hellstrom@linux.intel.com>
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

Add a live kunit test that benchmarks the drm_exec wound-wait locking
sequence with a set of GEM buffer objects.  Lock, iterate, and fini
phases are timed and reported separately, along with the retry count.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile            |   3 +-
 drivers/gpu/drm/xe/tests/xe_drm_exec_kunit.c | 130 +++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c  |   2 +
 drivers/gpu/drm/xe/xe_bo.c                   |   3 +
 4 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_drm_exec_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index f7aa47f11a36..bdb85d33f23a 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -2,7 +2,8 @@
 
 # "live" kunit tests
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_live_test.o
-xe_live_test-y = xe_live_test_mod.o
+xe_live_test-y = xe_live_test_mod.o \
+	xe_drm_exec_kunit.o
 
 # Normal kunit tests
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_drm_exec_kunit.c b/drivers/gpu/drm/xe/tests/xe_drm_exec_kunit.c
new file mode 100644
index 000000000000..b5592ff94607
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_drm_exec_kunit.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+#include <kunit/visibility.h>
+
+#include <linux/ktime.h>
+#include <linux/slab.h>
+
+#include <drm/drm_exec.h>
+#include <uapi/drm/xe_drm.h>
+
+#include "tests/xe_kunit_helpers.h"
+#include "tests/xe_pci_test.h"
+
+#include "xe_bo.h"
+#include "xe_device.h"
+
+#define DRME_BENCH_NUM_OBJECTS 256
+
+/**
+ * DOC: drm_exec benchmark
+ *
+ * Measures the time to lock a set of GEM objects via a drm_exec sequence,
+ * iterate over all locked objects, and finalize (unlock) the exec context.
+ * Each phase is timed independently and reported via kunit_info().
+ */
+
+static void xe_drm_exec_bench_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_bo **bos;
+	struct drm_gem_object *obj;
+	struct drm_exec exec;
+	ktime_t t_start, t_lock, t_iter, t_fini;
+	s64 ns_lock, ns_iter, ns_fini;
+	unsigned int count = 0;
+	unsigned int retries = 0;
+	int i;
+
+	bos = kunit_kcalloc(test, DRME_BENCH_NUM_OBJECTS, sizeof(*bos), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bos);
+
+	for (i = 0; i < DRME_BENCH_NUM_OBJECTS; i++) {
+		bos[i] = xe_bo_create_user(xe, NULL, PAGE_SIZE,
+					   DRM_XE_GEM_CPU_CACHING_WB,
+					   XE_BO_FLAG_SYSTEM |
+					   XE_BO_FLAG_DEFER_BACKING, NULL);
+		if (IS_ERR(bos[i])) {
+			KUNIT_FAIL(test, "bo[%d] create failed: %pe\n", i,
+				   bos[i]);
+			bos[i] = NULL;
+			goto out_put;
+		}
+	}
+
+	t_start = ktime_get();
+
+	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, DRME_BENCH_NUM_OBJECTS);
+
+	drm_exec_until_all_locked(&exec) {
+		for (i = 0; i < DRME_BENCH_NUM_OBJECTS; i++) {
+			int err = drm_exec_lock_obj(&exec, &bos[i]->ttm.base);
+			if (err == -EDEADLK)
+				retries++;
+			drm_exec_retry_on_contention(&exec);
+			if (err) {
+				KUNIT_FAIL(test, "bo[%d] lock failed: %pe\n",
+					   i, ERR_PTR(err));
+				drm_exec_fini(&exec);
+				goto out_put;
+			}
+		}
+	}
+
+	t_lock = ktime_get();
+	ns_lock = ktime_to_ns(ktime_sub(t_lock, t_start));
+
+	t_start = ktime_get();
+
+	drm_exec_for_each_locked_object(&exec, obj) {
+		READ_ONCE(obj->resv);
+		count++;
+	}
+
+	t_iter = ktime_get();
+	ns_iter = ktime_to_ns(ktime_sub(t_iter, t_start));
+
+	KUNIT_EXPECT_EQ(test, count, DRME_BENCH_NUM_OBJECTS);
+
+	/*
+	 * With CONFIG_DEBUG_WW_MUTEX_SLOWPATH the kernel injects artificial
+	 * -EDEADLK cases to exercise the slowpath, so retries are expected.
+	 * Without it, no other thread holds these objects, so any retry
+	 * indicates a real locking bug.
+	 */
+	if (!IS_ENABLED(CONFIG_DEBUG_WW_MUTEX_SLOWPATH))
+		KUNIT_EXPECT_EQ_MSG(test, retries, 0,
+				    "unexpected ww-mutex retries on uncontested objects\n");
+
+	t_start = ktime_get();
+	drm_exec_fini(&exec);
+	t_fini = ktime_get();
+	ns_fini = ktime_to_ns(ktime_sub(t_fini, t_start));
+
+	kunit_info(test,
+		   "drm_exec bench: %u objects: lock=%lldns iter=%lldns fini=%lldns retries=%u\n",
+		   DRME_BENCH_NUM_OBJECTS, ns_lock, ns_iter, ns_fini, retries);
+
+out_put:
+	for (i = 0; i < DRME_BENCH_NUM_OBJECTS; i++) {
+		if (bos[i])
+			xe_bo_put(bos[i]);
+	}
+}
+
+static struct kunit_case xe_drm_exec_bench_cases[] = {
+	KUNIT_CASE_PARAM(xe_drm_exec_bench_kunit, xe_pci_live_device_gen_param),
+	{}
+};
+
+VISIBLE_IF_KUNIT
+struct kunit_suite xe_drm_exec_bench_test_suite = {
+	.name = "xe_drm_exec_bench",
+	.test_cases = xe_drm_exec_bench_cases,
+	.init = xe_kunit_helper_xe_device_live_test_init,
+};
+EXPORT_SYMBOL_IF_KUNIT(xe_drm_exec_bench_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index c55e46f1ae92..926868d9e0cc 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -8,6 +8,7 @@
 extern struct kunit_suite xe_bo_test_suite;
 extern struct kunit_suite xe_bo_shrink_test_suite;
 extern struct kunit_suite xe_dma_buf_test_suite;
+extern struct kunit_suite xe_drm_exec_bench_test_suite;
 extern struct kunit_suite xe_migrate_test_suite;
 extern struct kunit_suite xe_mocs_test_suite;
 extern struct kunit_suite xe_guc_g2g_test_suite;
@@ -15,6 +16,7 @@ extern struct kunit_suite xe_guc_g2g_test_suite;
 kunit_test_suite(xe_bo_test_suite);
 kunit_test_suite(xe_bo_shrink_test_suite);
 kunit_test_suite(xe_dma_buf_test_suite);
+kunit_test_suite(xe_drm_exec_bench_test_suite);
 kunit_test_suite(xe_migrate_test_suite);
 kunit_test_suite(xe_mocs_test_suite);
 kunit_test_suite(xe_guc_g2g_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4c80bac67622..2c1e47fdd3f5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -5,6 +5,7 @@
 
 #include "xe_bo.h"
 
+#include <kunit/visibility.h>
 #include <linux/dma-buf.h>
 #include <linux/nospec.h>
 
@@ -2641,6 +2642,7 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 
 	return bo;
 }
+EXPORT_SYMBOL_IF_KUNIT(xe_bo_create_user);
 
 /**
  * xe_bo_create_pin_range_novm() - Create and pin a BO with range options.
@@ -3839,6 +3841,7 @@ void xe_bo_put(struct xe_bo *bo)
 		drm_gem_object_put(&bo->ttm.base);
 	}
 }
+EXPORT_SYMBOL_IF_KUNIT(xe_bo_put);
 
 /**
  * xe_bo_dumb_create - Create a dumb bo as backing for a fb
-- 
2.54.0

