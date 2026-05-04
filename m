Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2221BCD3427
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 19:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE2610E82C;
	Mon,  4 May 2026 19:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LF4brCeX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E03410E82C
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777923060; x=1809459060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jozZq+1AilOntbKREYviTpJAoW1s4RXY93G75DWImSw=;
 b=LF4brCeXad1Z/0G2I4sos0Ifgy8YACojWLr/Fw3KcLSeM+/FWsGf1R6m
 zLuyl9HqJ8NQJsKu3UxO/JcW/3dA5Ttxmpk2QdbIS1MaAQUd0rbVcfm2T
 Z6yK7wEJrQ65/Y5IneMUImJ2vLxQ3jj02mmz6csrbkilOGwBGj6khbFqq
 G2alsS/pz3/adS1k9wOWweSarFpXF8RAm8G7gMrZizC8+w/A3R0iQL8UH
 9lKYbgyWNyrrYc7iURVZ7YxzhaIgZ0MU3KhrvktE7UjLsPuu31dPURXtW
 Ilp5HgzNNNtqLrhY1zM4vE1TYcsZfANTk/tTZqh03sbUwjDepA1cF0T7/ w==;
X-CSE-ConnectionGUID: SRSUe23pTQ2oqN2ZjrGAZQ==
X-CSE-MsgGUID: 2YqEyYsoSg+U1rbuGB6QAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89093187"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="89093187"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 12:30:56 -0700
X-CSE-ConnectionGUID: zzV14RVsR2OMn78evZMWxQ==
X-CSE-MsgGUID: 4EkUvgd/RA65diYVWEUIMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="237370838"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 12:30:53 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 michal.wajdeczko@intel.com, stuart.summers@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] RFC drm/xe/guc: distinguish wedged from recoverable
 cancellation
Date: Tue,  5 May 2026 00:58:02 +0530
Message-ID: <20260504192801.2542945-2-sk.anirban@intel.com>
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

The CT layer returns -ECANCELED regardless of whether cancellation
is due to a GT reset or a wedged device. Return -ENOTRECOVERABLE
on wedge so callers don't need xe_device_wedged() checks
to suppress spurious error logs.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 10 +++++++++-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a11cff7a20be..b7d38fa80675 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1057,6 +1057,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	xe_gt_assert(gt, g2h_len || !num_g2h);
 	lockdep_assert_held(&ct->lock);
 
+	if (xe_device_wedged(ct_to_xe(ct))) {
+		ret = -ENOTRECOVERABLE;
+		goto out;
+	}
+
 	if (unlikely(ct->ctbs.h2g.info.broken)) {
 		ret = -EPIPE;
 		goto out;
@@ -1371,7 +1376,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (g2h_fence.fail) {
 		if (g2h_fence.cancel) {
 			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
-			ret = -ECANCELED;
+			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
 			goto unlock;
 		}
 		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
@@ -1690,6 +1695,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
+	if (xe_device_wedged(xe))
+		return -ENOTRECOVERABLE;
+
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
 		return -ENODEV;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 2b99c1ebdd58..f43ca1c76f75 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -473,7 +473,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
 
 	ret = enable_engine_activity_stats(guc);
 	if (ret)
-		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
+		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats: %pe\n", ERR_PTR(ret));
 	else
 		engine_activity_set_cpu_ts(guc, 0);
 }
-- 
2.43.0

