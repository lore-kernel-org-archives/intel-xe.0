Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDEFC5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7925210EEAA;
	Wed, 19 Aug 2026 19:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sb2/H6JD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E6410EEB5
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166903; x=1818702903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aW2viNrEM/X6uhQc2nrh9OzZTI7R1V6iQUulhECydfQ=;
 b=Sb2/H6JDAvlVOTtTfTnlFjRv2RjDASu1OB1c/b2xYDjHpRXeg4k7R4Bq
 bn3hYWHxN3G/YMsC+/u1mIh2gDeFRTpSKSzvA9Ci3iq0EwcY3+l+5plp8
 90yUcJbnTHPxnFnRP3dyXx/AU0lLCj7IOx3loUozZJEYcVue0tO/rxHNI
 YuSGuKc6LyCBv5gLYVk+XUNbGD3llFJlEb9n6SbjQEVBiU/n3/RRS1dz4
 eiCPAYw4tIutm6bP2VLARYK2LTwHUNZMX7GQqHatrKhF0Ql/3+zyYP6Ei
 91axfN2H1YyBQOLvc/XQFoJb3IvfrJQKH32/QYQnlPKeIa2VboadmF6+r A==;
X-CSE-ConnectionGUID: DZIll+gqSuaqIS0MlG66Ng==
X-CSE-MsgGUID: dbHSajUuSdyQjJtBn21wJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647300"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:15:02 -0700
X-CSE-ConnectionGUID: HSuuliBxTK6WDRmVsJIC4A==
X-CSE-MsgGUID: GbgOfENjQuexrxiNIp5+FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556778"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:15:01 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 11/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
Date: Thu, 20 Aug 2026 00:44:40 +0530
Message-ID: <20260819191442.1957986-12-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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
 drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0c726eda9390..a9feeacbae55 100644
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
@@ -302,14 +303,16 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 
 	err = lmtt_invalidate_hw(lmtt);
 	if (err)
-		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
-				  ERR_PTR(err));
+		xe_log_err(tile, LMTT, -EIO,  "%s invalidation failed (%pe)",
+			   xe_sriov_printk_prefix(xe),
+			   ERR_PTR(err));
 
 	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
 		err = xe_mert_invalidate_lmtt(xe);
 		if (err)
-			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
-					  ERR_PTR(err));
+			xe_log_err(tile, LMTT, -EIO,  "%s MERT invalidation failed (%pe)",
+				   xe_sriov_printk_prefix(xe),
+				   ERR_PTR(err));
 	}
 }
 
-- 
2.54.0

