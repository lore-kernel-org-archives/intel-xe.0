Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EB3C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364EB10EB09;
	Tue,  8 Sep 2026 10:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAS6oxdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE1E10EB10
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862747; x=1820398747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h66M8dfP/HxsO9O7DUaSY77OSdvFJlSwcZsUNlyEDmo=;
 b=OAS6oxdSERhgEClMYDf96ZZHA/dp5iCHgwKin7Km59sW5WnDQ1cC8pfM
 fpSTQ9kTIi8vt+tY8XMdA6eQfDcBnjRS6md4Fah4c0tY7H5gLTz2MPju4
 9FNmAOBeF3K9Gc1sjFC2/8lF0rBRR8j5oawwhLJ2IEfKsFlDK1uj3nyhW
 7du75ojEFwL0QjMNaYuAHIHS53eRfTKLcUS8zGYJcakOG1P2Rq6B9n1Zv
 ev8Y5sIygqUrQ4qxNnhUxMSROM2axxwUHJw7gq2JZbqYP6EGNh73I8BjP
 4U+7CEgNYKLQqeiwQ5GCf+XtMERPGHW1KbCx7SDJxsFEDsrfcJI38tvdZ g==;
X-CSE-ConnectionGUID: 4WtLDvcETVSGIhvs33GXcg==
X-CSE-MsgGUID: MbiVwBtAScCeBNuy7aS5eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278281"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278281"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:19:07 -0700
X-CSE-ConnectionGUID: H4b/n112S9u5OvlVIGueDg==
X-CSE-MsgGUID: ww7WfClbQHWMTdGGrCIKkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628474"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:19:06 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 11/13] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
Date: Tue,  8 Sep 2026 15:48:47 +0530
Message-ID: <20260908101849.1219614-12-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
References: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
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

v2:
- Drop logging error type in log (Mallesh)

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0c726eda9390..fe77b3ec0680 100644
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
+		xe_log_err(tile, LMTT, err, "%s invalidation failed.",
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

