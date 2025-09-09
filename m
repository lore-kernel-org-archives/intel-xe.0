Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2EBCAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 17:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8032610E7C0;
	Tue,  9 Sep 2025 17:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cb6LjEeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB4310E7C0
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757437200; x=1788973200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3hG6Ph4auCOdxulFIrQazQrej5/YEfgyNuE6cKpC65E=;
 b=Cb6LjEeQAWL47Qdt4zTZjOf4BgWp4BtyWlU5kOyVC4NEM7xoemaTNXlb
 8CuCnEjLrnXhHaiwG75q0OXJjXi84YL88sAUS/bwiljbABTZn/qmbHyYo
 RlAw/vB7T2+PxFbuaa7oAGQLP0T9gXUptKWZCRrnyta7jlqVwxuZIkCQg
 5qy7BbNJSkDScexjuTP8UlMw8bQuskp7YUJhqoM+fFqGnY81ePEPp5JyD
 GBDfimmqVJF/y0VHHjEDEYpJeJcMCtDBhfBuD89LAtOqHdJAgjUFpM78T
 +S29ushGLc4bV9OU/KZ+kpnLndt/ysK6gvVmyMuwlhHej2Nar1sQ7WOnc g==;
X-CSE-ConnectionGUID: 5FtbJx3QRKC0iHibbZdQFg==
X-CSE-MsgGUID: 6T7bMD/xT6S+Zke7HhY+gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71148961"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="71148961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:59:59 -0700
X-CSE-ConnectionGUID: s4d/+2lQRg+7SwCPMbYwCg==
X-CSE-MsgGUID: 1fyt2XctTQqh9Gy1BGb3dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177426221"
Received: from dopitz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.31])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:59:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 5/5] drm/xe: Use tile-oriented messages in GGTT code
Date: Tue,  9 Sep 2025 18:59:39 +0200
Message-ID: <20250909165941.31730-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909165941.31730-1-michal.wajdeczko@intel.com>
References: <20250909165941.31730-1-michal.wajdeczko@intel.com>
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

Use recently added macros to print tile-oriented messages.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 71c7690a92b3..6a14bfdef41d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -28,6 +28,7 @@
 #include "xe_pm.h"
 #include "xe_res_cursor.h"
 #include "xe_sriov.h"
+#include "xe_tile_printk.h"
 #include "xe_tile_sriov_vf.h"
 #include "xe_tlb_inval.h"
 #include "xe_wa.h"
@@ -269,7 +270,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		gsm_size = probe_gsm_size(pdev);
 
 	if (gsm_size == 0) {
-		drm_err(&xe->drm, "Hardware reported no preallocated GSM\n");
+		xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
 		return -ENOMEM;
 	}
 
@@ -466,8 +467,8 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
 		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		xe_gt_dbg(ggtt->tile->primary_gt, "GGTT %#llx-%#llx (%s) %s\n",
-			  node->start, node->start + node->size, buf, description);
+		xe_tile_dbg(ggtt->tile, "GGTT %#llx-%#llx (%s) %s\n",
+			    node->start, node->start + node->size, buf, description);
 	}
 }
 
@@ -499,9 +500,8 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
 
 	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
 
-	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
-		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
-		       node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
+	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
+			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
 		return err;
 
 	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
-- 
2.47.1

