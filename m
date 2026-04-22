Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626E8FA1FD3
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 16:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D2910EEA3;
	Wed, 22 Apr 2026 16:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpxXug3p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D37E10EEA2;
 Wed, 22 Apr 2026 16:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776875183; x=1808411183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dqapS9Oae6yPdFEYG9vTni2jGsYUnFHBJHiYkEDHrMs=;
 b=GpxXug3p+pZNtycs11TwLpIJAOWMbILvezckFF4Q21qOBstOTMsdAKWX
 VH4n1sex+yx+zFhxVAFcmVJsTUg8zX5Q0IwjQcKWaJ4wNarb331AkVEIP
 RI6cBiUkh49MfRKE6N+zsofKOq9jetKm73UmfNDBhWeG5F6XMipzJwX5o
 hpsmdXWAkO0PbC45lrXaSzGG8DOsQxvE3+Qq4ODKcXSO+PqR9zI40vc9a
 NHdREeuMeeQdhF91nHidknyU+zcbBaN9ECIQgR2JW/kYiyMI5O+SLfdcH
 5YBptRFyyr4Z5twLQLCDjKLiMbsr9hxKzpSo1LGMrnk2fiCA+XlfGg+VZ w==;
X-CSE-ConnectionGUID: rST/2zrtQvi+9XcFVNO+1w==
X-CSE-MsgGUID: 8k3WWdsFQHq3wq/4R8ou7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95247618"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="95247618"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:23 -0700
X-CSE-ConnectionGUID: XdFTk1YmQ9SuUSZkYITV8w==
X-CSE-MsgGUID: U8UqlO9FRPeTmpip50PyGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="227816188"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:21 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v2 10/13] drm/i915/display: Enable DC3CO idle protocol in ALPM
Date: Wed, 22 Apr 2026 21:56:18 +0530
Message-ID: <20260422162622.1869831-11-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
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

Add PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL bit definition and set it
when DC3CO is allowed.

Changes in v2:
- Squash "Define DC3CO idle protocol bit in PR_ALPM_CTL"
  into this patch (Uma Shankar)
- Use intel_display_power_dc3co_allowed(display)
  instead of intel_dc3co_allowed(state)

BSpec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 6 ++++++
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index a7350ce8e716..6394d1568b54 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -389,6 +389,12 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			if (crtc_state->disable_as_sdp_when_pr_active)
 				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 
+			if (intel_display_power_dc3co_allowed(display) &&
+			    intel_display_power_dc3co_supported(display))
+				pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
+			else
+				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
+
 			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
 				       pr_alpm_ctl);
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
index 8afbf5a38335..16a9e3af198d 100644
--- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
@@ -268,6 +268,7 @@
 
 #define _PR_ALPM_CTL_A	0x60948
 #define PR_ALPM_CTL(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _PR_ALPM_CTL_A)
+#define  PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL			BIT(7)
 #define  PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU	BIT(6)
 #define  PR_ALPM_CTL_RFB_UPDATE_CONTROL				BIT(5)
 #define  PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE	BIT(4)
-- 
2.43.0

