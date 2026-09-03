Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE89C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607CD10F687;
	Thu,  3 Sep 2026 15:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHvgcqTs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F4F10F684
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447726; x=1819983726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7he5Z1N3NENcTMZgfTLqInvkmQXoW7hoh9wPuRZW5Gk=;
 b=AHvgcqTsZsX2VKB4IgrogDZ1XUk22IUJ5Fc34VegnA7lOW56hfm3XDJR
 c2IAriuVQ4Z9sJht/Y5acbC4Fvi9uXIX/F9k1NIGLXLbbj09HB/sJYjua
 JLS+2cq4v9ANy6QYZ0xDLNQdzqsTBJq274tBEh2dvGLpxdUV6VcexXviQ
 veeKxUoKnwL+ack70A+rireUKvNwDtY2Nuv6UOiK2B8w2ri2P1avNK+zX
 dc52ZRtent8im1wPo3w0JNh+B0Oc4WOLwrHBwQVlUH8ehjF/l12fFoNM3
 32hZ90RZ+31ayfMyCF7vrk+KIfEqjVxLdNccIsuUtWpgveNBLnTtrHmOv w==;
X-CSE-ConnectionGUID: L5ebEdMxQe6KeI0w2NLcBg==
X-CSE-MsgGUID: wm8xfvHJTOqNTa9Z1hIVuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91443552"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="91443552"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:02:06 -0700
X-CSE-ConnectionGUID: OGztvH/DTbGLViSX450vWw==
X-CSE-MsgGUID: ssqUAXHTQge2OqOqin2/OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441608"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:55 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 25/27] drm/xe: export prep_vma_destroy as
 xe_vm_prep_vma_destroy
Date: Thu,  3 Sep 2026 17:59:49 +0300
Message-ID: <20260903145952.848051-26-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

From: Maciej Patelczyk <maciej.patelczyk@intel.com>

Rename and export helper function for wider usage.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 27 ++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h |  2 ++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 83cc94aabe59..cfe4b6f97dd0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2447,8 +2447,17 @@ static const u32 region_to_mem_type[] = {
 	XE_PL_VRAM1,
 };
 
-static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
-			     bool post_commit)
+/**
+ * xe_vm_prep_vma_destroy - Prepare vma to be destroyed.
+ * @vm : the vm vma belongs to
+ * @vma: vma to be removed
+ * @post_commit: if to remove vma from gpuvm tree
+ *
+ * Marks vma as destroyed and if post_commit is true
+ * also removes it from gpuvm tree.
+ */
+void xe_vm_prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
+			    bool post_commit)
 {
 	xe_svm_notifier_lock(vm);
 	vma->gpuva.flags |= XE_VMA_DESTROYED;
@@ -2803,7 +2812,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			if (!bo->vm) {
 				err = add_preempt_fences(vm, bo);
 				if (err) {
-					prep_vma_destroy(vm, vma, false);
+					xe_vm_prep_vma_destroy(vm, vma, false);
 					xe_vma_destroy(vma, NULL);
 				}
 			}
@@ -2830,7 +2839,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 		}
 	}
 	if (err) {
-		prep_vma_destroy(vm, vma, false);
+		xe_vm_prep_vma_destroy(vm, vma, false);
 		xe_vma_destroy_unlocked(vma);
 		vma = ERR_PTR(err);
 	}
@@ -2891,7 +2900,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 
 		xe_vm_assert_write_mode_or_garbage_collector(vm);
 
-		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
+		xe_vm_prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
 				 true);
 		op->flags |= XE_VMA_OP_COMMITTED;
 
@@ -2927,7 +2936,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	case DRM_GPUVA_OP_UNMAP:
 		xe_vm_assert_write_mode_or_garbage_collector(vm);
 
-		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
+		xe_vm_prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
 		op->flags |= XE_VMA_OP_COMMITTED;
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
@@ -3168,7 +3177,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 		xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 		if (op->map.vma) {
-			prep_vma_destroy(vm, op->map.vma, post_commit);
+			xe_vm_prep_vma_destroy(vm, op->map.vma, post_commit);
 			xe_vma_destroy_unlocked(op->map.vma);
 		}
 		break;
@@ -3194,11 +3203,11 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 		xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 		if (op->remap.prev) {
-			prep_vma_destroy(vm, op->remap.prev, prev_post_commit);
+			xe_vm_prep_vma_destroy(vm, op->remap.prev, prev_post_commit);
 			xe_vma_destroy_unlocked(op->remap.prev);
 		}
 		if (op->remap.next) {
-			prep_vma_destroy(vm, op->remap.next, next_post_commit);
+			xe_vm_prep_vma_destroy(vm, op->remap.next, next_post_commit);
 			xe_vma_destroy_unlocked(op->remap.next);
 		}
 		if (vma) {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 5dc15b6bbcdd..bb1c37e9a608 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -442,6 +442,8 @@ void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *fr
 
 int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma);
 struct xe_vma *xe_vm_create_null_vma(struct xe_vm *vm, u64 addr);
+void xe_vm_prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
+			    bool post_commit);
 void xe_vm_destroy_vma(struct xe_vma *vma);
 void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence);
 
-- 
2.53.0

