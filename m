Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18327CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 22:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6BA10E81A;
	Tue,  9 Sep 2025 22:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPpsGbVk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE16E10E815
 for <Intel-Xe@lists.freedesktop.org>; Tue,  9 Sep 2025 22:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757457692; x=1788993692;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QHwIBe8YQabqzuZVmSfJpOdOTDLZupqiECy/GXAZ8Ag=;
 b=DPpsGbVk2l8gtesXY8dK27m6IX5Dg2dSwq7ekrBlV/11OhitQWBNZ+/O
 M5LGXteiRaPnyK8HDDxRylvXeeEgleqdoJT7f4xSnFDuXUlF0mUUh/g2O
 7M/yn8Zgt0zfZq3cFLJs6Q5yIM6r6KW8+Cqjrhq+Aa9bk3i6pHTFeGexY
 ZtcMWKnr8m24WcM/85lYWTjCcRXS0aPgOtG8eEyX3j5VhJTcOu4uMMHi0
 aIu7RJXwdGPp1PaD3JFI7Unut5wxQWltKIf+cNpDFZQcEAVmmM+EZjNrE
 JTRDT7ljd90SgqIaLqAXtLXmFt3HPYgo5lkxCgu8DOJ4WEym5QPxZsUSW w==;
X-CSE-ConnectionGUID: 6RV2VxPjThOM/1RNsYZprg==
X-CSE-MsgGUID: 3FFgCmCySxaxjuzVN9+fKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="47330505"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="47330505"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 15:41:32 -0700
X-CSE-ConnectionGUID: gOp3C48PR6ufszDeYDAEPg==
X-CSE-MsgGUID: nP8JVIMKR9yyap1FQ4omxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="178433801"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 09 Sep 2025 15:41:32 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/guc: Return an error code if the GuC load fails
Date: Tue,  9 Sep 2025 15:41:31 -0700
Message-ID: <20250909224132.536320-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Due to multiple explosion issues in the early days of the Xe driver,
the GuC load was hacked to never return a failure. That prevented
kernel panics and such initially, but now all it achieves is creating
more confusing errors when the driver tries to submit commands to a
GuC it already knows is not there. So fix that up.

As a stop-gap and to help with debug of load failures due to invalid
GuC init params, a wedge call had been added to the inner GuC load
function. The reason being that it leaves the GuC log accessible via
debugfs. However, for an end user, simply aborting the module load is
much cleaner than wedging and trying to continue. The wedge blocks
user submissions but it seems that various bits of the driver itself
still try to submit to a dead GuC and lots of subsequent errors occur.
And with regards to developers debugging why their particular code
change is being rejected by the GuC, it is trivial to either add the
wedge back in and hack the return code to zero again or to just do a
GuC log dump to dmesg.

v2: Add support for error injection testing and drop the now redundant
wedge call.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e56c9c5c8845..5aa7289cc83e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1057,7 +1057,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
 #endif
 #define GUC_LOAD_TIME_WARN_MS      200
 
-static void guc_wait_ucode(struct xe_guc *guc)
+static int guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_mmio *mmio = &gt->mmio;
@@ -1164,7 +1164,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 			break;
 		}
 
-		xe_device_declare_wedged(gt_to_xe(gt));
+		return -EPROTO;
 	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
 		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
 			   delta_ms, status, count);
@@ -1176,7 +1176,10 @@ static void guc_wait_ucode(struct xe_guc *guc)
 			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
 			  before_freq, status, count);
 	}
+
+	return 0;
 }
+ALLOW_ERROR_INJECTION(guc_wait_ucode, ERRNO);
 
 static int __xe_guc_upload(struct xe_guc *guc)
 {
@@ -1208,14 +1211,16 @@ static int __xe_guc_upload(struct xe_guc *guc)
 		goto out;
 
 	/* Wait for authentication */
-	guc_wait_ucode(guc);
+	ret = guc_wait_ucode(guc);
+	if (ret)
+		goto out;
 
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
 	return 0;
 
 out:
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
-	return 0	/* FIXME: ret, don't want to stop load currently */;
+	return ret;
 }
 
 static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
-- 
2.49.0

