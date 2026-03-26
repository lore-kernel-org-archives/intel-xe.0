Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE23010A88EB
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835A610EAC7;
	Thu, 26 Mar 2026 17:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBUrFv5j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32CA10EAC7;
 Thu, 26 Mar 2026 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774545341; x=1806081341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0iZ4IGzE882ierrXPDsTGs+29DhbHM6p6D9d7sAR5pE=;
 b=FBUrFv5jc/qfA+4iLAAoEvgjvPA1G2YxOezko3NASHRvmUhHtKKf49kp
 33vA9lN+OWqL2Ybs3HcmtBFsi7k4/CkLdbDdPCgLdBytpLIuLkQXz4Zy3
 g5NhlgEYHhCIlJz7MY7Tm5U7Mvcpkj/v2CA4ZHQul0l2QGJuQ5fpVafEG
 bLH+mNK0KInmGVUOhvvGy+jEZF13P8T7zPkdGHqYvTO78cIdO+aJTQT3S
 j4X14ULSmUe58luDSzUnPIno/D6IeuJuq55BDPuewaXiozdo/ftSEyFba
 eDUmQXiNhwjFnXNOqfJInCA7VIMhr92SCKxkaZuKbluLZgndOgicfW5CF g==;
X-CSE-ConnectionGUID: ElbC+imaRiyKiDlQUfp3mg==
X-CSE-MsgGUID: 70x9Zuy1RbCh/jzFR82Teg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75630593"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75630593"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:41 -0700
X-CSE-ConnectionGUID: c4KX4j8lTOizKHKyjDo0Wg==
X-CSE-MsgGUID: FSDYTzqdStaE/hA5LEybig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262975631"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:39 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH 14/19] drm/i915/display: Enable DC3CO idle protocol in ALPM
Date: Thu, 26 Mar 2026 22:45:52 +0530
Message-ID: <20260326171557.2065632-15-dibin.moolakadan.subrahmanian@intel.com>
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

Set PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL when DC3CO is
allowed.

BSpec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index a7350ce8e716..9f92513a23c0 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -365,6 +365,9 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	struct intel_display *display = to_intel_display(intel_dp);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 alpm_ctl;
+	struct intel_atomic_state *state =
+		to_intel_atomic_state(crtc_state->uapi.state);
+
 
 	if (DISPLAY_VER(display) < 20 || (!intel_psr_needs_alpm(intel_dp, crtc_state) &&
 					  !crtc_state->has_lobf))
@@ -389,6 +392,12 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			if (crtc_state->disable_as_sdp_when_pr_active)
 				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 
+			if (intel_dc3co_allowed(state) &&
+			    intel_display_power_dc3co_supported(display))
+				pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
+			else
+				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
+
 			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
 				       pr_alpm_ctl);
 		}
-- 
2.43.0

