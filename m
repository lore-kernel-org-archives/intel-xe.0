Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E1CC61DBE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 00:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587FC10E37D;
	Thu, 27 Aug 2026 00:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+C1Ne1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A47610E37D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 00:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787790494; x=1819326494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7fq18hzcc6lUGQYmkGNA3Qfeq74KlaInjhBTlGG5+Nw=;
 b=D+C1Ne1uxj/GEg7aLsyZaH5PmLi5y6OmxcTVhUbH+/MC7ILYHneS/J8V
 K+zsBNymVjjflEe2HrqGdFZ7/2sUeYRiQ8KfV5lHDN5ZuXjr/tIfE0Az0
 4rQH3/U3obvwR30y+QoRvWn6SMPNC1Dp9ki8wGns9jkhXAzhnYnP2BQtR
 E+KIa9330MvyUyuJf/aWFO49IJvnqpg0SoQpbCNLuX21cKjLzsHiGuDfZ
 qOqINHCQu3Qn3mF47ASSWglIWtJpmoW392rSx5Z2eoPiiMEwY/w/N+vnf
 WJ2JDu5Ay+UJMFvhTCKSIqCJwhoMEk2TIVksDMx2znytzFkkGMSPrwOor w==;
X-CSE-ConnectionGUID: Bs1rLy/PSyS8aYDAOnKKZQ==
X-CSE-MsgGUID: P5AQQQS5Qp2t0QFVlrq1nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98620376"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="98620376"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 17:28:14 -0700
X-CSE-ConnectionGUID: DJEXw7ZkRLC21x8X0m/gww==
X-CSE-MsgGUID: N39HRvffRB+h0QDvcTDNJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="265126126"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 17:28:14 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Report major GuC failures using SIGID
Date: Thu, 27 Aug 2026 00:28:00 +0000
Message-ID: <20260827002801.837731-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
References: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
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

Convert errors during critical GuC flows (init, load, reset, suspend)
to use the xe_log_err() helper.
For the GuC load failure scenario, the possible failure modes have been
bucketed into 3 different possible error codes to distinguish a bad
binary from a driver error or unexpected HW behavior.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c7f8bbd4cb92..484cb47fbc81 100644
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
 
@@ -998,14 +998,15 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
 	if (ret) {
-		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
+		xe_log_err(gt, GUC, -EIO, "GuC reset timed out, GDRST=%#x\n", gdrst);
 		goto err_out;
 	}
 
 	guc_status = xe_mmio_read32(mmio, GUC_STATUS);
 	if (!(guc_status & GS_MIA_IN_RESET)) {
-		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
-			  guc_status);
+		xe_log_err(gt, GUC, -EIO,
+			   "GuC status: %#x, MIA core expected to be in reset\n",
+			   guc_status);
 		ret = -EIO;
 		goto err_out;
 	}
@@ -1163,14 +1164,16 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
 	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
 	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
 	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
+		return -ENOEXEC;
 	case XE_GUC_LOAD_STATUS_DPC_ERROR:
 	case XE_GUC_LOAD_STATUS_EXCEPTION:
+		return -EIO;
 	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
 	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
 	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
 	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
 	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
-		return -1;
+		return -EINVAL;
 	}
 
 	switch (bootrom) {
@@ -1184,7 +1187,7 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
 	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
 	case XE_BOOTROM_STATUS_EXCEPTION:
 	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
-		return -1;
+		return -ENOEXEC;
 	}
 
 	if (++*tries >= 100) {
@@ -1222,9 +1225,10 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
 
 	if (ret || load_result <= 0) {
-		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
-			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
-			  xe_guc_pc_get_cur_freq_fw(guc_pc));
+		xe_log_err(gt, GUC, ret ?: load_result,
+			   "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
+			   status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
+			   xe_guc_pc_get_cur_freq_fw(guc_pc));
 		print_load_status_err(gt, status);
 
 		return -EPROTO;
@@ -1461,7 +1465,7 @@ int xe_guc_suspend(struct xe_guc *guc)
 
 	ret = xe_guc_softreset(guc);
 	if (ret) {
-		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
+		xe_log_err(gt, GUC, ret, "GuC suspend failed\n");
 		return ret;
 	}
 
-- 
2.53.0

