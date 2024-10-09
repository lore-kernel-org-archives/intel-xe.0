Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB9CEE333
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 17:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AC010E796;
	Wed,  9 Oct 2024 17:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lonBvN9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A2810E796
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728494503; x=1760030503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/kQZ6Rupkt0d0qtLh/e3DeyeYJZwyevn+D98W54Uvyc=;
 b=lonBvN9fU6z6rZe3UdYcUB5aPHysvP/WETICvzPKlCYL4w9YkGAHZUJR
 FWxkWoQGQnoopMEdB830uYx/6wvU1UK8lZoOAgUZtprGP3aZtrLu3qMLh
 pMRXlWUoYtgqYw5KJTMGvLz2TLjiE58RRbmMuMS/Th9OfV3d3iVNN2TWD
 jdMbtN/kDFBmScEh4o4r73sc1v7b9r4BCWRfc1cnaz71pn1v33wWrxPGP
 hb/RLFifXcSe9O7YhL2+KPF/olfey0YKT3MhDM/98giFGJpNn/qQpaSd8
 HgoPGY3WTQmtcneVIVSzm0BlSMCUvR4MAuL1N837Q3fOyrbME6UBARbMR Q==;
X-CSE-ConnectionGUID: Bw/ARVMXSmCfY7i2vrSU0w==
X-CSE-MsgGUID: l37Di+INQxOSrby3nIGmtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27292655"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27292655"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:42 -0700
X-CSE-ConnectionGUID: Ty6469sURYyCfyfU2l6p1Q==
X-CSE-MsgGUID: sDukeMFcReWD9+EZV4ZGsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76265754"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/5] drm/xe/guc: Introduce the GuC Buffer Cache
Date: Wed,  9 Oct 2024 19:21:21 +0200
Message-Id: <20241009172125.1539-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241009172125.1539-1-michal.wajdeczko@intel.com>
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
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

The purpose of the GuC Buffer Cache is to prepare a cached buffer
that could be used by some of the CTB based communication actions
which require an indirect data to be passed in a separate location
than CT message buffer.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_guc_buf.c       | 387 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.h       |  48 ++++
 drivers/gpu/drm/xe/xe_guc_buf_types.h |  40 +++
 4 files changed, 476 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index da80c29aa363..0aed652dc806 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -56,6 +56,7 @@ xe-y += xe_bb.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
+	xe_guc_buf.o \
 	xe_guc_capture.o \
 	xe_guc_ct.o \
 	xe_guc_db_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
