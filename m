Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4D6CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EED10F077;
	Mon, 12 Oct 2026 12:25:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB5810EF66
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791807932; x=1823343932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=phfzyIYq6ZAqs9QKmkI5dAX4m/+4pGPL5oC5zP6jDqk=;
 b=OlNKE46gE+lM7uXgi1uOkMNszzmnFwXnJW408d14Pjdy1rs7GjBA5ndI
 aPBIm0u7W7HiyIGaC4QcDeSL5Ni7mTkTCWK26mBK6KRavQjQj8/eZdZ5x
 Ymkegk0OD7T9yMTqtSmzt3BX2uA8CSPiUILinhm1nvDtTAmDCy4eIm7mB
 oQIzOXNPjeLaQO5bLZQ5I/cr/OOipo0p59DKmMzggMgg8F9jjhEvUYWZz
 +iRCq/FEGaqmSc+57w/qDqJun4KE5UmrsJmCKs/nM6rAmsMRFVVd4bN/+
 EMlvhnhUVorKdv4V3jSDCtvCETVaA6F5KMww4yEabN8cIUHAf6GE5EEfN Q==;
X-CSE-ConnectionGUID: zTUY2NIjQmaMcK07FR+rng==
X-CSE-MsgGUID: cLaA9bgfSZCxLuVuBOyRZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="522903"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522903"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:25:31 -0700
X-CSE-ConnectionGUID: TnU9MULOQHe3hCw6JMZPrQ==
X-CSE-MsgGUID: E2tLf/+0Qc68H/CeSEz81g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="962792"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2026 05:25:30 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v7 05/12] drm/xe/memirq: Report errors using structured xe_log
 API
Date: Mon, 12 Oct 2026 17:55:14 +0530
Message-ID: <20261012122522.2307625-6-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
References: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
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

