Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F47CC61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 07:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F8A10E722;
	Thu, 12 Jun 2025 07:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VK6qoGXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AD010E72F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 07:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749712159; x=1781248159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T5sCXimXCA67R571Ebz+iqx24W/rnvRb5aGT33lP6dQ=;
 b=VK6qoGXgU3/eoec6bRL7bkfSjjK1wCZwYuEAe33PWG/iZxsrk39cXjlx
 xk0Dgh2I4t4aSRR8GGlNWU/p9zCG56uJbs6F0Tqe64ZJOoZpMjnYgLkzQ
 QMfatbOejVlIatCZJl1qq9x57Fd+LjtferdHieILHH7rvxrx2EvAt45VW
 JiAWpZSm3HdcefZ0L3u07hNlJtWcWO0ONL2H79eZMWdSdygGLVS4L5oCC
 hSsgJUtV+0iae/n+yjmyMe9xsVA6ZdR3JgrxrWIu34aAYeFMmXFUxZ+3S
 B2t2f00R1isxffN/bDM+k3WGpP9AY/HNxaDFJWWIB7Zpe/u3JEcLoVHlM A==;
X-CSE-ConnectionGUID: 8DdMmqUWTIWD1vrb0n1Hbg==
X-CSE-MsgGUID: +ySL7ejqQkeirCZefrfAIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51792681"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51792681"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:09:16 -0700
X-CSE-ConnectionGUID: Rlo6cAdQQqiVBnLhYvS4qg==
X-CSE-MsgGUID: 80LOHHvdQKKxxauYlGamgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152197768"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:09:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4 1/3] drm/xe/guc: Ignore GuC CT errors when wedged
Date: Thu, 12 Jun 2025 00:09:00 -0700
Message-ID: <20250612-wa-14022085890-v4-1-94ba5dcc1e30@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
References: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-7a402
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Messaging to GuC may get canceled when device is wedged. Don't
flag this as an error in xe_guc_pc code.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 18c6239920355..aedf59162709a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -153,7 +153,7 @@ static int pc_action_reset(struct xe_guc_pc *pc)
 	int ret;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC reset failed: %pe\n",
 			  ERR_PTR(ret));
 
@@ -177,7 +177,7 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC query task state failed: %pe\n",
 			  ERR_PTR(ret));
 
@@ -200,7 +200,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC set param[%u]=%u failed: %pe\n",
 			  id, value, ERR_PTR(ret));
 
@@ -222,7 +222,7 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC unset param failed: %pe",
 			  ERR_PTR(ret));
 
@@ -239,7 +239,7 @@ static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
 	int ret;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
+	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
 			  mode, ERR_PTR(ret));
 	return ret;

-- 
2.49.0

