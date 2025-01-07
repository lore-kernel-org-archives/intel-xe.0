Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ED0E77199
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 13:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F95310EABE;
	Tue,  7 Jan 2025 13:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvVTKScG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636E310EABE;
 Tue,  7 Jan 2025 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736258129; x=1767794129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nZNa1oBIgY5oJn6iswwt1hJy4aJVeFHELgT5EBBrQRk=;
 b=TvVTKScGOW9ZGbEHxW/cJulw21pnbs1/czMqQRmpbu4U8fd2mDdj4vZK
 y0/0ngg+jc2tQjxf/K59Xfu4V8OQrknZKS6ul4HPWCkn1ZuJIyqO89Fal
 iUkmfdljqChK1Dpwz9D8iX29Kutrs2is/Z4+i6vhQGF8wXlysutLZpiGi
 Xm+Qz8ntYzEHUUkhLUSED/qo5sxTWX5EoBRXdYD0y6dy+ZhZ4d25JE6Eq
 P6ZWgE37VVXtVk9CEzSIvhC0ymZBLckld2oIDzEa3fqCoqZ2kVrAPks8E
 gSfwK7JHum9mtYEfjgWChtpxIEU/+3JgvjnvnbaYwmUlG6fDi+/Age35J w==;
X-CSE-ConnectionGUID: 354xfF+UTtOvy8y1cRErtQ==
X-CSE-MsgGUID: gO2c6KXhSiCPsriOxnxnAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36558842"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36558842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 05:55:28 -0800
X-CSE-ConnectionGUID: WaNjg/qkR+G2ezl1J+llcQ==
X-CSE-MsgGUID: 3fxypLT+RGGinKNLd7pYIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="102678825"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 05:55:25 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Auld@freedesktop.org, Matthew <matthew.auld@intel.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V8 4/4] tests/xe/mmap: add tests for pci mem barrier
Date: Tue,  7 Jan 2025 19:30:23 +0530
Message-Id: <20250107140023.2940684-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107140023.2940684-1-tejas.upadhyay@intel.com>
References: <20250107140023.2940684-1-tejas.upadhyay@intel.com>
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

We want to make sure that mmap do direct mapping of physical
page at doorbell space and whole page is accessible in order
to use pci memory barrier effect effectively.

Following subtests are added,
./build/tests/xe_mmap --r pci-membarrier
./build/tests/xe_mmap --r pci-membarrier-parallel
./build/tests/xe_mmap --r pci-membarrier-bad-pagesize
./build/tests/xe_mmap --r pci-membarrier-bad-object

V8(MAuld):
 - Move open driver below igt_require
V7(MAuld):
 In parallel test :
 - check values with 1 client write and other read in loop
 - Modify seed and update random number at every test
V6(MAuld):
 - checking differnet cross client value is enough in parallel test
V5:
 - Add pci-membarrier-parallel test
V3(MAuld):
 - Check if pci memory barrier is supported
V2(MAuld)
 - use do_ioctl and replace igt_subtest_f with igt_subtest
 - Remove unused define

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_mmap.c | 172 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index d818cc2f8..72dc16fc7 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -64,6 +64,117 @@ test_mmap(int fd, uint32_t placement, uint32_t flags)
 	gem_close(fd, bo);
 }
 
