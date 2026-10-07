Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057F2CA5FFF
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91A110E6CC;
	Wed,  7 Oct 2026 21:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMmQ+4mf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82C110E6CC
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407677; x=1822943677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eND4YuKI+B3w3n/meJldmSLJWG5Q3QRquix24XTOu7Y=;
 b=MMmQ+4mf0NgBPLaBS8CNpTrQ0dFxdyrPdhGPoygdZXf8OHEJQr2XIJzQ
 am6pjud69MRBZZxOhV1zhGpTdrrTuT35xEVxijGw/DdGNsVMw/q5ZOtVF
 0MpjDyKvexHIlv+7nI64W2g+S5aCqS7JmolvMru5iLBUsRA1s1ahi6f+7
 Sec4tx1GX/jA1C53rkxrBkIcTCALTdaxD+k/hgKJOnS9I0p6UVjiVDCHw
 L/KqTSDKm8WDnhWoZBrw9F4o/g6LVdKoFZ3+R8CQIY1gAZa68U3J26K6W
 yffAwy/kwVPlIY1qBs2MaBdD+v0+VSnc2F8irqV2HBA3czrlY9Vt38HWr Q==;
X-CSE-ConnectionGUID: Mrun4Ga0T7eIpFj7C2AkCw==
X-CSE-MsgGUID: 4QzYE2jESVSRlZw6sXzfGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="77186"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="77186"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:14:36 -0700
X-CSE-ConnectionGUID: Ts9J51FNQkejVwqpHrxnXQ==
X-CSE-MsgGUID: IITtu74cRUmjtxUOrEjRVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="305526896"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa001.fm.intel.com with ESMTP; 07 Oct 2026 14:14:33 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v5 10/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
Date: Thu,  8 Oct 2026 02:44:15 +0530
Message-ID: <20261007211417.2093611-11-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
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

Replace xe_tile_sriov_err() with xe_log_err() using the LMTT component
tag for LMTT and MERT invalidation failures, preserving the SR-IOV
prefix in the log message.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
v2:
 - Drop logging error type in log (Mallesh)

v3:
 - Add trailing newline(Mallesh).
---
---
 drivers/gpu/drm/xe/xe_lmtt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0c726eda9390..b6b3d892a35e 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -14,6 +14,7 @@
 #include "xe_bo.h"
 #include "xe_tlb_inval.h"
 #include "xe_lmtt.h"
+#include "xe_log.h"
 #include "xe_map.h"
 #include "xe_mert.h"
 #include "xe_mmio.h"
@@ -302,14 +303,15 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 
 	err = lmtt_invalidate_hw(lmtt);
 	if (err)
-		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
-				  ERR_PTR(err));
+		xe_log_err(tile, LMTT, err, "%s invalidation failed.\n",
+			   xe_sriov_printk_prefix(xe));
 
 	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
 		err = xe_mert_invalidate_lmtt(xe);
 		if (err)
-			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
-					  ERR_PTR(err));
+			xe_log_err(tile, LMTT, err,
+				   "%s MERT invalidation failed.\n",
+				   xe_sriov_printk_prefix(xe));
 	}
 }
 
-- 
2.54.0

