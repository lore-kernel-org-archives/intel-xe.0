Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB625D6408B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 21:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D2910E190;
	Fri,  8 Nov 2024 21:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTg657cj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E08C10E190
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 21:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731101258; x=1762637258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=46mhFy5ycWsX0L/CiMJqSx71b+UmqGM1Tth70PJ5t0M=;
 b=iTg657cjnPYA0r15W7UvTOopH1M34MTTBV/Xi7ewpi/BLRLV+7C8iq6h
 p4MV/EKrgSZE35voGew37HdV5sCq0W8aM/JcXjwhIc8HvSrRZdiruPjAt
 LwLabvmzYq/bhnO8rYDWugxDQQdtwJYNX4zqcL6hOiHtbw4+SzjeGJp7F
 ZD3qsXUM+0CK/LNeoOOUyD8opViogLJpdbXdLWNSGnW/sWqBVZ3NJiR2P
 yNKYIiQBrFpg4cgtVWFO/h3qo6PZbaTIzoPp37Q2xWa3hUV74eIRmSZr/
 QcIyIRKboYfGPzgGBTd/IEplgDaB+1n2U7mnifpj+amEt1J3PyvqqpwI5 A==;
X-CSE-ConnectionGUID: 1W/Ls9SOQCy3XlA25yAqcA==
X-CSE-MsgGUID: xV0UezrKTaehQkk/b24MDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30854865"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30854865"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 13:27:38 -0800
X-CSE-ConnectionGUID: aprT5g+kQu20Pqk76NbLtw==
X-CSE-MsgGUID: 0WUD9lcYR6eUcqoaTYezkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85744261"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa010.jf.intel.com with ESMTP; 08 Nov 2024 13:27:38 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Support crash dump notification from GuC
Date: Fri,  8 Nov 2024 13:27:37 -0800
Message-ID: <20241108212737.2044007-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
References: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
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

Add support for the two crash dump notifications from GuC. Either one
means GuC is toast, so just capture state trigger a reset.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 63bd91963eb1..7eb175a0b874 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -54,6 +54,7 @@ enum {
 	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x1000 */
 	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x2000 */
 	CT_DEAD_PARSE_G2H_TYPE,			/* 0x4000 */
+	CT_DEAD_CRASH,				/* 0x8000 */
 };
 
 static void ct_dead_worker_func(struct work_struct *w);
@@ -1120,6 +1121,24 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	return 0;
 }
 
+static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
+{
+	struct xe_gt *gt = ct_to_gt(ct);
+
+	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
+		xe_gt_err(gt, "GuC Crash dump notification\n");
+	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
+		xe_gt_err(gt, "GuC Exception notification\n");
+	else
+		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
+
+	CT_DEAD(ct, NULL, CRASH);
+
+	kick_reset(ct);
+
+	return 0;
+}
+
 static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
 	struct xe_gt *gt =  ct_to_gt(ct);
@@ -1294,6 +1313,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case GUC_ACTION_GUC2PF_ADVERSE_EVENT:
 		ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, hxg_len);
 		break;
+	case XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
+	case XE_GUC_ACTION_NOTIFY_EXCEPTION:
+		ret = guc_crash_process_msg(ct, action);
+		break;
 	default:
 		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
 	}
-- 
2.47.0

