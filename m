Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A34CFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 08:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18CC10E05A;
	Fri, 28 Nov 2025 08:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9b40kNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9462C10E05A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764318166; x=1795854166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TE61UtlvdGeVV/l8heBM/J0EJ6u9UhtWXBOlA8zng8I=;
 b=F9b40kNFnwAa9S2r8UV+apOYNVU73UrWq63SJOCRdTEFr7otXtwNoMFS
 +0ZMKU6+TF9vfRWmqJ72T3h3Nl4Eay7PXkhsnsTIvII7aqD8BZudSJKSx
 t6ISf7VevhIX+5eyh6dsvePt2j2WPXnpOBv08uylf4vOS5cudXt1o+lHS
 T3SBxFazSBqLEmczSlOVEr/dFT+cKIWU/Kh0onM5F/17SwLCxhfKSuEoO
 hn9EhS9fNQrlXY5pOIT8tyUF6SURxLXK94lojxAAxxpj1dcAh3iQ8NMUY
 Mx6/v9lnwf4nAUmM+NV0m8KqVKB9w6ErYAbXIZDT6os3LgU+tgL+YvAzW g==;
X-CSE-ConnectionGUID: BskeFISKQPilLNlMJlh6XQ==
X-CSE-MsgGUID: s7FQAo4ERAO1hTSXvafcIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83960831"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="83960831"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 00:22:46 -0800
X-CSE-ConnectionGUID: w2/RUMIgQ66sdjpuxLkVuQ==
X-CSE-MsgGUID: rbPRjOoxSR+aII6VyqBUmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="193206939"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 28 Nov 2025 00:22:43 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/gt: Use scope-based forcewake
Date: Fri, 28 Nov 2025 13:52:12 +0530
Message-ID: <20251128082212.294592-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Switch runtime PM code to use scope-based forcewake for consistency with
other parts of the driver.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 996756d1fbd5..1bfde7af90b3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -964,26 +964,20 @@ int xe_gt_resume(struct xe_gt *gt)
  */
 int xe_gt_runtime_suspend(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-	int err = -ETIMEDOUT;
-
 	xe_gt_dbg(gt, "runtime suspending\n");
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_force_wake;
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
+		return -ETIMEDOUT;
+	}
 
 	xe_uc_runtime_suspend(&gt->uc);
 	xe_gt_disable_host_l2_vram(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "runtime suspended\n");
 
 	return 0;
-
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	return err;
 }
 
 /**
@@ -994,26 +988,20 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
  */
 int xe_gt_runtime_resume(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-	int err = -ETIMEDOUT;
-
 	xe_gt_dbg(gt, "runtime resuming\n");
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_force_wake;
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+		xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
+		return -ETIMEDOUT;
+	}
 
 	xe_gt_enable_host_l2_vram(gt);
 	xe_uc_runtime_resume(&gt->uc);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "runtime resumed\n");
 
 	return 0;
-
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	return err;
 }
 
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
-- 
2.43.0

