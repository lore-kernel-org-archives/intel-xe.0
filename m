Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E0CC71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 23:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E907510E576;
	Fri, 13 Jun 2025 23:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIKBYxPq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693B410E576
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 23:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749856594; x=1781392594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FFrJfzPtojkna9NNjzPqZskdrWuQs8x43SvZeADYfu4=;
 b=LIKBYxPqZ0RQsqnkqnPfESoHDtRWij3et0PlPkGx1Z3BYvBuotlIszW5
 drdmctDEn5R7p9O+91xa7IDDs37C7fvgg8YWbQNNr0gTJxMaKMuHoLm0t
 eq0ltpSl/5Vtzx2M6BOz1FNdYw+/a7ymTmmjF7vQ14JIFV3jfpL7ewfPj
 X/QrwZxfKHPSPiAoiGmyzNWtq/r6zAnhaq9sZXRX823+tZucC7oXi5oYb
 S43h4ISfpxN340twvzLQYfRbHl895IOgW16rFlVy2M8b+/l53Pk46OdZY
 iJqH6czVc8kDsqZLQJDT7oxIsA3WyxE86GNxbHAItpGGOQRRtxQ6B28ta w==;
X-CSE-ConnectionGUID: 7o6RVQzeT12exNBYkdQhTA==
X-CSE-MsgGUID: 9+ZwZdUBS/ew88qhKyBuzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69524195"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="69524195"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 16:16:33 -0700
X-CSE-ConnectionGUID: wpQA9FlXSXangM0HphDLEA==
X-CSE-MsgGUID: 8W2jKMMUR8Kjjf48VVMz6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="147787678"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 16:16:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Do not kill VM in PT code on -ENODATA
Date: Fri, 13 Jun 2025 16:18:08 -0700
Message-Id: <20250613231808.752616-1-matthew.brost@intel.com>
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

No need kill on -ENODATA as is this non-fatal error can occur when MMU
notifiers race with prefetches.

Fixes: 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM ranges")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f39d5cc9f411..971e55fd0061 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2524,7 +2524,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	kfree(mfence);
 	kfree(ifence);
 kill_vm_tile1:
-	if (err != -EAGAIN && tile->id)
+	if (err != -EAGAIN && err != -ENODATA && tile->id)
 		xe_vm_kill(vops->vm, false);
 
 	return ERR_PTR(err);
-- 
2.34.1

