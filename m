Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EE5CDB477
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 06:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C640110E4D3;
	Mon, 22 Jun 2026 06:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqxVzH30";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BBB10E4AD
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 06:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782111583; x=1813647583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t5OdT2h7e7Xz3Z9NvGeAV2Jw4Mfoh7fytRO1cwnqURE=;
 b=XqxVzH30L36eQwZvac6U8fa7qvsqjskMRj+U0xFRLQp9DSfeJeiNtQuZ
 4y+mxADyFU35AerEPzKtn6ZK9m+8HuQSMrn1SrdaNFqFg3+O6dvzJRRxV
 qhr12JmLBK/nbDPp95bWBbnxukLXbJAVXtMoMJGNpab4uVSPsLliaaiSx
 IDi/eBtogEpwFRV9Wm2PzEQNQSGyjjsUXI3tWKR0sSLkUVh96QRQN9B2g
 st8wmPliTIzNiafunIi09B7yx2R7YpxGw65wDIX2JeN/HU9h5l9L3eGDT
 IvifDleIYieB6+69l4U5CpDmVrd+PEnIv0bxkiGVnlM/sFsb/HhtdfuyE Q==;
X-CSE-ConnectionGUID: PUGbP9V8T3Wg2Scu/UKoJg==
X-CSE-MsgGUID: Onr39PpXRZGgUuB73cigOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82928749"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82928749"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:59:43 -0700
X-CSE-ConnectionGUID: Z5K+/YpKTCK25w0y+Fifqw==
X-CSE-MsgGUID: 4XOyeS1yTZyBFwLtBIC38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251068131"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 23:59:41 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 6/9] drm/xe/vm: apply debug page-size policy to VMA map flags
Date: Mon, 22 Jun 2026 12:30:28 +0530
Message-ID: <20260622070031.2445502-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
References: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
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

Propagate the debug user BO page-size selection into VM bind map
operations.

When page-size allocation control is supported and the BO is a user BO,
set the corresponding VMA PTE flag during bind-op construction based on
the BO page-size requirement flags. This covers 64K, 2M, and 1G modes
and allows the debug page-size allocation policy to influence page-table
mapping behavior for user allocations.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..50ca29a79533 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2390,6 +2390,27 @@ static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
 	}
 }
 
+static void xe_vma_apply_debug_page_size_flag(struct xe_vm *vm,
+					      struct xe_vma_op *op,
+					      struct xe_bo *bo)
+{
+	if (!xe_device_supports_multi_pagesize(vm->xe))
+		return;
+
+	if (!bo)
+		return;
+
+	if (!(bo->flags & XE_BO_FLAG_USER))
+		return;
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_64K)
+		op->map.vma_flags |= XE_VMA_PTE_64K;
+	else if (bo->flags & XE_BO_FLAG_NEEDS_2M)
+		op->map.vma_flags |= XE_VMA_PTE_2M;
+	else if (bo->flags & XE_BO_FLAG_NEEDS_1G)
+		op->map.vma_flags |= XE_VMA_PTE_1G;
+}
+
 /*
  * Create operations list from IOCTL arguments, setup operations fields so parse
  * and commit steps are decoupled from IOCTL arguments. This step can fail.
@@ -2485,6 +2506,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
+			xe_vma_apply_debug_page_size_flag(vm, op, bo);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 			struct xe_tile *tile;
-- 
2.43.0

