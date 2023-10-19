Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37D3CDB482
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 17:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C99210E52C;
	Thu, 19 Oct 2023 17:33:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9609B10E52C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 17:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697736824; x=1729272824;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u/sA5B7Cm0oJArLOzODvURskIACDvtV49T59a00wkW8=;
 b=ePiWmTIJLrZBBquyl1D9YQRTx8TaN1nriCbsaFlyzEs1GEwZNuZym+q7
 GiWaUdic56dJ1CIuaRXME6fjbdGh/jb1jpBNpKEoo2zd1bJc86gYMCXrx
 NMukKG9F0Jg9zSC7Vb0C92JOPHrGTqv8u8Er4Bk0oJ74BLa+gX5z0y/tC
 6+xlU9rVm38B7T3mkzfpP5EDG9HSvM0wbofTCvTAHFTf3fQtxmg5VOvjK
 2mBfXfDiXdAjKwhc6PvT+HHX+oPQFUG/U0cbTPDPERe4W6OEktgHCLg2q
 WmemJyxSXiYyLkgWfhhEL9tK8ZFPKBTo8oBoPoHubu1YKCvGgwk7EOlEo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="472551383"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="472551383"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="5064252"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:33:45 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 10:33:43 -0700
Message-Id: <20231019173343.17987-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Convert pagefaulting code to use
 drm_exec
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

Remove unneeded num_shared argument to xe_pf_begin().
Per discussion w/ Matthew Brost, we request to preallocate 2 fence slots
from xe_vm_prepare_vma() for binding and potential move.
This should be hardcoded to 2, and not use tile_count which just happens
to be correct on PVC platform.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index c0027982ab4c..2ec0db7a4b29 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -100,10 +100,11 @@ static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       unsigned int num_shared, bool atomic, unsigned int id)
+		       bool atomic, unsigned int id)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
+	unsigned int num_shared = 2; /* slots for bind + move */
 	int err;
 
 	err = xe_vm_prepare_vma(exec, vma, num_shared);
@@ -195,7 +196,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, xe->info.tile_count, atomic, tile->id);
+		ret = xe_pf_begin(&exec, vma, atomic, tile->id);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			goto unlock_dma_resv;
@@ -525,7 +526,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, xe->info.tile_count, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, tile->id);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
-- 
2.38.0

