Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AE9C982DA
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 23:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764F310E6DF;
	Thu, 17 Sep 2026 23:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHTAOwZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1ED10E00B
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789689573; x=1821225573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hot+iwMYRZfF8rYMdZ0MYynmtQaK6ltKZG4iAv2vjcI=;
 b=nHTAOwZXrDSglhEIRsrJUy6NOtL5t1OrVLpjLG8B0JZzHP2PB+rASA5w
 m7tbWH4mNFj+nDt/ytc3WYtaWJ2JLSGu2G17FoYm8oG88jYXQ6Qh55mAy
 iG8u5lWnOVCkYe3DGr+v96Rwq4UoIOxfBoVmWZJANlu2Y3VUz96VvKBY7
 K0/jCDhSdWMC8af+J3l7laHBGry71+Ab/OmCx7DAkuaL5Ft9fChlXdXM0
 VvR437SDAa2Gk4V8/ZXjMiVuzueZxPm3B16mJrL7eqWD9+HI7vuwukS9H
 ZDIlMYRS0prgbCqGMRs5qWWUuA8A+rQUvTb+7ECXTna9og+GYjSWYQqld Q==;
X-CSE-ConnectionGUID: q8HCucIDS1urVxZC3ueAjA==
X-CSE-MsgGUID: lPDPXf8NRSeMxmBVV7bvrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77727915"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77727915"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:32 -0700
X-CSE-ConnectionGUID: FibqihmcR2OpkZGnXnZUJA==
X-CSE-MsgGUID: hwh/jNnqS1mCPViavV7nLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270788221"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v4 6/7] drm/xe/guc: Report major GuC failures using SIGID
Date: Thu, 17 Sep 2026 16:59:30 -0700
Message-ID: <20260917235923.1521112-15-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
References: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: split guc_load_done changes to their own patch, use available ret
value for reset errors (Michal)
v3: Remove 'GuC' string from logs and cleanup logs (Michal)
v4: (Michal)
- Add s-o-b
- Differentiate Early vs later initialization messages
- Use %u for frequencies
- Remove unnecessary newline
---
 drivers/gpu/drm/xe/xe_guc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 5285d4cecbc8..3bb4aea30a5c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -777,7 +777,7 @@ int xe_guc_init_noalloc(struct xe_guc *guc)
 	return 0;
 
 out:
-	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
+	xe_log_err(gt, GUC, ret, "Early initialization error\n");
 	return ret;
 }
 
@@ -845,7 +845,7 @@ int xe_guc_init(struct xe_guc *guc)
 	return 0;
 
 out:
-	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
+	xe_log_err(gt, GUC, ret, "Initialization error\n");
 	return ret;
 }
 
@@ -998,15 +998,15 @@ int xe_guc_reset(struct xe_guc *guc)
 
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
+		xe_log_err(gt, GUC, ret, "MIA core not in reset, GUC_STATUS=%#x\n",
+			   guc_status);
 		goto err_out;
 	}
 
@@ -1224,9 +1224,9 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
 
 	if (ret || load_result) {
-		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
-			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
-			  xe_guc_pc_get_cur_freq_fw(guc_pc));
+		xe_log_err(gt, GUC, ret ?: load_result,
+			   "Load failed, GUC_STATUS=%#x, time = %lldms, freq = %uMHz (req %uMHz)\n",
+			   status, delta_ms, act_freq, cur_freq);
 		print_load_status_err(gt, status);
 
 		return ret ?: load_result;
@@ -1463,7 +1463,7 @@ int xe_guc_suspend(struct xe_guc *guc)
 
 	ret = xe_guc_softreset(guc);
 	if (ret) {
-		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
+		xe_log_err(gt, GUC, ret, "Suspend aborted\n");
 		return ret;
 	}
 
-- 
2.55.0

