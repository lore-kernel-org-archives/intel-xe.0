Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029B6C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901E2112F13;
	Tue,  9 Apr 2024 20:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiDq2q9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2FF112F13
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693094; x=1744229094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=md7tQM9T3A4VwB7ZQLx3ZNAE2GdLYWgQ/fwACmogQXM=;
 b=CiDq2q9TrqJx9fo37+aK+yt7iavWINz7KYAClO8JP1TZLbfzGSpoWL+S
 W+CMI24PmdjWaduL2PUoRs7/MQMX0BnoYlcP10Rh2q0WSkNcSmXOsVpAq
 1GgpVODJ41hWnVh13wj5fJzouMpw7derP8cDJF9E5mDNJZjaAR0LRcFKl
 5//ffoj+qybYsI4SRxArZ1G3ewlOQCC31mfm1gKtEDq1a6QKgqPvg/6LI
 B6qRxOeOh5ksjReEezjg0MYmVs+cxiou9hj/ptueE9oegdMyeqbDKhGLf
 Bm8ebQgTdhPI8j8Y5NHbi7T4792QL7LJRc4DZSPHJ196N2snnE+7CUMsQ w==;
X-CSE-ConnectionGUID: 7AxHvAvURbCMPNfr2t1Ztg==
X-CSE-MsgGUID: a7UBYkuyTlOVcNBW2exrTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803745"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803745"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
X-CSE-ConnectionGUID: jSXOI6bZSZqQRoT4ABgiCQ==
X-CSE-MsgGUID: 0L+SguYpQvmeTDcVKzfx9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773720"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 03/31] drm/xe: Invalidate userptr VMA on page pin fault
Date: Tue,  9 Apr 2024 16:17:14 -0400
Message-Id: <20240409201742.3042626-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Rather than return an error to the user or ban the VM when userptr VMA
page pin fails with -EFAULT, invalidate VMA mappings. This supports the
UMD use case of freeing userptr while still having bindings.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 ++--
 drivers/gpu/drm/xe/xe_trace.h        |  2 +-
 drivers/gpu/drm/xe/xe_vm.c           | 20 +++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h     |  7 ++-----
 4 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index e4f5a80a46fc..c49b1409e168 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -68,7 +68,7 @@ static bool access_is_atomic(enum access_type access_type)
 static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 {
 	return BIT(tile->id) & vma->tile_present &&
-		!(BIT(tile->id) & vma->usm.tile_invalidated);
+		!(BIT(tile->id) & vma->tile_invalidated);
 }
 
 static bool vma_matches(struct xe_vma *vma, u64 page_addr)
@@ -230,7 +230,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	if (xe_vma_is_userptr(vma))
 		ret = xe_vma_userptr_check_repin(to_userptr_vma(vma));
-	vma->usm.tile_invalidated &= ~BIT(tile->id);
+	vma->tile_invalidated &= ~BIT(tile->id);
 
 unlock_dma_resv:
 	drm_exec_fini(&exec);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index c4704c5f3c72..5f7d26bf4cd7 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -464,7 +464,7 @@ DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate,
 	     TP_ARGS(vma)
 );
 
-DEFINE_EVENT(xe_vma, xe_vma_usm_invalidate,
+DEFINE_EVENT(xe_vma, xe_vma_invalidate,
 	     TP_PROTO(struct xe_vma *vma),
 	     TP_ARGS(vma)
 );
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8ba037e7ce5c..e1c1c18825ff 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -723,11 +723,18 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
 				 userptr.repin_link) {
 		err = xe_vma_userptr_pin_pages(uvma);
-		if (err < 0)
-			return err;
-
 		list_del_init(&uvma->userptr.repin_link);
-		list_move_tail(&uvma->vma.combined_links.rebind, &vm->rebind_list);
+		if (err == -EFAULT) {
+			err = xe_vm_invalidate_vma(&uvma->vma);
+			if (err)
+				return err;
+		} else {
+			if (err < 0)
+				return err;
+
+			list_move_tail(&uvma->vma.combined_links.rebind,
+				       &vm->rebind_list);
+		}
 	}
 
 	return 0;
@@ -3136,9 +3143,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	u8 id;
 	int ret;
 
-	xe_assert(xe, xe_vm_in_fault_mode(xe_vma_vm(vma)));
 	xe_assert(xe, !xe_vma_is_null(vma));
-	trace_xe_vma_usm_invalidate(vma);
+	trace_xe_vma_invalidate(vma);
 
 	/* Check that we don't race with page-table updates */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
@@ -3176,7 +3182,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 		}
 	}
 
-	vma->usm.tile_invalidated = vma->tile_mask;
+	vma->tile_invalidated = vma->tile_mask;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index d0a08e927db7..2bb76adf66a1 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -96,11 +96,8 @@ struct xe_vma {
 		struct work_struct destroy_work;
 	};
 
-	/** @usm: unified shared memory state */
-	struct {
-		/** @tile_invalidated: VMA has been invalidated */
-		u8 tile_invalidated;
-	} usm;
+	/** @tile_invalidated: VMA has been invalidated */
+	u8 tile_invalidated;
 
 	/** @tile_mask: Tile mask of where to create binding for this VMA */
 	u8 tile_mask;
-- 
2.26.3

