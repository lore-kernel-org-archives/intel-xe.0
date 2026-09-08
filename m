Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DA3C79FAD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250CB10E0BB;
	Tue,  8 Sep 2026 10:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbMSdFsK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC5910EAF7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788864358; x=1820400358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uG2/9wCPyn8+LVsrJSGGfVPbOMN47v/7mr6YE84WmZo=;
 b=YbMSdFsK8J7VX6C7+wmjgGo5VWhg8VK0+4xSnFNYGucg9aeCf11n+3nK
 p+RvCm9W9G0I9QAVJYvDkL4mBymqKNGGsV57cXMoYHMPVD07aszFUBIeI
 M64M6w5bEOfD99Ex85YW1CyjuhUyr6COQzYl0NH6Gyds1R+umjMFLo8AG
 TYmd+YGZ9/x0FuiJtr42i/m+UAuqtdPY9V4zNlonu6xvPUZ/dydH2Zhvh
 SV4TzuY/rQbyGWR3aHNiyg2gTJ9lhN3wKFZdRq7D1l71DZ9ChVpOh0I35
 MfndNrh64nugLjg6bnW3dYcHWztEtN00l0JoRBrkpVbvs4a8O2NBDXm/X w==;
X-CSE-ConnectionGUID: PPuk2GgqQ32SVLFxyrvF3w==
X-CSE-MsgGUID: 33qfCUIBRtapLbDo0nJqKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91773075"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="91773075"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:45:58 -0700
X-CSE-ConnectionGUID: hTYOfpB+S2WEkzoVa86m0Q==
X-CSE-MsgGUID: dWJlisDnRMmXUpnyF9SXdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264759084"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 03:45:57 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v3 05/13] drm/xe/memirq: Report errors using structured xe_log
 API
Date: Tue,  8 Sep 2026 16:15:42 +0530
Message-ID: <20260908104550.1283933-6-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
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

