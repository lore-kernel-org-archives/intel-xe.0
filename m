Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CB5C624D6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 21:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF0F10EF2F;
	Tue,  1 Sep 2026 21:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXoeroFl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBEA10EF2C
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788297133; x=1819833133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dzZoB4QjY38Cl6NxpbVR8HVUZmMJMPBcvIY+wf5vv/0=;
 b=CXoeroFlct4OcVx2pTea15PYs7Prstsjjjz0dYcPOtHCMxcDM1J9ZDj/
 UfCIDvZI0JACIuA72yP/mb7JgcXKbilAlrSvJyazi+GNsITXprnjYWvvq
 A2wdoKigoGvkCtlZB/tQyfTScQfB6+1Jq6q0eA2zuqik1TDlnohANNx0r
 d1Pztx7CMe/sL8mtD7QbjWPxEu0Yb5WIkhLbAODvvHcl193LG5lPHw8i9
 HzK7y1M5QyYJXSeqGYcbH5nb1amNyRsjix3Rw2Ruj+e0iOgHRY4Z8CMeZ
 nfXTGxmn7UEbqE3EwCALMk1QSNTjxVA5+uyy4Zztth6SyZUjJM9bsXt5x g==;
X-CSE-ConnectionGUID: H4ECGflfRuaUlpQk5MA03w==
X-CSE-MsgGUID: IIye3V+LRfCTj8/gCO+1UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92562331"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="92562331"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:12:12 -0700
X-CSE-ConnectionGUID: +Nx7l63qTluo+MLCOk8gPA==
X-CSE-MsgGUID: BHOB9umxRLaAvVrBRtmAYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="272988135"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:12:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v2 4/5] drm/xe/guc: Report major GuC failures using SIGID
Date: Tue,  1 Sep 2026 14:12:09 -0700
Message-ID: <20260901211204.131972-11-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Convert errors during critical GuC flows (init, load, reset, suspend)
to use the xe_log_err() helper.
While at it, simplify the error log for the GuC load failure to use the
cached frequency values instead of fetching them again.

v2: split guc_load_done changes to their own patch, use available ret
value for reset errors (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 5285d4cecbc8..d0ddaaf35274 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -777,7 +777,7 @@ int xe_guc_init_noalloc(struct xe_guc *guc)
 	return 0;
 
 out:
-	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
+	xe_log_err(gt, GUC, ret, "GuC init failed\n");
 	return ret;
 }
 
@@ -845,7 +845,7 @@ int xe_guc_init(struct xe_guc *guc)
 	return 0;
 
 out:
-	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
+	xe_log_err(gt, GUC, ret, "GuC init failed\n");
 	return ret;
 }
 
@@ -998,15 +998,16 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
 	if (ret) {
-		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
+		xe_log_err(gt, GUC, ret, "GuC reset timed out, GDRST=%#x\n", gdrst);
 		goto err_out;
 	}
 
 	guc_status = xe_mmio_read32(mmio, GUC_STATUS);
 	if (!(guc_status & GS_MIA_IN_RESET)) {
-		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
-			  guc_status);
 		ret = -EIO;
+		xe_log_err(gt, GUC, ret,
+			   "GuC status: %#x, MIA core expected to be in reset\n",
+			   guc_status);
 		goto err_out;
 	}
 
@@ -1224,9 +1225,9 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
 
 	if (ret || load_result) {
-		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
-			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
-			  xe_guc_pc_get_cur_freq_fw(guc_pc));
+		xe_log_err(gt, GUC, ret ?: load_result,
+			   "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
+			   status, delta_ms, act_freq, cur_freq);
 		print_load_status_err(gt, status);
 
 		return ret ?: load_result;
@@ -1463,7 +1464,7 @@ int xe_guc_suspend(struct xe_guc *guc)
 
 	ret = xe_guc_softreset(guc);
 	if (ret) {
-		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
+		xe_log_err(gt, GUC, ret, "GuC suspend failed\n");
 		return ret;
 	}
 
-- 
2.55.0

