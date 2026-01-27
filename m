Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD78D2F000
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 11:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72E710E551;
	Tue, 27 Jan 2026 11:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKPbiFTT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44BD10E551
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 11:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769515058; x=1801051058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eg3MBYFQgtPHPfkmPyduSH2nPejLYXlhrtiXoZjAX1k=;
 b=dKPbiFTTm9wdEMVXUXgy3mzttWhq66uKEe4AFJ/RODj6gtX5IB2hNzRE
 9+D2mFD82XhmRTQHlCIDqPacinih+atPpBSiIZHq1dFQlPH9C+ZRP4DaX
 eQKCbpuK09zcS7rSyOTtu2fNXg2iv80upTLFfnEBC//w0PCSunIxDF4SS
 wJGBqUSvMUJ1PYGWp3JKX5NypZqRJ47id9vlci5s0KiXPVq8YnMRGpX6S
 bpmVw9luwBpVStH5QQxLpzO0dtpXd4XYoltWLaJcZ61jPSxt/ZQfhTC9T
 8Ap/ZFe4/aqxzD4orHbInOIJLOikY5S8F+VXKKGe1DRhyJE57rgws5IuZ g==;
X-CSE-ConnectionGUID: sWw1uIe0S2mWD03AZRNeLw==
X-CSE-MsgGUID: 0YEr9jOxQqesLP2FXZ+85A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74330359"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="74330359"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:57:38 -0800
X-CSE-ConnectionGUID: 6xS7GzGsR3a3GG/vxfkdjA==
X-CSE-MsgGUID: B0rsTo7mSVizXK+jDZTPrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="245576201"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:57:35 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com,
 priyanka.dandamudi@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 1/2] drm/xe: Rename xe_pagefault_print to
 xe_pagefault_error_account
Date: Tue, 27 Jan 2026 17:27:12 +0530
Message-ID: <20260127115713.869000-2-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127115713.869000-1-varun.gupta@intel.com>
References: <20260127115713.869000-1-varun.gupta@intel.com>
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

Rename the function to better reflect its purpose of error handling.
Add an err parameter to the function signature.

v2: Clarified commit message to describe only the changes made in this
    commit (Matt Roper)

Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
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

