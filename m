Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D419CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E340B10F06D;
	Mon, 12 Oct 2026 12:25:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8322310F06D
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791807927; x=1823343927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5IWEmCANRkoEzQuHlYJV+ArVg3BfHzvO4+BC8XXI8zg=;
 b=gJTI6b6HyTVAKv3sqJr2XK8GnErb7XEPj1A3CY1xoGL3lJeArt18FfIj
 L+ijZfoDm4XZ48FJJOm1tPID30MhB8vMVd7REtxmQI46aTtyho9Mca1+X
 UVKvD8hUnbtYzyGDusXcXp64TCYZH1f8iBkc/upTgrXt+Yi8vTLht2jC6
 dAFR8EoK0FPkbfJzT7/yr4GqiZ4sj2axF7b9SWeGOou2tWOewVEgXj52D
 HS2hSDX7z6xNYOoQiVvy4Ag8p6LK+ZYMsxHm+uUISkrMvQ6gELnDt1d4j
 5yxIcPPZKPSGA5iYTQgrU6DFw3D1s1erVjH3TzOhJeOswy71+SEtIZPTa g==;
X-CSE-ConnectionGUID: edEyjG/RR1GqyI/+BKcnYw==
X-CSE-MsgGUID: lWdMu8bgSFG08ojz+C1qLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="522899"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522899"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:25:27 -0700
X-CSE-ConnectionGUID: opVXV7SBTLCwxuIru526Hw==
X-CSE-MsgGUID: PPoCWc7dQh+TivaTEGw6Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="962781"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2026 05:25:26 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v7 02/12] drm/xe/ggtt: Report GGTT errors using structured
 logging
Date: Mon, 12 Oct 2026 17:55:11 +0530
Message-ID: <20261012122522.2307625-3-dnyaneshwar.bhadane@intel.com>
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

