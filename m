Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDFFF9EDC1
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 12:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E7C10E9B6;
	Wed, 22 Apr 2026 12:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwfLc1ZO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C2310E29D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 12:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776860061; x=1808396061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n/ZmT1aS7sqbc8Z3MTH5kOAaMzZnF78OeaswYFJtdBA=;
 b=EwfLc1ZOerPJL5KcAraTtvZp3taSiwx2h6bfSYhe/ImNJSK3hQj4S0wY
 vPJNluUsN9QAlCN+SHe+XvOzvXmsAg+ISvE72NENFPMHNeenoXHZPWLOq
 ZN+5D4gu3ik8mgHxLfJeFj4ApWwaJNEiREUgZBWeq0IeVNU6VJpEK5wTX
 Lxht/9phDa/dP/RCjzTAd5yALoHGtw5h9mX06icXm2INrsB9AV5MVvcYb
 og49olWucPbCkAv9NN4j+QlzkMK4ncFpkTOwaz7tsrG4TEONUaMujFv3w
 VI5crWxmybAR6ziDYRR5X2MsC2ZtfdUqxxFUmvFcPfbdoZUI4Uh6Pu6+0 A==;
X-CSE-ConnectionGUID: tDBk11LjS7iIrrfsDXzOAA==
X-CSE-MsgGUID: ek7f+VYVSDm4vLX6JYLv4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89197447"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89197447"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 05:14:21 -0700
X-CSE-ConnectionGUID: YRH8Ji2HR72gl316A7pwaw==
X-CSE-MsgGUID: DpdjTfvRSjusSeSvGQ8VzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="231305911"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa006.jf.intel.com with ESMTP; 22 Apr 2026 05:14:19 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, sk.anirban@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/2] drm/xe/guc: Make xe_guc_pc_stop() void
Date: Wed, 22 Apr 2026 17:40:56 +0530
Message-ID: <20260422121128.1002031-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422121128.1002031-1-raag.jadav@intel.com>
References: <20260422121128.1002031-1-raag.jadav@intel.com>
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

xe_guc_pc_stop() doesn't return any meaningful value. Refactor it into
void function.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    |  9 ++-------
 drivers/gpu/drm/xe/xe_guc_pc.c | 10 ++++------
 drivers/gpu/drm/xe/xe_guc_pc.h |  2 +-
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1355b68d3fce..ec291588c482 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1730,13 +1730,8 @@ void xe_guc_reset_wait(struct xe_guc *guc)
 
 void xe_guc_stop_prepare(struct xe_guc *guc)
 {
-	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
-		int err;
-
-		err = xe_guc_pc_stop(&guc->pc);
-		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
-			   ERR_PTR(err));
-	}
+	if (!IS_SRIOV_VF(guc_to_xe(guc)))
+		xe_guc_pc_stop(&guc->pc);
 }
 
 void xe_guc_stop(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 7ecd91ad6192..59f2fa79ad42 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1316,18 +1316,16 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
  * xe_guc_pc_stop - Stop GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
  */
-int xe_guc_pc_stop(struct xe_guc_pc *pc)
+void xe_guc_pc_stop(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
 
 	if (xe->info.skip_guc_pc)
-		return 0;
+		return;
 
 	mutex_lock(&pc->freq_lock);
 	pc->freq_ready = false;
 	mutex_unlock(&pc->freq_lock);
-
-	return 0;
 }
 
 /**
@@ -1342,10 +1340,10 @@ static void xe_guc_pc_fini_hw(void *arg)
 	if (xe_device_wedged(xe))
 		return;
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
-	XE_WARN_ON(xe_guc_pc_stop(pc));
+	xe_guc_pc_stop(pc);
 
 	/* Bind requested freq to mert_freq_cap before unload */
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
 	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 0678a4e787b3..1025a2b15f5f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -13,7 +13,7 @@ struct drm_printer;
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
-int xe_guc_pc_stop(struct xe_guc_pc *pc);
+void xe_guc_pc_stop(struct xe_guc_pc *pc);
 void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
 int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
 int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
-- 
2.43.0

