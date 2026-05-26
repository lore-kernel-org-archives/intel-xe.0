Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A8CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0F710E705;
	Tue, 26 May 2026 19:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7NJq7bA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E77910E6E2;
 Tue, 26 May 2026 19:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779823151; x=1811359151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CPQ6fLlml3rWBsXufp0JPr2U0Um2VUiAXhwSHEQtc9Q=;
 b=E7NJq7bADqboyCrevng/ZQoU7RnPekyw1l1CLPT8L4JfcG7GYEtjGcM8
 Eclw5uljnnM3zpPxLvlxLWLwf4VMevYjnrexTsHGa8hc5MTYjgt/S9P+O
 H1q0K9+r2R9pIMnM7VISgJ/6nROgsBAtGbJE8jZBunzMKevFy7RnQr9fn
 VlmUwfSDlNC9ql3XA1SKXK4yy5Auzqa2L1bzBp/tsFVOu7vn2adkXlYLv
 ldv5pHDpC1RsAvGjcNlMxd64gjWaA0yvkoaxwqC8SPq+yOrZZkUB7gbNl
 SjtAesq8pe7eWpBUcqrMZYSGq6+TXIiH5qpFD9fUnZHOXxPnRPhB9swWa Q==;
X-CSE-ConnectionGUID: w4HFbuNETkSC91CsO1MLxg==
X-CSE-MsgGUID: z1M6PjBVQJ2Jl155Wc6nOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="83226301"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="83226301"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:19:11 -0700
X-CSE-ConnectionGUID: 2/86etE6TWqs7yL0x10yzA==
X-CSE-MsgGUID: W3Ev6eOASRukDVvBVkRUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="237841896"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:19:09 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com,
	uma.shankar@intel.com
Subject: [PATCH v4 10/13] drm/i915/display: Enable DC3CO idle protocol in ALPM
Date: Wed, 27 May 2026 00:48:23 +0530
Message-ID: <20260526191826.3786009-11-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526191826.3786009-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260526191826.3786009-1-dibin.moolakadan.subrahmanian@intel.com>
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
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
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

