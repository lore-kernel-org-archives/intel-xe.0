Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6F5C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AD310F0F6;
	Wed, 12 Aug 2026 19:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApBRC+H3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5176C10F0F2
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562156; x=1818098156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4uXcAYdiUqdMgXNAuWK+DkaissNYSq8gZp68UBuYxxQ=;
 b=ApBRC+H36zIZrHc13jmMuNuQvWjnZPahSCNIxtYMn3meQcJcYfOM+nR9
 rkNaewjf+KanPWzexrKn1ce/35GwNw/vNXCNAQulrvVb5kvnxkE4CggVZ
 ZHyf5iYVmqNmyHl4/LWQJWGiFiiaGzx0kvJfgqLP8bxPmcfW05SEd9JVu
 cxXVDmmn4aFTxZyHpX2zMR/vzxgCORgELquuUh8TwZ/ClMv5LVoyt3U+W
 kDFKNZZh9zaU9q0jZOdO+RLMFzsqfXJfCisHdwMaAVABsGS5wBwfInG3v
 dTWVyfh7DGXf/W5zjWP6c7u5ztF11aoAJyrSg4DD1OIfrpYvTdB6mrvHo g==;
X-CSE-ConnectionGUID: sYlXArCPTGygwh9/3bVmvQ==
X-CSE-MsgGUID: 9vVl0ASFRdOUX2GccCF5rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987618"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987618"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:56 -0700
X-CSE-ConnectionGUID: UHZPyq0BRwGMFX9PXB38ag==
X-CSE-MsgGUID: bNbpf3ZBSl+D6H7pzLmX+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892126"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 30/32] drm/xe/gt: Report 'Fault response' pagefault error
 using SIGID
Date: Wed, 12 Aug 2026 21:14:46 +0200
Message-ID: <20260812191450.11690-31-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

Report 'Unsuccessful response' error using xe_log_err() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: rebased (Michal) reword message (Mallesh)
---
 drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 7e829c61387f..eb600c466187 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -14,6 +14,7 @@
 #include "xe_gt_types.h"
 #include "xe_gt_stats.h"
 #include "xe_hw_engine.h"
+#include "xe_log.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 #include "xe_svm.h"
@@ -625,8 +626,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 				xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
 				xe_pagefault_cache_start_invalidate(cache_start);
 				xe_pagefault_print(pf);
-				xe_gt_info(pf->gt, "Fault response: Unsuccessful %pe\n",
-					   ERR_PTR(err));
+				xe_log_err(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");
 			} else {
 				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
 				xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
-- 
2.47.1

