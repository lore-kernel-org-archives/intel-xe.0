Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E4A107BCC8
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 16:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0708A10EB9B;
	Fri, 13 Mar 2026 16:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KewKWPh5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C32D10EB8C;
 Fri, 13 Mar 2026 16:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773417806; x=1804953806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q858z+RLcssjRNF8Sm0EBfN5EmpLZC0TUhQVso6m3OM=;
 b=KewKWPh5N6HoTgrcf5rpNTp79lpiDGCD6khosp7aFZqzxkkPKRGzm4ZY
 P1HIX+cWh0xesftVtFeB3ZbEoJL/3MqmlnRPQPY+J3ZwZbTbUp2ltqBqT
 3NkgFwZBE8KwrMc+zYx5MJHzE72Fw0xcXvLu9BgrU8vsfx5qn6s/Z6+pI
 YACg0f/BSFrCjWJ36/nQOrhPG9tBmiiaCFx3nZLRWYkgTVJt4V4qImrvi
 +D4IIHiHoqKQluatRx69E3qVJuZ3zc9zl9I4qO00aq7Osp5vAiTMmTJHc
 Ej7kLqY4J8rYvI4xDUMDXyLzv6+KbMG0qrue9i+faOlIs9T+pOz7nhRJ4 A==;
X-CSE-ConnectionGUID: xIf9HSIDSweT/ZWgur0WWA==
X-CSE-MsgGUID: 3Px5smgFRUuYh14unaLDYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74715448"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74715448"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 09:03:26 -0700
X-CSE-ConnectionGUID: v4eEuhm1RSagT9IEdH/EEQ==
X-CSE-MsgGUID: HbSVMmzxRx2EiDefzOMGgg==
X-ExtLoop1: 1
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2026 09:03:23 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dibin.moolakadan.subrahmanian@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 11/12] drm/i915/cmtg: set dc3co_enable flag for
 lobf/psr2/pr-alpm
Date: Fri, 13 Mar 2026 21:02:59 +0530
Message-Id: <20260313153300.3530695-12-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260313153300.3530695-1-animesh.manna@intel.com>
References: <20260313153300.3530695-1-animesh.manna@intel.com>
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

Set the flag in specific scenarios such as LOBF/PSR2/PR-ALPM,
where DC3CO enablement will be targeted, allowing CMTG to be programmed.
DC3CO enablement will be implemented in a separate patch series.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fbb5e2f9c241..53982d1e39dc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7327,6 +7327,7 @@ int intel_dp_compute_config_late(struct intel_encoder *encoder,
 				 struct intel_crtc_state *crtc_state,
 				 struct drm_connector_state *conn_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	int ret;
 
@@ -7338,6 +7339,13 @@ int intel_dp_compute_config_late(struct intel_encoder *encoder,
 
 	intel_alpm_lobf_compute_config_late(intel_dp, crtc_state);
 
+	if (HAS_DC3CO(display) && intel_dp_is_edp(intel_dp) &&
+	    (crtc_state->has_lobf || crtc_state->has_sel_update ||
+	     crtc_state->has_panel_replay))
+		crtc_state->dc3co.enable = true;
+	else
+		crtc_state->dc3co.enable = false;
+
 	return 0;
 }
 
-- 
2.29.0

