Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA541CD8C9F
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 18:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A7810F884;
	Mon,  8 Jun 2026 18:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNN8pzu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3FF10F884
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 18:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780943322; x=1812479322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=14XtHrXbXWlwru7yyb/G0uwAFLmshPWVHBAlQoDP2LA=;
 b=dNN8pzu7K7hsYCDSP7ARKeNqSIYXRnRH0HIvZHimaOKwW+ilf1uvGEwQ
 k/FJeN2brAbSc/vwf3AHDfIGA3nD7vMQSMn5n0+0oet3Mzfc0j+qzL0rL
 WECOs44m+0BCpqkpAebgOcswmpOUycVH1t2mzPDgbivaIr4d/zjMy1PHU
 lK9bQ0/cZNoycI4ueCqXklq7EvY4HFIrlCyeYHEqx8Qn/9WnKGDAn54ux
 ef1hWtfF68iee2cvuHL2H5NEIAF+9R07GzpgQFmfYaHq91ZJxwnVstpI+
 nPremf4AabxQhZADAiszk1JJEbEXT9gVNn8ElnmyJWWwjzF9jBcOolU8J A==;
X-CSE-ConnectionGUID: ZY8tRFZQRIeFsBxM+mid8A==
X-CSE-MsgGUID: NNrPLlHYS1GPpsuKdmkYxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92367997"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92367997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 11:28:42 -0700
X-CSE-ConnectionGUID: /rxbZHmKRn6Rb3hevSrT5A==
X-CSE-MsgGUID: /GTJ3nYQS6KelJ91C7y7zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="250726842"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 11:28:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/mcr: Prefer GT-oriented WARN messages
Date: Mon,  8 Jun 2026 20:28:29 +0200
Message-ID: <20260608182829.913-1-michal.wajdeczko@intel.com>
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

In all functions where xe_gt pointer is relevant, we should use
GT-oriented diagnostic messages using macros from xe_gt_printk.h

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 04f0098070a4..d11cc9e25cdb 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -507,7 +507,7 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
 	spin_lock_init(&gt->mcr_lock);
 
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
-		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
+		xe_gt_WARN_ON(gt, MEDIA_VER(xe) < 13);
 
 		if (MEDIA_VER(xe) >= 30) {
 			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
@@ -662,9 +662,9 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 
 	for (int type = 0; type < IMPLICIT_STEERING; type++) {
 		if (reg_in_steering_type_ranges(gt, reg, type)) {
-			drm_WARN(&gt_to_xe(gt)->drm, !gt->steering[type].initialized,
-				 "Uninitialized usage of MCR register %s/%#x\n",
-				 xe_steering_types[type].name, reg.addr);
+			xe_gt_WARN(gt, !gt->steering[type].initialized,
+				   "Uninitialized usage of MCR register %s/%#x\n",
+				   xe_steering_types[type].name, reg.addr);
 
 			*group = gt->steering[type].group_target;
 			*instance = gt->steering[type].instance_target;
@@ -679,9 +679,9 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 	 * Not found in a steering table and not a register with implicit
 	 * steering. Just steer to 0/0 as a guess and raise a warning.
 	 */
-	drm_WARN(&gt_to_xe(gt)->drm, true,
-		 "Did not find MCR register %#x in any MCR steering table\n",
-		 reg.addr);
+	xe_gt_WARN(gt, true,
+		   "Did not find MCR register %#x in any MCR steering table\n",
+		   reg.addr);
 	*group = 0;
 	*instance = 0;
 
@@ -710,7 +710,7 @@ static void mcr_lock(struct xe_gt *gt) __acquires(&gt->mcr_lock)
 		ret = xe_mmio_wait32(&gt->mmio, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
 				     true);
 
-	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
+	xe_gt_WARN_ON_ONCE(gt, ret == -ETIMEDOUT);
 }
 
 static void mcr_unlock(struct xe_gt *gt) __releases(&gt->mcr_lock)
-- 
2.47.1

