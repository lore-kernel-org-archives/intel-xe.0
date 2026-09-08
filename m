Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36396C79FAE
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC4010EB0F;
	Tue,  8 Sep 2026 10:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBN5ZynF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD69110EB09
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862744; x=1820398744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TJZVbFyOIrPIgYc2OG4xPX2ztiV58iP+C2/rraojtsk=;
 b=bBN5ZynFQSNl2oObM7tMK2Y48ah5Jda+wmXRBQpLPnKsURAHyzZ6Yt5m
 2RJOx173bRiFcthMhfv3hBg/+AS03qcSGw4LtIM2nNWAVC/urqqsp6q5o
 Yf95dYKcO2vfwvdVrPlCwPJbvg0Ijdg/6fvcChZB/gr96AK1KqH+tnhYN
 FcVL+waGWrjthyoX+uknf2Wg4ZwvlDdeZzR8lGDHzM4Mo6FZrZNNKwZGp
 Jl9vvMMbDXsX+5otoxy/gvI3+4UaEu4DfLzHqVIrUEJ797cj5c6Rvp6+2
 UD1ySQLA+YfI5ki9ufzp3AeycsctpQj9BQLNe9G6zaaciTMhN9v6fPUVh g==;
X-CSE-ConnectionGUID: yTrQuRfwT7KoU8wioUjg+Q==
X-CSE-MsgGUID: EYhfNji+Qjqd5qGf54MtJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278278"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278278"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:19:04 -0700
X-CSE-ConnectionGUID: i9iAIWKRQWGtOL5AjY7blQ==
X-CSE-MsgGUID: gjIKNO9/Rnug48sHzxlK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628462"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:19:04 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 09/13] drm/xe/pat: Report missing PAT table using
 structured xe_log API
Date: Tue,  8 Sep 2026 15:48:45 +0530
Message-ID: <20260908101849.1219614-10-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err() with xe_log_err() using the PAT component tag
when a platform has no matching PAT table entry.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 8af92e3c4c17..f012eaba838a 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -16,6 +16,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_wa.h"
@@ -678,8 +679,9 @@ int xe_pat_init_early(struct xe_device *xe)
 		xe->pat.idx[XE_CACHE_WT] = 2;
 		xe->pat.idx[XE_CACHE_WB] = 0;
 	} else {
-		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
-			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		xe_log_err(xe, PAT, -EINVAL,
+			   "Missing PAT table for platform with graphics version %d.%02d!\n",
+			   GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 		return -ENODATA;
 
 	}
-- 
2.54.0

