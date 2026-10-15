Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934C1CC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 23:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3882610E0F7;
	Thu, 15 Oct 2026 23:34:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC27C10E1B3
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 23:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792107237; x=1823643237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cc+PDAfxqKoW50xPoTnQqS2v2Nnh1EFAWkYel+CeJ/0=;
 b=ZJRJjdwA5AU0oDwE/VEG61BUjqXkhzUmCSIrTTSmGR+DRJyh59NQIuPO
 7J3H4snsTWrugE6YVZ4i1WlNQAJbC4oO473tJ/dkHy4zu81+YTvD372Ay
 Cq2CmCGPl1q8JS2jXCypeYIiDuvEbC/g5HypvtBFnpuy/RXyPT634At9W
 JUceMeGAsuYGlxW1FVOCnhShyn4FTkj2PaXFAhan2luf0vfn67I/R2ClQ
 Ag/M93PVFoFCH8g5IHA7Q/fCiQSeT3/mcCg7+LsrtF0mvxI9DOweHWNjo
 j4TnE96cd5UEsCU133oF8wlJ4BTf1dE/kUIMkTnktXAgKHzgz2WsjxMuc A==;
X-CSE-ConnectionGUID: YYps7KUeSn6f0LZ9DycYEw==
X-CSE-MsgGUID: 2FFubzSqSLiGCCQO6oEP3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="891365"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="891365"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 16:33:57 -0700
X-CSE-ConnectionGUID: 2/GcJkHtTguvFSWhnPYgPA==
X-CSE-MsgGUID: +pR/b5vdQXmVVpKxC6zo+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1814604"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2026 16:33:54 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/3] drm/xe: Access MMIO after pcode init
Date: Thu, 15 Oct 2026 09:54:54 -0700
Message-ID: <20261015165451.154495-7-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
References: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
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

Allow pcode initialization to complete before we start poking around
the MMIO space during resume. This ensures MMIO space is ready for access.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index daa7ba2df317..1f5097875bcd 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -241,9 +241,6 @@ int xe_pm_resume(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Resuming device\n");
 	trace_xe_pm_resume(xe, __builtin_return_address(0));
 
-	for_each_gt(gt, xe, id)
-		xe_gt_idle_disable_c6(gt);
-
 	for_each_tile(tile, xe, id)
 		xe_wa_apply_tile_workarounds(tile);
 
@@ -251,6 +248,9 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		return err;
 
+	for_each_gt(gt, xe, id)
+		xe_gt_idle_disable_c6(gt);
+
 	xe_display_pm_resume_early(xe);
 
 	/*
@@ -698,13 +698,13 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe_rpm_lockmap_acquire(xe);
 
 	if (xe->d3cold.allowed) {
-		for_each_gt(gt, xe, id)
-			xe_gt_idle_disable_c6(gt);
-
 		err = xe_pcode_ready(xe, true);
 		if (err)
 			goto out;
 
+		for_each_gt(gt, xe, id)
+			xe_gt_idle_disable_c6(gt);
+
 		xe_display_pm_resume_early(xe);
 
 		/*
-- 
2.53.0

