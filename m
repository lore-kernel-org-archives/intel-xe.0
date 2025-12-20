Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C58E6689E
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 07:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E186B10E080;
	Sat, 20 Dec 2025 07:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1utdLBI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6373C10E080
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766216375; x=1797752375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xd69oRFlZTQFT480CBdZl3pg/8Z2WdY+mvH8/7fehU8=;
 b=c1utdLBIFR3ZJaAKl+wEd9gIrwhABXmvOpgUkO4l5TwQsGfPDQ3q4TQ3
 m4z+Kzsc0Nq+a/f9o0JFZzdEMFjqHddPaiKOJkh5QeBoTPv9EEo6AzewF
 x1qv3aRH82w13dr2rFqQhkI0q/XRz85iJ3/B4sHTCxsz7ryXub9Nt/Ak4
 z3Kx+5nPdW83u+NbwBNfE9CVKGJKkfObr+cwY2bsm2U4nZtfiYlSoARhq
 QC2gjp7voLJyIspfzcfqtO6zhl4O4pzBivkL0bwFqRVstpQ6knTez19VQ
 Q06zy1D72+Mjh6ErInWEEkYVJ9iy/7qYBBvJ2sWGFx1euma58/3plhlVV A==;
X-CSE-ConnectionGUID: WiOa6MhNQo67L8+Lq1hT0A==
X-CSE-MsgGUID: bXrdpk15SZ65MNqlLwwwHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="85749297"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="85749297"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 23:39:34 -0800
X-CSE-ConnectionGUID: 0gnPNhkxT1y/sB699AfS2A==
X-CSE-MsgGUID: xto8f0zdQTGKYQ4r6WCwXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="203199536"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 19 Dec 2025 23:39:30 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 karthik.poosa@intel.com, matthew.d.roper@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/pm: Handle GT resume failure
Date: Sat, 20 Dec 2025 13:06:56 +0530
Message-ID: <20251220073657.166810-1-raag.jadav@intel.com>
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

We've been historically ignoring GT resume failure. Since the function
can return error, handle it properly.

v2: Bring up display before bailing (Matt Roper, Rodrigo)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 4390ba69610d..559cf5490ac0 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -260,10 +260,19 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_resume(gt);
+		if (err)
+			break;
+	}
 
+	/*
+	 * Try to bring up display before bailing from GT resume failure,
+	 * so we don't leave the user clueless with a blank screen.
+	 */
 	xe_display_pm_resume(xe);
+	if (err)
+		goto err;
 
 	err = xe_bo_restore_late(xe);
 	if (err)
@@ -656,10 +665,19 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	for_each_gt(gt, xe, id)
-		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
+	for_each_gt(gt, xe, id) {
+		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
+		if (err)
+			break;
+	}
 
+	/*
+	 * Try to bring up display before bailing from GT resume failure,
+	 * so we don't leave the user clueless with a blank screen.
+	 */
 	xe_display_pm_runtime_resume(xe);
+	if (err)
+		goto out;
 
 	if (xe->d3cold.allowed) {
 		err = xe_bo_restore_late(xe);
-- 
2.43.0

