Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FBAC5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4839C10EEAA;
	Wed, 19 Aug 2026 19:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5sIoTNG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38D010EEA1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166889; x=1818702889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xaD1GcjJnHqCUnr4LhFG8Vjmyfm0JoZQXpZSFw1IcDc=;
 b=K5sIoTNGG5ophMbdY73wjCi4zCIWsic8OhsksrTekFnR3xEJxvztx0UU
 cVC/mVttIPFw7wjHc8p1kRoPIAduFoAvnVI6HTBI3gFv+zSKiyTXS9CJs
 RbZP5GBc2j+/BQB8PMMJeN2aRmJ3Q/OwAghEp2Mp5BHbVa50GKr0e6NQ7
 cKunoax4UqCmW4qXTJsL1PCIrkMTRaNA+whA/V04bLk29UJFC4Ixm2jo0
 r4j8QUz28QwxBzP/LfPVfQlOri3rzU/3CGjt7IyQep1rWfx37dZYhBKdj
 UzlRu1VD62QOp25z1qWZLLrUY/mIBEY+mPnbtXcUbZ0gjMu6OAHMndskY g==;
X-CSE-ConnectionGUID: yjKEn+72RHGgqEZ/GVgQpQ==
X-CSE-MsgGUID: fFQnND53RAClZ8AZAvKy2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647283"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647283"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:14:49 -0700
X-CSE-ConnectionGUID: ViyJC3QySmGmGDjwHKLjIw==
X-CSE-MsgGUID: 6D4un2z5RtqvIpwm/hSZdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556705"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:14:48 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 02/12] drm/xe/ggtt: Report GGTT errors using structured logging
Date: Thu, 20 Aug 2026 00:44:31 +0530
Message-ID: <20260819191442.1957986-3-dnyaneshwar.bhadane@intel.com>
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

Replace xe_tile_err() calls with xe_log_err_fatal() using the GGTT
component tag in GGTT initialization error paths.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..1f8929b4e536 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -22,6 +22,7 @@
 #include "xe_bo.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
+#include "xe_log.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pat.h"
@@ -402,7 +403,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		else
 			gsm_size = probe_gsm_size(pdev);
 		if (gsm_size == 0) {
-			xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
+			xe_log_err_fatal(ggtt->tile, GGTT, -ENOMEM,
+					 "Hardware reported no preallocated GSM\n");
 			return -ENOMEM;
 		}
 		ggtt_start = wopcm;
@@ -413,8 +415,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 
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

