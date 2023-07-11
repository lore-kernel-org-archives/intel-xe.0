Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12A8C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 21:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F8E10E445;
	Tue, 11 Jul 2023 21:27:39 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDA710E432
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 21:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689110855; x=1720646855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0qymcLAIhSyqOcPkM3+pANxfoG0p5XZ+j6+zV3JUCl0=;
 b=dxROy0+efrCW5fd7Yzz/cfRLikGpCgBsq44QTAe0LO0IZ/GwGDm7Qgve
 oL768/TV3YuXFKADD+9GYxeBmzMbfo21XVxg9ThI8x4H3uMceK8lWAp3d
 Sv/17xNxC+A23JcI4rKc7JlLN4HeZAcTQ+HiYHiGE5mg6K6HYWV2F5W1+
 +Lr5UEJQsoZgDlhpgeUMCqXOuQsWAK2BAO6bxHI8p0SqYH0Rrzn2VSobd
 FKwiFzk9FDuW4Ojxcwj1WybSDXyAj8tQmfYa2JD5TJ7pxDZocawVY70VP
 6Tl+XO66hq7P/1Im0651NBQBImXZ7yPQmsfcdX8KZmUCRUtv/OPBzt0rV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="451102347"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="451102347"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 14:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="786782152"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="786782152"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 14:27:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 11 Jul 2023 14:27:46 -0700
Message-Id: <20230711212748.2029455-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711212748.2029455-1-matthew.brost@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/5] drm/xe: Change tile masks from u64 to u8
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       |  8 ++++----
 drivers/gpu/drm/xe/xe_vm_types.h | 28 ++++++++++++++--------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b2847be6de6a..762aefa75ed4 100644
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
@@ -2246,7 +2246,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u64 tile_mask, u32 region)
+			 u32 operation, u8 tile_mask, u32 region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct ww_acquire_ctx ww;
@@ -2343,7 +2343,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u64 tile_mask, bool read_only, bool is_null)
+			      u8 tile_mask, bool read_only, bool is_null)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -3323,7 +3323,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
 		u64 obj_offset = bind_ops[i].obj_offset;
-		u64 tile_mask = bind_ops[i].tile_mask;
+		u8 tile_mask = bind_ops[i].tile_mask;
 		u32 region = bind_ops[i].region;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 84bf1620214c..2a8691a48c55 100644
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
 		/** @userptr: link into VM repin list if userptr */
@@ -97,9 +85,21 @@ struct xe_vma {
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
@@ -386,7 +386,7 @@ struct xe_vma_op {
 	 */
 	struct async_op_fence *fence;
 	/** @tile_mask: gt mask for this operation */
-	u64 tile_mask;
+	u8 tile_mask;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
 
-- 
2.34.1