new file mode 100644
index 000000000000..a49be711ea86
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -0,0 +1,387 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/bitmap.h>
+#include <linux/cleanup.h>
+#include <linux/mutex.h>
+
+#include <drm/drm_managed.h>
+
+#include "xe_assert.h"
+#include "xe_bo.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
+#include "xe_guc_buf.h"
+
+/**
+ * DOC: GuC Buffer Cache
+ *
+ * The purpose of the `GuC Buffer Cache`_ is to prepare a cached buffer for use
+ * by the GuC `CTB based communication` actions that require an indirect data to
+ * be passed in a separate GPU memory location, that needs to be available only
+ * during processing of that GuC action.
+ *
+ * The xe_guc_buf_cache_init() will allocate and initialize the cache object.
+ * The object is drm managed and will be allocated with GFP_KERNEL flag.
+ * The size of the underlying GPU memory buffer will be aligned to SZ_4K.
+ * The cache will then support up to BITS_PER_LONG a sub-allocations from that
+ * data buffer. Each sub-allocation will be at least aligned to SZ_64.
+ *
+ * ::
+ *
+ *       <------> chunk (n * 64)
+ *       <------------- CPU mirror (n * 4K) -------------------------------->
+ *      +--------+--------+--------+--------+-----------------------+--------+
+ *      |   0    |   1    |   2    |   3    |                       |   m    |
+ *      +--------+--------+--------+--------+-----------------------+--------+
+ *                                                 ||       /\
+ *                                                flush     ||
+ *                                                 ||      sync
+ *                                                 \/       ||
+ *      +--------+--------+--------+--------+-----------------------+--------+
+ *      |   0    |   1    |   2    |   3    |                       |   m    |
+ *      +--------+--------+--------+--------+-----------------------+--------+
+ *       <--------- GPU allocation (n * 4K) -------------------------------->
+ *       <------> chunk (n * 64)
+ *
+ * The xe_guc_buf_reserve() will return a reference to a new sub-allocation.
+ * The xe_guc_buf_release() shall be used to release a such sub-allocation.
+ *
+ * The xe_guc_buf_cpu_ptr() will provide access to the sub-allocation.
+ * The xe_guc_buf_flush() shall be used to flush data from any mirror buffer to
+ * the underlying GPU memory.
+ *
+ * The xe_guc_buf_gpu_addr() will provide a GPU address of the sub-allocation.
+ * The xe_guc_buf_sync() might be used to copy the content of the sub-allocation
+ * from the GPU memory to the local mirror buffer.
+ */
+
+static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
+{
+	return cache->guc;
+}
+
+static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
+{
+	return guc_to_gt(cache_to_guc(cache));
+}
+
+static struct xe_device *cache_to_xe(struct xe_guc_buf_cache *cache)
+{
+	return gt_to_xe(cache_to_gt(cache));
+}
+
+static struct mutex *cache_mutex(struct xe_guc_buf_cache *cache)
+{
+	return &cache_to_guc(cache)->ct.lock;
+}
+
+static void __fini_cache(void *arg)
+{
+	struct xe_guc_buf_cache *cache = arg;
+	struct xe_gt *gt = cache_to_gt(cache);
+
+	if (cache->used)
+		xe_gt_dbg(gt, "buffer cache unclean: %#lx = %u * %u bytes\n",
+			  cache->used, bitmap_weight(&cache->used, BITS_PER_LONG), cache->chunk);
+
+	kvfree(cache->mirror);
+	cache->mirror = NULL;
+	cache->bo = NULL;
+	cache->used = 0;
+}
+
+/**
+ * xe_guc_buf_cache_init() - Allocate and initialize a GuC Buffer Cache.
+ * @guc: the &xe_guc where this cache will be used
+ * @size: minimum size of the cache
+ *
+ * See `GuC Buffer Cache`_ for details.
+ *
+ * Return: pointer to the &xe_guc_buf_cache on success or a ERR_PTR() on failure.
+ */
+struct xe_guc_buf_cache *xe_guc_buf_cache_init(struct xe_guc *guc, u32 size)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_guc_buf_cache *cache;
+	u32 chunk_size;
+	u32 cache_size;
+	int ret;
+
+	cache_size = ALIGN(size, SZ_4K);
+	chunk_size = cache_size / BITS_PER_LONG;
+
+	xe_gt_assert(gt, size);
+	xe_gt_assert(gt, IS_ALIGNED(chunk_size, SZ_64));
+
+	cache = drmm_kzalloc(&xe->drm, sizeof(*cache), GFP_KERNEL);
+	if (!cache)
+		return ERR_PTR(-ENOMEM);
+
+	cache->bo = xe_managed_bo_create_pin_map(xe, tile, cache_size,
+						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+						 XE_BO_FLAG_GGTT |
+						 XE_BO_FLAG_GGTT_INVALIDATE);
+	if (IS_ERR(cache->bo))
+		return ERR_CAST(cache->bo);
+
+	cache->guc = guc;
+	cache->chunk = chunk_size;
+	cache->mirror = kvzalloc(cache_size, GFP_KERNEL);
+	if (!cache->mirror)
+		return ERR_PTR(-ENOMEM);
+
+	ret = devm_add_action_or_reset(xe->drm.dev, __fini_cache, cache);
+	if (ret)
+		return ERR_PTR(ret);
+
+	xe_gt_dbg(gt, "buffer cache at %#x (%uKiB = %u x %zu dwords) for %ps\n",
+		  xe_bo_ggtt_addr(cache->bo), cache_size / SZ_1K,
+		  BITS_PER_LONG, chunk_size / sizeof(u32), __builtin_return_address(0));
+	return cache;
+}
+
+static bool cache_is_ref_active(struct xe_guc_buf_cache *cache, unsigned long ref)
+{
+	lockdep_assert_held(cache_mutex(cache));
+	return bitmap_subset(&ref, &cache->used, BITS_PER_LONG);
+}
+
+static bool ref_is_valid(unsigned long ref)
+{
+	return ref && find_next_bit(&ref, BITS_PER_LONG,
+				    find_first_bit(&ref, BITS_PER_LONG) +
+				    bitmap_weight(&ref, BITS_PER_LONG)) == BITS_PER_LONG;
+}
+
+static void cache_assert_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
+{
+	xe_gt_assert_msg(cache_to_gt(cache), ref_is_valid(ref),
+			 "# malformed ref %#lx %*pbl", ref, (int)BITS_PER_LONG, &ref);
+	xe_gt_assert_msg(cache_to_gt(cache), cache_is_ref_active(cache, ref),
+			 "# stale ref %#lx %*pbl vs used %#lx %*pbl",
+			 ref, (int)BITS_PER_LONG, &ref,
+			 cache->used, (int)BITS_PER_LONG, &cache->used);
+}
+
+static unsigned long cache_reserve(struct xe_guc_buf_cache *cache, u32 size)
+{
+	unsigned long index;
+	unsigned int nbits;
+
+	lockdep_assert_held(cache_mutex(cache));
+	xe_gt_assert(cache_to_gt(cache), size);
+	xe_gt_assert(cache_to_gt(cache), size <= BITS_PER_LONG * cache->chunk);
+
+	nbits = DIV_ROUND_UP(size, cache->chunk);
+	index = bitmap_find_next_zero_area(&cache->used, BITS_PER_LONG, 0, nbits, 0);
+	if (index >= BITS_PER_LONG) {
+		xe_gt_dbg(cache_to_gt(cache), "no space for %u byte%s in cache at %#x used %*pbl\n",
+			  size, str_plural(size), xe_bo_ggtt_addr(cache->bo),
+			  (int)BITS_PER_LONG, &cache->used);
+		return 0;
+	}
+
+	bitmap_set(&cache->used, index, nbits);
+
+	return GENMASK(index + nbits - 1, index);
+}
+
+static u64 cache_ref_offset(struct xe_guc_buf_cache *cache, unsigned long ref)
+{
+	cache_assert_ref(cache, ref);
+	return __ffs(ref) * cache->chunk;
+}
+
+static u32 cache_ref_size(struct xe_guc_buf_cache *cache, unsigned long ref)
+{
+	cache_assert_ref(cache, ref);
+	return hweight_long(ref) * cache->chunk;
+}
+
+static u64 cache_ref_gpu_addr(struct xe_guc_buf_cache *cache, unsigned long ref)
+{
+	return xe_bo_ggtt_addr(cache->bo) + cache_ref_offset(cache, ref);
+}
+
+static void *cache_ref_cpu_ptr(struct xe_guc_buf_cache *cache, unsigned long ref)
+{
+	return cache->mirror + cache_ref_offset(cache, ref);
+}
+
+/**
+ * xe_guc_buf_reserve() - Reserve a new sub-allocation.
+ * @cache: the &xe_guc_buf_cache where reserve sub-allocation
+ * @size: the requested size of the buffer
+ *
+ * Use xe_guc_buf_is_valid() to check if returned buffer reference is valid.
+ * Must use xe_guc_buf_release() to release a sub-allocation.
+ *
+ * Return: a &xe_guc_buf of new sub-allocation.
+ */
+struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 size)
+{
+	guard(mutex)(cache_mutex(cache));
+	unsigned long ref;
+
+	ref = cache_reserve(cache, size);
+
+	return (struct xe_guc_buf){ .cache = cache, .ref = ref };
+}
+
+/**
+ * xe_guc_buf_from_data() - Reserve a new sub-allocation using data.
+ * @cache: the &xe_guc_buf_cache where reserve sub-allocation
+ * @data: the data to flush the sub-allocation
+ * @size: the size of the data
+ *
+ * Similar to xe_guc_buf_reserve() but flushes @data to the GPU memory.
+ *
+ * Return: a &xe_guc_buf of new sub-allocation.
+ */
+struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
+				       const void *data, size_t size)
+{
+	guard(mutex)(cache_mutex(cache));
+	unsigned long ref;
+
+	ref = cache_reserve(cache, size);
+	if (ref) {
+		u32 offset = cache_ref_offset(cache, ref);
+
+		xe_map_memcpy_to(cache_to_xe(cache), &cache->bo->vmap,
+				 offset, data, size);
+	}
+
+	return (struct xe_guc_buf){ .cache = cache, .ref = ref };
+}
+
+static void cache_release_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
+{
+	cache_assert_ref(cache, ref);
+	cache->used &= ~ref;
+}
+
+/**
+ * xe_guc_buf_release() - Release a sub-allocation.
+ * @buf: the &xe_guc_buf to release
+ *
+ * Releases a sub-allocation reserved by xe_guc_buf_reserve().
+ */
+void xe_guc_buf_release(const struct xe_guc_buf buf)
+{
+	guard(mutex)(cache_mutex(buf.cache));
+
+	if (!buf.ref)
+		return;
+
+	cache_release_ref(buf.cache, buf.ref);
+}
+
+static u64 cache_flush_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
+{
+	u32 offset = cache_ref_offset(cache, ref);
+	u32 size = cache_ref_size(cache, ref);
+
+	xe_map_memcpy_to(cache_to_xe(cache), &cache->bo->vmap,
+			 offset, cache->mirror + offset, size);
+
+	return cache_ref_gpu_addr(cache, ref);
+}
+
+/**
+ * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
+ * @buf: the &xe_guc_buf to flush
+ *
+ * Return: a GPU address of the sub-allocation.
+ */
+u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
+{
+	guard(mutex)(cache_mutex(buf.cache));
+
+	return cache_flush_ref(buf.cache, buf.ref);
+}
+
+static void *cache_sync_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
+{
+	u32 offset = cache_ref_offset(cache, ref);
+	u32 size = cache_ref_size(cache, ref);
+
+	xe_map_memcpy_from(cache_to_xe(cache), cache->mirror + offset,
+			   &cache->bo->vmap, offset, size);
+
+	return cache_ref_cpu_ptr(cache, ref);
+}
+
+/**
+ * xe_guc_buf_sync() - Copy the data from the GPU memory to the sub-allocation.
+ * @buf: the &xe_guc_buf to sync
+ *
+ * Return: the CPU pointer to the sub-allocation.
+ */
+void *xe_guc_buf_sync(const struct xe_guc_buf buf)
+{
+	guard(mutex)(cache_mutex(buf.cache));
+
+	return cache_sync_ref(buf.cache, buf.ref);
+}
+
+/**
+ * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
+ * @buf: the &xe_guc_buf to query
+ *
+ * Return: the CPU pointer of the sub-allocation.
+ */
+void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf)
+{
+	guard(mutex)(cache_mutex(buf.cache));
+
+	return cache_ref_cpu_ptr(buf.cache, buf.ref);
+}
+
+/**
+ * xe_guc_buf_gpu_addr() - Obtain a GPU address of the sub-allocation.
+ * @buf: the &xe_guc_buf to query
+ *
+ * Return: the GPU address of the sub-allocation.
+ */
+u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf)
+{
+	guard(mutex)(cache_mutex(buf.cache));
+
+	return cache_ref_gpu_addr(buf.cache, buf.ref);
+}
+
+/**
+ * xe_guc_cache_gpu_addr_from_ptr() - Lookup a GPU address using the pointer.
+ * @cache: the &xe_guc_buf_cache with sub-allocations
+ * @ptr: the CPU pointer to the data from a sub-allocation
+ * @size: the size of the data at @ptr
+ *
+ * Return: the GPU address on success or 0 on failure.
+ */
+u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size)
+{
+	guard(mutex)(cache_mutex(cache));
+	ptrdiff_t offset = ptr - cache->mirror;
+	unsigned long ref;
+	int first, last;
+
+	if (offset < 0)
+		return 0;
+
+	first = div_u64(offset, cache->chunk);
+	last = DIV_ROUND_UP(offset + max(1, size), cache->chunk) - 1;
+
+	if (last >= BITS_PER_LONG)
+		return 0;
+
+	ref = GENMASK(last, first);
+	cache_assert_ref(cache, ref);
+
+	return xe_bo_ggtt_addr(cache->bo) + offset;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
new file mode 100644
index 000000000000..700e7b06c149
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GUC_BUF_H_
+#define _XE_GUC_BUF_H_
+
+#include <linux/cleanup.h>
+
+#include "xe_guc_buf_types.h"
+
+struct xe_guc_buf_cache *xe_guc_buf_cache_init(struct xe_guc *guc, u32 size);
+
+struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 size);
+struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
+				       const void *data, size_t size);
+void xe_guc_buf_release(const struct xe_guc_buf buf);
+
+/**
+ * xe_guc_buf_is_valid() - Check if the GuC Buffer Cache sub-allocation is valid.
+ * @buf: the &xe_guc_buf reference to check
+ *
+ * Return: true if @buf represents a valid sub-allocation.
+ */
+static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
+{
+	return buf.ref;
+}
+
+void *xe_guc_buf_sync(const struct xe_guc_buf buf);
+void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
+u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
+u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
+
+u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
+
+DEFINE_CLASS(xe_guc_buf, struct xe_guc_buf,
+	     xe_guc_buf_release(_T),
+	     xe_guc_buf_reserve(cache, size),
+	     struct xe_guc_buf_cache *cache, u32 size);
+
+DEFINE_CLASS(xe_guc_buf_from_data, struct xe_guc_buf,
+	     xe_guc_buf_release(_T),
+	     xe_guc_buf_from_data(cache, data, size),
+	     struct xe_guc_buf_cache *cache, const void *data, u32 size);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
new file mode 100644
index 000000000000..fe93b32e97f8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GUC_BUF_TYPES_H_
+#define _XE_GUC_BUF_TYPES_H_
+
+#include <linux/types.h>
+
+struct xe_bo;
+struct xe_guc;
+
+/**
+ * struct xe_guc_buf_cache - GuC Data Buffer Cache.
+ */
+struct xe_guc_buf_cache {
+	/** @guc: the parent GuC where buffers are used */
+	struct xe_guc *guc;
+	/** @bo: the main cache buffer object with GPU allocation */
+	struct xe_bo *bo;
+	/** @mirror: the CPU pointer to the data buffer */
+	void *mirror;
+	/** @used: the bitmap used to track allocated chunks */
+	unsigned long used;
+	/** @chunk: the size of the smallest sub-allocation */
+	u32 chunk;
+};
+
+/**
+ * struct xe_guc_buf - GuC Data Buffer Reference.
+ */
+struct xe_guc_buf {
+	/** @cache: the cache where this allocation belongs */
+	struct xe_guc_buf_cache *cache;
+	/** @ref: the internal reference */
+	unsigned long ref;
+};
+
+#endif
-- 
2.43.0

