Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE25D609C2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 17:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C828210E239;
	Tue, 16 Dec 2025 17:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtZhS+F8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AAF10E239
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765904521; x=1797440521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=03KSJ1l7SRimWVr7BBDGOdp0HTTKi/uc1JTwQow9MYE=;
 b=XtZhS+F8sZbGFBmudoS0XgChu11K51LGCpM7DUmfz+o5fWSWo5FaMzV3
 FtkCPV2+3+5QilGzmZiYy8Lqz6sxACeA7jP+whwEilpxhFPgDxSR2UCuW
 yncT6LolijhBEdRzRwEgVn+3OXoXwgChfNMI8MJYEbLATtt8KMlKwBIEY
 +qF1YowRBTqr9gXyQYm6CRKzHQkU2K5NXahe4SPSrv9aQ981k3uYItwlu
 Cn7ByrVsBUWifH+tvmCAekOriNwzgMCSDtgG04ZBdSgfyp/ey1EKpaTJo
 FikEuy1AZ/ivvzRHn7qPhpPvREDKAojhOai9LMn88XfdZxCcycb137Cl5 w==;
X-CSE-ConnectionGUID: fgio8qhjQE6Np9L+Ub/XYA==
X-CSE-MsgGUID: uWqWOYBdSBGyJVJ8QLgmRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71683433"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="71683433"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 09:02:01 -0800
X-CSE-ConnectionGUID: lus+Mz4yRWa2CA08ZbyB1g==
X-CSE-MsgGUID: xxwkuxO1SbGmdgMUDZbgtQ==
X-ExtLoop1: 1
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 09:02:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 peter.senna@intel.com, ayaz.siddiqui@intel.com, varun.gupta@intel.com
Subject: [PATCH] drm/xe/xe_svm: Only count unique pagefaults
Date: Tue, 16 Dec 2025 17:02:01 +0000
Message-ID: <20251216170200.8714-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

The function __xe_svm_handle_pagefault increments the value of
XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT every time it is called by
xe_svm_handle_pagefault.  However, if __xe_svm_handle_pagefault returns
-EAGAIN, it can be called again in a loop, resulting in
XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT being incremented multiple times for
the same pagefault instance.  This can occur if, for example,
xe_svm_garbage_collector return -EAGAIN.

It does not make sense to increment the SVM pagefault count more than
once per pagefault, so only increment it once per call to
xe_svm_handle_pagefault.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Peter Senna <peter.senna@intel.com>
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 93550c7c84ac..245ffa6330bb 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1026,8 +1026,6 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
-	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
-
 retry:
 	/* Always process UNMAPs first so view SVM ranges is current */
 	err = xe_svm_garbage_collector(vm);
@@ -1178,6 +1176,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    bool atomic)
 {
 	int need_vram, ret;
+
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
 retry:
 	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
 	if (need_vram < 0)
-- 
2.43.0

