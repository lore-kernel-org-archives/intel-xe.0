Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D1DC71130
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 23:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20C710E033;
	Mon,  7 Jul 2025 23:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFE5N8Fa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D3E10E033
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 23:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751929871; x=1783465871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nhwgY/nagVWBZPr/nR5f2NGxHd46+jFtTsgEyhPfc0M=;
 b=bFE5N8FaOdWhWiAXciFx9v5OImjSlAwXAlNuSRwSMD3dhjxz0mK1Jl83
 t1o/0NyN9i1GZB6keVCEGbJv6FHJeBJ7/dwTFkinWKCr+llHVidURwCgx
 UDiN2tA0FBuO1Te0ci8OEc4guygKDDyH1wKn9BgEinhKgzruI/+ykt75M
 QVMMH8TkoSvAGhMGph0GMveQfxaJ1YZUF8BlIvDds8U23M27TZKvO5Co4
 PbDRvb8M8sSvoXn6dx5bltkud1cFvAYucHBbfMyhopzH3BKFbj6f2Cs8+
 t+hCsqnozlhr5r89vRPyodfCVqTBk2SsbejpdXm36+/vmEa0BZ+8/Vukc g==;
X-CSE-ConnectionGUID: l6VkF0pEQWin4P0aRF0J3Q==
X-CSE-MsgGUID: rnWRuHtqS2+K8w2T7EmuCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41783593"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="41783593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 16:11:11 -0700
X-CSE-ConnectionGUID: KlHctXehRSuj2icL/mpqQw==
X-CSE-MsgGUID: ezs+OX+OQliArqnRxJejJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="156081418"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa010.fm.intel.com with ESMTP; 07 Jul 2025 16:11:10 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v9] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Date: Mon,  7 Jul 2025 19:11:08 -0400
Message-Id: <20250707231108.3217573-1-zhanjun.dong@intel.com>
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

Disable GuC communication on Xe micro controller hardware initialization
error.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917

---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Change list:
v9: Switched to xe_guc_sanitize
v8: Fix kernel-doc style
    Add error handling in vf_guc_min_load_for_hwconfig
v7: Add kernel-doc for xe_guc_disable_communication
    Unset submission_state.enabled as well
v6: Skip disable ct on xe_guc_enable_communication error
v5: Set wedge is excessive action, revert back to disable ct
v4: Fix typo and add new line
v3: v2 CI re-run
v2: Remove unnecessary jump to err-out
    Drop disable ct, switch to set wedge
---
 drivers/gpu/drm/xe/xe_guc.c |  8 ++++++--
 drivers/gpu/drm/xe/xe_uc.c  | 18 +++++++++++++-----
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8573957facae..b1d1d6da3758 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1219,13 +1219,17 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 	ret = xe_gt_sriov_vf_connect(gt);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_gt_sriov_vf_query_runtime(gt);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	return 0;
+
+err_out:
+	xe_guc_sanitize(guc);
+	return ret;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 6431ba3a2c53..3e0c3af235f2 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -158,7 +158,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 
 	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
 	if (err)
-		return err;
+		goto err_out;
 
 	uc->guc.submission_state.enabled = true;
 
@@ -168,9 +168,13 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 
 	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (err)
-		return err;
+		goto err_out;
 
 	return 0;
+
+err_out:
+	xe_guc_sanitize(&uc->guc);
+	return err;
 }
 
 /*
@@ -202,15 +206,15 @@ int xe_uc_load_hw(struct xe_uc *uc)
 
 	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_guc_post_load_init(&uc->guc);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_guc_pc_start(&uc->guc.pc);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
@@ -222,6 +226,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	xe_gsc_load_start(&uc->gsc);
 
 	return 0;
+
+err_out:
+	xe_guc_sanitize(&uc->guc);
+	return ret;
 }
 
 int xe_uc_reset_prepare(struct xe_uc *uc)
-- 
2.34.1

