Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D0CD2E035
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 09:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0537C10E7AB;
	Wed, 23 Oct 2024 09:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fqc4bmak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A1C10E7AD;
 Wed, 23 Oct 2024 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729676391; x=1761212391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kc4el9L+O8oIyjISBfTmYS6l2rpzV7Gn+wqZZhksdg0=;
 b=Fqc4bmakvYk0VnMw7NH/7Q9fBeBZDUhAFL5hLwS5WNl1h3kknzmCUfF/
 B9/fDDLaX1vPTbtyrx7Au8nIOFiyBFnBUpm4zD2qjMwPZ8ytaOy/J3F8G
 +U8Wo7fey88pcIw6O7J0FsXYNQkEO3G++pj4Tb/6cmzwp/O0bK8NVLfeL
 c5sgXM/n4oGy6QEn8kn5WdWXHgbbVoPTWhK5HfLMTHXwxuphStDu1HXVw
 TLBxtKR1/XnSxWVmSvRN9Mk4cXvlfMEZTRW3u3KFunmZMJARokAUFEKh9
 kWa7EcAY5M4KGlt3AwU3VmAAEIbzd2BQhwM8jmYum6qApbEWpDv6mP9Hp A==;
X-CSE-ConnectionGUID: aB+/AciEQhWjtPrqvJY34g==
X-CSE-MsgGUID: 3UKYnjBYS0GUlB3roJf3nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29414210"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29414210"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 02:39:51 -0700
X-CSE-ConnectionGUID: 5vpgexoNTvuBnd+0D0Ju2g==
X-CSE-MsgGUID: mBpbtGRKRZiSq2v0bOd8PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="110979547"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 02:39:50 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t V2 2/2] tests/intel: Add xe_pci_membarrier test
Date: Wed, 23 Oct 2024 15:13:27 +0530
Message-Id: <20241023094327.965050-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023094327.965050-1-tejas.upadhyay@intel.com>
References: <20241023094327.965050-1-tejas.upadhyay@intel.com>
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

We want to make sure that direct mmap mapping of physical
page at doorbell space and whole page is accessible in order
to use pci memory barrier effect effectively.

This is basic pci memory barrier test to showcase xe driver
support for feature. In follow up patches we will have more
of corner and negative tests added later.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_pci_membarrier.c | 80 +++++++++++++++++++++++++++++++++
 tests/meson.build               |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 tests/intel/xe_pci_membarrier.c

diff --git a/tests/intel/xe_pci_membarrier.c b/tests/intel/xe_pci_membarrier.c
new file mode 100644
index 000000000..d0bf447b6
--- /dev/null
+++ b/tests/intel/xe_pci_membarrier.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include "xe_drm.h"
+#include "igt.h"
+
+/**
+ * TEST: Test if the driver is capable of putting pci memory barrier using mmap
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Memory management tests
+ * Functionality: mmap with pre-defined offset
+ */
+
+IGT_TEST_DESCRIPTION("Basic MMAP tests pci memory barrier effect with special offset");
+#define PAGE_SHIFT 12
+#define PAGE_SIZE 4096
+
+/**
+ * SUBTEST: basic
+ * Description: create pci memory barrier with write on defined mmap offset.
+ * Test category: functionality test
+ *
+ */
+
+static void pci_membarrier(int xe)
+{
+	uint64_t flags = MAP_SHARED;
+	unsigned int prot = PROT_WRITE;
+	uint32_t *ptr;
+	uint64_t size = PAGE_SIZE;
+	struct timespec tv;
+        struct drm_xe_gem_mmap_offset mmo = {
+                .handle = 0,
+                .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+        };
+
+        igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
+        ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
+	igt_assert(ptr != MAP_FAILED);
+
+	/* Check whole page for any errors, also check as
+	 * we should not read written values back
+	 */
+	for (int i = 0; i < size / sizeof(*ptr); i++) {
+		/* It is expected unconfigured doorbell space
+		 * will return read value 0xdeadbeef
+		 */
+		igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);
+
+		igt_gettime(&tv);
+		ptr[i] = i;
+		if (READ_ONCE(ptr[i]) == i) {
+			while (READ_ONCE(ptr[i]) == i)
+				;
+			igt_info("fd:%d value retained for %"PRId64"ns pos:%d\n",
+				 xe, igt_nsec_elapsed(&tv), i);
+		}
+		igt_assert_neq(READ_ONCE(ptr[i]), i);
+	}
+
+	munmap(ptr, size);
+}
+
+igt_main
+{
+	int xe;
+
+	igt_fixture {
+		xe = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest_f("basic")
+		pci_membarrier(xe);
+
+	igt_fixture
+		drm_close_driver(xe);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 34b87b125..15131d812 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -306,6 +306,7 @@ intel_xe_progs = [
 	'xe_noexec_ping_pong',
 	'xe_oa',
 	'xe_pat',
+        'xe_pci_membarrier',
 	'xe_peer2peer',
 	'xe_pm',
 	'xe_pm_residency',
-- 
2.34.1

