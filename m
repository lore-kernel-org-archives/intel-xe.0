Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3263E6C5E5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 02:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B4810E21E;
	Tue,  3 Dec 2024 02:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ml87trJ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE87A10E8C6
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 02:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733191549; x=1764727549;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WF6mNvXYdMZdcFHLmv0N8ObGu/dk8505ytFOOYTBh/k=;
 b=Ml87trJ0GXfxi8lqEOX08y8njZ8CVEgwuRelPl0NDvIjppGK8pK3ty8B
 5v7SFlY3w70b6FU6D66uG7/1tdZdH7kazr9+sebFLM8UTX3Yn6PZEkNYh
 GkvBOjSpHLUli5DSVRZpuF4x3WBoBphdbRE5x6zmm+HipeN4niAzgEp7J
 2OrXq9CfVJsOm/nPSuPLlYwLlJ19LcKmwxNt5q3fLsPneuIoqZ0jqj6y6
 YT8uSVPsAyWFsSrMGhmQUBbWAjzY7STbxAN98jx940Fh4HUWRHEeLJ/os
 eyM0wXo7UDqQTvTB6wtnNFs/yGMYo3mMRfcZ0Mrc0SbrOz0MLze0OVAU/ A==;
X-CSE-ConnectionGUID: V2cZI7CFTF2ZgUUeFWNWxA==
X-CSE-MsgGUID: +5fSQCK+RG6uyjWUcYm0Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44419642"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="44419642"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 18:05:48 -0800
X-CSE-ConnectionGUID: VXOc6KjoRd61jUJKa34uAA==
X-CSE-MsgGUID: 2E/DKPE9RoONBn4vQA2avw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98301217"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 18:05:49 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com
Subject: [PATCH] drm/xe: Avoid evicting object of the same vm in none fault
 mode
Date: Mon,  2 Dec 2024 21:19:29 -0500
Message-Id: <20241203021929.1919730-1-oak.zeng@intel.com>
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

v1: Use xe_vm_in_preempt_fence_mode instead of stack variable (Thomas)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2492750505d69..016fedae5d554 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2359,13 +2359,15 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 				 bool validate)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
 	int err = 0;
 
 	if (bo) {
 		if (!bo->vm)
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
-			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
+			err = xe_bo_validate(bo, vm,
+					     !xe_vm_in_preempt_fence_mode(vm));
 	}
 
 	return err;
-- 
2.26.3

