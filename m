Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04B8CD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 16:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15AB10ECC2;
	Tue, 16 Jun 2026 16:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtYJMWm+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED39910ECC1;
 Tue, 16 Jun 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781627007; x=1813163007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ClujtInf99E4/ky1npTglguBjoHr6K0fWQ2Y/WVgfoE=;
 b=FtYJMWm+jhoxmMVZOCeh7CFUJLRp1iJS4nSVJHQNtE942mlVAeDXIEOR
 YNM4V02NhsYR2kM6HSgnF/d8Xb0qnrgScTtxxi+a/PyhjR0GA+ESdCTJ7
 WE7dpHNdE51axgZazCZYsCQMQCocskC3L31yrJNCyG7JB3XKCaHUmiHz/
 JlR2TMXhk275lXM+IgivqvTiW4HEHrfDhThBqiDk9tSAnBu/63iFKugRD
 SPzPPX8iU8KOjfx5+frOjr0tDUvT0E4ZZYwQfc0z7diabR6lu0PEhQjjq
 lsQqE1feonnPfcVzSKGppQ3xR2DlZX1ABjgAiD+uaBjLSROtw76T0yTSN g==;
X-CSE-ConnectionGUID: cEDyncGFSHaEt8KYsDSa3g==
X-CSE-MsgGUID: cOiV0mwTR5+De4goUyGFpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93781325"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93781325"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:27 -0700
X-CSE-ConnectionGUID: G1NtMehmR0yFmSpsUv6r/g==
X-CSE-MsgGUID: 581kNw5lQjioCgbFKKJsgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247693537"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:26 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, animesh.manna@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v6 11/16] drm/i915/display: Enable DC3CO idle protocol in ALPM
Date: Tue, 16 Jun 2026 21:51:49 +0530
Message-ID: <20260616162154.2630995-12-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
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

Changes in v5:
- check only intel_display_power_dc3co_allowed()
  before wiriting PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL (Jani Nikula)

BSpec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 5 +++++
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index c6963ea420cc..9b6248548f64 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -407,6 +407,11 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			if (crtc_state->disable_as_sdp_when_pr_active)
 				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 
+			if (intel_display_power_dc3co_allowed(display))
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

