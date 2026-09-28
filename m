Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77725C9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CEB10E901;
	Mon, 28 Sep 2026 09:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAXHiO3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3445710E840
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790587445; x=1822123445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f7QzSOA+aQqSYJRXWO58wKslQLqYfklKChIUDid2sj4=;
 b=RAXHiO3CtnhAj65ANvWz8YKNNhQofYXMl5qyM6LCwat+bSLbi7/ZKagC
 zADOX3YLEHE7mvKp8WPyDkPjTuqyEU+xgk2J95LN2hl0v5MzEWxoxCkx0
 ZCD93zOMSOXCFdW9BBcQ+6iW6AhD4m8lzIvhJ37UYo++yVtA3T51A6iVT
 Mtkg/UEhML6v7xwKUByFxBqVect3CQDOG0e62CxhXBkEdMtthcPSVdN/t
 R7g6nTnIU1oCqcCSp+hJN4FJU8Gal69RxvWTmirM055RI2JNxrwuZ1blj
 a1zKb3LGISnJGhO68MPEO9e+fT5UHl1Lspsl9ccI286cDwV5NpNj0uEKT Q==;
X-CSE-ConnectionGUID: PGgWvFOuTLC8tUnm0z/Nsg==
X-CSE-MsgGUID: KA8Tm26UTBWPoY9FIjvUeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78845446"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78845446"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:22:19 -0700
X-CSE-ConnectionGUID: uB7MUgBAS/eAKjW0TqJ49g==
X-CSE-MsgGUID: J+fV16VeQwCTHNrAIlrD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="283078002"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 02:21:19 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v4 02/12] drm/xe/ggtt: Report GGTT errors using structured
 logging
Date: Mon, 28 Sep 2026 14:51:04 +0530
Message-ID: <20260928092114.1610203-3-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
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

Replace xe_tile_err() calls with xe_log_err_fatal() using the GGTT
component tag in GGTT initialization error paths.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 63e8bf193605..773777afc68a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -23,6 +23,7 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
+#include "xe_log.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pat.h"
@@ -403,7 +404,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		else
 			gsm_size = probe_gsm_size(pdev);
 		if (gsm_size == 0) {
-			xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
+			xe_log_err_fatal(ggtt->tile, GGTT, -ENOMEM,
+					 "Hardware reported no preallocated GSM\n");
 			return -ENOMEM;
 		}
 		ggtt_start = wopcm;
@@ -414,8 +416,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 
 		if (ggtt_start < wopcm ||
 		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
-			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
-				    ggtt_start, ggtt_start + ggtt_size - 1);
+			xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
+					 "Invalid GGTT configuration: %#llx-%#llx\n",
+					 ggtt_start, ggtt_start + ggtt_size - 1);
 			return -ERANGE;
 		}
 	}
-- 
2.54.0

