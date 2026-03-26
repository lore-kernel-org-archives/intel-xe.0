Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A5F10A88E9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382A710EA95;
	Thu, 26 Mar 2026 17:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoC/CVTf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7846E10EA9B;
 Thu, 26 Mar 2026 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774545327; x=1806081327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wmJ02gTX9Qesnbpc5pgkynF/+LOH1An5xx8WHeKHkMs=;
 b=FoC/CVTfu9/vMsAS4uTCPCnIhgoGISuF3dZMdAKK2MY4G2usoXg5f8tp
 6NvqDOpSFfq97QaA67CGE2/B05y+5/02GCHrxOH8t/nOv4rW3pTqf/b/h
 JU4gPHyf4TCvpxJz3bGaeBNxYM9u32IcYrASEIe5TxTkFe9TXaOAZ3UV8
 S2ArZ+ruldT+FbrFvx/npPOnUev4PDz723jEEM+JlSKKO+kvp1sN0fnuS
 aBj4ViWs59lSFTX8qhxsvBduq5/fACpV5XVvy0IqNIe9wa3zl636dSSHd
 P8nxmRBhHtjB9ElkuRc1SIg4tZOb78X3tuMDKu+sVgsCSAh+qcSaKnxmT g==;
X-CSE-ConnectionGUID: 4iMCwO+JQMyxK5noZ86gfg==
X-CSE-MsgGUID: 8191f/faTk+1xs6+559W0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75630569"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75630569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:27 -0700
X-CSE-ConnectionGUID: gyQHKhAfSJiVwSdEpLOqfQ==
X-CSE-MsgGUID: SqFNHIRtQue9TZMctvIp0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262975559"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:25 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH 07/19] drm/i915/display: Add helper to check DC3CO support
Date: Thu, 26 Mar 2026 22:45:45 +0530
Message-ID: <20260326171557.2065632-8-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
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

Add a helper to query DC3CO support from allowed_dc_mask.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 7 +++++++
 drivers/gpu/drm/i915/display/intel_display_power.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 12967db27c8d..a3b0c8ad8bb5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -365,6 +365,13 @@ u32 intel_display_power_get_current_dc_state(struct intel_display *display)
 	return current_dc_state;
 }
 
+bool intel_display_power_dc3co_supported(struct intel_display *display)
+{
+	struct i915_power_domains *power_domains = &display->power.domains;
+
+	return (power_domains->allowed_dc_mask & DC_STATE_EN_UPTO_DC3CO) == DC_STATE_EN_UPTO_DC3CO;
+}
+
 static void __async_put_domains_mask(struct i915_power_domains *power_domains,
 				     struct intel_power_domain_mask *mask)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 3fb45154864e..f57ce99a6039 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -201,6 +201,7 @@ void intel_display_power_resume(struct intel_display *display);
 void intel_display_power_set_target_dc_state(struct intel_display *display,
 					     u32 state);
 u32 intel_display_power_get_current_dc_state(struct intel_display *display);
+bool intel_display_power_dc3co_supported(struct intel_display *display);
 
 bool intel_display_power_is_enabled(struct intel_display *display,
 				    enum intel_display_power_domain domain);
-- 
2.43.0

