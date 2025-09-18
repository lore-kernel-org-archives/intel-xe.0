Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A27CAC5A0
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 13:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A2F10E8CB;
	Thu, 18 Sep 2025 13:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8UMNbDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FF510E8C9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 13:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758203805; x=1789739805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yxXnnFcNMoAt8GqhMFFgiMuhFQe93bgUjGL/LEyhw9U=;
 b=K8UMNbDskKSlgtee1FDF0fwkZ3rP2emnOU+Z8A4SpRCuRy91VU0CcjyT
 AcQMFem1Y7tR2/T0quMQ1+iqZZCTgeH2Np8Hlhv5NSNPbRtIJrbwIkHza
 IExLlXNHsjIw9sykakc9A2iz90P3616cpilwgncd6/3nuxc/Tnfh/FyUw
 ilqIeiqDeoRAMaUP1QewcktFIxqnXEgCJLRQgt3fc3MIV2DpOAktoz7At
 cdP9g4rQZkWk6GfiDUx2JfdZwBNu9qY3l8x8xcgMnxR9+Q8Xmonr2GJNR
 Q2lnr+XvP9Z8Dq4eGvEzNuzWkLUQAPzEDE2HpcvujG+eoo797YzWhmy1c A==;
X-CSE-ConnectionGUID: rlcx7kkpTZmrdYrelL9RnA==
X-CSE-MsgGUID: S6JoYxZ1QNONYo35ONX0DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64337091"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64337091"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:56:44 -0700
X-CSE-ConnectionGUID: VJc4HcC3SXuD+uAwWuY+dw==
X-CSE-MsgGUID: EtuJI4j3QhijfCPJMVNLXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="179828084"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 18 Sep 2025 06:56:43 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1 5/5] drm/xe: perform on-demand decompression on VMA
 pagefaults
Date: Thu, 18 Sep 2025 19:55:29 +0530
Message-Id: <20250918142529.608432-6-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918142529.608432-1-nitin.r.gote@intel.com>
References: <20250918142529.608432-1-nitin.r.gote@intel.com>
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

When a VMA pagefault occurs and the bound BO has the DECOMPRESS flag,
schedule a resolve (xe_migrate_resolve) to perform per-page decompression
before binding the VMA to the faulting GT.

Behavior:
 - schedule xe_migrate_resolve() while holding appropriate reservations,
 - wait on the returned fence, then clear the BO's DECOMPRESS flag
   on success,
 - proceed with the normal rebind path.

This ensures on-demand fault-time decompression works consistently with
the VM_BIND path.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 41 ++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index a054d6010ae0..4a3f2682ed85 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -95,11 +95,14 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 				bool atomic)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	int err, needs_vram;
+	bool needs_decompression = false;
+	struct dma_fence *decomp_fence = NULL;
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -112,8 +115,14 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 
 	trace_xe_vma_pagefault(vma);
 
+	/* Check if decompression is needed */
+	if (bo && (bo->flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS)) {
+		needs_decompression = true;
+		drm_dbg(&vm->xe->drm, "Decompressing VMA during page fault handling\n");
+	}
+
 	/* Check if VMA is valid, opportunistic check only */
-	if (vma_is_valid(tile, vma) && !atomic)
+	if (vma_is_valid(tile, vma) && !atomic && !needs_decompression)
 		return 0;
 
 retry_userptr:
@@ -135,6 +144,21 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 		if (err)
 			goto unlock_dma_resv;
 
+		/* Perform decompression inside proper locking context */
+		if (needs_decompression) {
+			decomp_fence = xe_migrate_resolve(tile->migrate, xe_vma_bo(vma),
+							  xe_vma_bo(vma),
+							  xe_vma_bo(vma)->ttm.resource,
+							  xe_vma_bo(vma)->ttm.resource,
+							  false);
+			if (IS_ERR(decomp_fence)) {
+				drm_err(&vm->xe->drm,
+					"Decompression failed during page fault handling\n");
+				err = PTR_ERR(decomp_fence);
+				goto unlock_dma_resv;
+			}
+		}
+
 		/* Bind VMA only to the GT that has faulted */
 		trace_xe_vma_pf_bind(vma);
 		xe_vm_set_validation_exec(vm, &exec);
@@ -147,8 +171,19 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 		}
 	}
 
-	dma_fence_wait(fence, false);
-	dma_fence_put(fence);
+	/* Wait for decompression first, then rebind */
+	if (decomp_fence) {
+		dma_fence_wait(decomp_fence, false);
+		dma_fence_put(decomp_fence);
+
+		/* Clear the decompression flag after successful decompression */
+		bo->flags &= ~DRM_XE_VM_BIND_FLAG_DECOMPRESS;
+	}
+
+	if (fence) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
 
 unlock_dma_resv:
 	xe_validation_ctx_fini(&ctx);
-- 
2.25.1

