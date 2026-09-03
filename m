Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6778EC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 05:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CD110E2E0;
	Thu,  3 Sep 2026 05:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaG3lsIF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06B510E2E0
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 05:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788414393; x=1819950393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cPXqUIZoDbKYEjVNakeVh6roXZFSJjaOXleUHrtUVMw=;
 b=NaG3lsIFPe/drV4CPDD2fVDYYkNPvwDPhQQcFJZ2v9EbSvxVIn6tJXNR
 /0BYNMYdqQapytPSx2DVjg4TADfJADD8FESKnmzbigxfOJuxyFo4vZgo8
 dBXCyNv6uIV/lwGq1rHoLi4Nvz3PAMAhhe/5i1OsyqhVycPOXwcCwJXX3
 bxH/ccW+8bmnKpig4GXzb9vNym0oW3I88hPGzM9xquHdwp0Q66ZyH8cUe
 P16F/cLAq4ZkhIt2XQ8mFZ8TldHCzZqjT4n5e++rdAcHwGkUyEPz21iuF
 N0pVJORqFxkjnSwyCn+5xqrNmdIlBmiGG5LO23F5bKr+FfS7ZObUOngmG A==;
X-CSE-ConnectionGUID: hHZBZha+Q4CfvWWrMS2Znw==
X-CSE-MsgGUID: zzSoT/52R3SMnOV+0f4mtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100398816"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100398816"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:46:33 -0700
X-CSE-ConnectionGUID: AKJjPhEzQ4mVtn9dEMI+5A==
X-CSE-MsgGUID: k1xNhaHFTkSmTJcqep5YVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263447026"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:46:30 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v7 3/4] drm/xe/svm: Report terminal page-fault failures using
 SIGID
Date: Thu,  3 Sep 2026 11:16:09 +0530
Message-ID: <20260903054610.3640788-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903054610.3640788-1-arvind.yadav@intel.com>
References: <20260903054610.3640788-1-arvind.yadav@intel.com>
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

Use structured SIGID logging for SVM page-fault errors after
retries are exhausted.

Report these failures with the PAGEFAULT component, which maps to
XE_SIGID_MEM_FAULT.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
v7:
 - Simplified the commit message. (Michal)
 - Changed "asid" to "ASID" in the log messages. (Michal)
 - Log the GPUVM name instead of the pointer. (Michal)

 drivers/gpu/drm/xe/xe_svm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 627a741293d5..a7fb1b357d8c 100644
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
+					   "VRAM allocation failed, retry count exceeded, ASID=%u\n",
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
+				   "Get pages failed, retry count exceeded, ASID=%u, GPUVM=%s\n",
+				   vm->usm.asid, vm->svm.gpusvm.name);
 		}
 	}
 	if (err) {
-- 
2.43.0

