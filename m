Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E37CF9C69
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 10:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D567810E17F;
	Mon, 23 Sep 2024 10:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNApnnGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B28610E17F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727088946; x=1758624946;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hblNGDLlel7Qd9gsf1wH9K0D8QOsapyvXo1lOyurWkQ=;
 b=jNApnnGUJyjsFich6XT+wvSiIRdIYEz5gdnHmyTp6W/nLpwSUdo3QGAd
 g+3X4jVVDufanBN37HUHdNc3cm3xkUbukpXdqgwQqLxiwMeP/KbyKB4/M
 6IfhTxicovocTldhgPzSIxRGqz1NiADSjzAzgFvjfRfXcJZ6bkd1KdmpD
 Qh23Szmnc53izesXh5/WH9Wo2baSjM8mstKKoSKYAahjf5Mz9pDBBJmRT
 h4moSFWmubV0ykDt5P1WgnXHYqM1qXHIKBah/7kZkB8HIJXQohU94ofs7
 nLG+wI0ZHnrZ7dshUp5J/s+XcvT6kuCMB+mc+58i9CeeGSpljqrrv/ZrB w==;
X-CSE-ConnectionGUID: JOIAJ1f2QnaXC4L83FTJQA==
X-CSE-MsgGUID: pp1QD2qpQ068uqWdcHKnWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="51447061"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="51447061"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 03:55:43 -0700
X-CSE-ConnectionGUID: LhB1XAuiQwGpopWUTDUcSA==
X-CSE-MsgGUID: 2OLbr/wnSXipRxIqzNB+Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="108467666"
Received: from suttanur-desk.iind.intel.com (HELO
 singhapo-Super-Server.iind.intel.com) ([10.145.169.90])
 by orviesa001.jf.intel.com with ESMTP; 23 Sep 2024 03:55:42 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe: Check return values of functions in xe_gt_shutdown()
Date: Mon, 23 Sep 2024 16:36:33 +0530
Message-Id: <20240923110633.19545-1-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Apoorva Singh <apoorva.singh@intel.com>

Check the return values of the functions xe_force_wake_get()
and xe_force_wake_put() to prevent mistakenly treating them as
void returns.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 274737417b0f..eaeaae1df198 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -890,9 +890,9 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	do_gt_reset(gt);
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 }
 
 /**
-- 
2.34.1

