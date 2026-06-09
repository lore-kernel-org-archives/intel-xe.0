Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652A5CD98D6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A49C10E2FA;
	Tue,  9 Jun 2026 12:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmRmFge4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED73F10E2EC;
 Tue,  9 Jun 2026 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006643; x=1812542643;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=S6RcO1zPa725OClpDg9/MI9tnx7OsDywzqUkt2VPabY=;
 b=nmRmFge4DGCiT7j327tKzNqCqOeL+7qvsfV5NBjpriP9pMkxq3FVL6s+
 yb5GuI4WFj2Ax6Q98cOqzIwgbSExXyfk954w93zJ45t7zW+aRQADPFFZn
 +Ch2+0LfIfcJGODpNdMQqMEZ6K6Zy2OCytUh1L02oz0EuEg996AtBP9hG
 yE3szryfF98CO8ALpX3UnsUZgLCBtwltMgx2wQb4jEnu2ZJS7BxvDOoFZ
 LMJeFtwAr+tmzNlXx0PCZbhOM0qAWfJXTZIw1c3ZQz8gjORzQjgw/77uw
 s8a+A6qYuV5dX2gl80TKtgF6c4mGz9QY6EByWk/g7cD554Hl7J9LOeRjf Q==;
X-CSE-ConnectionGUID: 3HhBS0lsQJCrEvoGmUjt4A==
X-CSE-MsgGUID: cPwm0bJhRzGczp/tZ2jgqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340400"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340400"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:02 -0700
X-CSE-ConnectionGUID: lUfBelI3S/ie5luhQLIpJg==
X-CSE-MsgGUID: nPuz3r+KSVyazLXrk/F2Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988395"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:02 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 17/36] drm/i915/cmtg: Add CMTG scan line programming
Date: Tue,  9 Jun 2026 17:32:31 +0530
Message-ID: <20260609120250.867750-18-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
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

Enable the hardware based guardband calculations which allows
DC3co to remain enabled when timings are changing from one fixed
refresh rate to another fixed refresh rate.

Bspec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c      | 2 ++
 drivers/gpu/drm/i915/display/intel_cmtg_regs.h | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index cc36784e5253..1d63b612c44b 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -188,6 +188,7 @@ void intel_cmtg_disable(const struct intel_crtc_state *crtc_state)
 
 	intel_de_rmw(display, TRANS_DDI_FUNC_CTL2(display, cpu_transcoder),
 		     CMTG_SECONDARY_MODE, 0);
+	intel_de_rmw(display, CMTG_SCANLINE_GB1(cpu_transcoder), CMTG_HW_GB_ENABLE, 0);
 
 	intel_de_rmw(display, TRANS_CMTG_CTL(cpu_transcoder), CMTG_ENABLE, 0);
 
@@ -351,6 +352,7 @@ void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state)
 		return;
 
 	intel_de_rmw(display, TRANS_DDI_FUNC_CTL2(display, cpu_transcoder), 0, CMTG_SECONDARY_MODE);
+	intel_de_rmw(display, CMTG_SCANLINE_GB1(cpu_transcoder), 0, CMTG_HW_GB_ENABLE);
 	crtc->cmtg.enabled = true;
 	drm_dbg_kms(display->drm, "CMTG: %s enabled\n", transcoder_name(cpu_transcoder));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
index a4a2a2fe6b66..18dcb665df04 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
@@ -32,4 +32,10 @@
 #define CMTG_HW_GB_DC5_EXIT_LATENCY_MASK	REG_GENMASK(27, 16)
 #define CMTG_HW_GB_UP_LW_BG_DIFF_MASK		REG_GENMASK(31, 28)
 
+#define _CMTG_SCANLINE_GB1_A		0x456A0
+#define _CMTG_SCANLINE_GB1_B		0x456C0
+#define CMTG_SCANLINE_GB1(trans)	_MMIO_TRANS((trans), \
+						    _CMTG_SCANLINE_GB1_A, _CMTG_SCANLINE_GB1_B)
+#define  CMTG_HW_GB_ENABLE		REG_BIT(31)
+
 #endif /* __INTEL_CMTG_REGS_H__ */
-- 
2.43.0

