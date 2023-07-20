Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F3AEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 21:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A760310E1B4;
	Thu, 20 Jul 2023 21:44:43 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B41810E19F
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 21:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689889479; x=1721425479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=STzbiDJvG9HvfVFJ+nPj0qh+c1d4MRPa5exkP9x16FE=;
 b=h+nObxGd1pNlTcZPNdSNYnrIKZ+1lxpWCItljLvnUEjwQ63Tp5Fsfved
 efh4pjo5wGalcirKyPr+mmqleZuD9AG2dGT47xKSVQAnR8wKua3PNZ7ZX
 yV7oaGzBKBO6n0y2xmfc5vhBX/w49mjAPEjvtw7Gm95vhbroRV7iEGrnW
 dzqhq1BTLyDqlOwHPTxcb++V9T2PgvJRwaIQE4VUW+LXoxvLqEZyLkezU
 +IDGvhzs6Hde4RTvLG92xZNwKVW1Y9x2eEDpiX0fDnTkBOZxkVN7Ap9nf
 NP1x5KfwlGrIejrLru8GQg1ZZDZ+vdPWPa8pqzyTGTJ4e+NPQRt3rVjCW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433093177"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="433093177"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814693485"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="814693485"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:43:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 20 Jul 2023 14:43:43 -0700
Message-Id: <20230720214345.203464-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720214345.203464-1-matthew.brost@intel.com>
References: <20230720214345.203464-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/7] drm/xe: Change tile masks from u64 to u8
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This will save us a few bytes in the xe_vma structure.

v2: Use hweight8 rather than hweight_long (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 12 ++++++------
 drivers/gpu/drm/xe/xe_vm_types.h | 28 ++++++++++++++--------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 52278ec2ade1..25ecc196ce57 100644
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
@@ -1582,7 +1582,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
-	int number_tiles = hweight_long(vma->tile_present);
+	int number_tiles = hweight8(vma->tile_present);
 	int err;
 	u8 id;
 
@@ -1657,7 +1657,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
-	int number_tiles = hweight_long(vma->tile_mask);
+	int number_tiles = hweight8(vma->tile_mask);
 	int err;
 	u8 id;
 
@@ -2253,7 +2253,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u64 tile_mask, u32 region)
+			 u32 operation, u8 tile_mask, u32 region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct ww_acquire_ctx ww;
@@ -2350,7 +2350,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u64 tile_mask, bool read_only, bool is_null)
+			      u8 tile_mask, bool read_only, bool is_null)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -3335,7 +3335,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
 		u64 obj_offset = bind_ops[i].obj_offset;
-		u64 tile_mask = bind_ops[i].tile_mask;
+		u8 tile_mask = bind_ops[i].tile_mask;
 		u32 region = bind_ops[i].region;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 20dd830dae79..93004b1901e2 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -38,18 +38,6 @@ struct xe_vma {
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
@@ -107,9 +95,21 @@ struct xe_vma {
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
@@ -402,7 +402,7 @@ struct xe_vma_op {
 	 */
 	struct async_op_fence *fence;
 	/** @tile_mask: gt mask for this operation */
-	u64 tile_mask;
+	u8 tile_mask;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
 
-- 
2.34.1

