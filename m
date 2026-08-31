Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFA6C624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9357B10E6DD;
	Mon, 31 Aug 2026 08:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uu1afA0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E5B10E6EC
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788163530; x=1819699530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5KabJfHnQuefGLUpdHgLhXdzYytQ8HAl5zD+EHctX30=;
 b=Uu1afA0P4DyXqFjQdcTrZUukKTstnQVURhZeN4R+mFxHSbrSbWJ/74tA
 +hGgmWfj3dOx+BEqNXbEMhryT6dFNac27lNkvTr2aOuApb0k1m/0OgydN
 BVLt0q2hSTnlyO5MHobvPxm+NJVWDKsbcnbhEW+Rg5FzYkKbNsl7dm9hZ
 kUzFUW4cxw6899y1D6vLROqfYN6qyxuXFV/Ub52r+nUYBkx0GTGyqhWpN
 RN5TlgyMwFj93m9oZ2Ft+cinF7l+vGxRckjnrAYbfmH+o4qETzE7HihRT
 9N73iueCh62tOjnxDEF6LRnerfbIgtYUyIWEdwlZEp3Uf/l0Xjh+XUhY4 Q==;
X-CSE-ConnectionGUID: 8EZT/KnMTFSJ7x++eEP+/g==
X-CSE-MsgGUID: MMMLSIq4Smy6s0v3c3JriA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92251040"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92251040"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:05:30 -0700
X-CSE-ConnectionGUID: FIZ0nPJKRV63SIJjhkReww==
X-CSE-MsgGUID: f8Hqr19xQE2kB3xXWzkbkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="268172167"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:05:28 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 3/4] drm/xe/svm: Report terminal page-fault failures using
 SIGID
Date: Mon, 31 Aug 2026 13:35:06 +0530
Message-ID: <20260831080507.2364687-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831080507.2364687-1-arvind.yadav@intel.com>
References: <20260831080507.2364687-1-arvind.yadav@intel.com>
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

Route terminal SVM page-fault failures through the structured SIGID logging
helper.

These errors are reported only after the retry count is exceeded, so they
represent terminal page-fault handling failures rather than transient retry
conditions.

Use the PAGEFAULT component, which maps to XE_SIGID_MEM_FAULT, and pass the
real errno value to the helper. Pass the GT object so the report carries
tile/GT location. The helper renders the errno, so remove the manual
ERR_PTR() formatting from the message text.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 627a741293d5..349e307ca092 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -13,6 +13,7 @@
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
+#include "xe_log.h"
 #include "xe_migrate.h"
 #include "xe_module.h"
 #include "xe_pagefault.h"
@@ -1361,9 +1362,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 				else
 					goto retry;
 			} else {
-				drm_err(&vm->xe->drm,
-					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
-					vm->usm.asid, ERR_PTR(err));
+				xe_log_err(gt, PAGEFAULT, err,
+					   "VRAM allocation failed, retry count exceeded, asid=%u\n",
+					   vm->usm.asid);
 				goto err_out;
 			}
 		}
@@ -1384,9 +1385,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			range_debug(range, "PAGE FAULT - RETRY PAGES");
 			goto retry;
 		} else {
-			drm_err(&vm->xe->drm,
-				"Get pages failed, retry count exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
-				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+			xe_log_err(gt, PAGEFAULT, err,
+				   "Get pages failed, retry count exceeded, asid=%u, gpusvm=%p\n",
+				   vm->usm.asid, &vm->svm.gpusvm);
 		}
 	}
 	if (err) {
-- 
2.43.0

