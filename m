Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AF4CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB60A10E27D;
	Thu,  4 Sep 2025 19:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIpX3vpZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6458E10E27D
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757015706; x=1788551706;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ujVNXwIhSOxqqC5Fsn0+5ecKASIsuchKggDQKOIAs6E=;
 b=HIpX3vpZgYf+ANW0m9MFBoDKKO+sgYghHw6+vnQ8/9iS77mYdkCwL8Ja
 MGCPJV9GfJ70EZamJC+W67wri7nC9Vd+bYqmejb0FFOMyaRMobdEZKZkx
 Oa3HyIH0K0rz6p4+CHtc1AX/NZzkyK0o3DLzGtjwkoZizMndZsQGtTPkU
 DloBtKZ/D19o7p/MUygxdycnhxL9pTO0Tx1bfe0yNzGAOoz6qg14z8fOR
 Lhj+2kiDKOztczoxVmzIUKY3AharefInbgYDGr538/5pCPpR6RkPXjvZr
 LM0d2uio2qL9uXybgnHVxrPeheHFDVjWZekL5t+5JaYWrHOuDbxN/F42u w==;
X-CSE-ConnectionGUID: cuGo9VLYTyutvfdBRKivgg==
X-CSE-MsgGUID: Z22qgikQQaizEteHPXNKyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59515339"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="59515339"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:55:06 -0700
X-CSE-ConnectionGUID: twddViFxSmSYMZUrhBsatg==
X-CSE-MsgGUID: J0TJ8yPCQU++JtHZ/4B0Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="172422916"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa009.fm.intel.com with ESMTP; 04 Sep 2025 12:55:05 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Return an error code if the GuC load fails
Date: Thu,  4 Sep 2025 12:55:04 -0700
Message-ID: <20250904195505.3844671-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b3a6408a5760..ed9d9e960ebd 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1066,7 +1066,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
 #endif
 #define GUC_LOAD_TIME_WARN_MS      200
 
-static void guc_wait_ucode(struct xe_guc *guc)
+static int guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_mmio *mmio = &gt->mmio;
@@ -1174,6 +1174,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 		}
 
 		xe_device_declare_wedged(gt_to_xe(gt));
+		return -EPROTO;
 	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
 		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
 			   delta_ms, status, count);
@@ -1185,6 +1186,8 @@ static void guc_wait_ucode(struct xe_guc *guc)
 			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
 			  before_freq, status, count);
 	}
+
+	return 0;
 }
 
 static int __xe_guc_upload(struct xe_guc *guc)
@@ -1217,14 +1220,16 @@ static int __xe_guc_upload(struct xe_guc *guc)
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

