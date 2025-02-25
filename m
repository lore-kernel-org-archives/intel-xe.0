Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467C2C021B8
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 19:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AEF10E7C7;
	Tue, 25 Feb 2025 19:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlF3cmVD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0C110E7C1
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 19:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740513576; x=1772049576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YzzMT9NIPHTkcgFgKwkCQf+VL1dl8/E2d+lk5w6B6Ao=;
 b=OlF3cmVD+ZNhIcqa97Lcyxeb2tn49lJnq4/zPln73QSygBjdNQx7boly
 OmiEz1o6ZFyzD2ZLPivBrnLaErx2up3baxt9XsCltvK/NLXNjcTquqNQL
 jjsFbUKYzt4qQ+Jn13ZbDaqxtyb+wfRsqjg4hcpmlEGteXI3CwdQpNg+A
 M8NsMlknAuoYPm79L6Cjqfvq5Rcmmz3b4wBkimDSZuHB16073pArItyuA
 9Xrzd5bB+K0Z74ZsY+FiDg9683laaSaCOlsUdCJTkn9YzFuvzTodWquGa
 SYjCh3Rfcfltt3ug+vlCY5dX1DFtwv4zHyS31yjaaZw3F5wsWVCxSwokR A==;
X-CSE-ConnectionGUID: 8IDr3qefTny9Ee44UJVduA==
X-CSE-MsgGUID: coVoNWLiT0Gj5hB0jEuOuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45252982"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="45252982"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 11:59:36 -0800
X-CSE-ConnectionGUID: N00J5P+iTkyG5aildOkq6w==
X-CSE-MsgGUID: Xtlwy4eaQc+gN/WAnwoy4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147396736"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.239])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 11:59:34 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/2] drm/xe/gt_stats: Use atomic64_t for counters
Date: Tue, 25 Feb 2025 20:57:33 +0100
Message-ID: <20250225195902.1247100-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225195902.1247100-1-francois.dugast@intel.com>
References: <20250225195902.1247100-1-francois.dugast@intel.com>
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

The stats counters are now used for things like counting the VMA
bytes during page faults. During workload execution, the counter
value can grow fast and easily reach the atomic int limit, in
which case it overflows. To make this less likely to happen, push
the limit by switching to 64b atomic to store the counter value.
Overhead is very small as there are only 3 stat entries per GT as
of now, and stats are only enabled with CONFIG_DEBUG_FS.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c | 6 +++---
 drivers/gpu/drm/xe/xe_gt_types.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 2e9879ea4674..af3fd03f665c 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -23,7 +23,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
 	if (id >= __XE_GT_STATS_NUM_IDS)
 		return;
 
-	atomic_add(incr, &gt->stats.counters[id]);
+	atomic64_add(incr, &gt->stats.counters[id]);
 }
 
 static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
@@ -44,8 +44,8 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_gt_stats_id id;
 
 	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
-		drm_printf(p, "%s: %d\n", stat_description[id],
-			   atomic_read(&gt->stats.counters[id]));
+		drm_printf(p, "%s: %lld\n", stat_description[id],
+			   atomic64_read(&gt->stats.counters[id]));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6e66bf0e8b3f..f72b965cc9e6 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -139,7 +139,7 @@ struct xe_gt {
 	/** @stats: GT stats */
 	struct {
 		/** @stats.counters: counters for various GT stats */
-		atomic_t counters[__XE_GT_STATS_NUM_IDS];
+		atomic64_t counters[__XE_GT_STATS_NUM_IDS];
 	} stats;
 #endif
 
-- 
2.43.0

