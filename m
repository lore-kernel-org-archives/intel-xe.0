Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41527C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 23:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0623F10EBA5;
	Mon, 25 Mar 2024 23:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acOcSO6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E2A10EBA5
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 23:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711411009; x=1742947009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vwOnFKkH58GpZpka+FpWwgY8WwIKu79p73bhihU7Wbo=;
 b=acOcSO6zENWbFV3NvQctjdxF4aZMt07g8pUOpdSjypG/oZNsSxhKAfr+
 bfFgXqLMRufrDkcNVYfcI/bThtkFwh0Hk14GBWSKnR7hxozE2HiVXyh21
 fjfO05VRY6sRiRKdUS1IJyX6oqIc69AxjdGDzRwFFnQqzXRngho019gRv
 K875kCXVHCXKrRd1HLPtifTFBZNnxfiKneWn96nI7LhY4pfPMhK626sXf
 Qbi8yjZkx3X4P/jqufFn7TZ8UHDqjRphCHL8WsfJhbloqXvj7ybVE+CzZ
 Ekj0wc61Kz8zDJGRjGnRtdhn2SaWnHw7fPnQnQ3+xDHeXmlWiZ9Ju6GDH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="16987486"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="16987486"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 16:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20439018"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa004.fm.intel.com with ESMTP; 25 Mar 2024 16:56:48 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/guc: Remove explicit shutdown of SLPC
Date: Mon, 25 Mar 2024 16:56:02 -0700
Message-Id: <20240325235602.1155486-1-vinay.belgaumkar@intel.com>
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

v2: Rebase

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index b242af8ed59f..9c110537d135 100644
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
@@ -893,7 +874,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 int xe_guc_pc_stop(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
-	int ret;
 
 	if (xe->info.skip_guc_pc) {
 		xe_gt_idle_disable_c6(pc_to_gt(pc));
@@ -904,15 +884,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
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

