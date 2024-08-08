Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F12C52D73
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 09:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5205310E6A2;
	Thu,  8 Aug 2024 09:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwKWr8ft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDCF10E6A2
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723109714; x=1754645714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ULJpDBRt2dgTb2q4VYUx+k/cchYo1ZdU1HbbOVVGJ6I=;
 b=SwKWr8ftXVRLIUGcpMw/gFiDOof6Aa0/2y9mBML8EpeNUShZJELTVooN
 EU9/vvbK7f+d6dwg6AYttl3Voq6YzALEi7Gy+x1N4CQwRP+hzeOgX2AtU
 4cm2VhE5P/SUACZ3sUvz24WQhN/3hoTg3roq9pn1BdHEovJf1YKtgqknj
 fpn7lABp/Uf/NPh/BjdQnvxlaKW6RaSZ9j7fsuxrJPO8aNAydZMK6ZnBy
 Zrr4RuR6hIZ0cyt65knHDxTmTSVWnE8hW8hdP7zEZJQawT5TSXojY41xY
 3FHKHQly+Oi+f6wwXWIX6cRgUHtevOqGUjpVXqUzIOpvPUC0d52e3d0Jr w==;
X-CSE-ConnectionGUID: AFo45Y+HRkqTL5BZlAnJAA==
X-CSE-MsgGUID: eb8rCIIeQnuyCs9Eem873A==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21384429"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="21384429"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 02:35:13 -0700
X-CSE-ConnectionGUID: y+j6A17gS4+7x5dN9XUzdQ==
X-CSE-MsgGUID: 5dTYjek4RB2z67Eej0r7lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="61262226"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 02:35:11 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 2/2] drm/xe: Add stats for tlb invalidation count
Date: Thu,  8 Aug 2024 11:19:15 +0200
Message-ID: <20240808091917.5761-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240808091917.5761-1-nirmoy.das@intel.com>
References: <20240808091917.5761-1-nirmoy.das@intel.com>
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

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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
index 74ed9342af91..d6a8afbb8192 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -27,6 +27,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr)
 }
 
 static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
+	"tlb_inval_count",
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
index b97363e99ba7..816e81c69b2e 100644
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

