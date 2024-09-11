Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608F6EE01FA
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 01:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D431F10E844;
	Wed, 11 Sep 2024 01:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5XB1jCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425410E844
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 01:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726017440; x=1757553440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AENDtdRyRfARje2+LGh7YT2TEulGnm+664br7+5yEDg=;
 b=S5XB1jCeG7IkpU8lvHo6jlzgnC0K3LUbGCESiCHbR4/wgrF5fvM38FLh
 c7lXeRfkRTUMsvCbe8X0O3PpKN7unMbmG+uOOUkKWnJEPHamPX09b4eEn
 Q7QB7GI2LEiE1KugJWT8FkdzFVFpuzGfStp+9UaMozOkSfRZWOTXlruRM
 Vuz3pc5tiQjSjyuigQCn6N9TW6VVmT390eI027ONNjeyXROt9K84OMf5g
 gvorbu62K4Y6shPXQt26L7WXXIdfR1McF0jXIrYCzDC3xdBq3PZGB0ND0
 TeQSDUo69aGals1gQtY1khbclSjNVLE6RAgaBY2/K/l1Kr00Bm6JzX6Yc A==;
X-CSE-ConnectionGUID: DalYIT0ISM+ohYL7LTIxSw==
X-CSE-MsgGUID: vp93v3lRQluPsaOCWsnsQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24289874"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24289874"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 18:17:19 -0700
X-CSE-ConnectionGUID: bbtmDkrTTAuBQSE9wrWCQA==
X-CSE-MsgGUID: YU3IPpUHT2C31WBCiGDeeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67056330"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 18:17:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Do not run GPU page fault handler on a closed VM
Date: Tue, 10 Sep 2024 18:18:20 -0700
Message-Id: <20240911011820.825127-1-matthew.brost@intel.com>
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

Closing a VM removes page table memory thus we shouldn't touch page
tables when a VM is closed. Do not run the GPU page fault handler once
the VM is closed to avoid touching page tables.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 730eec07795e..00af059a8971 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -212,6 +212,12 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	 * TODO: Change to read lock? Using write lock for simplicity.
 	 */
 	down_write(&vm->lock);
+
+	if (xe_vm_is_closed(vm)) {
+		err = -ENOENT;
+		goto unlock_vm;
+	}
+
 	vma = lookup_vma(vm, pf->page_addr);
 	if (!vma) {
 		err = -EINVAL;
-- 
2.34.1

