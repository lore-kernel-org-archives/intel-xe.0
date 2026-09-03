Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C974FC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB5710F685;
	Thu,  3 Sep 2026 15:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W//WyIk6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F356C10F686
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447716; x=1819983716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PQf6/ngTROlc66llhHdxnnqZrn8QB7hLtOJQ5ev3zHY=;
 b=W//WyIk6TWiwtmgqYw/x54yAgevwb0f+pVDfWgSURveI+Bp0RZOcNmlr
 AUczuba4Y+cra5JsxmzUiDSR/0V8mfUEIe0uvopAuQIgswHJ3kuWlVylC
 692jHUXSYA1KXpS4Pj5/LsS6Kcq4In7eRyw/F2BTBOaWLMt0cpfZzCgBM
 yY1HYPAv8eTPUWnIudWVkqo7bp6DA5X36aHlnnHOnnsM4l86DHquduDAg
 p3TgM2mf2lpTlMxshT3CFXkoJS2bmYx/Rq1Ih3nAgRydNFco9zKD54WIM
 JPQt05Qb27mOiUsQdXnX/8DcARBPFjfcsQhClvIhoU+SxK4HEXkEa6ldD A==;
X-CSE-ConnectionGUID: xgnQkeaLSRiJC4dmcsRRFw==
X-CSE-MsgGUID: su5m/ya1RbqvJ3zqcpY1zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486938"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486938"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:56 -0700
X-CSE-ConnectionGUID: H/XJJBi1ThmAzAcaPuHVGw==
X-CSE-MsgGUID: BQe7X35kTjSZfWdoBROdXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441504"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:51 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 24/27] drm/xe: Support for xe_vma_unbind()
Date: Thu,  3 Sep 2026 17:59:48 +0300
Message-ID: <20260903145952.848051-25-mika.kuoppala@linux.intel.com>
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

Introduced a API to single VMA unbind from VM.
New function xe_vma_unbind() added.

Assisted-by: GitHub Copilot CLI:claude-opus-4.7
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 84 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |  3 ++
 2 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 73490a10bdc0..83cc94aabe59 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1066,6 +1066,90 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	return fence;
 }
 
+static void xe_vm_populate_unbind(struct xe_vma_op *op,
+				  struct xe_vma *vma,
+				  u8 tile_mask)
+{
+	INIT_LIST_HEAD(&op->link);
+	op->tile_mask = tile_mask;
+	op->base.op = DRM_GPUVA_OP_UNMAP;
+	op->base.unmap.va = &vma->gpuva;
+	op->base.unmap.keep = false;
+}
+
+static int xe_vm_ops_add_unbind(struct xe_vma_ops *vops,
+				  struct xe_vma *vma,
+				  u8 tile_mask)
+{
+	struct xe_vma_op *op;
+
+	op = kzalloc_obj(*op);
+	if (!op)
+		return -ENOMEM;
+
+	xe_vm_populate_unbind(op, vma, tile_mask);
+	list_add_tail(&op->link, &vops->list);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
+
+	return 0;
+}
+
+/**
+ * xe_vma_unbind() - Unbind a vma from GPU page tables.
+ * @vm: The VM which the vma belongs to.
+ * @vma: The vma to be unbinded.
+ * @tile_mask: tiles for unbind.
+ *
+ * Return: dma fence for unbind to signal completion on success, ERR_PTR on
+ * failure
+ */
+
+struct dma_fence *xe_vma_unbind(struct xe_vm *vm, struct xe_vma *vma,
+				u8 tile_mask)
+{
+	struct dma_fence *fence = NULL;
+	struct xe_vma_ops vops;
+	struct xe_vma_op *op, *next_op;
+	struct xe_tile *tile;
+	u8 id;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_held(vm);
+	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
+
+	if (!vma->tile_present)
+		return dma_fence_get_stub();
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[tile->id].q =
+			xe_migrate_exec_queue(tile->migrate);
+	}
+
+	err = xe_vm_ops_add_unbind(&vops, vma, tile_mask);
+	if (err)
+		return ERR_PTR(err);
+
+	err = xe_vma_ops_alloc(&vops, false);
+	if (err) {
+		fence = ERR_PTR(err);
+		goto free_ops;
+	}
+
+	fence = ops_execute(vm, &vops);
+
+free_ops:
+	list_for_each_entry_safe(op, next_op, &vops.list, link) {
+		list_del(&op->link);
+		kfree(op);
+	}
+	xe_vma_ops_fini(&vops);
+
+	return fence;
+}
+
 static void xe_vma_mem_attr_fini(struct xe_vma_mem_attr *attr)
 {
 	drm_pagemap_put(attr->preferred_loc.dpagemap);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6ff14fbce7a6..5dc15b6bbcdd 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -249,6 +249,9 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 				     u8 tile_mask);
 struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 				     struct xe_svm_range *range);
+struct dma_fence *xe_vma_unbind(struct xe_vm *vm,
+				struct xe_vma *vma,
+				u8 tile_mask);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
-- 
2.53.0

