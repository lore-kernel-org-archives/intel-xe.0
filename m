Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46998C982CC
	for <intel-xe@archiver.kernel.org>; Sat, 19 Sep 2026 05:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDCF10E6D9;
	Sat, 19 Sep 2026 05:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkfE/TAt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C205E10E642
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Sep 2026 05:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789794063; x=1821330063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2w852UA/5wZCaVNsqOt86PAKppDOTs2xsPrc3guPKXQ=;
 b=fkfE/TAtU8yCYcqjTXQO8+vnjDHiIXJq+KkRaJf30P8C7uhS00ZIkqGR
 BamZWw+7zvt/ebWHOvenuhwcwZlniATw46jsvr9jdiBDt1YMN+5mQjk/3
 lQEjtTUPbfMt7eEfr17gh3KOJK/0yQj6ryDirhWhL/xIKk1Ysy2TOdATG
 j0sMYxxyRHCfnEHUwXUxbBYTbZRmMVh/82wTXqQQMcW2nda+IyZmzr6DO
 et7a0OVxZta7WGLZoburaC8opZnxlDSDUfL1yu5kh7d5sEHUEcpnAz5L4
 TLJiHDLqxjzfhL55LQ/L/btqaWMhd9cByGVW2Jk6u1Rn5hbYC5Ld3TRJW w==;
X-CSE-ConnectionGUID: xq3lBnbxR5SZB09hwAdtNA==
X-CSE-MsgGUID: BBH0oJmIQx6Jzo4poqxP2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="89463548"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="89463548"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 22:01:03 -0700
X-CSE-ConnectionGUID: BcvyDIS4SyeTX4dAS2H74Q==
X-CSE-MsgGUID: BcCWLoHdTKy6cTyp0s/9jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2926698"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 22:01:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v5 1/7] drm/xe/guc: Use different error codes for GuC load
 errors
Date: Fri, 18 Sep 2026 22:00:57 -0700
Message-ID: <20260919050055.2092579-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919050055.2092579-9-umesh.nerlige.ramappa@intel.com>
References: <20260919050055.2092579-9-umesh.nerlige.ramappa@intel.com>
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

Instead of always returning -EPROTO no matter what goes wrong, use
different error codes based on the error type.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: split to its own patch
---
 drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c7f8bbd4cb92..5285d4cecbc8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1144,8 +1144,8 @@ static void print_load_status_err(struct xe_gt *gt, u32 status)
  * Check GUC_STATUS looking for known terminal states (either completion or
  * failure) of either the microkernel status field or the boot ROM status field.
  *
- * Returns 1 for successful completion, -1 for failure and 0 for any
- * intermediate state.
+ * Returns 0 for successful completion, -EBUSY for any intermediate state and
+ * other errno values for failure cases.
  */
 static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
 {
@@ -1157,20 +1157,22 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
 
 	switch (ukernel) {
 	case XE_GUC_LOAD_STATUS_READY:
-		return 1;
+		return 0;
 	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
 	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
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
@@ -1184,7 +1186,7 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
 	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
 	case XE_BOOTROM_STATUS_EXCEPTION:
 	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
-		return -1;
+		return -ENOEXEC;
 	}
 
 	if (++*tries >= 100) {
@@ -1197,7 +1199,7 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
 			  *status, ukernel, bootrom);
 	}
 
-	return 0;
+	return -EBUSY;
 }
 
 static int guc_wait_ucode(struct xe_guc *guc)
@@ -1213,21 +1215,21 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	before_freq = xe_guc_pc_get_act_freq(guc_pc);
 	before = ktime_get();
 
-	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries), load_result,
-			      10 * USEC_PER_MSEC,
+	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries),
+			      load_result != -EBUSY, 10 * USEC_PER_MSEC,
 			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
 
 	delta_ms = ktime_to_ms(ktime_sub(ktime_get(), before));
 	act_freq = xe_guc_pc_get_act_freq(guc_pc);
 	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
 
-	if (ret || load_result <= 0) {
+	if (ret || load_result) {
 		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
 			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
 			  xe_guc_pc_get_cur_freq_fw(guc_pc));
 		print_load_status_err(gt, status);
 
-		return -EPROTO;
+		return ret ?: load_result;
 	}
 
 	if (delta_ms > GUC_LOAD_TIME_WARN_MSEC) {
-- 
2.55.0

