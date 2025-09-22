Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D070FCAC5AC
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 19:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C5C10E50D;
	Mon, 22 Sep 2025 19:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5GjqK9U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BF910E50C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 19:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758571128; x=1790107128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nSZ3bT273oVCZlXfrR6t7aeJ7r1dIUNRsZDbZBREPX8=;
 b=j5GjqK9U50pBABbTQNIR2UV4Z9YaZPrHqohZEDD8N8d444r4482D59k6
 JOqGgc0wNmGusu3cvWKcLIpac2hZqdWpjm3fsgPIZm3ONhzBF13OUwLil
 R4zUs3j8iyhiuzPcEGGZmGjUswW3qnqdfu364BGhw2mKqi+o4cRG332yc
 kmSkgznsSys893kzaBDkH/JzbPG/DU6cE4hbUw7EdgWh3H/LbdrlqLbSo
 OVN8j2qbHbY7IjbelwM6r5aqrFAbb685YaRzmjaQK6R8FbHzEO2BGm1sM
 Pv8m2Ev8mqNgtUoHnVX7sISyurjgCoVgd4aBG+hblA8y/WH9A4WiU32pG Q==;
X-CSE-ConnectionGUID: Yp9IqNbHTxqASZf+W9pZsA==
X-CSE-MsgGUID: W2TzoOWjQn6WjZDrKLdmNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72267352"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="72267352"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:58:47 -0700
X-CSE-ConnectionGUID: 9XwtQw0DTo6pdk+hGZMM2g==
X-CSE-MsgGUID: INZcolFfSjeXS+zSqOyWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="207306251"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:58:46 -0700
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
Subject: [PATCH v4 3/5] drm/xe/guc: Drop helper to read freq
Date: Mon, 22 Sep 2025 12:58:31 -0700
Message-ID: <20250922-xe-iopoll-v4-3-06438311a63f@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
References: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
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
index 00789844ea4d0..708e08fb0779f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1017,14 +1017,6 @@ static int guc_load_done(u32 status)
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
@@ -1102,7 +1094,7 @@ static int guc_wait_ucode(struct xe_guc *guc)
 
 		xe_gt_dbg(gt, "load still in progress, timeouts = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
 			  count, xe_guc_pc_get_act_freq(guc_pc),
-			  guc_pc_get_cur_freq(guc_pc), status,
+			  xe_guc_pc_get_cur_freq_fw(guc_pc), status,
 			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
 			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
 	} while (1);
@@ -1113,7 +1105,7 @@ static int guc_wait_ucode(struct xe_guc *guc)
 
 		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
 			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
-			  guc_pc_get_cur_freq(guc_pc), load_done);
+			  xe_guc_pc_get_cur_freq_fw(guc_pc), load_done);
 		xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
 			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
 			  bootrom, ukernel,
@@ -1167,11 +1159,11 @@ static int guc_wait_ucode(struct xe_guc *guc)
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
 

-- 
2.50.1

