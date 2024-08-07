Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B1EC52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 11:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698D210E4C0;
	Wed,  7 Aug 2024 11:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2nd9O0h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE7310E4C0
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 11:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723029854; x=1754565854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C+E/IdKOZdY9nA2PjB8wxh92AwdnaGxs2PcDWnI1VwY=;
 b=H2nd9O0hqW3LsZWyrpVnu1hWaMxareIM4sW1o2wUxp3DVfv1eZ9BLZy9
 RPAt2e3kguVWRXoDGjTxyzJcd01n3W0v6AHPWI403RkCUR/hL2vNGOAdY
 OdL/f9+yjXjY542NA3wPepbJ9gR25fMgjJlBPZMq7dxdC+IqUHyzYAmkQ
 NUQfZBye2uJQ3rF307LlNf7bfgNiEBG8ZsrDQsW5S//PwvQS7G7c7d6vL
 fZH/4ATXIsEF1hO/e0m5D9D9mWa5384xrVBk2AjDcU7wFDtj4c8mFXRJH
 7sASSNSpxidFITDRvE9B7lCkyA3nJOerS+Zl1fcvIO7WJlmj4OVtSW+1M Q==;
X-CSE-ConnectionGUID: Sj/VV9CQR+mzcfgvE/phZQ==
X-CSE-MsgGUID: n1fOHQ1iSn2ic6vPoeof9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20907975"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="20907975"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 04:24:14 -0700
X-CSE-ConnectionGUID: kayV911xTH6kj0i3ApPY1Q==
X-CSE-MsgGUID: sYyzNflVT4GEFc5aaEq5HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="61642996"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 04:24:13 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Add stats for tlb invalidation count
Date: Wed,  7 Aug 2024 13:07:59 +0200
Message-ID: <20240807110802.13385-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240807110802.13385-1-nirmoy.das@intel.com>
References: <20240807110802.13385-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add stats for tlb invalidation count which can be viewed with per GT
stat debugfs file.

Example output:
cat /sys/kernel/debug/dri/0/gt0/stats
tlb_inval_count: 22

v2: fix #include order(Tejas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c            | 1 +
 drivers/gpu/drm/xe/xe_gt_stats.h            | 1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index b13aee5488d5..74572b45f59b 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -29,6 +29,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr)
 }
 
 static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
+	"tlb_inval_count",
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
index 04a1d61ce1fb..c290c95c6bd5 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
@@ -10,6 +10,7 @@ struct xe_gt;
 struct drm_printer;
 
 enum xe_gt_stats_id {
+	XE_GT_STATS_ID_TLB_INVAL,
 	/* must be the last entry */
 	__XE_GT_STATS_NUM_IDS,
 };
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 87cb76a8718c..cca9cf536f76 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -12,6 +12,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_gt_stats.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -213,6 +214,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 			gt->tlb_invalidation.seqno = 1;
 	}
 	mutex_unlock(&guc->ct.lock);
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
 
 	return ret;
 }
-- 
2.42.0

