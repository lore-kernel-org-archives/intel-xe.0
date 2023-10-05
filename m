Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF34E92714
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F1710E430;
	Thu,  5 Oct 2023 15:31:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F9210E439;
 Thu,  5 Oct 2023 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519911; x=1728055911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4jb1TqCyu7ib7bV4s5kDohuRzRprdPfnONPte30jowM=;
 b=A3t7p4A3kSLrIAt8sxyPy+mTi5NisW/+6oQyg/fOWMCV0K46OBAp7Vou
 uaPzRlVR0KfGcLX58NPsJO5AACafdODVRGnysTBrfecjGkSZum/ZIfc1x
 55HtbYXbwPRi3h0Cos7u6VoGNc0W7eFbR2IZJJN9/3uaEqAUE1dpG5t+t
 dNfsKwaJoOkT3CntHlqprMlH3viNz3DtgyioKxd9ocp+1jPrHyN7bnQNJ
 c+3WYR1M6aca4/pq1JyIxUVGvNVVnsOkmC1l87FPHjwmvgacH4/blgMzs
 UCxEv6uxPlb5HZ6/vQWay3tQ+3N7bUmOnVsvEI5FcnIC65UCaROucUORe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363810943"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363810943"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925631343"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925631343"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:15 +0100
Message-ID: <20231005153116.452319-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 11/12] tests/xe: add some vm_bind pat_index
 tests
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
Cc: Nitish Kumar <nitish.kumar@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add some basic tests for pat_index and vm_bind.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Nitish Kumar <nitish.kumar@intel.com>
---
 tests/intel/xe_pat.c | 483 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 484 insertions(+)
 create mode 100644 tests/intel/xe_pat.c

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
new file mode 100644
index 000000000..9c5261b4a
--- /dev/null
+++ b/tests/intel/xe_pat.c
@@ -0,0 +1,483 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Test for selecting per-VMA pat_index
+ * Category: Software building block
+ * Sub-category: VMA
+ * Functionality: pat_index
+ */
+
+#include "igt.h"
+#include "intel_blt.h"
+#include "intel_mocs.h"
+#include "intel_pat.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_util.h"
+
+#define PAGE_SIZE 4096
+
+static bool do_slow_check;
+
+/**
+ * SUBTEST: userptr-coh-none
+ * Test category: functionality test
+ * Description: Test non-coherent pat_index on userptr
+ */
+static void userptr_coh_none(int fd)
+{
+	size_t size = xe_get_default_alignment(fd);
+	uint32_t vm;
+	void *data;
+
+	data = mmap(0, size, PROT_READ |
+		    PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(data != MAP_FAILED);
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	/*
+	 * Try some valid combinations first just to make sure we're not being
+	 * swindled.
+	 */
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
+				   size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0,
+				   DEFAULT_PAT_INDEX, 0),
+		      0);
+	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
+				   size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0,
+				   intel_get_pat_idx_wb(fd), 0),
+		      0);
+	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+
+	/* And then some known COH_NONE pat_index combos which should fail. */
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
+				   size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0,
+				   intel_get_pat_idx_uc(fd), 0),
+		      -EINVAL);
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
+				   size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0,
+				   intel_get_pat_idx_wt(fd), 0),
+		      -EINVAL);
+
+	munmap(data, size);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: pat-index-all
+ * Test category: functionality test
+ * Description: Test every pat_index
+ */
+static void pat_index_all(int fd)
+{
+	size_t size = xe_get_default_alignment(fd);
+	uint32_t vm, bo;
+	uint8_t pat_index;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	bo = xe_bo_create_caching(fd, 0, size, all_memory_regions(fd),
+				  DRM_XE_GEM_CPU_CACHING_WC,
+				  DRM_XE_GEM_COH_NONE);
+
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+				   size, XE_VM_BIND_OP_MAP, NULL, 0, 0,
+				   intel_get_pat_idx_uc(fd), 0),
+		      0);
+	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+				   size, XE_VM_BIND_OP_MAP, NULL, 0, 0,
+				   intel_get_pat_idx_wt(fd), 0),
+		      0);
+	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+				   size, XE_VM_BIND_OP_MAP, NULL, 0, 0,
+				   intel_get_pat_idx_wb(fd), 0),
+		      0);
+	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+
+	igt_assert(intel_get_max_pat_index(fd));
+
+	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
+	     pat_index++) {
+		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+					   size, XE_VM_BIND_OP_MAP, NULL, 0, 0,
+					   pat_index, 0),
+			      0);
+		xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+	}
+
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+				   size, XE_VM_BIND_OP_MAP, NULL, 0, 0,
+				   pat_index, 0),
+		      -EINVAL);
+
+	gem_close(fd, bo);
+
+	/* Must be at least as coherent as the gem_create coh_mode. */
+	bo = xe_bo_create_caching(fd, 0, size, system_memory(fd),
+				  DRM_XE_GEM_CPU_CACHING_WB,
+				  DRM_XE_GEM_COH_AT_LEAST_1WAY);
+
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+				   size, XE_VM_BIND_OP_MAP, NULL, 0, 0,
+				   intel_get_pat_idx_uc(fd), 0),
+		      -EINVAL);
+
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+				   size, XE_VM_BIND_OP_MAP, NULL, 0, 0,
+				   intel_get_pat_idx_wt(fd), 0),
+		      -EINVAL);
+
+	gem_close(fd, bo);
+
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: pat-index-common-blt
+ * Test category: functionality test
+ * Description: Check the common pat_index modes with blitter copy.
+ */
+
+static void pat_index_blt(int fd,
+			  uint32_t r1, uint8_t r1_pat_index, uint16_t r1_coh_mode,
+			  uint32_t r2, uint8_t r2_pat_index, uint16_t r2_coh_mode)
+{
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+	struct blt_copy_data blt = {};
+	struct blt_copy_object src = {};
+	struct blt_copy_object dst = {};
+	uint32_t vm, exec_queue, src_bo, dst_bo, bb;
+	uint32_t *src_map, *dst_map;
+	uint16_t r1_cpu_caching, r2_cpu_caching;
+	intel_ctx_t *ctx;
+	uint64_t ahnd;
+	int width = 512, height = 512;
+	int size, stride, bb_size;
+	int bpp = 32;
+	int i;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
+	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
+	ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
+					 INTEL_ALLOCATOR_SIMPLE,
+					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+	bb_size = xe_get_default_alignment(fd);
+	bb = xe_bo_create_flags(fd, 0, bb_size, r1);
+
+	size = width * height * bpp / 8;
+	stride = width * 4;
+
+	if (r1_coh_mode == DRM_XE_GEM_COH_AT_LEAST_1WAY
+	    && r1 == system_memory(fd))
+		r1_cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
+	else
+		r1_cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+
+	if (r2_coh_mode == DRM_XE_GEM_COH_AT_LEAST_1WAY &&
+	    r2 == system_memory(fd))
+		r2_cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
+	else
+		r2_cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+
+	src_bo = xe_bo_create_caching(fd, 0, size, r1, r1_cpu_caching,
+				      r1_coh_mode);
+	dst_bo = xe_bo_create_caching(fd, 0, size, r2, r2_cpu_caching,
+				      r2_coh_mode);
+
+	blt_copy_init(fd, &blt);
+	blt.color_depth = CD_32bit;
+
+	blt_set_object(&src, src_bo, size, r1, intel_get_uc_mocs(fd),
+		       r1_pat_index, T_LINEAR,
+		       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
+	blt_set_geom(&src, stride, 0, 0, width, height, 0, 0);
+
+	blt_set_object(&dst, dst_bo, size, r2, intel_get_uc_mocs(fd),
+		       r2_pat_index, T_LINEAR,
+		       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
+	blt_set_geom(&dst, stride, 0, 0, width, height, 0, 0);
+
+	blt_set_copy_object(&blt.src, &src);
+	blt_set_copy_object(&blt.dst, &dst);
+	blt_set_batch(&blt.bb, bb, bb_size, r1);
+
+	src_map = xe_bo_map(fd, src_bo, size);
+	dst_map = xe_bo_map(fd, dst_bo, size);
+
+	/* Ensure we always see zeroes for the initial KMD zeroing */
+	blt_fast_copy(fd, ctx, NULL, ahnd, &blt);
+
+	/*
+	 * Only sample random dword in every page if we are doing slow uncached
+	 * reads from VRAM.
+	 */
+	if (!do_slow_check && r2 != system_memory(fd)) {
+		int dwords_page = PAGE_SIZE / sizeof(uint32_t);
+		int dword = rand() % dwords_page;
+
+		igt_debug("random dword: %d\n", dword);
+
+		for (i = dword; i < size / sizeof(uint32_t); i += dwords_page)
+			igt_assert_eq(dst_map[i], 0);
+
+	} else {
+		for (i = 0; i < size / sizeof(uint32_t); i++)
+			igt_assert_eq(dst_map[i], 0);
+	}
+
+	/* Write some values from the CPU, potentially dirtying the CPU cache */
+	for (i = 0; i < size / sizeof(uint32_t); i++)
+		src_map[i] = i;
+
+	/* And finally ensure we always see the CPU written values */
+	blt_fast_copy(fd, ctx, NULL, ahnd, &blt);
+
+	if (!do_slow_check && r2 != system_memory(fd)) {
+		int dwords_page = PAGE_SIZE / sizeof(uint32_t);
+		int dword = rand() % dwords_page;
+
+		igt_debug("random dword: %d\n", dword);
+
+		for (i = dword; i < size / sizeof(uint32_t); i += dwords_page)
+			igt_assert_eq(dst_map[i], i);
+	} else {
+		for (i = 0; i < size / sizeof(uint32_t); i++)
+			igt_assert_eq(dst_map[i], i);
+	}
+
+	munmap(src_map, size);
+	munmap(dst_map, size);
+
+	gem_close(fd, src_bo);
+	gem_close(fd, dst_bo);
+	gem_close(fd, bb);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+
+	put_ahnd(ahnd);
+	intel_ctx_destroy(fd, ctx);
+}
+
+/**
+ * SUBTEST: pat-index-common-render
+ * Test category: functionality test
+ * Description: Check the common pat_index modes with render.
+ */
+
+static void pat_index_render(int fd,
+			     uint32_t r1, uint8_t r1_pat_index, uint16_t r1_coh_mode,
+			     uint32_t r2, uint8_t r2_pat_index, uint16_t r2_coh_mode)
+{
+	uint32_t devid = intel_get_drm_devid(fd);
+	igt_render_copyfunc_t render_copy = NULL;
+	int size, stride, width = 512, height = 512;
+	struct intel_buf src, dst;
+	struct intel_bb *ibb;
+	struct buf_ops *bops;
+	uint16_t r1_cpu_caching, r2_cpu_caching;
+	uint32_t src_bo, dst_bo;
+	uint32_t *src_map, *dst_map;
+	int bpp = 32;
+	int i;
+
+	bops = buf_ops_create(fd);
+
+	render_copy = igt_get_render_copyfunc(devid);
+	igt_assert(render_copy);
+
+	ibb = intel_bb_create(fd, xe_get_default_alignment(fd));
+
+	if (r1_coh_mode == DRM_XE_GEM_COH_AT_LEAST_1WAY
+	    && r1 == system_memory(fd))
+		r1_cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
+	else
+		r1_cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+
+	if (r2_coh_mode == DRM_XE_GEM_COH_AT_LEAST_1WAY &&
+	    r2 == system_memory(fd))
+		r2_cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
+	else
+		r2_cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+
+	size = width * height * bpp / 8;
+	stride = width * 4;
+
+	src_bo = xe_bo_create_caching(fd, 0, size, r1, r1_cpu_caching,
+				      r1_coh_mode);
+	intel_buf_init_full(bops, src_bo, &src, width, height, bpp, 0,
+			    I915_TILING_NONE, I915_COMPRESSION_NONE, size,
+			    stride, r1, r1_pat_index);
+
+	dst_bo = xe_bo_create_caching(fd, 0, size, r2, r2_cpu_caching,
+				      r2_coh_mode);
+	intel_buf_init_full(bops, dst_bo, &dst, width, height, bpp, 0,
+			    I915_TILING_NONE, I915_COMPRESSION_NONE, size,
+			    stride, r2, r2_pat_index);
+
+	src_map = xe_bo_map(fd, src_bo, size);
+	dst_map = xe_bo_map(fd, dst_bo, size);
+
+	/* Ensure we always see zeroes for the initial KMD zeroing */
+	render_copy(ibb,
+		    &src,
+		    0, 0, width, height,
+		    &dst,
+		    0, 0);
+	intel_bb_sync(ibb);
+
+	if (!do_slow_check && r2 != system_memory(fd)) {
+		int dwords_page = PAGE_SIZE / sizeof(uint32_t);
+		int dword = rand() % dwords_page;
+
+		igt_debug("random dword: %d\n", dword);
+
+		for (i = dword; i < size / sizeof(uint32_t); i += dwords_page)
+			igt_assert_eq(dst_map[i], 0);
+	} else {
+		for (i = 0; i < size / sizeof(uint32_t); i++)
+			igt_assert_eq(dst_map[i], 0);
+	}
+
+	/* Write some values from the CPU, potentially dirtying the CPU cache */
+	for (i = 0; i < size / sizeof(uint32_t); i++)
+		src_map[i] = i;
+
+	/* And finally ensure we always see the CPU written values */
+	render_copy(ibb,
+		    &src,
+		    0, 0, width, height,
+		    &dst,
+		    0, 0);
+	intel_bb_sync(ibb);
+
+	if (!do_slow_check && r2 != system_memory(fd)) {
+		int dwords_page = PAGE_SIZE / sizeof(uint32_t);
+		int dword = rand() % dwords_page;
+
+		igt_debug("random dword: %d\n", dword);
+
+		for (i = dword; i < size / sizeof(uint32_t); i += dwords_page)
+			igt_assert_eq(dst_map[i], i);
+	} else {
+		for (i = 0; i < size / sizeof(uint32_t); i++)
+			igt_assert_eq(dst_map[i], i);
+	}
+
+	munmap(src_map, size);
+	munmap(dst_map, size);
+
+	intel_bb_destroy(ibb);
+
+	gem_close(fd, src_bo);
+	gem_close(fd, dst_bo);
+}
+
+const struct pat_index_entry {
+	uint8_t (*get_pat_index)(int fd);
+	const char *name;
+	uint16_t coh_mode;
+} common_pat_index_modes[] = {
+	{ intel_get_pat_idx_uc, "uc", DRM_XE_GEM_COH_NONE },
+	{ intel_get_pat_idx_wt, "wt", DRM_XE_GEM_COH_NONE },
+	{ intel_get_pat_idx_wb, "wb", DRM_XE_GEM_COH_AT_LEAST_1WAY },
+};
+
+typedef void (*pat_index_fn)(int fd,
+			     uint32_t r1, uint8_t r1_pat_index, uint16_t r1_coh_mode,
+			     uint32_t r2, uint8_t r2_pat_index, uint16_t r2_coh_mode);
+
+static void subtest_pat_index_common_with_regions(int fd, pat_index_fn fn)
+{
+	struct igt_collection *common_pat_index_set;
+	struct igt_collection *regions_set;
+	struct igt_collection *regions;
+
+	common_pat_index_set =
+		igt_collection_create(ARRAY_SIZE(common_pat_index_modes));
+
+	regions_set = xe_get_memory_region_set(fd,
+					       XE_MEM_REGION_CLASS_SYSMEM,
+					       XE_MEM_REGION_CLASS_VRAM);
+
+	for_each_variation_r(regions, 2, regions_set) {
+		struct igt_collection *modes;
+		uint32_t r1, r2;
+		char *reg_str;
+
+		r1 = igt_collection_get_value(regions, 0);
+		r2 = igt_collection_get_value(regions, 1);
+
+		reg_str = xe_memregion_dynamic_subtest_name(fd, regions);
+
+		for_each_variation_r(modes, 2, common_pat_index_set) {
+			struct pat_index_entry r1_entry, r2_entry;
+			uint8_t r1_pat_index, r2_pat_index;
+			int r1_idx, r2_idx;
+
+			r1_idx = igt_collection_get_value(modes, 0);
+			r2_idx = igt_collection_get_value(modes, 1);
+
+			r1_entry = common_pat_index_modes[r1_idx];
+			r2_entry = common_pat_index_modes[r2_idx];
+
+			r1_pat_index = r1_entry.get_pat_index(fd);
+			r2_pat_index = r2_entry.get_pat_index(fd);
+
+			igt_dynamic_f("%s-%s-%s", reg_str, r1_entry.name, r2_entry.name)
+				fn(fd,
+				   r1, r1_pat_index, r1_entry.coh_mode,
+				   r2, r2_pat_index, r2_entry.coh_mode);
+		}
+
+		free(reg_str);
+	}
+}
+
+igt_main
+{
+	int fd;
+	uint32_t seed;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+
+		seed = time(NULL);
+		igt_debug("seed: %d\n", seed);
+
+		xe_device_get(fd);
+	}
+
+	igt_subtest("pat-index-all")
+		pat_index_all(fd);
+
+	igt_subtest("userptr-coh-none")
+		userptr_coh_none(fd);
+
+	igt_subtest_with_dynamic("pat-index-common-blt") {
+		igt_require(blt_has_fast_copy(fd));
+		subtest_pat_index_common_with_regions(fd, pat_index_blt);
+	}
+
+	igt_subtest_with_dynamic("pat-index-common-render") {
+		igt_require(xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER));
+		subtest_pat_index_common_with_regions(fd, pat_index_render);
+	}
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2404b2d4a..61351be04 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -296,6 +296,7 @@ intel_xe_progs = [
 	'xe_mmio',
 	'xe_module_load',
 	'xe_noexec_ping_pong',
+	'xe_pat',
 	'xe_pm',
 	'xe_pm_residency',
 	'xe_prime_self_import',
-- 
2.41.0

