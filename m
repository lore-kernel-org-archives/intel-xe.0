Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EC3C54F51
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 21:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FCD10E25D;
	Wed, 29 Jul 2026 21:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bx3vBi/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B64710E25D
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 21:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785361005; x=1816897005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vQCNkEYSeahbwEp3Oihowd5U3S0XXjRH+9/GxudDjS4=;
 b=bx3vBi/sV/8BvMtYi0a3D9smBMUTrOj5xgOGMgWAV9vYwutMysdZjIkX
 pX7GXoPaLUpp6HffMyFQd/39h1r8txoLDoXNhIec2JsJn5KlrHZKl7y7d
 SNaECSQ0dctZV/ziYhetvbRptap+pq/OPXgPnlfiZWLueMihJlP/IpOmN
 f1aR9s6tDN4VVI5MDlPbTAqyKtNCIHxNUXjdaWkE/Wdl7iJD0mcE0i1q6
 WcpRqZp+8RWYwGlefPNACDouvEWCxQApNZxgFHTqPhDZbCCFGUOstSifc
 d3L8PLGBO+rAQMyLH9Jvm3yVInh0BjVVFVNZBzC3h1OAZaaMI2Vt8s9XZ A==;
X-CSE-ConnectionGUID: dqQWF4hVSCiFvsl+96mvyA==
X-CSE-MsgGUID: mjgFEySgSLSyjvAyZaFsdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96338097"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="96338097"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:36:45 -0700
X-CSE-ConnectionGUID: GDbS/igQQxiv9O1Z/4ukWQ==
X-CSE-MsgGUID: hVdlLr43Rz+9rRzVfIydBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="256786832"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2026 14:36:45 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 1/2] drm/xe: Use IBC v3 on PTL
Date: Wed, 29 Jul 2026 14:31:40 -0700
Message-Id: <20260729213141.374812-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260729213141.374812-1-vinay.belgaumkar@intel.com>
References: <20260729213141.374812-1-vinay.belgaumkar@intel.com>
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
v5: Don't cascade return checks (Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c                | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

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
index 59f2fa79ad42..211569c2e8ea 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1234,8 +1234,21 @@ static int pc_modify_defaults(struct xe_guc_pc *pc)
 
 	if (xe->info.platform == XE_PANTHERLAKE) {
 		ret = pc_action_set_dcc(pc, false);
-		if (unlikely(ret))
+		if (unlikely(ret)) {
 			xe_gt_err(gt, "Failed to modify DCC default: %pe\n", ERR_PTR(ret));
+			return ret;
+		}
+
+		if (xe_gt_is_main_type(gt) &&
+		    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 48, 0)) {
+			ret = pc_action_set_param(pc,
+						  SLPC_PARAM_SET_IBC_VERSION,
+						  3);
+			if (unlikely(ret)) {
+				xe_gt_err(gt, "Failed to modify IBC version: %pe\n", ERR_PTR(ret));
+				return ret;
+			}
+		}
 	}
 
 	return ret;
-- 
2.38.1

