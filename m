Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D776C43458
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jul 2026 11:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6C210E439;
	Sun, 12 Jul 2026 11:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnwzHI0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E7910E439
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Jul 2026 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783854898; x=1815390898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H6GkALYfOGnR4iZN/3XDrpcXZJ94LvNypr9bSfLCNJY=;
 b=HnwzHI0VYQoEAiCoAs0TzcEYTQmMAAwmRXdwKQTc9BUetuyw6juMuvGK
 pR49czqTM0ErnA702+rQ0p34EJZCn09FeXdd+48BpXvvlqgp+Xo9c5qD1
 HHAbMvST9/RBTyOrgAU88cMiqMCT1b+YueBussha4CjoxLf5SoT49+2O4
 IJrw5U3bj/ZUWCpraskOjNEVGFXaH93Zfd/VnqxY7lWGTkPsfo28JVAL/
 qAsM5+HGf5iILZOvSmfQB9D3doAjXE4lKmOKH+dKnoo+bZxuWf2UrIfkh
 zyPlDBzksVU1kL3NgWRwJuoOynuyhtcSX/jlGbTdqOUl01pZaGpjs5etx A==;
X-CSE-ConnectionGUID: XFENjZ9TSS6PaJSTYpMX1w==
X-CSE-MsgGUID: FZQI7qy+SuizOiCSQbZbRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84457638"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84457638"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 04:14:58 -0700
X-CSE-ConnectionGUID: sPf4PFi/TLuADu3ixvqpAw==
X-CSE-MsgGUID: XtzYxf/XSMKJlyz+XYNDkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255367736"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 12 Jul 2026 04:14:57 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v3 6/8] drm/xe/vm: propagate BO page-size requirements to VMA
 map flags
Date: Sun, 12 Jul 2026 16:45:15 +0530
Message-ID: <20260712111517.1956177-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
References: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
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

Propagate user BO page-size requirement flags into VM bind map
operations.

When a user BO carries a page-size requirement flag, set the
corresponding VMA PTE flag during bind-op construction. This covers
64K, 2M, and 1G page sizes and allows the debug page-size allocation
policy selected at BO creation time to be reflected in page-table
mapping behavior.

v3
- BO page-size requirement overrides prior map-state flags
- reword commit message

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..96d4e6ee4ffa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2390,6 +2390,26 @@ static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
 	}
 }
 
+static void xe_vma_apply_debug_page_size_flag(struct xe_vm *vm,
+					      struct xe_vma_op *op,
+					      struct xe_bo *bo)
+{
+	if (!bo)
+		return;
+
+	if (!(bo->flags & XE_BO_FLAG_USER))
+		return;
+
+	op->map.vma_flags &= ~(XE_VMA_PTE_64K | XE_VMA_PTE_2M | XE_VMA_PTE_1G);
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_1G)
+		op->map.vma_flags |= XE_VMA_PTE_1G;
+	else if (bo->flags & XE_BO_FLAG_NEEDS_2M)
+		op->map.vma_flags |= XE_VMA_PTE_2M;
+	else if (bo->flags & XE_BO_FLAG_NEEDS_64K)
+		op->map.vma_flags |= XE_VMA_PTE_64K;
+}
+
 /*
  * Create operations list from IOCTL arguments, setup operations fields so parse
  * and commit steps are decoupled from IOCTL arguments. This step can fail.
@@ -2485,6 +2505,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
+			/*
+			 * Propagate debug BO page-size selection into the VMA mapping flags for
+			 * user BO binds.
+			 */
+			xe_vma_apply_debug_page_size_flag(vm, op, bo);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 			struct xe_tile *tile;
-- 
2.43.0

