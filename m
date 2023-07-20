Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697D8EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 04:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCA310E556;
	Thu, 20 Jul 2023 04:21:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6C610E552
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 04:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689826881; x=1721362881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oURzrUZdYs8nvbLb8sra9/0bMP7bwJZwDIk7MdUN3bA=;
 b=h7L26sGrCoxhIJ5c/YNE7JkxuvRMmFKRcUtb+d+p65/7UQUrkw78Fkla
 XSCHPu4K5vMN18WTgNq1xeAqVKOEWujH0JDaFztBBxMTzj5JKy5M4vo7k
 mJumWuzWyy8+M6m6UuZrpqwHzUqJ3GnH3jo/xcwAV6j2PMIyyQzViGsmA
 uKKyfCXTBdrTz9+0TC5uksEXqgXN+1HWMovvLPxunUEWVDMk5DpeHIm7e
 MbNhwYF2vdpckE2oQj6guSL5+hhz4f+LwDWJRw1YC8Hpnl7irUTiaRYx1
 vuvnf+Rik/X3g8PCGUQ4KhJnzDzlgVOkEpxyH7SsE4oc7r7aD20kXi6NB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366661715"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366661715"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="724245051"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="724245051"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:21:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 21:21:13 -0700
Message-Id: <20230720042115.119494-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720042115.119494-1-matthew.brost@intel.com>
References: <20230720042115.119494-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 5/7] drm/xe: Change tile masks from u64 to u8
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

This will save us a few bytes in the xe_vma structure.

v2: Use hweight8 rather than hweight_long (Rodrigo)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 12 ++++++------
 drivers/gpu/drm/xe/xe_vm_types.h | 28 ++++++++++++++--------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1ed3bc2541f2..92d97d347a44 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -871,7 +871,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 start, u64 end,
 				    bool read_only,
 				    bool is_null,
-				    u64 tile_mask)
+				    u8 tile_mask)
 {
 	struct xe_vma *vma;
 	struct xe_tile *tile;
@@ -1574,7 +1574,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
-	int number_tiles = hweight_long(vma->tile_present);
+	int number_tiles = hweight8(vma->tile_present);
 	int err;
 	u8 id;
 
@@ -1649,7 +1649,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
-	int number_tiles = hweight_long(vma->tile_mask);
+	int number_tiles = hweight8(vma->tile_mask);
 	int err;
 	u8 id;
 
@@ -2245,7 +2245,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u64 tile_mask, u32 region)
+			 u32 operation, u8 tile_mask, u32 region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct ww_acquire_ctx ww;
@@ -2342,7 +2342,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u64 tile_mask, bool read_only, bool is_null)
+			      u8 tile_mask, bool read_only, bool is_null)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -3327,7 +3327,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
 		u64 obj_offset = bind_ops[i].obj_offset;
-		u64 tile_mask = bind_ops[i].tile_mask;
+		u8 tile_mask = bind_ops[i].tile_mask;
 		u32 region = bind_ops[i].region;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index f1f3b619d996..268d2475f2ae 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -37,18 +37,6 @@ struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
 
-	/** @tile_mask: Tile mask of where to create binding for this VMA */
-	u64 tile_mask;
-
-	/**
-	 * @tile_present: GT mask of binding are present for this VMA.
-	 * protected by vm->lock, vm->resv and for userptrs,
-	 * vm->userptr.notifier_lock for writing. Needs either for reading,
-	 * but if reading is done under the vm->lock only, it needs to be held
-	 * in write mode.
-	 */
-	u64 tile_present;
-
 	/** @combined_links: links into lists which are mutually exclusive */
 	union {
 		/**
@@ -106,9 +94,21 @@ struct xe_vma {
 	/** @usm: unified shared memory state */
 	struct {
 		/** @tile_invalidated: VMA has been invalidated */
-		u64 tile_invalidated;
+		u8 tile_invalidated;
 	} usm;
 
+	/** @tile_mask: Tile mask of where to create binding for this VMA */
+	u8 tile_mask;
+
+	/**
+	 * @tile_present: GT mask of binding are present for this VMA.
+	 * protected by vm->lock, vm->resv and for userptrs,
+	 * vm->userptr.notifier_lock for writing. Needs either for reading,
+	 * but if reading is done under the vm->lock only, it needs to be held
+	 * in write mode.
+	 */
+	u8 tile_present;
+
 	struct {
 		struct list_head rebind_link;
 	} notifier;
@@ -395,7 +395,7 @@ struct xe_vma_op {
 	 */
 	struct async_op_fence *fence;
 	/** @tile_mask: gt mask for this operation */
-	u64 tile_mask;
+	u8 tile_mask;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
 
-- 
2.34.1

