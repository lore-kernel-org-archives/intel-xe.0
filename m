Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A8FD2503B
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 06:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECDA10E2C9;
	Mon, 12 Jan 2026 06:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKHEttgp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DD410E2C9
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 06:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768198701; x=1799734701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LGF3+qtefGjfDs9HO1mwCZUw0LSFDfHrblFZBa+yMEA=;
 b=RKHEttgp/9LmfqzuDa4ityuDqk45qbEarV6ocYzZzDJfzpcRNfEliNUk
 LGiVYLMo3oHcdnkau8Sgj3APAnFIVRjgMJbJEJ0F22cnZ/NmUXl1ql5lr
 cTxQsfcf8Vh0eAT4rjXEeTQWBhIPHtsII0QeTywvFAXxPyUz3SUdqjlnN
 ggzpoxnPq1AZwWmOy/JLmuPEHBRwJrAUOelocLy9L1uQoSVlwK+7Jn4cY
 ezWBN/6dNmjGRt9ay2CuhEl0ZY32J19fRHZ88xo6yRDgmUQn13gHaTQd5
 nIIZ3OKy6YGAFGrYecoMt50G9jb494+LHDWPx/cFHulwmHwJdxRhc4nrY Q==;
X-CSE-ConnectionGUID: rJsj66rSRCa8jj4VC595wg==
X-CSE-MsgGUID: 23IEmX8zTa2P8LMK5LmUFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80574686"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="80574686"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 22:18:20 -0800
X-CSE-ConnectionGUID: 8bcML3K+RUqT2hPw+gpCWg==
X-CSE-MsgGUID: 86A4KFiyReOvywgeqb2IKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="241539284"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 22:18:19 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 1/2] drm/xe: Coalesce pagefault error handling
Date: Mon, 12 Jan 2026 11:47:57 +0530
Message-ID: <20260112061755.1569635-5-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112061755.1569635-4-varun.gupta@intel.com>
References: <20260112061755.1569635-4-varun.gupta@intel.com>
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

The page fault is only ever printed on when the fault handling fails.
Use a single dbg with the fault response status and its details.

Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 6bee53d6ffc3..34dac4280b9d 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -221,7 +221,7 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 	return found_fault;
 }
 
-static void xe_pagefault_print(struct xe_pagefault *pf)
+static void xe_pagefault_error_account(struct xe_pagefault *pf, int err)
 {
 	xe_gt_info(pf->gt, "\n\tASID: %d\n"
 		   "\tFaulted Address: 0x%08x%08x\n"
@@ -259,7 +259,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 		err = xe_pagefault_service(&pf);
 		if (err) {
-			xe_pagefault_print(&pf);
+			xe_pagefault_error_account(&pf, err);
 			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
 				   ERR_PTR(err));
 		}
-- 
2.43.0

