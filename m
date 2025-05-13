Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDC8C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 14:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBED210E5BF;
	Tue, 13 May 2025 14:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kysQR7qJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF4E10E5C9
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747146440; x=1778682440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t82OLuoab/gpzzzAgrtNblwayZWCJZFsYhwdvCFNkO4=;
 b=kysQR7qJPNl4iWYHJb9yMrbCAikaaey6ObYD9P/fhSuu4htLLN78iUyR
 YDlgZoK1225kVnSs1zqwYE2Q83Mb9E88XfHD5yxNH5P2Fa05YgDu3TyEw
 EK56R3Ix9t4eEMITJrV0xY14RDFXSC2ZjUfgHYhSSY1MmYAPbYzwuEbqy
 zCY5q6X2xAyGyFSkQeWNgpJ4tAdT0gQTXDgjsk44RT07q3CTQNa+XhF7H
 1l1A/tm2MQTqd2I3sjqrNhcCjFkY3ynycBLa9lcVM6sWHdCWVdLiDBNzO
 L6WLgmIBhtgKRulaPb5jZSCW5kwqKQiKFrhNG2ApB83Q+r0xFgz1NZ2Vp A==;
X-CSE-ConnectionGUID: YBLl6l1rRASef3qbfSf7Mw==
X-CSE-MsgGUID: hxRgh/EFSWqTzBc55XRMwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48869997"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48869997"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:27:20 -0700
X-CSE-ConnectionGUID: RPAPNdMtRtiqH8bOlN6mWw==
X-CSE-MsgGUID: Iz2bVesSTeu9w5dDqelWzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="138232170"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:27:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/guc_submit: Simplify and fix diff calculation
Date: Tue, 13 May 2025 07:25:49 -0700
Message-ID: <20250513-time-wrap-v1-1-fba9a69a65c8@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250513-time-wrap-07aa075a29db
X-Mailer: b4 0.15-dev-f7671
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

With a u32 type, there's no need to check which one is greater: the
current is always the latest and if it's less than the previous, it's
because it wrapped: just do the unsigned calculation that will lead to
the same result, or better the correct one. It fixes an off-by-one in
the wrapped calculation, however that doesn't really matter for the
timeout calculation.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index fb125f940de8f..80f748baad3f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -976,10 +976,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 	 */
 	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
 
-	if (ctx_timestamp < ctx_job_timestamp)
-		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
-	else
-		diff = ctx_timestamp - ctx_job_timestamp;
+	diff = ctx_timestamp - ctx_job_timestamp;
 
 	/*
 	 * Ensure timeout is within 5% to account for an GuC scheduling latency



