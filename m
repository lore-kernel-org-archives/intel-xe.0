Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D356FEC1136
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 20:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFC710E44A;
	Mon, 23 Feb 2026 20:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WR5d+oH+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A498310E44A;
 Mon, 23 Feb 2026 20:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771879835; x=1803415835;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tcp044MWSAH1bN0hF625tWgD0ajuNhCI199NnZSMufE=;
 b=WR5d+oH+biQerHvMQd39aPLclLXq0XUZAw1jGDT/uI4j6QVJDz398jm9
 G+LVdlHdg/hfHuhiU8AQ9WFA2ucvB6tBerY5cRs6vrcDaJlRPyYLGT3t8
 +7w16onkldHIYtwpUbmuXvMpgTrf/+CU7+bVwDRtQd+Zo0mDMKDREMcwf
 4yFoiAjwQBB1UAH5oy7lMV37tD0M3rFJpbYQuXvrjrRuS+XN9+BPDPUsr
 71cGgJxFJHHXyMAU5e8untMKHN4xHTBlQjKLkMYCnuFwBz9u4R7lzrKWT
 g86XeBWAOKtOVGeEtINajOUXkwrhqXlDKbN16w/txrgWNKKhnjLm4glLi g==;
X-CSE-ConnectionGUID: uSB+zbBgQeWkYAawNCe0rA==
X-CSE-MsgGUID: mNNcs2teQsypdMwtrFQ1Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84249581"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="84249581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 12:50:35 -0800
X-CSE-ConnectionGUID: Vj9hTpPJTLaLN87Msd4b7w==
X-CSE-MsgGUID: w2qTxYOQSGCqWjjnP5l4aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220202587"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa004.jf.intel.com with ESMTP; 23 Feb 2026 12:50:33 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH] drm/i915/display: Enable AS SDP Skip Frames
Date: Tue, 24 Feb 2026 02:37:07 +0530
Message-ID: <20260223210707.1039982-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
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

Hardware provides mechanism to skip AS SDP for programmed
number of frames. Enable the same to drive to 1Hz if hardware
supports it.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 3 +++
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index b3334bc4d0f9..76a8919cdba2 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -395,6 +395,9 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			if (crtc_state->disable_as_sdp_when_pr_active)
 				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 
+			if (DISPLAY_VER(display) >= 35)
+				pr_alpm_ctl |= PR_ALPM_CTL_ASSDP_SKIP_FRAMES(32);
+
 			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
 				       pr_alpm_ctl);
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
index 8afbf5a38335..8c35df795955 100644
--- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
@@ -268,6 +268,8 @@
 
 #define _PR_ALPM_CTL_A	0x60948
 #define PR_ALPM_CTL(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _PR_ALPM_CTL_A)
+#define  PR_ALPM_CTL_ASSDP_SKIP_FRAMES_MASK			REG_GENMASK(27, 16)
+#define  PR_ALPM_CTL_ASSDP_SKIP_FRAMES(val)			REG_FIELD_PREP(PR_ALPM_CTL_ASSDP_SKIP_FRAMES_MASK, val)
 #define  PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU	BIT(6)
 #define  PR_ALPM_CTL_RFB_UPDATE_CONTROL				BIT(5)
 #define  PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE	BIT(4)
-- 
2.50.1

