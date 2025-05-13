Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D21CC3ABD7
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 09:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4036810E364;
	Tue, 13 May 2025 09:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTmBtbWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0748210E506
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747127927; x=1778663927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U25h0BLDha8+XtzPsUHxKUjDPdmxgAAXB66YI+h+X78=;
 b=bTmBtbWFbt4stPSiTwU2j5cZP0EQhbVIdCeKBn62Tf9JhC5FoAymfnVt
 Kbh0zvAse6DxT02n6Kw7Q6MOjnsU/YgPOakywH5748XyHjWOw2RVtOLCt
 XVMnouxqHn3+oZGRZFoX+lYP1N95z9CLFuiIF4qlIxbqejWxFVMHKXLc1
 P5eahuflkeqJP6MKisKmSMRBeAQaaNSYmwpQNK4RIxD1RCYksTYRKD9ro
 mtHZ7a2yfReCIQIzFloeXG8Az6oDkC/s37s1L92n0T28R4fEWUNtljcbz
 lfYg3pQLc4FbBYQAU6dBSX7CYXwpTvnCSTa6zwpADhncOfJ0nMqxzhZso w==;
X-CSE-ConnectionGUID: acSs8825QDmXvFGgxgQ2lA==
X-CSE-MsgGUID: p9U7dHZwRIGS2KsYs9eS0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49127689"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="49127689"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 02:18:45 -0700
X-CSE-ConnectionGUID: Lla/pbg4Tzmiy6FQkgKmiw==
X-CSE-MsgGUID: TA4ORl9tSp+GgcwyneV8Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142409124"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 02:18:40 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 2/4] drm/xe: Don't update wedged mode in case of an error
Date: Tue, 13 May 2025 11:18:25 +0200
Message-Id: <20250513091827.4825-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250513091827.4825-1-lukasz.laguna@intel.com>
References: <20250513091827.4825-1-lukasz.laguna@intel.com>
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

Update driver's internal wedged.mode state only in case of a success to
avoid inconsistent state.

Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 5dd0ad3f9bae..3b0754496992 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -170,8 +170,6 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (xe->wedged.mode == wedged_mode)
 		return size;
 
-	xe->wedged.mode = wedged_mode;
-
 	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
 		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
@@ -183,6 +181,8 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	}
 	xe_pm_runtime_put(xe);
 
+	xe->wedged.mode = wedged_mode;
+
 	return size;
 }
 
-- 
2.40.0

