Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C08D3C526
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 04:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C6B10E65E;
	Wed, 10 Dec 2025 04:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0cPlmjD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6590310E65E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 04:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765341144; x=1796877144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tt31Nqsz7bDhAu+i7xvuvN77FTPq4QqpABbGzoFA5yo=;
 b=L0cPlmjDC/h6zrUEdnckWoZIBNIyiSDFEFGNAttLp3iM1nLPeRkb0X1h
 HMmEmI+ub2Qt5englFYFkPenmVjnt7kclH6ayTg5ftk9FtHUNeFrmhgHJ
 ID8ACnTPaN2KHvWsiB6I1q2igEtauk84zypFuZw8yIU0YeRab+G5uiLO3
 0uyfn2xMdJgvK0NjmZM3LwPlrSOCHdN1k0pTTuezAwf0zYT1zlzc2TXZE
 qMAMvHXSJ3pY1/v0/j9NaJdYkVNKp2dQ/qYFjCc7rdjcCZiEJ8prlIXPc
 h+GsoFhsCFQSXySRihNwMKnF5b/3GQC9QRSLzA32MTy5N/9qZDFLwEBiA A==;
X-CSE-ConnectionGUID: YrBr6yh1TZmDbJhjUy5M8A==
X-CSE-MsgGUID: UCmvvA9BThuefPa7X39QfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78000065"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78000065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:24 -0800
X-CSE-ConnectionGUID: aTFt7M+JTbCqqpEHhv8H2A==
X-CSE-MsgGUID: TLOYrMKVSJWmt2ec9Am0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196466685"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:23 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v3 5/8] drm/xe/vm: Prevent binding of purged buffer objects
Date: Wed, 10 Dec 2025 10:00:49 +0530
Message-ID: <20251210043112.3267620-6-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210043112.3267620-1-arvind.yadav@intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
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

Add check_purged parameter to vma_lock_and_validate() to block
new mapping operations on purged BOs while allowing cleanup
operations to proceed.

Purged BOs have their backing pages freed by the kernel. New
mapping operations (MAP, PREFETCH, REMAP) must be rejected with
-EINVAL to prevent GPU access to invalid memory. Cleanup
operations (UNMAP) must be allowed so applications can release
resources after detecting purge via the retained field.

REMAP operations require mixed handling - reject new prev/next
VMAs if the BO is purged, but allow the unmap portion to proceed
for cleanup.

The check_purged parameter distinguishes between these cases:
true for new mappings (must reject), false for cleanup (allow).

v2:
  - Clarify that purged BOs are permanently invalid (i915 semantics)
  - Remove incorrect claim about madvise(WILLNEED) restoring purged BOs

v3:
  - Move xe_bo_is_purged check under vma_lock_and_validate (Matthew Brost)
  - Add check_purged parameter to distinguish new mappings from cleanup
  - Allow UNMAP operations to prevent resource leaks
  - Handle REMAP operation's dual nature (cleanup + new mappings)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 762098d368a6..9a6c9a26c6da 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2864,7 +2864,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 }
 
 static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
-				 bool res_evict, bool validate)
+				 bool res_evict, bool validate, bool check_purged)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -2873,6 +2873,11 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 	if (bo) {
 		if (!bo->vm)
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
+
+		/* Reject new mappings to purged BOs; allow cleanup operations */
+		if (!err && check_purged && xe_bo_is_purged(bo))
+			err = -EINVAL;
+
 		if (!err && validate)
 			err = xe_bo_validate(bo, vm,
 					     !xe_vm_in_preempt_fence_mode(vm) &&
@@ -2964,7 +2969,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			err = vma_lock_and_validate(exec, op->map.vma,
 						    res_evict,
 						    !xe_vm_in_fault_mode(vm) ||
-						    op->map.immediate);
+						    op->map.immediate,
+						    true);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
@@ -2973,13 +2979,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.remap.unmap->va),
-					    res_evict, false);
+					    res_evict, false, false);
 		if (!err && op->remap.prev)
 			err = vma_lock_and_validate(exec, op->remap.prev,
-						    res_evict, true);
+						    res_evict, true, true);
 		if (!err && op->remap.next)
 			err = vma_lock_and_validate(exec, op->remap.next,
-						    res_evict, true);
+						    res_evict, true, true);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
@@ -2988,7 +2994,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.unmap.va),
-					    res_evict, false);
+					    res_evict, false, false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 	{
@@ -3003,7 +3009,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
-					    res_evict, false);
+					    res_evict, false, true);
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
 					    region_to_mem_type[region],
-- 
2.43.0

