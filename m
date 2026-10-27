Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E991606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 00:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IQLrOn5+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346E010E508;
	Wed, 28 Oct 2026 00:21:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B73810E508
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 00:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793146864; x=1824682864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fyLp8rwkFQvkZZbTt+cBIp4jUW8eDxl/Iyn5zLTWQLQ=;
 b=IQLrOn5+BJ1alKygoQkxrRCByXJtc/sVQ26gfvdiUkwC/TZHw0zazKfX
 zzFd1p4q7TLqaR05D70AbegOv7t5wZgfnZuBv1ZjMKYUzBoAcRvcp7Pib
 giDyFzhFvaX7YL6gBVcU1A3ADwwWYBQRClgavNlPQWf23aOpXO53Y7hwb
 Vl8RXKqTyjfMmvZ7wDGUddqbt7SwLoI22QSx5ahbhqCqqaxJKhyh1k4V6
 6H0W5gNpcwVDpP8EOxsB5XmDUaCpQ1fczLdj7DVsdct5dVgSW0s8jesOp
 aDrmW976PcvEbV4tvNj0+9nPhMbWia/eJZQUZTBZHwUjbTwTAgShjwdWD g==;
X-CSE-ConnectionGUID: sXujDUvLQKiONgnHJ9pGjQ==
X-CSE-MsgGUID: CUbMaW9HT1+7z5BXs1ILYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1860080"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1860080"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 17:21:04 -0700
X-CSE-ConnectionGUID: 80swLWU9Q7SD6tzFBFiVKw==
X-CSE-MsgGUID: nZrXp2h9RYyahSBbHyrD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6454378"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa012.fm.intel.com with ESMTP; 27 Oct 2026 17:21:03 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 2/3] drm/xe: Access GT MMIO after pcode init
Date: Tue, 27 Oct 2026 10:43:54 -0700
Message-ID: <20261027174351.619929-7-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027174351.619929-5-vinay.belgaumkar@intel.com>
References: <20261027174351.619929-5-vinay.belgaumkar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allow pcode initialization to complete before we start poking around
the GT MMIO space during resume as these accesses go through sgunit.
We do write to MMIO registers in xe_wa_apply_tile_workarounds(), but
those are in uncore space. Those accesses remain viable even during
d3cold suspend.

v2: Clarify about xe_wa_apply_tile_workarounds (Karthik Poosa)
v3: Add fixes tag (Anshuman)

Fixes: 95d0883ac810 ("drm/xe: Ensure GT is in C0 during resumes")
Cc: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
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

