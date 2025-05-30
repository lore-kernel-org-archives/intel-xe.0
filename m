Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71DBC5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 21:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB4910E881;
	Fri, 30 May 2025 21:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeFKqEiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1132F10E259
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 21:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748639145; x=1780175145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BzS6oRQJ8VZ6XlXmxf6IOqohIv4PJ+Icx2kLoZA1pY0=;
 b=MeFKqEiWYK1/9BYW9KUkrrNpQ3+5Z2WG4SlMM5vbCyGmkMRq6L6c5Rji
 aQFOsussXcMYylK1V2xEqvmdNDtc2iP6hTbibhZK9f7Ft3/zjAqxVHU6D
 JadVjeNG0SUIi9OV012jz8DPuk8FvClPn/r2pkGQaRXU8UTcgyfCEmak6
 +xBNnMfkIF8V0LxKbPl1d1q5BTdUamja/iMVl1hL1uVvJ5dq71vuQYRnh
 hxQe4TCGqQ4bPjqGR+P91L2Xar88FnSOzdU9LkGgoflJjurGp8AxNuTBJ
 jMQN1fNjDWoUO9pcyJpxUu+RfwdSgzc4mv6W/NnoKbQjh3fztbV2rF5l2 w==;
X-CSE-ConnectionGUID: 0UXzk7/uR1ayabKV6Pgu6A==
X-CSE-MsgGUID: 1GjnyuAIQJO7Kxo8dpXuiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50891200"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="50891200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:05:45 -0700
X-CSE-ConnectionGUID: QL5kF1x9SpCi5ui2Nr4UCw==
X-CSE-MsgGUID: lTZVIC2gT9GGI2wXafAOlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="181181158"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:05:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Use GT-oriented printer to dump topology on init
Date: Fri, 30 May 2025 23:05:24 +0200
Message-Id: <20250530210524.505-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

During the probe we dump the discovered GT topology, but instead
of a generic printer we can use our own GT-oriented printer which
contains information about the source GT.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 516c81e3b8dd..acec6559e2f2 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -12,6 +12,7 @@
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_mmio.h"
 #include "xe_wa.h"
 
@@ -243,8 +244,7 @@ xe_gt_topology_init(struct xe_gt *gt)
 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
 	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
 
-	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
-
+	p = xe_gt_dbg_printer(gt);
 	xe_gt_topology_dump(gt, &p);
 }
 
-- 
2.47.1

