Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3015E92711
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFE810E43D;
	Thu,  5 Oct 2023 15:31:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F404610E43C;
 Thu,  5 Oct 2023 15:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519908; x=1728055908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qQbvdW35sEucxdD4Q7/wUSx2hwXorpKjR6CV3DPLMNc=;
 b=H1M8j5gY5WzO7EnEzwXsN8BeQMzWIWPXRWjJ80t8T5hpgw80GVIgHKS2
 8qu7xGdwseLYjs7i4+2iEsf77um1AuApyxy/vYrzHNIyfZ2APbK4mewvn
 0CHJLy9hM8t2qiIFmPjmOifpWuQnSxyPNAwNDlv3egwh3414afr5rhjco
 eHz6o5PSAREDmzCFhXHQNidfwjiGg+PLME0SkTI0UwgFBN1pgpMWtWucF
 XwjWhzgP8Vg9/kbsLWt9AITzmGP094cX+DQ2vPicumnY3+L85h+Dq1o6L
 PLEh2/MpXNfdO68Ldsb9tpkSUK2T2fYqFC6zRL/igABILFFwbrOzoXwQx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363810936"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363810936"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925631336"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925631336"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:13 +0100
Message-ID: <20231005153116.452319-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 09/12] lib/intel_buf: support pat_index
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

Some users need to able select their own pat_index. Some display tests
use igt_draw which in turn uses intel_batchbuffer and intel_buf.  We
also have a couple more display tests directly using these interfaces
directly. Idea is to select wt/uc for anything display related, but also
allow any test to select a pat_index for a given intel_buf.

Signted-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 lib/igt_draw.c            |  7 +++++-
 lib/igt_fb.c              |  3 ++-
 lib/intel_allocator.c     |  1 +
 lib/intel_allocator.h     |  1 +
 lib/intel_batchbuffer.c   | 51 ++++++++++++++++++++++++++++++---------
 lib/intel_bufops.c        | 29 +++++++++++++++-------
 lib/intel_bufops.h        |  9 +++++--
 tests/intel/kms_big_fb.c  |  4 ++-
 tests/intel/kms_dirtyfb.c |  7 ++++--
 tests/intel/kms_psr.c     |  4 ++-
 tests/intel/xe_intel_bb.c |  3 ++-
 11 files changed, 89 insertions(+), 30 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 2332bf94a..8db71ce5e 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -31,6 +31,7 @@
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
 #include "intel_mocs.h"
+#include "intel_pat.h"
 #include "igt_core.h"
 #include "igt_fb.h"
 #include "ioctl_wrappers.h"
@@ -75,6 +76,7 @@ struct buf_data {
 	uint32_t size;
 	uint32_t stride;
 	int bpp;
+	uint8_t pat_index;
 };
 
 struct rect {
@@ -658,7 +660,8 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
 				    width, height, from->bpp, 0,
 				    tiling, 0,
 				    size, 0,
-				    region);
+				    region,
+				    from->pat_index);
 
 	/* Make sure we close handle on destroy path */
 	intel_buf_set_ownership(buf, true);
@@ -785,6 +788,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	igt_skip_on(!rendercopy);
 
 	/* We create a temporary buffer and copy from it using rendercopy. */
+	tmp.pat_index = buf->pat_index;
 	tmp.size = rect->w * rect->h * pixel_size;
 	if (is_i915_device(fd))
 		tmp.handle = gem_create(fd, tmp.size);
@@ -852,6 +856,7 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		.size = buf_size,
 		.stride = buf_stride,
 		.bpp = bpp,
+		.pat_index = intel_get_pat_idx_wt(fd),
 	};
 	struct rect rect = {
 		.x = rect_x,
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d290fd775..61384c553 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2637,7 +2637,8 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 				    igt_fb_mod_to_tiling(fb->modifier),
 				    compression, fb->size,
 				    fb->strides[0],
-				    region);
+				    region,
+				    intel_get_pat_idx_wt(fd));
 	intel_buf_set_name(buf, name);
 
 	/* Make sure we close handle on destroy path */
diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index da357b833..b3e5c0226 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -1449,6 +1449,7 @@ bool intel_allocator_is_reserved(uint64_t allocator_handle,
 bool intel_allocator_reserve_if_not_allocated(uint64_t allocator_handle,
 					      uint32_t handle,
 					      uint64_t size, uint64_t offset,
+					      uint8_t pat_index,
 					      bool *is_allocatedp)
 {
 	struct alloc_req req = { .request_type = REQ_RESERVE_IF_NOT_ALLOCATED,
diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index 5da8af7f9..d93c5828d 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -206,6 +206,7 @@ bool intel_allocator_is_reserved(uint64_t allocator_handle,
 bool intel_allocator_reserve_if_not_allocated(uint64_t allocator_handle,
 					      uint32_t handle,
 					      uint64_t size, uint64_t offset,
+					      uint8_t pat_index,
 					      bool *is_allocatedp);
 
 void intel_allocator_print(uint64_t allocator_handle);
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index e7b1b755f..eaaf667ea 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -38,6 +38,7 @@
 #include "intel_batchbuffer.h"
 #include "intel_bufops.h"
 #include "intel_chipset.h"
+#include "intel_pat.h"
 #include "media_fill.h"
 #include "media_spin.h"
 #include "sw_sync.h"
@@ -825,15 +826,18 @@ static void __reallocate_objects(struct intel_bb *ibb)
 static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
 					     uint32_t handle,
 					     uint64_t size,
-					     uint32_t alignment)
+					     uint32_t alignment,
+					     uint8_t pat_index)
 {
 	uint64_t offset;
 
 	if (ibb->enforce_relocs)
 		return 0;
 
-	offset = intel_allocator_alloc(ibb->allocator_handle,
-				       handle, size, alignment);
+	offset = __intel_allocator_alloc(ibb->allocator_handle, handle,
+					 size, alignment, pat_index,
+					 ALLOC_STRATEGY_NONE);
+	igt_assert(offset != ALLOC_INVALID_ADDRESS);
 
 	return offset;
 }
@@ -1300,11 +1304,14 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 		ops->op = op;
 		ops->obj_offset = 0;
 		ops->addr = objects[i]->offset;
-		ops->range = objects[i]->rsvd1;
+		ops->range = objects[i]->rsvd1 & ~(4096-1);
 		ops->region = region;
+		if (set_obj)
+			ops->pat_index = objects[i]->rsvd1 & (4096-1);
 
-		igt_debug("  [%d]: handle: %u, offset: %llx, size: %llx\n",
-			  i, ops->obj, (long long)ops->addr, (long long)ops->range);
+		igt_debug("  [%d]: handle: %u, offset: %llx, size: %llx pat_index: %u\n",
+			  i, ops->obj, (long long)ops->addr, (long long)ops->range,
+			  ops->pat_index);
 	}
 
 	return bind_ops;
@@ -1409,7 +1416,8 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
 		ibb->batch_offset = __intel_bb_get_offset(ibb,
 							  ibb->handle,
 							  ibb->size,
-							  ibb->alignment);
+							  ibb->alignment,
+							  DEFAULT_PAT_INDEX);
 
 	intel_bb_add_object(ibb, ibb->handle, ibb->size,
 			    ibb->batch_offset,
@@ -1645,7 +1653,8 @@ static void __remove_from_objects(struct intel_bb *ibb,
  */
 static struct drm_i915_gem_exec_object2 *
 __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
-		      uint64_t offset, uint64_t alignment, bool write)
+		      uint64_t offset, uint64_t alignment, uint8_t pat_index,
+		      bool write)
 {
 	struct drm_i915_gem_exec_object2 *object;
 
@@ -1661,6 +1670,9 @@ __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	object = __add_to_cache(ibb, handle);
 	__add_to_objects(ibb, object);
 
+	if (pat_index == DEFAULT_PAT_INDEX)
+		pat_index = intel_get_pat_idx_wb(ibb->fd);
+
 	/*
 	 * If object->offset == INVALID_ADDRESS we added freshly object to the
 	 * cache. In that case we have two choices:
@@ -1670,7 +1682,7 @@ __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	if (INVALID_ADDR(object->offset)) {
 		if (INVALID_ADDR(offset)) {
 			offset = __intel_bb_get_offset(ibb, handle, size,
-						       alignment);
+						       alignment, pat_index);
 		} else {
 			offset = offset & (ibb->gtt_size - 1);
 
@@ -1683,6 +1695,7 @@ __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 
 				reserved = intel_allocator_reserve_if_not_allocated(ibb->allocator_handle,
 										    handle, size, offset,
+										    pat_index,
 										    &allocated);
 				igt_assert_f(allocated || reserved,
 					     "Can't get offset, allocated: %d, reserved: %d\n",
@@ -1721,6 +1734,18 @@ __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	if (ibb->driver == INTEL_DRIVER_XE) {
 		object->alignment = alignment;
 		object->rsvd1 = size;
+		igt_assert(!(size & (4096-1)));
+
+		if (pat_index == DEFAULT_PAT_INDEX)
+			pat_index = intel_get_pat_idx_wb(ibb->fd);
+
+		/*
+		 * XXX: For now encode the pat_index in the first few bits of
+		 * rsvd1. intel_batchbuffer should really stop using the i915
+		 * drm_i915_gem_exec_object2 to encode VMA placement
+		 * information on xe...
+		 */
+		object->rsvd1 |= pat_index;
 	}
 
 	return object;
