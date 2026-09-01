Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B99C61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 06:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA66710EAC1;
	Tue,  1 Sep 2026 06:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gE76+01o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D5910EAC1
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 06:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788244283; x=1819780283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5em2K5tRmnRJoOhVoQjtx8g6lZiDXeW6FpN+CWi7tAo=;
 b=gE76+01ofePm62flROsVyT9uekMUs8vldeKUZmyC+zwzZIRb0ZkXO56u
 upiK2z6d0hQahFkQ9fnYCnpUuBafZG6X6IeW9wh22hF0JCD1stxsepK+J
 LVQ46PaRdOcg/59J0+jL9NSIGrX30KzO9BIZ7jgo85zAd8qELNZBBX+wk
 Y5q6Rg5UAgMFIWkBfrLYAcw4mpul51Yfb/+NUfcmBQVsJQiGCtqU+9oa2
 WFa5/XsQ7rtD1Y8jfuSRhdLC4b9Oe0NwvtQ1ZWVK0B7hn6HNp8OTHcULN
 XeBaHc03Q62ebb5rpGE2cwPH+z05nEe9JsrVJCio/5L8EDVhwJOQ25FJ6 g==;
X-CSE-ConnectionGUID: E2sE64BURs6eT9qzFpYfug==
X-CSE-MsgGUID: LLV0AYYVR9qrcXw/CFwwMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88588914"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88588914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 23:31:23 -0700
X-CSE-ConnectionGUID: C4Qt1FN7QZy3ROGSbH0yfw==
X-CSE-MsgGUID: bbmvoAWqT86MlnK0rfxOXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="272791290"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 23:31:20 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v6 4/4] drm/xe/gt: Report GT reset failure using SIGID
Date: Tue,  1 Sep 2026 12:00:59 +0530
Message-ID: <20260901063059.2547247-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901063059.2547247-1-arvind.yadav@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
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

Route the GT reset failure log through the structured SIGID logging helper.

Failure to complete the full graphics reset means GT reset did not finish
as expected. Use the GT component, which maps to XE_SIGID_GT_TDR, and pass
the reset errno value to the helper.

Also update the message to describe the actual failure. The driver does not
clear GRDOM_FULL directly. the reset should complete and clear it within
the timeout.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
v6:
 - Corrected the GT reset timeout in the log message to 5 ms.
   (sashiko)

v5:
 - Kept this patch limited to the GT reset failure path. (Michal)
 - Improved the GRDOM_FULL failure message to describe that full graphics
   reset did not complete. (Michal)

 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6805e0d3bf21..d72c7ec9a956 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -824,8 +824,8 @@ static int do_gt_reset(struct xe_gt *gt)
 	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
 	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
 	if (err)
-		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
-			  ERR_PTR(err));
+		xe_log_err(gt, GT, err,
+			   "full graphics reset not completed in 5 ms\n");
 
 	xe_gsc_wa_14015076503(gt, false);
 
-- 
2.43.0

