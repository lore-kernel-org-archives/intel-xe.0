Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F29AC61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 09:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E1110E499;
	Fri, 28 Aug 2026 09:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6RY84i1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DDD10E497
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 09:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787911104; x=1819447104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zq6Bulj/hGq7DDzDmk2upXZs46Cz5zY4YFEcOTlC8Do=;
 b=e6RY84i1zCfhA/rwnA1Ap0Q+xvLY+3VRyAOuVb1XzxAmFk7suSgQMfrF
 XN47eycSzHHMBOVUK6SkbuCXyafQx9Ft7Jr8avcMsseQb5nzKv1ji94Ey
 2QIfLvHU58AAksk/FloXbNajIeEvl6em//jVTJXizEI/Xn6LFepQ6kLnP
 KzOZzreNCK7pusKv0KTjt7CfEOVvOx5wInXDL6uRIixNyzlPBoZF/T/LS
 bSBrwiTRgu6JF1t73xDmwfvXn/EoRjsDSB7HtLSnGwg9APokkG7h/8Yve
 cCFUJjXBPeFWBmk1KsIlbORPu6meLJvAicahxG/0yfh8CI26oeB7d7gji Q==;
X-CSE-ConnectionGUID: TvT3BGa7R6SLUvdsqdVTxA==
X-CSE-MsgGUID: c2IB4+pLRCCDIToJO8gKTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99084941"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="99084941"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:58:24 -0700
X-CSE-ConnectionGUID: RQ1IJ2TnSMiOidgwagpdkw==
X-CSE-MsgGUID: jMcsqs4BS/6xMp88okTQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="272338907"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:58:22 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v4 4/4] drm/xe/gt: Report GT reset and power failures using
 SIGID
Date: Fri, 28 Aug 2026 15:28:03 +0530
Message-ID: <20260828095803.2130312-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828095803.2130312-1-arvind.yadav@intel.com>
References: <20260828095803.2130312-1-arvind.yadav@intel.com>
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

Route the GT reset failure log through the structured SIGID logging
helper.

Failure to clear GRDOM_FULL means the GT reset did not complete as
expected. Use the GT component, which maps to XE_SIGID_GT_TDR, and
pass the reset errno value to the helper.

Keep the lower-level GRDOM_FULL failure report because it records
the exact reset register wait that failed before the higher-level
reset failure is reported.

Also route GT suspend, resume and runtime power-flow failures through
the same helper.

These paths were already reported as GT errors. This change only adds
structured SIGID reporting and keeps the errno in the helper data.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6805e0d3bf21..58df31ecb825 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -824,8 +824,7 @@ static int do_gt_reset(struct xe_gt *gt)
 	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
 	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
 	if (err)
-		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
-			  ERR_PTR(err));
+		xe_log_err(gt, GT, err, "failed to clear GRDOM_FULL\n");
 
 	xe_gsc_wa_14015076503(gt, false);
 
@@ -1013,13 +1012,13 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
-		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
+		xe_log_err(gt, GT, -ETIMEDOUT, "suspend failed\n");
 		return -ETIMEDOUT;
 	}
 
 	err = xe_uc_suspend(&gt->uc);
 	if (err) {
-		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
+		xe_log_err(gt, GT, err, "suspend failed\n");
 		return err;
 	}
 
@@ -1065,7 +1064,7 @@ int xe_gt_resume(struct xe_gt *gt)
 	xe_gt_dbg(gt, "resuming\n");
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
-		xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
+		xe_log_err(gt, GT, -ETIMEDOUT, "resume failed\n");
 		return -ETIMEDOUT;
 	}
 
@@ -1092,7 +1091,7 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
-		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
+		xe_log_err(gt, GT, -ETIMEDOUT, "runtime suspend failed\n");
 		return -ETIMEDOUT;
 	}
 
@@ -1116,7 +1115,7 @@ int xe_gt_runtime_resume(struct xe_gt *gt)
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
-		xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
+		xe_log_err(gt, GT, -ETIMEDOUT, "runtime resume failed\n");
 		return -ETIMEDOUT;
 	}
 
-- 
2.43.0

