Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BDBC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 18:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D87010E0D4;
	Thu, 21 Mar 2024 18:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNxUPXpn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE9C112007
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711047026; x=1742583026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=agjDhkn1tb6SyMDGteEGFWeuVeVrZEbtCHduJDFLqNg=;
 b=iNxUPXpnaxpf6J5v34cQH8PGxjmSayMPJbSsifAqX6UKnXaj2wZCR0T9
 4D+47h1QHehx+3Go8BTswGqbIYh1/rgqQ5UYeXfSMpxTTTix00zwX+pbY
 GN9zhYomRO7ZG2/ZgUV8Ig1mOrHiUnRAQygyZSe4BFvVKqhFbH+wGYDrQ
 I4OJpQbJLlgCuwIqZHzRSQdA1iHVOtniEGm5HhqZqT9pzHwK0CZ25qOEr
 6Guz9YyJvZC6Yi+5SzZzbBaMlDuI+CtwyJYj3z4CFFq10l1ZEpJZAe97w
 GZWZc+CoLDoYJ/v7lZbDksyYEI5JXYsEaG7EzRi42fRxucO+3qOolxqtK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6187112"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6187112"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 11:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14605052"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa009.jf.intel.com with ESMTP; 21 Mar 2024 11:50:27 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/guc: Remove explicit shutdown of SLPC
Date: Thu, 21 Mar 2024 11:49:24 -0700
Message-Id: <20240321184924.234579-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

SLPC shutdown is called in reset and suspend paths. In the reset
path, it is possible that the H2G call gets lost as GuC is in the
process of being reset. There is no value in stopping SLPC when
it will happen anyways.

In the suspend path, we disable communication with GuC, so there
is no need to explicitly shutdown SLPC.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 786acaf71931..6dfae1c23946 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -145,25 +145,6 @@ static int pc_action_reset(struct xe_guc_pc *pc)
 	return ret;
 }
 
-static int pc_action_shutdown(struct xe_guc_pc *pc)
-{
-	struct  xe_guc_ct *ct = &pc_to_guc(pc)->ct;
-	int ret;
-	u32 action[] = {
-		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
-		SLPC_EVENT(SLPC_EVENT_SHUTDOWN, 2),
-		xe_bo_ggtt_addr(pc->bo),
-		0,
-	};
-
-	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
-		drm_err(&pc_to_xe(pc)->drm, "GuC PC shutdown %pe",
-			ERR_PTR(ret));
-
-	return ret;
-}
-
 static int pc_action_query_task_state(struct xe_guc_pc *pc)
 {
 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
@@ -889,7 +870,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 int xe_guc_pc_stop(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
-	int ret;
 
 	if (xe->info.skip_guc_pc) {
 		xe_gt_idle_disable_c6(pc_to_gt(pc));
@@ -900,15 +880,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 	pc->freq_ready = false;
 	mutex_unlock(&pc->freq_lock);
 
-	ret = pc_action_shutdown(pc);
-	if (ret)
-		return ret;
-
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_NOT_RUNNING)) {
-		drm_err(&pc_to_xe(pc)->drm, "GuC PC Shutdown failed\n");
-		return -EIO;
-	}
-
 	return 0;
 }
 
-- 
2.38.1

