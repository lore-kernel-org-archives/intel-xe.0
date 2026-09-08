Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CD5C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D49510EAF4;
	Tue,  8 Sep 2026 10:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iukmrP5E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF96210EAF0
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788864360; x=1820400360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1z9q5usOTnccWMTCf6Z87I/++zF1ResJabKCHI7HqnA=;
 b=iukmrP5EWo1Q8qtflIYJnf/DHfV0zUi11DFl5yhGiUBvE+MGSIk6L5/A
 Y5PLi24uQfISSC6a4SbzFfy2cruUCFCTy1QfC46OT2q5G3s8LAmAtBdU5
 7yu4T6p9BjrQalFu5JcnxHCFimHNBiiQrKDcwwB9Z4TsAWTISVjKfB9c3
 WSkY7yunNLJ3LjyxDA5i2Yx1Bp4nkm08D2BeLoN4ZPYklbrRjNJbhH85S
 L3pJs1SFyV1b4XpVqbLcHIVrw7cuPi2VmMWt4d7D8i8R1opYV2cewBliP
 TyOL6Zz9vpvO2cQ7ni07LUVnuxF7VknGZID5UDGnrSS7WhpM3r4S5PqwX g==;
X-CSE-ConnectionGUID: 5F28AYzTRuOA2PD82OkfYQ==
X-CSE-MsgGUID: ecf0nlNLSmOHsm3/CfTIDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91773076"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="91773076"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:45:59 -0700
X-CSE-ConnectionGUID: QNfJ9f+NTueBbUEmGqhxRw==
X-CSE-MsgGUID: hhOgnaYWTIKVnMeM3r3sFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264759089"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 03:45:58 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v3 06/13] drm/xe/reg_whitelist: Report whitelist overflow
 using structured xe_log API
Date: Tue,  8 Sep 2026 16:15:43 +0530
Message-ID: <20260908104550.1283933-7-dnyaneshwar.bhadane@intel.com>
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

Replace xe_gt_err() with xe_log_err() using the REGS component tag
when the maximum register whitelist slots are exhausted.

v2:
- Use -EOVERFLOW on max limit reached (Mallesh)

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index cab1b578ca0e..b15004fc5761 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -14,6 +14,7 @@
 #include "xe_gt.h"
 #include "xe_gt_types.h"
 #include "xe_gt_printk.h"
+#include "xe_log.h"
 #include "xe_platform_types.h"
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
@@ -186,9 +187,9 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe, struct xe_reg_sr *in
 		};
 
 		if (slot == RING_MAX_NONPRIV_SLOTS) {
-			xe_gt_err(hwe->gt,
-				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+			xe_log_err(hwe->gt, REGS, -EOVERFLOW,
+				   "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
+				   hwe->name, RING_MAX_NONPRIV_SLOTS);
 			break;
 		}
 
-- 
2.54.0

