Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF18E9270D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B557810E42D;
	Thu,  5 Oct 2023 15:31:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FBE10E428;
 Thu,  5 Oct 2023 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519902; x=1728055902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TuVIRO8sxjggr51MBiuOAnZ05gBz82yW7EXgmuOcaDU=;
 b=mwbsi2DiyHurp6Rmhv/con2n1/F7phpPf7DFkFISLYX9F0qYtcmrxeYI
 YsKwtdv9Jg7VD/9JxGpzz3PGbchJ8/KMznFzcLFDOMatCj6ZPE5IKclvA
 CwxsEavuNpA7ab5m6S+ZzryTM9k2qYe4ER9IJqR0fCyKotmgvjaDuejrq
 hCAAMmc+L7r/NNi+zzJ8OaOSFKy/dBTSiP6m2I7T7FTCzP2hSZI26xx8m
 nsxs70ZOb8BebM9skZLU9JQClNXs7in65wIBtz4J4Z+b9LfOqy+A31llH
 ogtx8QionzNVtgs9r3lVIoPiTI+h/Z8plqoVH7ygTJdtSCHZx5IdktuPH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363810920"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363810920"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925631308"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925631308"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:09 +0100
Message-ID: <20231005153116.452319-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 05/12] tests/xe/mmap: add some tests for
 cpu_caching and coh_mode
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Ensure the various invalid combinations are rejected. Also ensure we can
mmap and fault anything that is valid.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 tests/intel/xe_mmap.c | 77 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 7e7e43c00..09e9c8aae 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -199,6 +199,80 @@ static void test_small_bar(int fd)
 	gem_close(fd, bo);
 }
 
+static void assert_caching(int fd, uint64_t flags, uint16_t cpu_caching,
+			   uint16_t coh_mode, bool fail)
+{
+	uint64_t size = xe_get_default_alignment(fd);
+	uint64_t mmo;
+	uint32_t handle;
+	uint32_t *map;
+	bool ret;
+
+	ret = __xe_bo_create_caching(fd, 0, size, flags, cpu_caching,
+				     coh_mode, &handle);
+	igt_assert(ret == fail);
+
+	if (fail)
+		return;
+
+	mmo = xe_bo_mmap_offset(fd, handle);
+	map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
+	igt_assert(map != MAP_FAILED);
+	map[0] = 0xdeadbeaf;
+	gem_close(fd, handle);
+}
+
+/**
+ * SUBTEST: cpu-caching-coh
+ * Description: Test cpu_caching and coh, including mmap behaviour.
+ * Test category: functionality test
+ */
+static void test_cpu_caching(int fd)
+{
+	if (vram_memory(fd, 0)) {
+		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CPU_CACHING_WC, DRM_XE_GEM_COH_NONE,
+			       false);
+		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CPU_CACHING_WC, DRM_XE_GEM_COH_AT_LEAST_1WAY,
+			       false);
+		assert_caching(fd, vram_memory(fd, 0) | system_memory(fd),
+			       DRM_XE_GEM_CPU_CACHING_WC, DRM_XE_GEM_COH_NONE,
+			       false);
+
+		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CPU_CACHING_WB, DRM_XE_GEM_COH_NONE,
+			       true);
+		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CPU_CACHING_WB, DRM_XE_GEM_COH_AT_LEAST_1WAY,
+			       true);
+		assert_caching(fd, vram_memory(fd, 0) | system_memory(fd),
+			       DRM_XE_GEM_CPU_CACHING_WB, DRM_XE_GEM_COH_NONE,
+			       true);
+		assert_caching(fd, vram_memory(fd, 0) | system_memory(fd),
+			       DRM_XE_GEM_CPU_CACHING_WB, DRM_XE_GEM_COH_AT_LEAST_1WAY,
+			       true);
+	}
+
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WB,
+		       DRM_XE_GEM_COH_AT_LEAST_1WAY, false);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC,
+		       DRM_XE_GEM_COH_NONE, false);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC,
+		       DRM_XE_GEM_COH_AT_LEAST_1WAY, false);
+
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WB,
+		       DRM_XE_GEM_COH_NONE, true);
+	assert_caching(fd, system_memory(fd), -1, -1, true);
+	assert_caching(fd, system_memory(fd), 0, 0, true);
+	assert_caching(fd, system_memory(fd), 0, DRM_XE_GEM_COH_AT_LEAST_1WAY, true);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC, 0, true);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC + 1,
+		       DRM_XE_GEM_COH_AT_LEAST_1WAY, true);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC,
+		       DRM_XE_GEM_COH_AT_LEAST_1WAY + 1, true);
+}
+
 igt_main
 {
 	int fd;
@@ -230,6 +304,9 @@ igt_main
 		test_small_bar(fd);
 	}
 
+	igt_subtest("cpu-caching-coh")
+		test_cpu_caching(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.41.0

