Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD71C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 00:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931D010EA8E;
	Tue, 14 Jul 2026 00:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXmQXcaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F3110EA8E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 00:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783990131; x=1815526131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2p1e+0/kQsrbX3aAbIh+7M0KeCT7G8ff28kZvW6ti9A=;
 b=ZXmQXcaOu0ijo+SbvHR3E+XGeTLVmdICE51mEXOAFZLvG8bOaAlTVvYy
 QD+T6tju5QsZkddKlITcVUen6OCft9Tt3DYTcv0i/U+19bhSBYOTDxe/A
 q3tl6UB/4R/clIzFzSEc4jFJilwUfqHu0Oll7Lg0ga2rQNnHKQqQKuBLg
 3ZowWgkBcGJPFb6oWriv3NS63t/6Pq9QBCKaYPN4VM8rLc0xNT/VdG8Ew
 755xKHSp+39nwV16I+C5Lx25YU2S7aceVT1EvEoQn4lzn+zNoD1AkZrm9
 8c4zC5g1G7Z8Iq1hsCtQonrJF/gxnL7DcQsFeNzo+oxI/Dmj0d8WJ8xoB w==;
X-CSE-ConnectionGUID: cgPi/121S2CBzhokxmP0aA==
X-CSE-MsgGUID: t5H77u4BT3qPHjfmkaqKPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="72130911"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="72130911"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 17:48:51 -0700
X-CSE-ConnectionGUID: pM6nKy6VR0K8g38KynDc9Q==
X-CSE-MsgGUID: wddePkRJQq+95elr2PU72w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260583033"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 17:48:51 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Use IBC v3 on PTL
Date: Mon, 13 Jul 2026 17:43:58 -0700
Message-Id: <20260714004359.3905038-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260714004359.3905038-1-vinay.belgaumkar@intel.com>
References: <20260714004359.3905038-1-vinay.belgaumkar@intel.com>
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

Intelligent Bias Control (IBC) v3 algorithm in GuC has PTL specific
optimizations. This version selection param is only available GuC 70.48.0
onwards.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_pc.c                | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index ce5c59517528..57baa68bcba4 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -119,6 +119,7 @@ enum slpc_param_id {
 	SLPC_PARAM_STRATEGIES = 26,
 	SLPC_PARAM_POWER_PROFILE = 27,
 	SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY = 28,
+	SLPC_PARAM_SET_IBC_VERSION = 29,
 	SLPC_MAX_PARAM = 32,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 59f2fa79ad42..0d55d6b00cd9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1236,6 +1236,15 @@ static int pc_modify_defaults(struct xe_guc_pc *pc)
 		ret = pc_action_set_dcc(pc, false);
 		if (unlikely(ret))
 			xe_gt_err(gt, "Failed to modify DCC default: %pe\n", ERR_PTR(ret));
+
+		if (xe_gt_is_main_type(gt) &&
+		    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 48, 0)) {
+			ret = pc_action_set_param(pc,
+						  SLPC_PARAM_SET_IBC_VERSION,
+						  3);
+			if (unlikely(ret))
+				xe_gt_err(gt, "Failed to modify IBC version: %pe\n", ERR_PTR(ret));
+		}
 	}
 
 	return ret;
-- 
2.38.1

