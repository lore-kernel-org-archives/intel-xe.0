Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A6C606A325
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bATTjMOM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957BB10E28F;
	Sat, 21 Nov 2026 09:32:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBFB10E28F;
 Sat, 21 Nov 2026 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795253555; x=1826789555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kJs+1rQUr6TtDX4Dj4phF6VmWKk488oRFnRXUE6nl9Y=;
 b=bATTjMOMhq8VsLYHI8ODbOo0ZvX4Ev6vViKlHsyQCxaAiIvYJjOrbDoh
 N6mZGuG0Phu7BZn0d5Augzfr+/fQhf1xTyfQzn7jJfaLn98pFtZN8NbS8
 lkZxzc/7Nn2a2/gdNhQY/j8qCYBbxmJfHGlReJ7LTQ3Cz1tibBltHRTKK
 3Z4/AtyqYDXuBtfq6KkXMlkla89T8eG1sCDsxmwUz5hVNySi9Jt+Pv3uS
 8QfbxBL3qiirobmj0ilyLG9AGGUhO4RCpGPgb9h2qoR1tclWMV4BJ4ktO
 PdAxI9vMnQM2kvcPAk2LiDlkr3vxQ1VE5nkTx9U1Wa03uZRNh35J8lllq A==;
X-CSE-ConnectionGUID: S33aKkYCTM2ixkOwG7942Q==
X-CSE-MsgGUID: +ZS1Shd5RsC1q90ZKzTiLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4012780"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4012780"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 01:32:35 -0800
X-CSE-ConnectionGUID: NmUGWYy2RvOdhaSSNmUH5g==
X-CSE-MsgGUID: B8LmtXpuQmCvkHBeawa0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="10880637"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by orviesa006.jf.intel.com with ESMTP; 21 Nov 2026 01:32:35 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_create: Add
 create-huge-sysmem-defer-backing subtest
Date: Sat, 21 Nov 2026 01:32:14 -0800
Message-ID: <20261121093216.1509828-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Create a 1 TiB system memory bo with DEFER_BACKING. Its TTM page
directory needs more than INT_MAX bytes, which made kvmalloc() emit a
kernel WARNING. Check that the ioctl fails gracefully; the WARNING
itself is caught by igt_runner through dmesg. The expected TTM
"Failed allocating page table" error message is ignored.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---

Notes:
    This test depends on the kernel patch "drm/ttm: Don't warn on oversized
    page directory allocations":
    https://patchwork.freedesktop.org/series/179273/
    https://lore.kernel.org/all/20261121091815.1436090-2-shuicheng.lin@intel.com/
    
    The bo creation only reaches the TTM page directory allocation once the
    DRM mmap offset range is larger than 1 TiB, i.e. with kernel commit
    6a68105dac4f ("drm: increase 64-bit mmap_range size to 8TB"), currently
    in drm-tip. Without it the ioctl fails earlier with -ENOSPC and the test
    passes. With it, but without the TTM fix, the kernel WARNs and the test
    is reported as dmesg-warn (or abort with --abort-on-monitored-error).
    
    Tested on BMG with drm-xe-next plus 6a68105dac4f, with and without the
    TTM fix.

 tests/intel/xe_create.c | 62 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index fd1993b21..1edb9593d 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -42,14 +42,16 @@ static int __ioctl_create(int fd, struct drm_xe_gem_create *create)
 	return ret;
 }
 
-static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
-		       uint32_t *handlep)
+static int __create_bo_flags(int fd, uint32_t vm, uint64_t size,
+			     uint32_t placement, uint32_t flags,
+			     uint32_t *handlep)
 {
 	struct drm_xe_gem_create create = {
 		.vm_id = vm,
 		.size = size,
-		.cpu_caching = __xe_default_cpu_caching(fd, placement, 0),
+		.cpu_caching = __xe_default_cpu_caching(fd, placement, flags),
 		.placement = placement,
+		.flags = flags,
 	};
 	int ret;
 
@@ -61,6 +63,12 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 	return ret;
 }
 
+static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
+		       uint32_t *handlep)
+{
+	return __create_bo_flags(fd, vm, size, placement, 0, handlep);
+}
+
 /**
  * SUBTEST: valid-flag
  * Functionality: ioctl_input_validation
@@ -405,6 +413,51 @@ static void create_massive_size(int fd)
 	}
 }
 
+/**
+ * SUBTEST: create-huge-sysmem-defer-backing
+ * Functionality: ioctl
+ * Test category: functionality test
+ * Description: Create a system memory bo with DEFER_BACKING whose TTM page
+ *		directory needs more than INT_MAX bytes, and verify the
+ *		ioctl fails gracefully instead of triggering a kernel warning
+ *		in the kvmalloc() size check.
+ */
+static void create_huge_sysmem_defer_backing(int fd)
+{
+	/*
+	 * TTM keeps one pointer per page in its page directory, and
+	 * kvmalloc() refuses (and warns about) anything above INT_MAX bytes.
+	 * 1 TiB of 4 KiB pages needs 2 GiB of pointers, just above the limit.
+	 * DEFER_BACKING places the bo in system memory first, which bypasses
+	 * the total-RAM limit of the TT manager, so the page directory
+	 * allocation is reached without any real memory being consumed.
+	 */
+	const uint64_t size = ((uint64_t)INT_MAX / sizeof(uint64_t) + 1) *
+			      PAGE_SIZE;
+	uint32_t handle = 0;
+	int ret;
+
+	/* The expected allocation failure is logged with pr_err() by TTM. */
+	igt_emit_ignore_dmesg_regex("Failed allocating page table");
+
+	ret = __create_bo_flags(fd, 0, size, system_memory(fd),
+				DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING, &handle);
+	igt_debug("bo create of %" PRIu64 " bytes returned %d\n", size, ret);
+
+	/*
+	 * -ENOSPC: the size does not fit in the mmap offset range.
+	 * -ENOMEM: the TTM page directory could not be allocated.
+	 * Success is fine as well, as long as no kernel warning is emitted,
+	 * which is checked by igt_runner through dmesg.
+	 */
+	igt_assert_f(ret == 0 || ret == -ENOMEM || ret == -ENOSPC,
+		     "unexpected bo create result %d (%s)\n", ret,
+		     strerror(-ret));
+
+	if (!ret)
+		gem_close(fd, handle);
+}
+
 /**
  * SUBTEST: create-big-vram
  * Functionality: bo
@@ -581,6 +634,9 @@ int igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 		create_massive_size(xe);
 	}
 
+	igt_subtest("create-huge-sysmem-defer-backing")
+		create_huge_sysmem_defer_backing(xe);
+
 	igt_subtest_with_dynamic("create-big-vram") {
 		int gt;
 

base-commit: 792f1105b5f0e2bc254cf2254cc8f6aef8799659
-- 
2.43.0

