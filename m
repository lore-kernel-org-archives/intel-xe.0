Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78412CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 13:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2810D10EFD1;
	Wed, 17 Jun 2026 13:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWv6A/Kw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E5110EFDB
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 13:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781704267; x=1813240267;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DzX4B22e+ZBcvpsLO3KA/tyP04THydC26Y3IgO6VQw8=;
 b=CWv6A/KwSsUNn/QSd3GuTLPkF+XD0AkIF1Au3SWX51wRJKVNq4SgfGwu
 cVFtV5gx+lqC3snOEam+p3Kv5MP1zX5cmGcduKyOXtjSWMbn3K1EAneOa
 FC2Ma1nRdriWi6EnsnQ/35fqIeu2qJeQDdaf+fcUlNg6/u9jHMd1unS8J
 xIdkc+EjldpHMLnscpTd/BA30aAj/cRB5yX68BU6h0uf5G4vHzCrMrU4o
 YsZb+vkWOBhVxJEx8K1EcwEmxOKC6bExQvBxRv9sthfpd1w6HWNJsj42o
 5ri4JOXapDhnXKOTnSWzxK9bUFvMw3CiFlNVk0+VqEIXgcB6xdb4kO6Ao w==;
X-CSE-ConnectionGUID: q8VMb22WRhueM3ISQVbA6g==
X-CSE-MsgGUID: SGGbCU7dTgCxQWlyUpXXIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="92850022"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="92850022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 06:51:07 -0700
X-CSE-ConnectionGUID: 1VdM6R0jRr+0+W2gGNPhQA==
X-CSE-MsgGUID: 920+BSpoTQiN4K9qn20DNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="247935231"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 06:51:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Return error on non-migratable faults requiring devmem
Date: Wed, 17 Jun 2026 06:51:01 -0700
Message-Id: <20260617135101.1245574-1-matthew.brost@intel.com>
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

Non-migratable faults that require devmem incorrectly jump to the 'out'
label, which squashes the error code intended to be returned to the
upper layers. Fix this by returning -EACCES instead.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: ("4208fac3dce5 drm/xe: Add more SVM GT stats")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 03cfbf831257..2d8448e5b2fd 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1280,10 +1280,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	xe_svm_range_fault_count_stats_incr(gt, range);
 
-	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem) {
-		err = -EACCES;
-		goto out;
-	}
+	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem)
+		return -EACCES;
 
 	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
 		xe_svm_range_valid_fault_count_stats_incr(gt, range);
-- 
2.34.1

