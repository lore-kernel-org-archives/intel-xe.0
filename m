Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B08AC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 03:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADD110E02B;
	Tue, 23 Jul 2024 03:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmogEGP+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A853810E02B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 03:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721704404; x=1753240404;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2zAZcCQgnt4moA//Lz/8Ygr1H9byEpsEi/4Td8tq6H4=;
 b=EmogEGP+Z4C84wBRIRpEYb4sGrIh9abs96h2YRU6a/q+vpQt6jlxCmlm
 bG5OV527yPmsmPKoFzGtwzxaLm8FjAstajn2PjgTfoWw3wxnlfLmMhg2z
 33HLqyZ7J+GJ70JkB9UgasDTfZRaAySTk24ThB5SfIeuzf4pWChsDhTRh
 mD+tZ4hferZ2pehRkDhWjHBiW1IjDe1LWBoyx/xigo7JBGlOaXSqHOkgM
 J5TY+pDwygWtkrkiF25R9JANtrjUc9bub2abLlo2k7aw8G1+fgBxNNmf/
 CYFvcBGA6LTJNmM8/Ne9IOZUwCwd/i0uPFR6YDw2qlVrBeVuQjMA3mPc1 w==;
X-CSE-ConnectionGUID: 2wefOX+HRbiI2x/SaQd0fA==
X-CSE-MsgGUID: GDg31fDTT+uc9NvgBNnbdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29893438"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="29893438"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 20:13:23 -0700
X-CSE-ConnectionGUID: ie7jxeXTRSuWCdUedQuHNQ==
X-CSE-MsgGUID: Mq2Q7Qm5TdO7d2lvk2P3lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="89547603"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 20:13:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Wait on bookkeep dma-resv slots when unmapping /
 mapping same address
Date: Mon, 22 Jul 2024 20:14:09 -0700
Message-Id: <20240723031409.1698464-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

There is a window between unmap and map of the same address in which the
old and new address is invalid. Avoid this window by waiting bookkeep
dma-resv when unmapping and mapping the same address.

This race is shown when running xe_vm.mmap* on presi platform which by
nature are more susceptible to races.

Fixes: ("drm/xe: Convert multiple bind ops into single job")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 5 ++++-
 drivers/gpu/drm/xe/xe_vm.c       | 9 +++++++++
 drivers/gpu/drm/xe/xe_vm_types.h | 2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c24e869b7eae..1e92aa8dd241 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1757,7 +1757,10 @@ static int op_prepare(struct xe_vm *vm,
 			break;
 
 		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
-		pt_update_ops->wait_vm_kernel = true;
+		if (op->map.wait_bookkeep)
+			pt_update_ops->wait_vm_bookkeep = true;
+		else
+			pt_update_ops->wait_vm_kernel = true;
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = unbind_op_prepare(tile, pt_update_ops,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8fa2821d0c64..d0a5703e0967 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2165,6 +2165,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 	struct xe_tile *tile;
 	u8 id, tile_mask = 0;
 	int err = 0;
+	u64 unmap_addr = 0, unmap_range = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -2183,6 +2184,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
+			if (op->base.map.va.addr == unmap_addr &&
+			    op->base.map.va.range == unmap_range)
+				op->map.wait_bookkeep = true;
+
 			flags |= op->map.read_only ?
 				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
@@ -2289,6 +2294,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
+			unmap_addr = op->base.unmap.va->va.addr;
+			unmap_range = op->base.unmap.va->va.range;
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			break;
 		case DRM_GPUVA_OP_PREFETCH:
 			/* FIXME: Need to skip some prefetch ops */
 			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7f9a303e51d8..b2cfb13bf05f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -296,6 +296,8 @@ struct xe_vma_op_map {
 	bool is_null;
 	/** @dumpable: whether BO is dumped on GPU hang */
 	bool dumpable;
+	/** @wait_bookkeep: map op waits on bookkeep dma-resv slots */
+	bool wait_bookkeep;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
 };
-- 
2.34.1

