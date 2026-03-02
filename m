Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ECAE9B37C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 13:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F71A10E4DF;
	Mon,  2 Mar 2026 13:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeJloPXW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE16110E4E2;
 Mon,  2 Mar 2026 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772458041; x=1803994041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vfkj3u8+ELp4542Hw9MoUH023nj5G355ktoNUCKfTRk=;
 b=EeJloPXWSrtcwhwNj8cQcZFIJH86VNrk4eOOY4DML074x9JxItuhpDRz
 Zh4vdTZv/64oHUgwY8ajFC7ccNyexBLx9J7hzK9FGrCDtm08zWrEo6Xd7
 b0klj37WeDOphbFPQf7hcaUc9TOhsm+GuahYfvY3a7br3mii7Tn1BNDg3
 mvjWMfJAKScfrHfeAZ0/gH5Y8hkrWJ2etWEYqCEhSLEU7XnG92I/eow7j
 9OrSTnTxppNqouwLvIDIHSn9OxZbLbNxKXBMbHloQobkT/8zxuxR9QsQt
 HOdDUHGJSf2l9uglZSJe7EUxFjK+w42VDwO1HvITk6Yn7zJN3xcxFg4NK A==;
X-CSE-ConnectionGUID: tMwLkAI7R0mcLQSZfATq3g==
X-CSE-MsgGUID: pBKz3cWvSfOONq7A18XG3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84813270"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84813270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 05:27:21 -0800
X-CSE-ConnectionGUID: hdpH15OxQbGziMQLnwreGA==
X-CSE-MsgGUID: m9ElxQjXSluieCL6kPW0xg==
X-ExtLoop1: 1
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 02 Mar 2026 05:27:18 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 jouni.hogander@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv3 2/2] drm/i915/dp: Rename alpm_init to alpm_init_dpcd
Date: Mon,  2 Mar 2026 18:56:02 +0530
Message-Id: <20260302132602.480408-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260302132602.480408-1-arun.r.murthy@intel.com>
References: <20260302132602.480408-1-arun.r.murthy@intel.com>
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

In the function intel_alpm_init we are reading the ALPM_CAPABILITIES and
storing them in intel_dp, so appending the function name to _dpcd so as
to align with other function such as intel_psr_init_dpcd referenced in
the same function.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 2 +-
 drivers/gpu/drm/i915/display/intel_alpm.h | 2 +-
 drivers/gpu/drm/i915/display/intel_dp.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index b3334bc4d0f9..8ba7463d7fe1 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -42,7 +42,7 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
 }
 
-void intel_alpm_init(struct intel_dp *intel_dp)
+void intel_alpm_init_dpcd(struct intel_dp *intel_dp)
 {
 	u8 dpcd;
 
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index 1cf70668ab1b..a24a7a03bdaa 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -15,7 +15,7 @@ struct intel_connector;
 struct intel_atomic_state;
 struct intel_crtc;
 
-void intel_alpm_init(struct intel_dp *intel_dp);
+void intel_alpm_init_dpcd(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
 void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1544758c0bbc..4e9df88b90cd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4749,7 +4749,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 	intel_dp_init_source_oui(intel_dp);
 
 	/* Read ALPM DPCD caps before reading the PSR CAPS */
-	intel_alpm_init(intel_dp);
+	intel_alpm_init_dpcd(intel_dp);
 
 	/*
 	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks
-- 
2.25.1

