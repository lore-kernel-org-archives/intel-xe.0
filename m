Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03668C021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 21:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC83910E135;
	Thu, 13 Feb 2025 21:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImdonM36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB29010E135
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 21:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739482750; x=1771018750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G1Wq6wNQeHYiOCxlvms8XS3J/UuFA1ka0cEubsYC8x0=;
 b=ImdonM368ggK7fN95AXy+GqGzw3X1oDXwsNyeQkzzOtrTOOR3AXRpJ4J
 /TD1c5hCCevqFTtJmIs5/554RIWp+utRjm6HK+p13kW0OUiIXkvNiVn1d
 Tkr2358RI5GwVTiQBlB37k7wizhSJ7mfVEVqxvaKhmJWaTWW5W814qhVU
 O5oju2LNl0CbCp5j4zy3ro4IIa638u5VXfFnhIQ0iyqBzZ3ZdhVryiz40
 5xYhDpzhIjg0Qewyw7aXLc0HeF7UfS5v50d0te0SqrKAkvTqycXUoPtCh
 YfUMuLHmYlU2nD9IUNWnF4gp7KZyuZ0enmFWrrGxzmpsnrI2SEnVorp/7 Q==;
X-CSE-ConnectionGUID: W9KaOEXLSAS1GhnS+xbuZg==
X-CSE-MsgGUID: 7ZMeJ0UNRAuCtQMlhJd1vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40365082"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40365082"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 13:39:09 -0800
X-CSE-ConnectionGUID: 7sw2qYJ8Q+mWV4J5QohOdg==
X-CSE-MsgGUID: uREXAuhsQY2QMefkHfm2dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113793830"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 13:39:09 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2] drm/xe/guc: Escalate GuC load failure immediately
Date: Thu, 13 Feb 2025 13:39:01 -0800
Message-ID: <20250213213901.2191463-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

When the Xe was first introduced, we intentionally avoided escalating
GuC load failures, to not abort mid-probe. Xe is now mature enough and
we gracefully handle probe failures, so we can start escalating
immediately.

Note that even without this patch the probe is still aborted because
the attempt to enable CTs after GuC load will fail and that failure is
already escalated.

v2: only return success if the load_done variable is 1 (Tejas)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1619c0a52db9..407399cc4764 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -938,7 +938,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
 #endif
 #define GUC_LOAD_TIME_WARN_MS      200
 
-static void guc_wait_ucode(struct xe_guc *guc)
+static int guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_mmio *mmio = &gt->mmio;
@@ -1045,6 +1045,8 @@ static void guc_wait_ucode(struct xe_guc *guc)
 			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
 			  before_freq, status, count);
 	}
+
+	return load_done == 1 ? 0 : -EIO;
 }
 
 static int __xe_guc_upload(struct xe_guc *guc)
@@ -1077,14 +1079,16 @@ static int __xe_guc_upload(struct xe_guc *guc)
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
2.43.0

