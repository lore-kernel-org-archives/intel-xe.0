Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85427C02198
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 00:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505C510E0F5;
	Tue, 11 Feb 2025 00:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTM2Y18t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31EA10E0F5
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 00:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739234839; x=1770770839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pcu2joxmg77h1YQgq7paEkLJoCriM/17qAO5kzl9FTo=;
 b=WTM2Y18tyf22w3vI7XF/JaBiSP4MBSJkfBNhU4Oc9TRvFImtU6eRH4t+
 QbGnlK7O2XaFDS5AD3IhyaWxD7XVaazETVEpR3cilAsHpTIobs1h+nXCW
 9Ru4YjwJdR29N5FBUZ3bNEUZRHMdmQw8WrlpIYgjcQMxZrWD7jSGWeLkT
 yeAkSVD8rp/ZjliTebbnGew212wL5IknLIGvynj95RYIbuJ2zfw9iuIqE
 QbXk9ZjfpkdpYolqV7mq8ehlLeEBIMUENRQHLlB8ZfbBIFySxiOvK8bOv
 k4hrd41Jc0iCbnOAw5OMx/SAM48JELYLEt0xh2qqEzRLL0WYRmouiwPUO g==;
X-CSE-ConnectionGUID: MKY0MJghSn+OlN2c1UntRg==
X-CSE-MsgGUID: 0RDhi94JR5OPzXaBOLS89w==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50826639"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="50826639"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 16:47:19 -0800
X-CSE-ConnectionGUID: RgJDmezpRiOMhc5HS2CBLA==
X-CSE-MsgGUID: ZXMHTRAiR4m7zZAOHJ5vbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112327549"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 16:47:18 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Escalate GuC load failure immediately
Date: Mon, 10 Feb 2025 16:47:02 -0800
Message-ID: <20250211004702.1872837-1-daniele.ceraolospurio@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1619c0a52db9..13c3084c42c2 100644
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
+	return load_done ? 0 : -EIO;
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

