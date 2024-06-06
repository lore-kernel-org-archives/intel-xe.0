Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930CBC27C52
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 17:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6293710EA5E;
	Thu,  6 Jun 2024 17:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOSktkZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582C810EA50
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 17:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717696700; x=1749232700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7M7Me53+96b1NVGDP2puItodSvHmorTUEyWDmp3yB6I=;
 b=NOSktkZ3X+ndIVPQyd0tVm6df2QNsNhfkollmKaro0r9btM5joSx/0sK
 Pu0YFNPRJhXMSoloa5weSf7C2ovKtAb7/zEJO4UXjUf42STWTqH8H9bTf
 0DPdQFQsi6JPKEGn/9HBayipzC2EGtimbDTzSlVByjhTNR8MzJg31ZY8i
 fu2bAOxAfgDR9KreVrgARgA9GfVKAYqTIYEhBWags7G/izLffAq3BlbQQ
 jm74lps5xHpHqU86stsk6H8f5DrEnnE5/SdCyhsEwULmeWF6vHHxdX/HF
 /QpjQn2g42W+CusZPpcdu8vmmRQFScmAz5X2T2tWEqi/BiymKpAxg1k30 Q==;
X-CSE-ConnectionGUID: gE8kuW2wTR+VfxPFd6c2cQ==
X-CSE-MsgGUID: ZxuXPkV8Rw+j2VazbqxhTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25794813"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="25794813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 10:58:20 -0700
X-CSE-ConnectionGUID: 6KuT84+tSZWZbOPoblcCWw==
X-CSE-MsgGUID: qwCpx3fmTO+XyVnQ9hvNqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="61261799"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 10:58:20 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, lucas.demarchi@intel.com
Subject: [PATCH] drm/xe/xe_gt_debugfs: Use force_reset for duplicated code
Date: Thu,  6 Jun 2024 10:43:04 -0700
Message-Id: <20240606174304.2987279-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

force_reset_sync performs the same actions as force_reset, but performs
a flush_work afterwards as a means of syncing on the reset.  Use
force_reset instead of duplicating the code.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5e7fd937917a1..9bf703ccaa4f7 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -118,10 +118,7 @@ static int force_reset(struct xe_gt *gt, struct drm_printer *p)
 
 static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_reset_async(gt);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
+	force_reset(gt, p);
 	flush_work(&gt->reset.worker);
 
 	return 0;
-- 
2.25.1

