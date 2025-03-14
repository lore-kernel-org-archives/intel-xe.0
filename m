Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED7FC35FF1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669DA10E98E;
	Fri, 14 Mar 2025 07:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fhrl2uPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B02310E98D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937945; x=1773473945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KVL9LY8Zob4XP2Q+cZX3HI/+d8VLS51wlWXW1QIZk3M=;
 b=Fhrl2uPPKWnFr5t+yeu+7RUwQjUm2r6ebdnK4PHJKQSsJNjhb6VVfrUG
 PiOg/Dy+ZiCfZYnjia/rlpOkPUrej6OJr4Yw8WG1KEaIei+T1SVxP5Qtg
 cHaZNx8BmKAYT1RzGtr5eovv1+3srFd4c/4dXNa182lusfiOkFkpoWsj8
 RcJCFKa7UL//+5XD5Ue7edgxt5bvZWaoCNK3+fWlRglePV6Ik8ulqm7Jn
 5rXvPGVY5pcBAbo5KnmkfqeLVeDXEF0p9AHc8uDOJWnAnq7lt0uTAk9wT
 fQYG64riLD9pdNMFTZMalF0LjmUwnmggDXGTDOsHS3jeUGXcJVtNpoSz7 Q==;
X-CSE-ConnectionGUID: BXD9mnHfTfKup0cQ7E3bqg==
X-CSE-MsgGUID: EPic/JgUSgG55ta0eF5k3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446142"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:39:04 -0700
X-CSE-ConnectionGUID: fg51w/SoSdOEuK6U/47Tig==
X-CSE-MsgGUID: mw4LY9GNSdWnhDhJHmpxtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043901"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:39:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 26/29] drm/xe/svm: Consult madvise preferred location in prefetch
Date: Fri, 14 Mar 2025 13:32:23 +0530
Message-Id: <20250314080226.2059819-27-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, prefetch svm
ranges to preferred location provided by madvise.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5e36975258a3..36546c82df06 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2890,9 +2890,12 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 		if (!xe_vma_is_cpu_addr_mirror(vma))
 			return 0;
 
-		region = op->prefetch_range.region;
+		region = (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) ?
+			  vma->attr.preferred_loc.devmem_fd : op->prefetch_range.region;
 
-		/* TODO: Threading the migration */
+		/* TODO: Threading the migration
+		 * TODO: Multigpu support migration
+		 */
 		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
 			svm_range = xa_load(&op->prefetch_range.range, i);
 
@@ -2966,7 +2969,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		else
 			region = op->prefetch.region;
 
-		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
+			  region <= ARRAY_SIZE(region_to_mem_type));
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
@@ -3391,8 +3395,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
 				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
-				       xe->info.mem_region_mask)) ||
+		    XE_IOCTL_DBG(xe, (is_cpu_addr_mirror &&
+				      prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) &&
+				      !(BIT(prefetch_region) & xe->info.mem_region_mask)) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
-- 
2.34.1