@@ -1733,7 +1758,7 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	struct drm_i915_gem_exec_object2 *obj = NULL;
 
 	obj = __intel_bb_add_object(ibb, handle, size, offset,
-				    alignment, write);
+				    alignment, DEFAULT_PAT_INDEX, write);
 	igt_assert(obj);
 
 	return obj;
@@ -1795,8 +1820,10 @@ __intel_bb_add_intel_buf(struct intel_bb *ibb, struct intel_buf *buf,
 		}
 	}
 
-	obj = intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
-				  buf->addr.offset, alignment, write);
+	obj = __intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
+				    buf->addr.offset, alignment, buf->pat_index,
+				    write);
+	igt_assert(obj);
 	buf->addr.offset = obj->offset;
 
 	if (igt_list_empty(&buf->link)) {
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 2c91adb88..fbee4748e 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -29,6 +29,7 @@
 #include "igt.h"
 #include "igt_x86.h"
 #include "intel_bufops.h"
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -818,7 +819,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 			     int width, int height, int bpp, int alignment,
 			     uint32_t req_tiling, uint32_t compression,
 			     uint64_t bo_size, int bo_stride,
-			     uint64_t region)
+			     uint64_t region, uint8_t pat_index)
 {
 	uint32_t tiling = req_tiling;
 	uint64_t size;
@@ -839,6 +840,10 @@ static void __intel_buf_init(struct buf_ops *bops,
 	IGT_INIT_LIST_HEAD(&buf->link);
 	buf->mocs = INTEL_BUF_MOCS_DEFAULT;
 
+	if (pat_index == DEFAULT_PAT_INDEX)
+		pat_index = intel_get_pat_idx_wb(bops->fd);
+	buf->pat_index = pat_index;
+
 	if (compression) {
 		igt_require(bops->intel_gen >= 9);
 		igt_assert(req_tiling == I915_TILING_Y ||
@@ -957,7 +962,7 @@ void intel_buf_init(struct buf_ops *bops,
 	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
 						     system_memory(bops->fd);
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
-			 tiling, compression, 0, 0, region);
+			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX);
 
 	intel_buf_set_ownership(buf, true);
 }
@@ -974,7 +979,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 			      uint64_t region)
 {
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
-			 tiling, compression, 0, 0, region);
+			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX);
 
 	intel_buf_set_ownership(buf, true);
 }
@@ -1033,7 +1038,7 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
 				 uint32_t req_tiling, uint32_t compression)
 {
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
-			 req_tiling, compression, 0, 0, -1);
+			 req_tiling, compression, 0, 0, -1, DEFAULT_PAT_INDEX);
 }
 
 /**
@@ -1050,6 +1055,7 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
  * @size: real bo size
  * @stride: bo stride
  * @region: region
+ * @pat_index: pat_index to use for the binding (only used on xe)
  *
  * Function configures BO handle within intel_buf structure passed by the caller
  * (with all its metadata - width, height, ...). Useful if BO was created
@@ -1067,10 +1073,12 @@ void intel_buf_init_full(struct buf_ops *bops,
 			 uint32_t compression,
 			 uint64_t size,
 			 int stride,
-			 uint64_t region)
+			 uint64_t region,
+			 uint8_t pat_index)
 {
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
-			 req_tiling, compression, size, stride, region);
+			 req_tiling, compression, size, stride, region,
+			 pat_index);
 }
 
 /**
@@ -1149,7 +1157,8 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 							 int stride)
 {
 	return intel_buf_create_full(bops, handle, width, height, bpp, alignment,
-				     req_tiling, compression, size, stride, -1);
+				     req_tiling, compression, size, stride, -1,
+				     DEFAULT_PAT_INDEX);
 }
 
 struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
@@ -1160,7 +1169,8 @@ struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
 					uint32_t compression,
 					uint64_t size,
 					int stride,
-					uint64_t region)
+					uint64_t region,
+					uint8_t pat_index)
 {
 	struct intel_buf *buf;
 
@@ -1170,7 +1180,8 @@ struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
 	igt_assert(buf);
 
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
-			 req_tiling, compression, size, stride, region);
+			 req_tiling, compression, size, stride, region,
+			 pat_index);
 
 	return buf;
 }
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 4dfe4681c..b6048402b 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -63,6 +63,9 @@ struct intel_buf {
 	/* Content Protection*/
 	bool is_protected;
 
