Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD3FC5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 16:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A6810E3BC;
	Mon, 26 May 2025 16:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUg4sz0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7C110E159
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 16:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748276007; x=1779812007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=60Xz6B7HAgVWrkUt7zies9D8vONFHbh+9fRRrO4grn4=;
 b=MUg4sz0c8r2ZKbN8GTk58PLezbwl5bKrmSn6shrzt+DYAP7S6FHbuJH8
 BkX4kS+T8u0psSs8zI+nJBJb3Xbb9/TvpAJHDJIOrhfesPfcJ2NlwF9jQ
 VmqLcnf0D8E9D/lq1kcDvZ8GacU5FwmMbFI7L8inUAou5vEc7qlN3K51T
 0YwR87T22Du0YXaYUw/teyjOQv94wLDdLJFsuWxlHxcv5CWfSkkWw0PHL
 R74Yz7S19j/pYpNWd4m6fy+uya5mj4NmAx0jual0CWfySafz5aolYaV8T
 MBNOu8f2gLM/q4dpBrjmEdZjVbwdoawToTVeeuRlur+tnrLvCYAxqGHnE w==;
X-CSE-ConnectionGUID: McKLpx9sTe2w3hIg3Hn5vA==
X-CSE-MsgGUID: wodEjFcdRAeeKdT05rY8uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61664856"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="61664856"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 09:13:27 -0700
X-CSE-ConnectionGUID: xCpr4oOcSeChc4DLLt23uw==
X-CSE-MsgGUID: eDCVutQARMSRgoIAZyowyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="142442545"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 26 May 2025 09:13:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/1] drm/xe/svm: Avoid duplicate eviction on get_pages()
 failure
Date: Mon, 26 May 2025 22:09:07 +0530
Message-Id: <20250526163907.1011529-1-himal.prasad.ghimiray@intel.com>
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

xe_svm_range_get_pages() already calls drm_gpusvm_range_evict()
internally when it fails with -EOPNOTSUPP. Remove the redundant eviction
call in the caller to prevent duplicate handling.

Fixes: e0ff0d7cf928 ("drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 4432685936ed..871ac81bb04a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -914,11 +914,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (migrate_try_count > 0 || !ctx.devmem_only) {
-			if (err == -EOPNOTSUPP) {
-				range_debug(range, "PAGE FAULT - EVICT PAGES");
-				drm_gpusvm_range_evict(&vm->svm.gpusvm,
-						       &range->base);
-			}
 			drm_dbg(&vm->xe->drm,
 				"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
 				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-- 
2.34.1

