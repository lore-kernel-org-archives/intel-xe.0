Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B59BC44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 00:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B894910E27D;
	Thu, 16 Jul 2026 00:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MaP3Zgh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E774E10E27D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784160197; x=1815696197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l7Q4FtZoZH1bhhEjHi0pT4qnKmPa7hNQbi/ApyDzatM=;
 b=MaP3Zgh/7vIVr05ixNYKAwR4JH/fKnhfypPT1AmTbRQsKpxzW2zP2hUE
 pjOVo0U3GgyGG7PGJxNK9wvHJD1dw2kT7MMgB18ve4AVr640ptvuqHJs7
 H09KTh/AQXdqP/CTv8bewyiuUx9sWhCHDkck5ehutC9PuygqEGB8wM9r9
 wFcty7Zcxc2Wk2jP0/vn6QDxkKMxAEgwdwnK3wK/vnm6JsyY6NSuddGi8
 1pf6e2+P9eZ29wRUvwWkjxN7ed2BupVNc2yCwhVvoRhfHjflyLMETOi/4
 AyhdsK06Xe1DI7EiNyuAMWYc4E+WXl+FQu76hYfk4Dp1I1u0Q615L78GK g==;
X-CSE-ConnectionGUID: GT2HIjVhS6C61I3ZuE2DTA==
X-CSE-MsgGUID: Ylqt8esgTGGBBKwTrzq3YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95457248"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="95457248"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 17:03:16 -0700
X-CSE-ConnectionGUID: 770WAAffTJ2jpJ6Yj7c/3Q==
X-CSE-MsgGUID: B3kB5wRyRwO/55WGFh7dFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="254574176"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa006.jf.intel.com with ESMTP; 15 Jul 2026 17:03:17 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 1/2] drm/xe: Use IBC v3 on PTL
Date: Wed, 15 Jul 2026 16:58:23 -0700
Message-Id: <20260715235824.116991-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
References: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
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

v4: Fix sashiko.dev review issue

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
index 59f2fa79ad42..550da596fdd9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1236,6 +1236,15 @@ static int pc_modify_defaults(struct xe_guc_pc *pc)
 		ret = pc_action_set_dcc(pc, false);
 		if (unlikely(ret))
 			xe_gt_err(gt, "Failed to modify DCC default: %pe\n", ERR_PTR(ret));
+
+		if (!ret && xe_gt_is_main_type(gt) &&
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

