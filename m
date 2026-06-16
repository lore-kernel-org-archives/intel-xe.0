Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21864CD98F8
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF20B10EB45;
	Tue, 16 Jun 2026 12:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6IKLRit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C124B10EB43;
 Tue, 16 Jun 2026 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613960; x=1813149960;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ClujtInf99E4/ky1npTglguBjoHr6K0fWQ2Y/WVgfoE=;
 b=B6IKLRitsx4UWRDHE0a4x8O6khphGZUJH20ZxTfOa1z4lGtsr00B7MBX
 2n6CLYG5ZCtBZ/FrDpNL2bBHNKnhqk+EqS1gHzQk4zjMHxaAYnVpMilV/
 hNzSMfrOUzA3ZjN9+PmWfAK5HAHq5MS4rDF/fHPAlwvcoFsnT/jeC+1OU
 4ELG5awJUL49wHD6j82lD4PUc3O4HlwTBx8OPWsyp7SDhVn/5QJ+GcnRy
 XxmG+83AHh2QVKVNDZq6YMXhu7bOtdR+7Zn+C53gizOrxua3Ild7+gT75
 Oujvm615QafMOYxdwrOXRWBH8aZHT6HEWaLAqGmHnfvmGoiUma3T/SetQ A==;
X-CSE-ConnectionGUID: +cZ7ihAWSECXOxOZH9bXtQ==
X-CSE-MsgGUID: mxI/D3fbQZeENhViKWWYlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513290"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513290"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:59 -0700
X-CSE-ConnectionGUID: 70IgXZNGSqykv6rK/jkf/A==
X-CSE-MsgGUID: fqYMsmlgQEW298Ex62iWTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876385"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:58 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 33/39] drm/i915/display: Enable DC3CO idle protocol in ALPM
Date: Tue, 16 Jun 2026 18:14:09 +0530
Message-ID: <20260616124416.2442161-34-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

