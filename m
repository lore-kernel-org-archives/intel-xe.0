Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37A4C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D10110EB04;
	Tue,  8 Sep 2026 10:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftymYqMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C8C10EAFB
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862736; x=1820398736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f7QzSOA+aQqSYJRXWO58wKslQLqYfklKChIUDid2sj4=;
 b=ftymYqMca6QsDeLXoNPTud2wdskV+UJAZEjvNT+PBE94Vr8TN8MpXOmH
 d4qtUuPAzr6FTD2Hma0rmegdFfssfzFsnR+ioYjjYMQZLpfOnhEDB3RZe
 x7L9/w7uLohS6vw73HZdAkhoeE1q+8DtPXrJ7tEN8Sco1hqZ7tTpGHLTf
 /arn5Ki/LcBT7n2W9MyGZEltA4J/eraNcglbXzWiz05rJaecQ67stbQko
 x1+TK0cRE/G4QxmoakhlY/1ClFibLwAeDcI5FFEF233Rvp88T2j0I/Bfi
 4UDvf3/jMJt2XupH7EY9oOME8jo0n+7M9r/KKa+NF+lZcEbZ8B/JSOgDi Q==;
X-CSE-ConnectionGUID: wiVgdBB7Qc+QSydXqp9FxA==
X-CSE-MsgGUID: cSYiYHClQIqlVB8EAtb5AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278266"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278266"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:18:56 -0700
X-CSE-ConnectionGUID: QLksHgsaTgiD0zlcivCfYQ==
X-CSE-MsgGUID: MxnJdqIDSe26JR8YpJzLUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628423"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:18:55 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 02/13] drm/xe/ggtt: Report GGTT errors using structured
 logging
Date: Tue,  8 Sep 2026 15:48:38 +0530
Message-ID: <20260908101849.1219614-3-dnyaneshwar.bhadane@intel.com>
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