+	/* pat_index to use for mapping this buf. Only used in Xe. */
+	uint8_t pat_index;
+
 	/* For debugging purposes */
 	char name[INTEL_BUF_NAME_MAXSIZE + 1];
 };
@@ -161,7 +164,8 @@ void intel_buf_init_full(struct buf_ops *bops,
 			 uint32_t compression,
 			 uint64_t size,
 			 int stride,
-			 uint64_t region);
+			 uint64_t region,
+			 uint8_t pat_index);
 
 struct intel_buf *intel_buf_create(struct buf_ops *bops,
 				   int width, int height,
@@ -192,7 +196,8 @@ struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
 					uint32_t compression,
 					uint64_t size,
 					int stride,
-					uint64_t region);
+					uint64_t region,
+					uint8_t pat_index);
 void intel_buf_destroy(struct intel_buf *buf);
 
 static inline void intel_buf_set_pxp(struct intel_buf *buf, bool new_pxp_state)
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 611e60896..854a77992 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -34,6 +34,7 @@
 #include <string.h>
 
 #include "i915/gem_create.h"
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -88,7 +89,8 @@ static struct intel_buf *init_buf(data_t *data,
 	handle = gem_open(data->drm_fd, name);
 	buf = intel_buf_create_full(data->bops, handle, width, height,
 				    bpp, 0, tiling, 0, size, 0,
-				    region);
+				    region,
+				    intel_get_pat_idx_wt(data->drm_fd));
 
 	intel_buf_set_name(buf, buf_name);
 	intel_buf_set_ownership(buf, true);
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index cc9529178..ec9b2a137 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -10,6 +10,7 @@
 
 #include "i915/intel_drrs.h"
 #include "i915/intel_fbc.h"
+#include "intel_pat.h"
 
 #include "xe/xe_query.h"
 
@@ -246,14 +247,16 @@ static void run_test(data_t *data)
 				    0,
 				    igt_fb_mod_to_tiling(data->fbs[1].modifier),
 				    0, 0, 0, is_xe_device(data->drm_fd) ?
-				    system_memory(data->drm_fd) : 0);
+				    system_memory(data->drm_fd) : 0,
+				    intel_get_pat_idx_wt(data->drm_fd));
 	dst = intel_buf_create_full(data->bops, data->fbs[2].gem_handle,
 				    data->fbs[2].width,
 				    data->fbs[2].height,
 				    igt_drm_format_to_bpp(data->fbs[2].drm_format),
 				    0, igt_fb_mod_to_tiling(data->fbs[2].modifier),
 				    0, 0, 0, is_xe_device(data->drm_fd) ?
-				    system_memory(data->drm_fd) : 0);
+				    system_memory(data->drm_fd) : 0,
+				    intel_get_pat_idx_wt(data->drm_fd));
 	ibb = intel_bb_create(data->drm_fd, PAGE_SIZE);
 
 	spin = igt_spin_new(data->drm_fd, .ahnd = ibb->allocator_handle);
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index ffecc5222..9c6ecd829 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -31,6 +31,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
+#include "intel_pat.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -356,7 +357,8 @@ static struct intel_buf *create_buf_from_fb(data_t *data,
 	name = gem_flink(data->drm_fd, fb->gem_handle);
 	handle = gem_open(data->drm_fd, name);
 	buf = intel_buf_create_full(data->bops, handle, width, height,
-				    bpp, 0, tiling, 0, size, stride, region);
+				    bpp, 0, tiling, 0, size, stride, region,
+				    intel_get_pat_idx_wt(data->drm_fd));
 	intel_buf_set_ownership(buf, true);
 
 	return buf;
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 0159a3164..e2480acf8 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -19,6 +19,7 @@
 #include "igt.h"
 #include "igt_crc.h"
 #include "intel_bufops.h"
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -400,7 +401,7 @@ static void create_in_region(struct buf_ops *bops, uint64_t region)
 	intel_buf_init_full(bops, handle, &buf,
 			    width/4, height, 32, 0,
 			    I915_TILING_NONE, 0,
-			    size, 0, region);
+			    size, 0, region, DEFAULT_PAT_INDEX);
 	intel_buf_set_ownership(&buf, true);
 
 	intel_bb_add_intel_buf(ibb, &buf, false);
-- 
2.41.0

