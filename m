Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20A7C5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 23:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5AA10E186;
	Mon,  2 Jun 2025 23:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OB8fKJCH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3A110E195
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 23:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748908011; x=1780444011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mnBdlH8zfxjgSFE9g7yT48Q71f+b++vNQDbnEXrUf6U=;
 b=OB8fKJCHkPY4xNTgFXrD3Tsa/RJhqUPCEfrUYcHJ3nOR5yHq3W5Hg0NS
 H1r1nrpcq7J1QjtJ+vJ4OqZaWPc1JbseEyU01k8RSuducJTYOaFb01lvZ
 6AFmFZaZhZKp5YOV0EzGHgMZZb1+tu9TVkeRdLVm9gkJJenlPD2QRRO1v
 FJBodkcWtpPjvUzPxylEsTU3mKb2StjkS0Nhfl7gZm5iIHdEBTeW3JskP
 4OKt5LCyh+az9KDHTw6g25KAZeDkFmyUAjU6TB2/cLmjvZzDx3PS2X4b7
 SItjyCuo1y9ZK4BTglhSTF6gQrp68hQA+1Fc8BzTY99+6rqInIMG3si8B A==;
X-CSE-ConnectionGUID: CsbPHx2ySRm6qZqEGnkmKg==
X-CSE-MsgGUID: aCrBlF+IRjG0waOoO1NBWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68361181"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="68361181"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 16:46:50 -0700
X-CSE-ConnectionGUID: TVI/ErHkQS+JHxC9/CmPkQ==
X-CSE-MsgGUID: w9DyNOnZQ4OuaXraeFMfKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="167846165"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 16:46:18 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 2/4] drm/xe/guc: Ignore GuC CT errors when wedged
Date: Mon,  2 Jun 2025 16:44:13 -0700
Message-Id: <20250602234415.2015921-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
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

Messaging to GuC may get canceled when device is wedged. Don't
flag this as an error in xe_guc_pc code.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index cb0563494fcc..793df3486d1f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -154,7 +154,7 @@ static int pc_action_reset(struct xe_guc_pc *pc)
 	int ret;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC reset failed: %pe\n",
 			  ERR_PTR(ret));
 
@@ -178,7 +178,7 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC query task state failed: %pe\n",
 			  ERR_PTR(ret));
 
@@ -201,7 +201,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC set param[%u]=%u failed: %pe\n",
 			  id, value, ERR_PTR(ret));
 
@@ -223,7 +223,7 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC unset param failed: %pe",
 			  ERR_PTR(ret));
 
@@ -240,7 +240,7 @@ static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
 	int ret;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
 			  mode, ERR_PTR(ret));
 	return ret;
-- 
2.38.1

