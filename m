Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893B3CA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 22:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFA010E6EB;
	Wed,  7 Oct 2026 22:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arLwl4WX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E1D10E6EB
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791411877; x=1822947877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e24AdPnMumcLp+/9n+Sz4T8Cj+Z+5wzpFIAyp+Y4FJw=;
 b=arLwl4WXSaOIm+JD8oBJeL1bI+6xlp/JMCLBXSw4q4MnDh0KRxisVLx8
 TzkmnNrRkhUQg+WKr0s8T3fikqlwtiEt2ZeQXTgh+lrSGU7t6QJeKiWPE
 +9rkQ2I0F1knb3RAD1YTVY40Mbz9q+0y5mrBOdekSlXtwXHxadYzmqm7H
 9geMiCHiE0AEpTL5ayi4nBe01iXOpr5Lu2Cbp8mP48saj3UwyOLY5Lyho
 6LoKVLfLIHzkiNVrWFqGCE0/xhgl7q1CN/oDZMoBBKnF2nQBt0MA+pBm9
 Si+oLfACENaF0nlERRUk7yoDHeEtwgEF//q4DOXFPOa5mor7wwEBpx/HE A==;
X-CSE-ConnectionGUID: Rng40ueTRmKS6eEHM3Xv6A==
X-CSE-MsgGUID: fl3VQhGiT8KTyQSyvKUWBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="188248"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="188248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:24:37 -0700
X-CSE-ConnectionGUID: 3xY+uBBTR2i1GZob6Qms9Q==
X-CSE-MsgGUID: YFPdsk8hRcSIlIc+Xw3f8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="315600059"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa001.jf.intel.com with ESMTP; 07 Oct 2026 15:24:37 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Mark xe_vma_ops_alloc() noinline for error injection
Date: Wed,  7 Oct 2026 22:24:26 +0000
Message-Id: <20261007222426.1350374-1-shuicheng.lin@intel.com>
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

Since xe_vma_ops_alloc() was reduced to a loop around
xe_pt_job_ops_alloc(), the compiler inlines it into all of its
callers, including xe_vm_bind_ioctl(). ALLOW_ERROR_INJECTION() only
keeps an out-of-line copy of the function alive for the kprobe, so
fail_function injection on xe_vma_ops_alloc is armed on a copy that is
never called and the bind IOCTL succeeds.

This is seen with the nodebug kernel config used in CI, where
igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc fails with:

  Failed assertion: simple_vm_bind(fd, vm) != 0

Mark xe_vma_ops_alloc() noinline so callers go through the injectable
function.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9432
Fixes: 0e33330f1238 ("drm/xe: Add struct xe_pt_job_ops")
Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: LLM
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 761bc136145f..8e2110e11368 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -676,7 +676,7 @@ static void xe_vm_clear_fault_entries(struct xe_vm *vm)
 	vm->faults.len = 0;
 }
 
-static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
+static noinline int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
 
-- 
2.43.0

