Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638A5D2CDE3
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 04:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D3B10E9B7;
	Fri,  5 Dec 2025 04:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zig+0AWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8081A10E9B7
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 04:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764910549; x=1796446549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BGhAFYxsLTv0W7gSCpn32L7+N3Q0Lv/jidcDpq5WiXM=;
 b=Zig+0AWF5fEznLmSAiCR0/Vj2+iOOdOk537+NX9V53Efsczs2fe7c4wx
 dtQSEdTLGX5YPejb/Z7baNy/s2WxAZP699zdAC7DxNVrFV9z4wenCQK/A
 oTVKnIVoWhbsY7fKYQHYlx7/50QHEg/5wvGHR+GrTz3dS4BtIXo5A+bIs
 4QOw3oQdd9HsWfh6R11nTH2lxRgSTXLZgsKXNV0k20gecgMjRnGtKmf6c
 vYIXf1VDxyE07Ht15n9GnNu8vMYXtTNAT9zNKt3lArb8G6M+cTFxkCWJg
 gal8I6rHG0/8E3HwFO4/0zFIszplctqtZrVwE4pNgrbUFwxvHx1niqtUg w==;
X-CSE-ConnectionGUID: CCvu72xYTPG9NMIuYjroSw==
X-CSE-MsgGUID: ZPnx9+bkQRenkCIXvShocg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70562028"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="70562028"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 20:55:49 -0800
X-CSE-ConnectionGUID: 5R4ilu5ZTrqxitkLbfHTZg==
X-CSE-MsgGUID: q3IMyEizT0ijxHDiLOAhrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195286152"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 20:55:49 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com, joonas.lahtinen@intel.com,
 matthew.brost@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/1] drm/xe: Restore engine registers before restarting
 schedulers after GT reset
Date: Fri,  5 Dec 2025 05:55:29 +0100
Message-Id: <20251205045529.3801762-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251205045529.3801762-1-jan.maslak@intel.com>
References: <20251205045529.3801762-1-jan.maslak@intel.com>
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

During GT reset recovery in do_gt_restart(), xe_uc_start() was called
before xe_reg_sr_apply_mmio() restored engine-specific registers. This
created a race window where the scheduler could run jobs before hardware
state was fully restored.

This caused failures in eudebug tests (xe_exec_sip_eudebug@breakpoint-
waitsip-*) where TD_CTL register (containing TD_CTL_GLOBAL_DEBUG_ENABLE)
wasn't restored before jobs started executing. Breakpoints would fail to
trigger SIP entry because the debug enable bit wasn't set yet.

Fix by moving engine register restoration before xe_uc_start(), ensuring
all hardware state is fully restored before any jobs can be scheduled.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 7caf781ba9e8..17642d71f98f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -771,13 +771,14 @@ static int do_gt_restart(struct xe_gt *gt)
 		xe_gt_sriov_pf_init_hw(gt);
 
 	xe_mocs_init(gt);
-	err = xe_uc_start(&gt->uc);
-	if (err)
-		return err;
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
 
+	err = xe_uc_start(&gt->uc);
+	if (err)
+		return err;
+
 	/* Get CCS mode in sync between sw/hw */
 	xe_gt_apply_ccs_mode(gt);
 
-- 
2.34.1

