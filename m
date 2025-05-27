Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFE7C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE38210E525;
	Tue, 27 May 2025 16:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lz0bMVZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0E210E193
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362083; x=1779898083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QPApq2vPhBcmtDgxrj5rVcNpI3HlCZhp7aipy9NnY5s=;
 b=lz0bMVZDMWYupnSeeWsuLORZLw6PRz5CCdDOWvrk28wdwJwtK+8C+8gE
 XAfRNrsec61Gy7GjFlATkZBsCo6NylaffNNnk+mFTiZXwLYlI34q+QnDF
 SBGwyZn1Da/lP2vhG+VIqTN/JlpnqTxwL4L3T18/wk9OJYeHGIKXjcc1b
 a1CGXp1QaOSeyxWWngrvrDqRlhw+BeB405Z/CgfPD0mSqhL5n48Y1p6lC
 JGMzZoI7T92q4Y94vXCqV6yF6lNqz5jMVRdjRGnFGI/Tr8q95gAiQrIsL
 Sk5nvcOFPmcimfZuJTGEyCZiEAn4e6yCk9B7NqLFY//BtLa6oYoxAn9Tc g==;
X-CSE-ConnectionGUID: RVOvdffDT56W8P7z5hr8wg==
X-CSE-MsgGUID: D1owZbcdSOyi9bIZaWpOEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60614446"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="60614446"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:07:58 -0700
X-CSE-ConnectionGUID: lwinZzQ7Sr2Z42QwfSQTmg==
X-CSE-MsgGUID: KkEWn2o2STO4KW9CvM5DFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="142837350"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa010.jf.intel.com with ESMTP; 27 May 2025 09:07:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/1] drm/xe/svm: For atomic operations,
 continue with page fault handling
Date: Tue, 27 May 2025 22:03:40 +0530
Message-Id: <20250527163340.1067968-1-himal.prasad.ghimiray@intel.com>
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

Ranges might already be valid but lack AE flags in the PTE. Therefore,
continue with rebind of ranges for atomic operations.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 4432685936ed..d42d5df28115 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -884,7 +884,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
 		return -EACCES;
 
-	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
+	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only) && !atomic)
 		return 0;
 
 	range_debug(range, "PAGE FAULT");
-- 
2.34.1

