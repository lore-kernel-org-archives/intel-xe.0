Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71F5CA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6384A10EC9B;
	Mon, 12 Oct 2026 05:19:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2538310EA2B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782368; x=1823318368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5IWEmCANRkoEzQuHlYJV+ArVg3BfHzvO4+BC8XXI8zg=;
 b=h473bc2swSTE4k1FVFA/WohusyktS+gbKOmdDZLTWzMJBtqU+V369te7
 zWUgNtGfsyAP+7LfCif5PpPhdBsaDkL0MBcKlN/vBJVerCn0OqQfDQL3N
 gOesWzzC+AKGauCssqA1dgFUeL81UoJn4IFrtbixUDeZf7ekjZqc0BErF
 8eYKu9kbpNovGSD/V/aHfuoahE+KSM4skOR4kN8VctwrK3hUO3UMqEhYV
 HXCOUXxOGhMCkYUilzPCD8tLA3owQoVXNxWl+Jz024MgGOSapgtZuiqLE
 ppQLPViGjamkNKRkhwzHTneb+38A5zP1wS8S3Nd5qxGhQJHpdJAJfix1g w==;
X-CSE-ConnectionGUID: gXEww7KwS6y8RnUPdd3/DQ==
X-CSE-MsgGUID: ahsLbGIgQKiOfG1iFFp3rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="390501"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="390501"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:18:32 -0700
X-CSE-ConnectionGUID: UMkGgX3XQr+FH8t5pVAUjQ==
X-CSE-MsgGUID: Tv/Al7yJRiCFVOd3BXT94A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="735815"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 11 Oct 2026 22:18:31 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 02/12] drm/xe/ggtt: Report GGTT errors using structured
 logging
Date: Mon, 12 Oct 2026 10:48:13 +0530
Message-ID: <20261012051823.2201360-3-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
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

