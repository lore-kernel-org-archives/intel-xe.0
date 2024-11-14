Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD58D41C35
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 04:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A97010E7A2;
	Thu, 14 Nov 2024 04:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atrODep9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9EC10E7A1;
 Thu, 14 Nov 2024 04:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731560333; x=1763096333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N/ORtc9aVertKbNro9687VYRdey4ckOigSXKC0sF93o=;
 b=atrODep9A12dxTMoX8Gl7/CLVwUm/DF1/JyPxamO1/Pi7WNjxSugPMWL
 A7xftkRHhyNkoIpqenK5awHbtYXOiCN5hL3Uf+JW5QcNwJnChoImMha7l
 9fAFAOmQiiEWWzQbtacqHkW3gWEg8FoW1j/ND+h6EL++SFTGCYoLWPLbx
 9UtQfuCDiy5atibysYYPku/NdUxYRlYlqw4lCi6BOf+5e0WEX02VW46m7
 +Y7eDHLR+CaohuYmfmNSB9suJ6bdvgTaikhlnejjJJLnvL/EsskI5fbmI
 PDWyRyM5p31VphwHIEOCMdr7Jz7Rufcbc/dzPXNvjFdYQ7gWUj2zrDlsg A==;
X-CSE-ConnectionGUID: PBK/g9kgRD+GrNe5GFouQQ==
X-CSE-MsgGUID: GurMxm1wQJmA8qC1FYVrYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35409538"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="35409538"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:58:53 -0800
X-CSE-ConnectionGUID: Tt/b3kESSGi/SHOvUC+lig==
X-CSE-MsgGUID: pCcUbgGBRriEfjZ+MBKnCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="92139118"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:58:52 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t 4/4] tests/xe/mmap: add tests for pci mem barrier
Date: Thu, 14 Nov 2024 10:31:29 +0530
Message-Id: <20241114050129.1381711-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
References: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_mmap.c | 96 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index fc5d73d59..ae0363a20 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -64,6 +64,74 @@ test_mmap(int fd, uint32_t placement, uint32_t flags)
 	gem_close(fd, bo);
 }
 
+#define PAGE_SHIFT 12
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
+	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
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
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
+	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
+	igt_assert(map == MAP_FAILED);
+}
+
 /**
  * SUBTEST: bad-flags
  * Description: Test mmap offset with bad flags.
@@ -126,6 +194,25 @@ static void test_bad_object(int fd)
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
@@ -273,6 +360,12 @@ igt_main
 		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
+	igt_subtest("pci-membarrier")
+		test_pci_membarrier(fd);
+
+	igt_subtest_f("pci-membarrier-bad-pagesize")
+		test_bad_pagesize_for_pcimem(fd);
+
 	igt_subtest("bad-flags")
 		test_bad_flags(fd);
 
@@ -282,6 +375,9 @@ igt_main
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

