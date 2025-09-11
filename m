Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0EECAC594
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 17:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACE710E3D0;
	Thu, 11 Sep 2025 17:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4UJ9BEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B4610E282
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757611539; x=1789147539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jnijVk7xu8T9J8Pmdevy4DWL53ribTfu+uSU/EwizjY=;
 b=a4UJ9BEYBlq0f7w14bVvSaLzU0s8Clxzx2WgfAiTHvSWPxKlls7AWbbc
 f9U0bxsXEDt52uram0/abAyanG1hPNFwTfSCNbpUwcZRdcGzV7VD+2g9A
 rkeJrly9V52GYVR51XCiapJBIH+1hGzdQHWjECf1Ij1CU/0tnqlYnHyxh
 N2S5a0odUTb40MNmaYtyMrWd2mfjRSsj5PouPqLA4gD7FiTFztQAuqkSD
 Zk5uSYs1WJA8iFoJcYZwXux7wZ6mf0nwglQRm3oMyQOsleN4wTCk84oD7
 DVdel7yerBClv1hwm6Ty8Q2znCaA8k1VnHAgWb3DAPPf4C3Y2sLmDWOgn A==;
X-CSE-ConnectionGUID: mpGqT4FCRs2k/q+zjljkwQ==
X-CSE-MsgGUID: rl74pym8R6+esmMn1+LvWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59810771"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59810771"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:39 -0700
X-CSE-ConnectionGUID: e3iqXWenTpOKIjOWCXF5+g==
X-CSE-MsgGUID: cT4/hiS7T2mevZ74HnClcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178956844"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 3/5] drm/xe/guc: Drop helper to read freq
Date: Thu, 11 Sep 2025 10:25:21 -0700
Message-ID: <20250911-xe-iopoll-v3-3-6a95f1cc3b0b@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
References: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

As the forcewake is already held during GuC load, there's no need to use
a helper function to call xe_guc_pc_get_cur_freq(). Just call
xe_guc_pc_get_cur_freq_fw() directly.

Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e56c9c5c8845e..d8fc060c9682e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1019,14 +1019,6 @@ static int guc_load_done(u32 status)
 	return 0;
 }
 
-static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
-{
-	u32 freq;
-	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
-
-	return ret ? ret : freq;
-}
-
 /*
  * Wait for the GuC to start up.
  *
@@ -1104,7 +1096,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 
 		xe_gt_dbg(gt, "load still in progress, timeouts = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
 			  count, xe_guc_pc_get_act_freq(guc_pc),
-			  guc_pc_get_cur_freq(guc_pc), status,
+			  xe_guc_pc_get_cur_freq_fw(guc_pc), status,
 			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
 			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
 	} while (1);
@@ -1115,7 +1107,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 
 		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
 			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
-			  guc_pc_get_cur_freq(guc_pc), load_done);
+			  xe_guc_pc_get_cur_freq_fw(guc_pc), load_done);
 		xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
 			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
 			  bootrom, ukernel,
@@ -1169,11 +1161,11 @@ static void guc_wait_ucode(struct xe_guc *guc)
 		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
 			   delta_ms, status, count);
 		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
-			   xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
+			   xe_guc_pc_get_act_freq(guc_pc), xe_guc_pc_get_cur_freq_fw(guc_pc),
 			   before_freq, xe_gt_throttle_get_limit_reasons(gt));
 	} else {
 		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, timeouts = %d\n",
-			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
+			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), xe_guc_pc_get_cur_freq_fw(guc_pc),
 			  before_freq, status, count);
 	}
 }

-- 
2.50.1

