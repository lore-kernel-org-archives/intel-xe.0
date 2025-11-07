Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524B0CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B8310EB65;
	Fri,  7 Nov 2025 18:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mETcYc+V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11CF10EB62
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539065; x=1794075065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X/0k6vmKIqqd8U2sXu62itKZSsNFibK40N8g3AsIiG8=;
 b=mETcYc+VwYx3UHImo7+RZw4e6vfWsaL7qO8yqLmSvjQdK1b3RmtfoG77
 b+x0yOJSlG3Dgk1UBr41MRw33M9OH6ZaLp0y2uHAWs76keGNAXeCPrxiX
 EzWvDNw+tLbHqKvmNN5zglzJSJrh+Q8J7dtyvLYDclFqfA/r9kW6C9J6H
 f7d9gscmlG+ybVOE5XA6YyCM0W6gv4Zt3BR7dcY23RgT4feNTYvEg16Yt
 lyyr6CvMjQ74OmMt28DJBtcYdVdMd+uwRuTQkR+LNof7Q+DMv7PT752cr
 E094aoM5y3tyIIN5Zgvg7bIMJLM5NXDSoNCNDXNylRvrgbDMtbYaIpw4U w==;
X-CSE-ConnectionGUID: 8TdZ1PghTFC9QxSDvAMDcQ==
X-CSE-MsgGUID: GeDbAo2sSkuR79GPIVojXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="68531489"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="68531489"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:11:05 -0800
X-CSE-ConnectionGUID: L7ZoGgQ7QrCFZWaGKTsliw==
X-CSE-MsgGUID: Kej7qsBJT3WuNJvU+2p10g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="187398534"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:11:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 1/2] drm/xe: Coalesce pagefault logging
Date: Fri,  7 Nov 2025 10:10:24 -0800
Message-ID: <20251107-pagefault-prefetch-v1-1-93291d619126@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107-pagefault-prefetch-v1-0-93291d619126@intel.com>
References: <20251107-pagefault-prefetch-v1-0-93291d619126@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index fe3e401450129..68bcc25f27890 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -222,15 +222,17 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 	return found_fault;
 }
 
-static void xe_pagefault_print(struct xe_pagefault *pf)
+static void xe_pagefault_print(struct xe_pagefault *pf, int err)
 {
-	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
+	xe_gt_dbg(pf->gt, "\nFault response: Unsuccessful %pe\n"
+		  "\tASID: %d\n"
 		  "\tFaulted Address: 0x%08x%08x\n"
 		  "\tFaultType: %d\n"
 		  "\tAccessType: %d\n"
 		  "\tFaultLevel: %d\n"
 		  "\tEngineClass: %d %s\n"
 		  "\tEngineInstance: %d\n",
+		  ERR_PTR(err),
 		  pf->consumer.asid,
 		  upper_32_bits(pf->consumer.page_addr),
 		  lower_32_bits(pf->consumer.page_addr),
@@ -259,11 +261,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 			continue;
 
 		err = xe_pagefault_service(&pf);
-		if (err) {
-			xe_pagefault_print(&pf);
-			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
-				  ERR_PTR(err));
-		}
+		if (err)
+			xe_pagefault_print(&pf, err);
 
 		pf.producer.ops->ack_fault(&pf, err);
 

-- 
2.51.2

