Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D01D3C91D
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 14:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE8810E262;
	Wed, 10 Dec 2025 14:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4jw2SLp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910C210E262
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765378662; x=1796914662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WUwAMR4Rl6BgadV3WhXsiV7fsNT4SitqysRPDg/q6JY=;
 b=M4jw2SLphundU3oToPDm2cl+1Zqp8x/3lBIPAY2h0D8PTXyaC0lRmixf
 pfu6fIv6DvbSI+adtzXAk3LlKVa2DJac2VfTcpY+7I/hMwkgf7aZFG2ru
 QDlqSr72Vf0j1DKPuQDKv4bUGzFJdtj5LZtELcQeAbMd1ntrLw0WgTI2q
 0awM6F0+8tRMx4oTxoVFbrWw5z+9/fXHgcJq0Bg4ZxiG16vQe3wr7Pkhs
 pQKuhtIyQTlikwFw7EJ2FuvxZoSN8KCe/YMOSTpb+VpJqCY+f9kFmnLrJ
 Zp6yQYfSM3BBrlCbWzPH6qVkL5r8LgBumkd3ho8irbJ8axVFEsYMhrvCg Q==;
X-CSE-ConnectionGUID: rplezNgzRMasbZ95wZ1EOA==
X-CSE-MsgGUID: x8Fn+rhVS++SzEoUt0TRZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="70971503"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="70971503"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:57:17 -0800
X-CSE-ConnectionGUID: LOcRp4n0QiOG5cMTS577Hw==
X-CSE-MsgGUID: WVRI6tnPT1e0pQ2iA2O9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="195600253"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:57:17 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com, joonas.lahtinen@linux.intel.com,
 matthew.brost@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/1] drm/xe: Restore engine registers before restarting
 schedulers after GT reset
Date: Wed, 10 Dec 2025 15:56:18 +0100
Message-Id: <20251210145618.169625-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210145618.169625-1-jan.maslak@intel.com>
References: <20251210145618.169625-1-jan.maslak@intel.com>
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

Fix by moving xe_uc_start() after all MMIO register restoration,
including engine registers and CCS mode configuration, ensuring all
hardware state is fully restored before any jobs can be scheduled.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 7caf781ba9e8..313ce83ab0e5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -771,9 +771,6 @@ static int do_gt_restart(struct xe_gt *gt)
 		xe_gt_sriov_pf_init_hw(gt);
 
 	xe_mocs_init(gt);
-	err = xe_uc_start(&gt->uc);
-	if (err)
-		return err;
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
@@ -781,6 +778,10 @@ static int do_gt_restart(struct xe_gt *gt)
 	/* Get CCS mode in sync between sw/hw */
 	xe_gt_apply_ccs_mode(gt);
 
+	err = xe_uc_start(&gt->uc);
+	if (err)
+		return err;
+
 	/* Restore GT freq to expected values */
 	xe_gt_sanitize_freq(gt);
 
-- 
2.34.1

