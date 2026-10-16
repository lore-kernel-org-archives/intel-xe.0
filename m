Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A3BCCF2C6
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 20:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0423A1129D9;
	Fri, 16 Oct 2026 20:44:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266CF1129D6
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 20:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792183445; x=1823719445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4wk1O/0/OzwhLnS6eBVai2arzhuMaH257JrisNMrWTI=;
 b=dYTnM7EKj+oCRloq6CuZ1eCqWR0HAZWnmfVjgH205iYIyCMA9+jnAo0R
 Rl6le5btzaW8zD6krNx+okUp2RdYDHkAd9CAUoproSgW9XabxXI6SwH1B
 nzbj8LsdDzECWtKmDN6JR/J+iKaOjuWp4v1Qv/tg1utqMWi6Kcm9fVWtT
 dfBZ+pING123uuG8Z1VC3l91byz/Ia7+7NxUn3BmkqT4cPbjW+MIbVJn+
 jg5V5KxH1tgrlW8PpgJD+FpzJz4BeabuBX7jh5AkbW1ysWUt9ZkIg0jUu
 7ZXw3llLGCgDKWupso0u9BymQr/WaWSe0a8h8/CHCT8uGPLXlpMwifnI5 w==;
X-CSE-ConnectionGUID: dEZfdmNRTzq60FIKZ4Uiaw==
X-CSE-MsgGUID: qOaJFfMUQ0eydGD+OBkB9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1074529"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1074529"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:44:03 -0700
X-CSE-ConnectionGUID: Egcn9tDfS26IUid/Qjlm7w==
X-CSE-MsgGUID: zBA5rWRdQay0h7OU7+fVtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3784135"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:44:04 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, dnyaneshwar.bhadane@intel.com,
 michal.wajdeczko@intel.com, jesus.narvaez@intel.com
Subject: [PATCH v8 1/7] drm/xe/guc: Use different error codes for GuC load
 errors
Date: Fri, 16 Oct 2026 13:43:56 -0700
Message-ID: <20261016204354.364846-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016204354.364846-9-umesh.nerlige.ramappa@intel.com>
References: <20261016204354.364846-9-umesh.nerlige.ramappa@intel.com>
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
index 6c35474ab843..03b04305274b 100644
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

