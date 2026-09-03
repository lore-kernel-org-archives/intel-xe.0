Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E49C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B2810F08F;
	Thu,  3 Sep 2026 23:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBgmrEAk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC7110E26C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788478808; x=1820014808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gle622koZEfXfcil18rPx1Mjli3hNoU7SJ6/mYikruI=;
 b=fBgmrEAkwobdBVLvvHU+18neKKVOi5kEWJuHUuZedZ5HOFeIoCnixvi9
 n4cxL2S+OaGtZX7kaySJIk33ZGFzJTW+Vuqg1yiPFMKYkkBqRGvn5P+Ng
 1Fs1GOtBYa0HVTKygYHxSbyTA5RJ9AW9dq5fktFjB4dHWEVPY7usl8kWC
 2JdQcQXiSRIVtzAjidn7LH15P8W2Kao+5Bs+aFFRHN8TBvfDbTIeYiYWY
 T3nWMGBuWWwum3/RWr8SNx8+BYQEFSJPfH8RI3sbpv12M9MVFSJSrI24+
 OpIACcT8orqe3KkxxG0mXxn7RQ/L1lESdLxt6HoEZ6xbU9aBU5eYDCWDH Q==;
X-CSE-ConnectionGUID: aWQYvu6MT/S9CxGJjDsVrw==
X-CSE-MsgGUID: PDDnUw9QQkSn8HbqMLUQWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91489316"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="91489316"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:40:07 -0700
X-CSE-ConnectionGUID: qXzxYzu2Q7ib5kNiDshuCg==
X-CSE-MsgGUID: dvb236RXRD66KI6xtzAhLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="299735235"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:40:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v3 4/5] drm/xe/guc: Report major GuC failures using SIGID
Date: Thu,  3 Sep 2026 16:40:03 -0700
Message-ID: <20260903233958.475162-11-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
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
v3: Remove 'GuC' string from logs and cleanup logs (Michal)

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
index 5285d4cecbc8..9684f6528641 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -777,7 +777,7 @@ int xe_guc_init_noalloc(struct xe_guc *guc)
 	return 0;
 
 out:
-	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
+	xe_log_err(gt, GUC, ret, "Initialization error\n");
 	return ret;
 }
 
@@ -845,7 +845,7 @@ int xe_guc_init(struct xe_guc *guc)
 	return 0;
 
 out:
-	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
+	xe_log_err(gt, GUC, ret, "Initialization error\n");
 	return ret;
 }
 
@@ -998,15 +998,16 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
 	if (ret) {
-		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
+		xe_log_err(gt, GUC, ret, "Reset timeout, GDRST=%#x\n", gdrst);
 		goto err_out;
 	}
 
 	guc_status = xe_mmio_read32(mmio, GUC_STATUS);
 	if (!(guc_status & GS_MIA_IN_RESET)) {
-		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
-			  guc_status);
 		ret = -EIO;
+		xe_log_err(gt, GUC, ret,
+			   "MIA core not in reset, GUC_STATUS=%#x\n",
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
+			   "Load failed, GUC_STATUS=%#x, time = %lldms, freq = %dMHz (req %dMHz)\n",
+			   status, delta_ms, act_freq, cur_freq);
 		print_load_status_err(gt, status);
 
 		return ret ?: load_result;
@@ -1463,7 +1464,7 @@ int xe_guc_suspend(struct xe_guc *guc)
 
 	ret = xe_guc_softreset(guc);
 	if (ret) {
-		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
+		xe_log_err(gt, GUC, ret, "Suspend aborted\n");
 		return ret;
 	}
 
-- 
2.55.0

