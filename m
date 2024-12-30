Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36C7E77188
	for <intel-xe@archiver.kernel.org>; Mon, 30 Dec 2024 12:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFFE10E4CB;
	Mon, 30 Dec 2024 12:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1y/T+F/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DABE10E4D8;
 Mon, 30 Dec 2024 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735563185; x=1767099185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8X3uXdGLJQUZ8ygW+AO85Haiw7RQWSClyYbhtRMyH+U=;
 b=Z1y/T+F/cHqNSsNL2vUaLfyWV2RuBNfAo8RLaT7tcpUcg0kUcu2mLwc4
 iAxeH26dGAltxDbT084/j3R4jVfTQmeLFGnP4xg6OXNhmm2e9x8dFGa+s
 pcSxuW2+rh+idPPR1YpTth3Svhe5aSr+X/Tk/jQVkXeLSzQXkt4FDd5Th
 AhJX5T3k2aR4xnY1DUhpPJrmqWQBLDoYHbof8OdboskQKH4PQKqppY97i
 1gv7oaAl7Im2LupNPGS1iU766Dy9XUop29AGEFyzNj/o6DL0UAfcLKcFw
 qOPpKRRgEC4oTs31CrQ07mPA6080MVkpBmfIK699Z+iSeLd2dYE7bsIIX Q==;
X-CSE-ConnectionGUID: 9M2mZ1ZhQ3OrT8os7zhL4w==
X-CSE-MsgGUID: RB38JjkCSJCGyHD5FgE87A==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46846514"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="46846514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 04:53:05 -0800
X-CSE-ConnectionGUID: RgPQOYpcTnOCPqrrgKdA9g==
X-CSE-MsgGUID: LD6PuzhoQSSkSeTWSdo9Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105780681"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 04:53:03 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Auld@freedesktop.org, Matthew <matthew.auld@intel.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V6 4/4] tests/xe/mmap: add tests for pci mem barrier
Date: Mon, 30 Dec 2024 18:27:57 +0530
Message-Id: <20241230125757.2581381-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230125757.2581381-1-tejas.upadhyay@intel.com>
References: <20241230125757.2581381-1-tejas.upadhyay@intel.com>
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

V6(MAuld):
 - checking differnet cross client value is enough in parallel test
V5:
 - Add pci-membarrier-parallel test
V3(MAuld):
 - Check if pci memory barrier is supported
V2(MAuld)
 - use do_ioctl and replace igt_subtest_f with igt_subtest
 - Remove unused define

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_mmap.c | 190 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index d818cc2f8..8e7095e48 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -64,6 +64,140 @@ test_mmap(int fd, uint32_t placement, uint32_t flags)
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
+static void test_pci_membarrier_parallel(int xe, int child)
+{
+	unsigned int bad_ns, elapsed;
+	uint64_t flags = MAP_SHARED;
+	unsigned int i;
+	unsigned int prot = PROT_WRITE;
+	uint32_t *ptr;
+	uint64_t size = PAGE_SIZE;
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = 0,
+		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+	};
+	struct timespec total, bad;
+	int tpos = size / sizeof(*ptr);
+	int value;
+
+	do_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
+	ptr = mmap(NULL, size, prot, flags, xe, mmo.offset);
+	igt_assert(ptr != MAP_FAILED);
+
+	/* Check any random position up to 1K */
+	i = rand() % (size / sizeof(*ptr));
+	/* It is expected unconfigured doorbell space
+	 * will return read value 0xdeadbeef
+	 */
+	igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);
+
+	igt_until_timeout(5) {
+		/* Check clients should not be able to see each other */
+		if (child != -1)
+			value = tpos + 1;
+		else
+			value = tpos;
+
+		WRITE_ONCE(ptr[tpos-1], value);
+	}
+	bad_ns = 0;
+	igt_gettime(&total);
+	igt_until_timeout(5) { /* XXX sync with parent loop! */
+		if (READ_ONCE(ptr[tpos-1]) == value) {
+			igt_gettime(&bad);
+			while (READ_ONCE(ptr[tpos-1]) == value)
+				;
+			bad_ns += igt_nsec_elapsed(&bad);
+		}
+	}
+	elapsed = igt_nsec_elapsed(&total);
+	if (bad_ns) {
+		igt_info("Cross-client writes visible %.1f%% of the time.\n",
+				bad_ns * 100. / elapsed);
+	}
+	igt_assert(20 * bad_ns < elapsed); /* Arbitrary 5% threshold */
+	if (child != -1)
+		igt_assert_neq(READ_ONCE(ptr[tpos-1]), tpos);
+	else
+		igt_assert_neq(READ_ONCE(ptr[tpos-1]), tpos + 1);
+	igt_assert_eq_u32(READ_ONCE(ptr[tpos-1]), 0xdeadbeef);
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
@@ -126,6 +260,25 @@ static void test_bad_object(int fd)
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
@@ -260,6 +413,16 @@ static void test_cpu_caching(int fd)
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
@@ -278,6 +441,28 @@ igt_main
 		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
+	igt_subtest("pci-membarrier") {
+		igt_require(is_pci_membarrier_supported(fd));
+		test_pci_membarrier(fd);
+	}
+
+	igt_subtest("pci-membarrier-parallel") {
+		int xe = drm_open_driver(DRIVER_XE);
+
+		igt_require(is_pci_membarrier_supported(fd));
+		igt_fork(child, 1)
+			test_pci_membarrier_parallel(xe, child);
+		test_pci_membarrier_parallel(fd, -1);
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
 
@@ -287,6 +472,11 @@ igt_main
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

