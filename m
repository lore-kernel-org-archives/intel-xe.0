Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3D7C624DE
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE39810EDA3;
	Thu,  3 Sep 2026 23:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4xB4SyU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E360910ECCE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788478808; x=1820014808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1eCPXp5FS9tOt9aOO8Eb1NSZ1UkiSPhltj892fGco88=;
 b=J4xB4SyU3x3ec9Zw2zHVSUd/Xfop3mNY3pU1H5uLV/p0+fsOufOE7MG0
 pykB4HMtUxrEGcEVNMTit1SL2Z7FlVb31RfN7VwTpT9RGuaR+cJRWqOeE
 q48iOCNptIBkDJr9yWbECqojeVgex5/0Z+SNNtgw50qv/nTUQ97omxY21
 GjdXmMBoeu7rki51KrdDaNPQVSJ+dFmumaC+nXWTzvN7kQmxfuf4EcwJ9
 FWH6x/dO44k6rP+eJDOCDLUd4FY+ogsAjxuLkO62EsTQcRRim8rm2oTI8
 VXSTfSyi0eoQKk8lpkdOHyjk1JeYpoOmNvfGk+Kh1x5PEtaLpAfuHP74v w==;
X-CSE-ConnectionGUID: UB/oGZdiQkGTgxjnWsM9iw==
X-CSE-MsgGUID: onZqJKSwR1+ijFgIQ78brQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91489309"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="91489309"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:40:06 -0700
X-CSE-ConnectionGUID: ajSfYshWQ3ylkl7da6BZxw==
X-CSE-MsgGUID: s7kIn/hSSPaAO8KCd2AIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="299735225"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:40:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v3 1/5] drm/xe/guc: Use different error codes for GuC load
 errors
Date: Thu,  3 Sep 2026 16:40:00 -0700
Message-ID: <20260903233958.475162-8-umesh.nerlige.ramappa@intel.com>
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

Instead of always returning -EPROTO no matter what goes wrong, use
different error codes based on the error type.

v2: split to its own patch

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

