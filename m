Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54246D778B1
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 23:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE78910EC00;
	Fri, 23 Jan 2026 23:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ffl9qToZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC2510EC03
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 23:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769211267; x=1800747267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9B2qmOh8iN8Lr+ELhNvYJtSFwIquSJV7UF8NblHT6vE=;
 b=Ffl9qToZVhhWIT1DW0xKlXGqrBfnQi4LlYUeNgfH4EszMcqKJnycVEw0
 z5jMs2VQ/9vMpsbLz50TsYXB9/OSRi0053VSP+JAWf1eqxr7EwGB4Z0Sw
 WwnDCCDvItWOjzgvrPCi5bgK0FQDEPULj9WM97CwQLNsq6drRmTBADi7y
 rceIKV3EgxKmyJW09vf8PLJ2610R6G0xoXOo9IMBzrZhGzOfm6oeq/MGU
 +3C1T3FsVdQdHGOSF9ev5G4p/bO80yqwpUxXHEGsWwAnVvYv6NtuBeN/K
 ndNV6eJ5/BTj9V+RMOT/bwzMNQ34P5MgJY+ZRl1+ZSRXzGqnh2PaxrrC4 Q==;
X-CSE-ConnectionGUID: qjrRBJ+9Qwebi7WGGqHa9g==
X-CSE-MsgGUID: yvl3ugM+Qoe+b7zhC8JXYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="87884146"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="87884146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 15:34:27 -0800
X-CSE-ConnectionGUID: kIliVnE6Q8mIaHiwx8CL+Q==
X-CSE-MsgGUID: SRWumiCRQMWAe5fBy1o+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="230103096"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2026 15:34:25 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe/ptl: Disable DCC on PTL
Date: Fri, 23 Jan 2026 15:31:05 -0800
Message-Id: <20260123233105.369575-1-vinay.belgaumkar@intel.com>
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
it may cause some regressions due to added latencies. Upcoming GuC
releases will disable DCC on PTL as well, but we need to force it in
KMD so that this behavior is propagated to older kernels.

v2: Update commit message (Rodrigo)
v3: Rebase

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