+#define PAGE_SIZE 4096
+
+/**
+ * SUBTEST: pci-membarrier
+ * Description: create pci memory barrier with write on defined mmap offset.
+ * Test category: functionality test
+ *
+ */
+static void test_pci_membarrier(int xe)
+{
+	uint64_t flags = MAP_SHARED;
+	unsigned int prot = PROT_WRITE;
+	uint32_t *ptr;
+	uint64_t size = PAGE_SIZE;
+	struct timespec tv;
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = 0,
+		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+	};
+
+	do_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
+	ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
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
+					xe, igt_nsec_elapsed(&tv), i);
+		}
+		igt_assert_neq(READ_ONCE(ptr[i]), i);
+	}
+
+	munmap(ptr, size);
+}
+
+/**
+ * SUBTEST: pci-membarrier-parallel
+ * Description: create parallel pci memory barrier with write on defined mmap offset.
+ * Test category: functionality test
+ *
+ */
+static void test_pci_membarrier_parallel(int xe, int child, unsigned int i)
+{
+	uint64_t flags = MAP_SHARED;
+	unsigned int prot = PROT_WRITE;
+	uint32_t *ptr;
+	uint64_t size = PAGE_SIZE;
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = 0,
+		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+	};
+	int value;
+
+	do_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
+	ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
+	igt_assert(ptr != MAP_FAILED);
+
+	/* It is expected unconfigured doorbell space
+	 * will return read value 0xdeadbeef
+	 */
+	igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);
+
+	igt_until_timeout(5) {
+		/* Check clients should not be able to see each other */
+		if (child != -1) {
+			value = i + 1;
+			igt_assert_neq(READ_ONCE(ptr[i]), i);
+		} else {
+			value = i;
+			igt_assert_neq(READ_ONCE(ptr[i]), i + 1);
+		}
+
+		WRITE_ONCE(ptr[i], value);
+	}
+	igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);
+
+	munmap(ptr, size);
+}
+
+/**
+ * SUBTEST: pci-membarrier-bad-pagesize
+ * Description: Test mmap offset with bad pagesize for pci membarrier.
+ * Test category: negative test
+ *
+ */
+static void test_bad_pagesize_for_pcimem(int fd)
+{
+	uint32_t *map;
+	uint64_t page_size = PAGE_SIZE * 2;
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = 0,
+		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+	};
+
+	do_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
+	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
+	igt_assert(map == MAP_FAILED);
+}
+
 /**
  * SUBTEST: bad-flags
  * Description: Test mmap offset with bad flags.
@@ -126,6 +237,25 @@ static void test_bad_object(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, ENOENT);
 }
 
+/**
+ * SUBTEST: pci-membarrier-bad-object
+ * Description: Test mmap offset with bad object for pci mem barrier.
+ * Test category: negative test
+ *
+ */
+static void test_bad_object_for_pcimem(int fd)
+{
+	uint64_t size = xe_get_default_alignment(fd);
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = xe_bo_create(fd, 0, size,
+				       vram_if_possible(fd, 0),
+				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
+		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, EINVAL);
+}
+
 static jmp_buf jmp;
 
 __noreturn static void sigtrap(int sig)
@@ -260,6 +390,16 @@ static void test_cpu_caching(int fd)
 	assert_caching(fd, system_memory(fd), 0, DRM_XE_GEM_CPU_CACHING_WC + 1, true);
 }
 
+static bool is_pci_membarrier_supported(int fd)
+{
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = 0,
+		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+	};
+
+	return (igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo) == 0);
+}
+
 igt_main
 {
 	int fd;
@@ -278,6 +418,33 @@ igt_main
 		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
+	igt_subtest("pci-membarrier") {
+		igt_require(is_pci_membarrier_supported(fd));
+		test_pci_membarrier(fd);
+	}
+
+	igt_subtest("pci-membarrier-parallel") {
+		int xe;
+		unsigned int i;
+		uint32_t *ptr;
+
+		igt_require(is_pci_membarrier_supported(fd));
+		xe = drm_open_driver(DRIVER_XE);
+		srand(time(0));
+		i = rand() % (PAGE_SIZE / sizeof(*ptr));
+		igt_fork(child, 1)
+			test_pci_membarrier_parallel(xe, child, i);
+		test_pci_membarrier_parallel(fd, -1, i);
+		igt_waitchildren();
+
+		close(xe);
+	}
+
+	igt_subtest("pci-membarrier-bad-pagesize") {
+		igt_require(is_pci_membarrier_supported(fd));
+		test_bad_pagesize_for_pcimem(fd);
+	}
+
 	igt_subtest("bad-flags")
 		test_bad_flags(fd);
 
@@ -287,6 +454,11 @@ igt_main
 	igt_subtest("bad-object")
 		test_bad_object(fd);
 
+	igt_subtest("pci-membarrier-bad-object") {
+		igt_require(is_pci_membarrier_supported(fd));
+		test_bad_object_for_pcimem(fd);
+	}
+
 	igt_subtest("small-bar") {
 		igt_require(xe_visible_vram_size(fd, 0));
 		igt_require(xe_visible_vram_size(fd, 0) < xe_vram_size(fd, 0));
-- 
2.34.1

