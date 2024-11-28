Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BE7D70DEB
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 20:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152710E4A0;
	Thu, 28 Nov 2024 20:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRVOFDrp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB6C10E4A0
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732826850; x=1764362850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1LrchDCjEdNm4I8cUzhajgos7MSsh00JuB3wx7lQfPA=;
 b=FRVOFDrpux9uuT2a1hqkXduK9Yocp1sqE/khXRtShVp3Ev2rmu84vzRS
 mm1bM9VSpswPYE1/v0PHasRorXU1VodbAcw7QHwxbeGVT63ImjRqdZWPD
 ESX3h7LoXIBdqy3HpMPyIs5RmwXT0KolSzpAIdrV6eYvDPMMY3yRz1goB
 qyxF5DX+yvox6An3tvfNI+uOo7xyL2VJIK8sWrSiuWGtk5BveydYLsshR
 JqLCYozSAgE8wcArMl1Lk0std5cP9eMRHcC55OVPyGhpmMy6/Y521lK7z
 fIpZwlEw9ad75fXJD8yvRp1NkjVbbJ4Y0FZilFFx7RGUsNjR4V1tgbbBQ g==;
X-CSE-ConnectionGUID: mSsoOKXqTIWyzUlVZbQQRA==
X-CSE-MsgGUID: guxvdeA/SBSVooValF9uyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33123028"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="33123028"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 12:47:30 -0800
X-CSE-ConnectionGUID: LmSNlPn/R8CucH0nXrX+gA==
X-CSE-MsgGUID: Ba8Kdk+VTYCV0m7aT08IJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="92642981"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 12:47:29 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com
Subject: [PATCH] drm/xe: Avoid evicting object of the same vm in none fault
 mode
Date: Thu, 28 Nov 2024 16:01:03 -0500
Message-Id: <20241128210103.1820743-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

BO validation during vm_bind could trigger memory eviction when
system runs under memory pressure. Right now we blindly evict
BOs of all VMs. This scheme has a problem when system runs in
none recoverable page fault mode: even though the vm_bind could
be successful by evicting BOs, the later the rebinding of the
evicted BOs would fail. So it is better to report an out-of-
memory failure at vm_bind time than at time of rebinding where
xekmd currently doesn't have a good mechanism to report error
to user space.

This patch implemented a scheme to only evict objects of other
VMs during vm_bind time. Object of the same VM will skip eviction.
If we failed to find enough memory for vm_bind, we report error
to user space at vm_bind time.

This scheme is not needed for recoverable page fault mode under
what we can dynamically fault-in pages on demand.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2492750505d69..c005c96b88167 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2359,13 +2359,15 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 				 bool validate)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	bool preempt_mode = xe_vm_in_preempt_fence_mode(vm);
 	int err = 0;
 
 	if (bo) {
 		if (!bo->vm)
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
-			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
+			err = xe_bo_validate(bo, vm, !preempt_mode);
 	}
 
 	return err;
-- 
2.26.3

