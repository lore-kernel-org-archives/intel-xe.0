Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB233112584F
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 15:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A515810E8B0;
	Wed, 11 Mar 2026 15:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a81rUR/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1E910E3ED;
 Wed, 11 Mar 2026 15:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773244373; x=1804780373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xAnL+9IhxFRWyY4aXDCogwrwG4fhOUxMZMHt0f/ecHc=;
 b=a81rUR/i7kMAzAGIEgOKC0c7DTIs3OOLp5unKs4MPJHpZcu4YcA18Q1g
 dBxOtXw2x3DeWd3nvgn/7PotNxsBjQEi7R49hLwPoDF7u79sKR0v0DA5f
 kDTUvOeuzNpUcJzsWUUxXXlgo1QX0wWq57klCPwlQomtSCwDwyN5+1kVh
 irWEsKeiNA5+noAidzIiF2ePDAAAVcR+JFh6HzSTGTF+9OhJmloyNIejC
 +9QDClVKlckwP27X61ywXlavRR9hShXQ9EXgZUMgxkoVcxOZc7ixRIUBS
 6qGWh223RkWR8A8kE4PqJKKxiONWLtqx3JcV6V90cUy1M86/Zd2lKY9pb Q==;
X-CSE-ConnectionGUID: ihLpQL8KQAi7eXPXS7NXxQ==
X-CSE-MsgGUID: CIJ8jb5HSdCfBO7zuMY4gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74398190"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74398190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 08:52:51 -0700
X-CSE-ConnectionGUID: plOv7IGwQv6MX4WPpXYvLg==
X-CSE-MsgGUID: byNfUypvQTSNnebasrX5Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="246064354"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 08:52:48 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/tests: Add KUnit test for suballocator allocation
Date: Wed, 11 Mar 2026 15:52:37 +0000
Message-ID: <20260311155233.1903253-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
References: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
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

Add KUnit test to verify DRM suballocator allocation and insertion over
multiple iterations with randomized sizes. Tests both successful
allocations and allocation-free cycles to exercise fragmentation handling.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/Kconfig.debug             |  1 +
 drivers/gpu/drm/tests/.kunitconfig        |  1 +
 drivers/gpu/drm/tests/Makefile            |  1 +
 drivers/gpu/drm/tests/drm_suballoc_test.c | 79 +++++++++++++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 drivers/gpu/drm/tests/drm_suballoc_test.c

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 3b7886865335..ea18d9399d5c 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -69,6 +69,7 @@ config DRM_KUNIT_TEST
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KUNIT_TEST_HELPERS
+	select DRM_SUBALLOC_HELPER
 	select DRM_SYSFB_HELPER
 	select PRIME_NUMBERS
 	default KUNIT_ALL_TESTS
diff --git a/drivers/gpu/drm/tests/.kunitconfig b/drivers/gpu/drm/tests/.kunitconfig
index 5be8e71f45d5..67758bb211d2 100644
--- a/drivers/gpu/drm/tests/.kunitconfig
+++ b/drivers/gpu/drm/tests/.kunitconfig
@@ -3,3 +3,4 @@ CONFIG_DRM=y
 CONFIG_DRM_VKMS=y
 CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_KUNIT_TEST=y
+CONFIG_DRM_SUBALLOC_HELPER=y
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index d2e2e3d8349a..7f8aa03c5a6d 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
 	drm_rect_test.o \
+	drm_suballoc_test.o \
 	drm_sysfb_modeset_test.o \
 	drm_fixp_test.o
 
diff --git a/drivers/gpu/drm/tests/drm_suballoc_test.c b/drivers/gpu/drm/tests/drm_suballoc_test.c
new file mode 100644
index 000000000000..f03327e1c8af
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_suballoc_test.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_suballoc.h>
+
+#include <kunit/test.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/sizes.h>
+
+#define DRM_SUBALLOC_TEST_ITERATIONS        128
+#define DRM_SUBALLOC_TEST_MANAGER_ALIGN     SZ_16
+#define DRM_SUBALLOC_TEST_MANAGER_SIZE      SZ_16K
+#define DRM_SUBALLOC_TEST_MAX_ALLOCS        16
+#define DRM_SUBALLOC_TEST_MAX_ALLOC_SIZE    SZ_512
+
+static bool fence_disable = true;
+module_param_named(fence_disable, fence_disable, bool, 0644);
+MODULE_PARM_DESC(fence_disable, "Disable suballoc fence tracking in test");
+
+static void drm_test_suballoc_alloc_insert(struct kunit *test)
+{
+	struct drm_suballoc_manager manager;
+	struct drm_suballoc *sa_arr[DRM_SUBALLOC_TEST_MAX_ALLOCS], *sa;
+	struct drm_suballoc
+		*sa_alloc_arr[DRM_SUBALLOC_TEST_ITERATIONS / DRM_SUBALLOC_TEST_MAX_ALLOCS] = {0};
+	int i, size, sa_index, sa_alloc_arr_index;
+
+	drm_suballoc_manager_init(&manager,
+				  DRM_SUBALLOC_TEST_MANAGER_SIZE,
+				  DRM_SUBALLOC_TEST_MANAGER_ALIGN);
+	drm_suballoc_manager_fence_disable(&manager, fence_disable);
+
+	kunit_info(test, "Starting suballoc test with %d iterations with fence %s\n",
+		   DRM_SUBALLOC_TEST_ITERATIONS, fence_disable ? "disabled" : "enabled");
+
+	for (i = 0, sa_index = 0, sa_alloc_arr_index = 0;
+	     i < DRM_SUBALLOC_TEST_ITERATIONS; i++) {
+		size = get_random_u32_below(DRM_SUBALLOC_TEST_MAX_ALLOC_SIZE) + 1;
+		size = ALIGN(size, 16);
+
+		sa = drm_suballoc_new(&manager, size, GFP_KERNEL, true, 0);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sa);
+		KUNIT_ASSERT_EQ(test, drm_suballoc_size(sa), size);
+		sa_arr[sa_index++] = sa;
+
+		if (sa_index == DRM_SUBALLOC_TEST_MAX_ALLOCS) {
+			for (int free_iter = 0; free_iter < DRM_SUBALLOC_TEST_MAX_ALLOCS - 1;
+			     free_iter++) {
+				drm_suballoc_free(sa_arr[free_iter], NULL);
+			}
+			sa_alloc_arr[sa_alloc_arr_index++] =
+				sa_arr[DRM_SUBALLOC_TEST_MAX_ALLOCS - 1];
+			sa_index = 0;
+		}
+	}
+
+	for (i = 0; i < sa_alloc_arr_index; i++)
+		drm_suballoc_free(sa_alloc_arr[i], NULL);
+
+	drm_suballoc_manager_fini(&manager);
+}
+
+static struct kunit_case drm_suballoc_tests[] = {
+	KUNIT_CASE(drm_test_suballoc_alloc_insert),
+	{}
+};
+
+static struct kunit_suite drm_suballoc_test = {
+	.name = "drm_suballoc",
+	.test_cases = drm_suballoc_tests,
+};
+
+kunit_test_suite(drm_suballoc_test);
+
+MODULE_DESCRIPTION("KUnit DRM suballoc test suite");
+MODULE_LICENSE("GPL");
-- 
2.43.0

