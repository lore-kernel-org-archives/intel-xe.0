Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8B3C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 09:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6408910E497;
	Fri, 28 Aug 2026 09:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RV4uZUtQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2F110E497
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787911102; x=1819447102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dmf3SCIjYBrNRGEFTITJHdDIVvOghIc8L3Tcv5d53Xs=;
 b=RV4uZUtQO0Byn7E3BS3BMbeAMK4ctUjRNv9zfxosEF6APk8CUmPB7vf/
 RGw9Rli2XrH+09YKRtPPaZBLa/xh/uVOrHDpuo2ElD0IkfieKmCP3UHhm
 sYKKrBK/TmWTd7aYfABrcp0RE0Em61P5d/sAnfcsTgza3mAgaJB0Cd0b/
 584ACel4G+Yy/RXXyXELm08dSQrbND0pbPTcCVjPEnFCoc40IJL2FS3BT
 SlCwZBhNTJq+tSKN16ys80AlLmLe3KVnsf+26KvIV+m0WUYHbif0QXJjN
 XtmyT8bUD8c1KnDfiJDKHhoWcE5RdPotTDfPKzOoXqwE7zT5JsgyA+UXu Q==;
X-CSE-ConnectionGUID: g6buBy0YTEq6fAxz6Gdltg==
X-CSE-MsgGUID: +YrHMOWjSt2C1qjdXP+LMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99084939"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="99084939"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:58:22 -0700
X-CSE-ConnectionGUID: 0RT8yYUvSY6eDMVW91gPnA==
X-CSE-MsgGUID: 4X/B0MTuRua/KX6PbwFflg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="272338902"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:58:20 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v4 3/4] drm/xe/svm: Report terminal page-fault failures using
 SIGID
Date: Fri, 28 Aug 2026 15:28:02 +0530
Message-ID: <20260828095803.2130312-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828095803.2130312-1-arvind.yadav@intel.com>
References: <20260828095803.2130312-1-arvind.yadav@intel.com>
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
real errno value to the helper. The helper renders the errno, so remove the
manual ERR_PTR() formatting from the message text.

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

