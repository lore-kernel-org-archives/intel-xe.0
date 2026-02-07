Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5928EE0AE8
	for <intel-xe@archiver.kernel.org>; Sat,  7 Feb 2026 21:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8468922E;
	Sat,  7 Feb 2026 21:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPV8iSv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22A98922E
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Feb 2026 21:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770500697; x=1802036697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xu5MeOCta5ECOvNcfDpY06xuIbUSSi6XT23Fs5S8rzA=;
 b=BPV8iSv3B1rDAA+6ZXNtCbe5+LRJjmorN7piUNFKnCUfUPZJvaV7+sEa
 AiJgHCl1r4VgxAjg9kZuJp9PUKnkamLIE28/ZZznONUn6vcb4Ykt/k3Gt
 FwhgIE87cXFsGPTr4OUFBuZUjdY9eqnB4INzjaRa3YXE74GJSvluzPUpy
 vWH707h3lzEROCjnuYc2M0VczuyWVwF8tDI+cEC21U5s1cxV8SAnZJG4f
 a/NJRmk/XKKh6lmFiIjybeeNIZr/GhGeZIYote/Bns5w5xgNLbTLqz+9T
 5ulJ1kmwPQ9PkFHOhC0+FEA8cjm7jksZ5FxF9roCIZdKUTT80Tu9MzyFE w==;
X-CSE-ConnectionGUID: /Y5KYD0LRMm5jHj/hN1iiQ==
X-CSE-MsgGUID: B8xFb7tSSN23G9wJ/Gz8eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="71571696"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; d="scan'208";a="71571696"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2026 13:44:56 -0800
X-CSE-ConnectionGUID: oSFXfi5jSqi7+J14lcvUgQ==
X-CSE-MsgGUID: gPnRLF81STayAfEeWvRFxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; d="scan'208";a="215711875"
Received: from sbhoran-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.21.88])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2026 13:44:55 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/vf: Allow VF to initialize MCR tables
Date: Sat,  7 Feb 2026 22:44:28 +0100
Message-ID: <20260207214428.5205-1-michal.wajdeczko@intel.com>
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

While VFs can't access MCR registers, it's still safe to initialize
our per-platform MCR tables, as we might need them later in the LRC
programming, as engines itself may access MCR steer registers and
thanks to all our past fixes to the VF probe initialization order,
VFs are able to use values of the fuse registers needed here.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 7c1fe9ac120d..66c4efca80fe 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -505,9 +505,6 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
 
 	spin_lock_init(&gt->mcr_lock);
 
-	if (IS_SRIOV_VF(xe))
-		return;
-
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
 
@@ -568,9 +565,6 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
  */
 void xe_gt_mcr_init(struct xe_gt *gt)
 {
-	if (IS_SRIOV_VF(gt_to_xe(gt)))
-		return;
-
 	/* Select non-terminated steering target for each type */
 	for (int i = 0; i < NUM_STEERING_TYPES; i++) {
 		gt->steering[i].initialized = true;
-- 
2.47.1

