Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E150C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 02:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6D910E10C;
	Fri, 10 Jul 2026 02:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tv6F58x3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD5410E10C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 02:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783649834; x=1815185834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uv8d1TMBC+ZVQf88DxS2mqMPDYx3jXWrpDqSm/tuHcE=;
 b=Tv6F58x3oE1CmPdR8DKAX0iTa8imCT3wzRvpg2lyLtokMT6wmXnVeI48
 i/zNVtP9R8A4Fd+UbKPnj4tf1RX+3g4NgO2ddi7sH9rzdEshKipKub9SB
 vUetsWeTFgEnyi0uMyZwfE1FwmI/m6F6RE+GUckQApQahdZ3pTgMqeVlK
 B8ZgWhPgDmZ9k/Zpm325Z4Txgch/5oGQu29PFiXM6otE+CBdF4qZN1HCZ
 MMR5x/Wnk15EOtP61uWqp/xSHKu5zqtBXYEgZniMAuLMs5qaL8hEY+PA6
 wy185S2a/ykkE+JS8WdQD5I/EVRvQlbT+IzO+BVOzLCDW8Ufg+12uGRjC w==;
X-CSE-ConnectionGUID: eAW/iF6PST+VyvXHumTO1w==
X-CSE-MsgGUID: J/2Ury5MTCmLKYrIhrvfRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107146193"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107146193"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 19:17:14 -0700
X-CSE-ConnectionGUID: qoBkzzXgRTu9Fg1VF3lQ6g==
X-CSE-MsgGUID: 6oIJe+y3SRKFCqop2Rjhpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253647476"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa010.jf.intel.com with ESMTP; 09 Jul 2026 19:17:13 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/vm: Reject invalid prefetch region for non-SVM VMA
Date: Fri, 10 Jul 2026 02:17:00 +0000
Message-Id: <20260710021700.3611909-1-shuicheng.lin@intel.com>
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

DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC (-1) is only valid on a
CPU-address-mirror (SVM) VMA. On a regular VMA the value is used as
an index into region_to_mem_type[], causing an out-of-bounds access:

  UBSAN: array-index-out-of-bounds in drivers/gpu/drm/xe/xe_vm.c:3260:28
  index 4294967295 is out of range for type 'u32 [3]'
  Call Trace:
   __ubsan_handle_out_of_bounds+0xa7/0xf0
   vm_bind_ioctl_ops_execute+0x9b0/0x9d0 [xe]
   xe_vm_bind_ioctl+0x19f1/0x1b10 [xe]

Three related changes:

- vm_bind_ioctl_ops_create(): For a non-CPU-address-mirror VMA, reject
  both DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC and out-of-range prefetch
  regions with -EINVAL. This is the primary fix for the OOB.

- op_lock_and_prep(): Tighten the xe_assert() to
  'region < ARRAY_SIZE(region_to_mem_type)'. The
  DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC exemption is no longer needed
  since the value is rejected earlier, and '<=' was an off-by-one
  bound (valid indices are 0..ARRAY_SIZE-1).

- xe_drm.h: Document the CPU-address-mirror constraint on the
  DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC UAPI value.

Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in prefetch")
Assisted-by: Claude:claude-opus-4.7
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++++--
 include/uapi/drm/xe_drm.h  |  4 +++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..9430b2be18e4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2495,6 +2495,15 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			u32 i;
 
 			if (!xe_vma_is_cpu_addr_mirror(vma)) {
+				if (XE_IOCTL_DBG(vm->xe,
+						 prefetch_region ==
+						 DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) ||
+				    XE_IOCTL_DBG(vm->xe,
+						 prefetch_region >=
+						 ARRAY_SIZE(region_to_mem_type))) {
+					err = -EINVAL;
+					goto unwind_prefetch_ops;
+				}
 				op->prefetch.region = prefetch_region;
 				break;
 			}
@@ -3236,8 +3245,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 		if (!xe_vma_is_cpu_addr_mirror(vma)) {
 			region = op->prefetch.region;
-			xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
-				  region <= ARRAY_SIZE(region_to_mem_type));
+			xe_assert(vm->xe, region < ARRAY_SIZE(region_to_mem_type));
 		}
 
 		/*
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 509202a7b13e..e159c44e380a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1075,7 +1075,9 @@ struct drm_xe_vm_destroy {
  *
  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
- *    the memory region advised by madvise.
+ *    the memory region advised by madvise. Only valid when the target VMA
+ *    was created with %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR; rejected with
+ *    -EINVAL otherwise.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.43.0

