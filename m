Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F55AC43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BAA10F065;
	Wed,  1 Jul 2026 16:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVL4VvIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D8E10F064
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782923601; x=1814459601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t5OdT2h7e7Xz3Z9NvGeAV2Jw4Mfoh7fytRO1cwnqURE=;
 b=EVL4VvIryrutD2V3XS+LKF8mNNi2xa3WdY14yODbEEaeHW0R6gUUd3SA
 sgvNh2d9gihSAl7vc6Rm7/57XgPJ2Up8p5lhc0oT3rGTW63J4VpBELN/u
 7mHw0pTDOqxXgvdiJVU7ES2pkpJV94PEHOxLRA9nnVZNeBZAavgjxt8I4
 EchyxPykvnM4URNQf0jvOtjG1bwazxkwFT2mWZik3iUeZdZ2cASlq+OD9
 KvarXhp4dwZE2bGUq5nMkXzJWwob1kAeOkEMXKIzTXFpJxWwaXBjQRngS
 CbHQgqopQd0+g7GqPWSvlKiwbeMlo+6T+DfkQfBYdg1uR6N5awbeeuHeb A==;
X-CSE-ConnectionGUID: X5dcEG2ZSEyxT08BCPTAUQ==
X-CSE-MsgGUID: 4W2Ew2yWQiSHp/pwoa1Jbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82779256"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="82779256"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:33:21 -0700
X-CSE-ConnectionGUID: suOMNmujT/O/zztdPOqdkA==
X-CSE-MsgGUID: W8+6BtQCRPaIaYlfwrIgMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256196449"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 09:33:20 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 6/8] drm/xe/vm: apply debug page-size policy to VMA map
 flags
Date: Wed,  1 Jul 2026 22:03:46 +0530
Message-ID: <20260701163348.3432358-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
References: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
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

