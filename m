Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC64D262AB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 00:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD3F10E677;
	Wed, 21 Jan 2026 00:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iy/USbJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B9110E674
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 00:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768953754; x=1800489754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ECnnzCN/wP58DUlCRNK7iMRJSv/n7WU2AYoz6wo83T8=;
 b=Iy/USbJjc/9Or8EsNnnOMpfEoTUiJawrWOEN39OShpRrUzgMtcThtLU9
 DQHSnSbvMRZwZ/xogkdB7fCHlXz/4b96xOwMesN8lrA8Eqrj3fFuQBw4P
 vTDkvMGbwhyZHhtBylhdik83JIxRx5/pCQMmCRzweFvGqdKKr33DeLV01
 SQGD/OGD/I+KdwN5ZIUA0UgWLPPyseNyQhCDfi9VrAbkhmfNaMmSZHQZf
 jzVO+mRlj46PqVbrOBLsJLGttnuUb4c1KudX0VNK82RRO0ERVHT7hxAAF
 NkI1p9CAMOaCPZrfzypa9E0s0J1pLNtdBXUoqs55oEVbNGWP9aVWZohSN Q==;
X-CSE-ConnectionGUID: WpRxO3FtTXyU2w0O2LArrQ==
X-CSE-MsgGUID: 4BmTm83jTVO1hyqyitlC1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81553055"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81553055"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 16:02:33 -0800
X-CSE-ConnectionGUID: MnrNvj9dTzqhQ/S06sgJ6A==
X-CSE-MsgGUID: p54ZCszcSSq2d9Oj2jtVTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205905355"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa007.fm.intel.com with ESMTP; 20 Jan 2026 16:02:33 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/ptl: Disable DCC on PTL
Date: Tue, 20 Jan 2026 15:59:26 -0800
Message-Id: <20260120235926.4040336-1-vinay.belgaumkar@intel.com>
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

On PTL, the recommendation is to disable DCC(Duty Cycle Control) as
it may cause some regressions due to added latencies.

Fixes: 5cdb71d3b0db ("drm/xe/ptl: Add GuC FW definition for PTL")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 54702a0fd05b..5e5495a39a3c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1198,6 +1198,36 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
 	return ret;
 }
 
+static int pc_action_set_dcc(struct xe_guc_pc *pc, bool enable)
+{
+	int ret;
+
+	ret = pc_action_set_param(pc,
+				  SLPC_PARAM_TASK_ENABLE_DCC,
+				  enable);
+	if (!ret)
+		return pc_action_set_param(pc,
+					   SLPC_PARAM_TASK_DISABLE_DCC,
+					   !enable);
+	else
+		return ret;
+}
+
+static int pc_modify_defaults(struct xe_guc_pc *pc)
+{
+	struct xe_device *xe = pc_to_xe(pc);
+	struct xe_gt *gt = pc_to_gt(pc);
+	int ret = 0;
+
+	if (xe->info.platform == XE_PANTHERLAKE) {
+		ret = pc_action_set_dcc(pc, false);
+		if (unlikely(ret))
+			xe_gt_err(gt, "Failed to modify DCC default: %pe\n", ERR_PTR(ret));
+	}
+
+	return ret;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1249,6 +1279,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 			   ktime_ms_delta(ktime_get(), earlier));
 	}
 
+	ret = pc_modify_defaults(pc);
+	if (ret)
+		return ret;
+
 	ret = pc_init_freqs(pc);
 	if (ret)
 		return ret;
-- 
2.38.1

