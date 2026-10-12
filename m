Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F98CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B1710F082;
	Mon, 12 Oct 2026 12:25:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9108310F082
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791807941; x=1823343941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0FWoxpen/jUAwdxbGyeGEqBNepq2lPjcXmq1ULniERE=;
 b=e1YcQ6wN729HFFwcq/V/qhR3bS0wR706zllSdNBPtFJlgrHcep8Ql8xX
 5qEcEjg3snUUPLtrRGOTxIWrFoasd88W44Pt8vmXmHZEp4M2Abfc93040
 Df/aGC3EvQHsASDq82/lU0uC6h17bunintu4zs07enEC0+sVeEefczC1c
 1ZnLyPlj3ihOrUiBE7arvcV8z4Lf2tzJL0draYwA8QTfESH2Eit0CIZur
 8BjtscearfonfMUD66rnjmymVFPgggBBvj9gQKtvnGEyjOA8qptW6r4VQ
 bpfG9Hb7aT7iFS7h0YkZJI/t7SJ7d89sIwb9AuwczTtnFn1GpFm854s6F Q==;
X-CSE-ConnectionGUID: oJjzxhkPRr+VAgchjEm5Eg==
X-CSE-MsgGUID: A1O6GOvIQYGMXwxEwDoc0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="522914"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522914"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:25:37 -0700
X-CSE-ConnectionGUID: jNTYq7AnR7Kt+2R0RLAtQg==
X-CSE-MsgGUID: w5f23VwUTFup1QfH9LTvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="962810"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2026 05:25:37 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v7 10/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
Date: Mon, 12 Oct 2026 17:55:19 +0530
Message-ID: <20261012122522.2307625-11-dnyaneshwar.bhadane@intel.com>
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

Replace xe_tile_sriov_err() with xe_log_err() using the LMTT component
tag for LMTT and MERT invalidation failures, preserving the SR-IOV
prefix in the log message.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

---
v2:
 - Drop logging error type in log (Mallesh)

v3:
 - Add trailing newline(Mallesh).
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

