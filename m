Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99D0CA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDEE10ECA8;
	Mon, 12 Oct 2026 05:19:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A2D10EC8C
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782377; x=1823318377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=phfzyIYq6ZAqs9QKmkI5dAX4m/+4pGPL5oC5zP6jDqk=;
 b=Ge75cme/alGmbLRBq8UdyMeekZQyiLVbXnbeq2K1aTi2vXrPlgEOJUU9
 4OD++RaLiuT0Tb1sz5WK159edBWNHsI88GrrpgFridNK9L+/D5sMGglgY
 y8pL+OIsl6XsRiJ1iyLA4mBmFHqDYNZZpYoMlp5Lh2L3FmzxcqedN8aul
 +PL8BCCGuL5uK5vVWnSPYRxatrs00P2pvcW8aLpmhJdJgIN22I++gSEQ8
 rNVQtdpJ8M99GS4xfi+8+N7ezWNyZUQRJNavPoqZJNuv4j02kmODXuwHK
 oBJNCcrSkPmkNawOMKywTXu479iCjBm0PPJ0rkCLvc3Fpoj0CVsWQ5Y3f A==;
X-CSE-ConnectionGUID: CJrR+tC/SWGVsdf6Wytf6Q==
X-CSE-MsgGUID: neDLq0YbQLqPQRn2kgZ9DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="390506"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="390506"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:18:36 -0700
X-CSE-ConnectionGUID: ZudP4IYkTB2XzBB7twUqGA==
X-CSE-MsgGUID: +4UAiFqKTXaKl3CHnFSr7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="735875"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 11 Oct 2026 22:18:35 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 05/12] drm/xe/memirq: Report errors using structured xe_log
 API
Date: Mon, 12 Oct 2026 10:48:16 +0530
Message-ID: <20261012051823.2201360-6-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
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

Replace memirq_err() calls with xe_log_err() using the MEMIRQ
component tag for memory-based IRQ failures

v2:
- No need to log ERR_PTR(err) explicitly (Mallesh)
- Using tile instead of xe for more local log location(sashiko bot)

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 9dfe965cb46e..32b9f87a10ec 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
+#include "xe_log.h"
 #include "xe_memirq.h"
 #include "xe_tile_printk.h"
 
@@ -232,7 +233,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	return 0;
 
 out:
-	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
+	xe_log_err(tile, MEMIRQ, err, "Failed to allocate memirq page\n");
 	return err;
 }
 
@@ -370,8 +371,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	return 0;
 
 failed:
-	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
-		   guc_name(guc), ERR_PTR(err));
+	xe_log_err(memirq_to_tile(memirq), MEMIRQ, err,
+		   "Failed to setup report pages in %s\n", guc_name(guc));
 	return err;
 }
 
-- 
2.54.0

