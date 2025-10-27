Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA347CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E5610E19A;
	Mon, 27 Oct 2025 21:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVPn1uVp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0133B10E55D
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601377; x=1793137377;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=moootHlUXPf8f6xXh+EJkn3K4X2eIaDha1FmoFo5hAg=;
 b=YVPn1uVpM9tiy3cuozte7oXx4GRdlziQ0075uSGPKC27sm62hvOnKRzL
 StGMB9WVAE6tduJK605akUC2/8Q1Zd3L5vQcldcDnk7UOQSF1uUnCX8gj
 mjJpgb+09U/QJcVCyASJWqUsDEd5C3gqtkdL62NB8U4/XbXnDyLcp8/1X
 SZyploNPIFwnD+0aZfBFAIOu73UvaXyd1ffmsM4Z39nUS6ETESOiJrgF7
 ikuf0QQeIlFzSfeapYxLkrYa/dT0fxE3imDngVq9/wmf4ximc6SQhHllM
 aa9zzkq2Jr07uLiTryaTS709N6rnIHn5WnG7nGYInN3QyAJsNd39CaGri Q==;
X-CSE-ConnectionGUID: 9M/2WnoZQe6OblxZ/Rz59w==
X-CSE-MsgGUID: tjaEGxZyRo6lwvtT37wRWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74368845"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74368845"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:57 -0700
X-CSE-ConnectionGUID: daEz6ZoJRo2W2r+3lz5ndw==
X-CSE-MsgGUID: SxlbGin5SMeFFOhXM1OQyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184782345"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 3/8] drm/xe: Do not wait on TLB invalidations in page fault binds
Date: Mon, 27 Oct 2025 14:42:47 -0700
Message-Id: <20251027214252.2455093-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027214252.2455093-1-matthew.brost@intel.com>
References: <20251027214252.2455093-1-matthew.brost@intel.com>
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

The migrate queue is shared by all processes using a device, thus is
possible while servicing a page fault another process uses the migrate
queue resulting in a TLB invalidation. In case of page fault binds, this
TLB invalidation has nothing to do with the current bind so there is not
need to wait on it. Teach the bind pipeline to be able to skip waits on
TLB invalidations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 14 ++++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2f181c44b8b7..df0a44d9eb46 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -755,6 +755,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT;
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
@@ -845,6 +846,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT;
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
@@ -3111,8 +3113,13 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	if (number_tiles == 0)
 		return ERR_PTR(-ENODATA);
 
-	for_each_tile(tile, vm->xe, id)
-		n_fence += (1 + XE_MAX_GT_PER_TILE);
+	if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT) {
+		for_each_tile(tile, vm->xe, id)
+			++n_fence;
+	} else {
+		for_each_tile(tile, vm->xe, id)
+			n_fence += (1 + XE_MAX_GT_PER_TILE);
+	}
 
 	fences = kmalloc_array(n_fence, sizeof(*fences), GFP_KERNEL);
 	if (!fences) {
@@ -3153,6 +3160,9 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 
 collect_fences:
 		fences[current_fence++] = fence ?: dma_fence_get_stub();
+		if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT)
+			continue;
+
 		xe_migrate_job_lock(tile->migrate, q);
 		for_each_tlb_inval(i)
 			fences[current_fence++] =
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 542dbe2f9310..3766dc37b3ad 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -466,6 +466,7 @@ struct xe_vma_ops {
 #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
 #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
 #define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
+#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

