Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D701DD4920F
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 11:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A156B10E4BE;
	Mon, 18 Nov 2024 11:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BA+pSnMq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819EC10E4AA;
 Mon, 18 Nov 2024 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731929526; x=1763465526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZH95LURMrmDbafn2eArscb10xUpvIfCmWIV4krwSppU=;
 b=BA+pSnMqKDkwwAiBLXSGufWKGgDhWXA/2FCASbkmbHXc+HQ7DngdM69u
 RX3O/SOOWsx8jHDEhc/UN8eO+Qo6MdzXWkdaja+4R1TD0OiQeA1nr+RY3
 P03Yt/iyPgf51wUI/6QtVN019UBHTtMIhnlKScb9SWfywG77hGI9YPbfV
 Oalw4qA2h5325OoZlWRiCggK6GGkXm+jl2Zgt50D3ZlA3cB7r1fIcwNc1
 x1o2Lp3e4m5XUsxb6MrnYWPPGGZRQb5DOeZyDrxp3xKcTvhz7Xn638hvm
 24Q36RKWeolXsQvKbYVPR9zM9j19XUWImlYZDVO3bo36LWpfC3biT6pxJ Q==;
X-CSE-ConnectionGUID: hCbue4RsSCWJGcYAUxdTig==
X-CSE-MsgGUID: dHDcOXhUSymz2r2E7Q9IBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35655446"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="35655446"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:32:06 -0800
X-CSE-ConnectionGUID: 72PEl+wtQ/6jxLjmMODlxw==
X-CSE-MsgGUID: lZ5dO5z2TKWVA44OpLzHAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="93655368"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:32:04 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [i-g-t V3 4/4] tests/xe/mmap: add tests for pci mem barrier
Date: Mon, 18 Nov 2024 17:06:06 +0530
Message-Id: <20241118113606.1490397-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118113606.1490397-1-tejas.upadhyay@intel.com>
References: <20241118113606.1490397-1-tejas.upadhyay@intel.com>
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
./build/tests/xe_mmap --r pci-membarrier-bad-pagesize
./build/tests/xe_mmap --r pci-membarrier-bad-object

V2(MAuld)
 - use do_ioctl and replace igt_subtest_f with igt_subtest
 - Remove unused define

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_mmap.c | 95 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index fc5d73d59..2e5cab622 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -64,6 +64,73 @@ test_mmap(int fd, uint32_t placement, uint32_t flags)
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
+				 xe, igt_nsec_elapsed(&tv), i);
+		}
+		igt_assert_neq(READ_ONCE(ptr[i]), i);
+	}
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
@@ -126,6 +193,25 @@ static void test_bad_object(int fd)
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
@@ -273,6 +359,12 @@ igt_main
 		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
+	igt_subtest("pci-membarrier")
+		test_pci_membarrier(fd);
+
+	igt_subtest("pci-membarrier-bad-pagesize")
+		test_bad_pagesize_for_pcimem(fd);
+
 	igt_subtest("bad-flags")
 		test_bad_flags(fd);
 
@@ -282,6 +374,9 @@ igt_main
 	igt_subtest("bad-object")
 		test_bad_object(fd);
 
+	igt_subtest("pci-membarrier-bad-object")
+		test_bad_object_for_pcimem(fd);
+
 	igt_subtest("small-bar") {
 		igt_require(xe_visible_vram_size(fd, 0));
 		igt_require(xe_visible_vram_size(fd, 0) < xe_vram_size(fd, 0));
-- 
2.34.1

