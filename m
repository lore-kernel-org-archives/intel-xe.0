Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D7BC44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E505710ECF9;
	Tue, 14 Jul 2026 10:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tb5zvSDE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CB610ECF4;
 Tue, 14 Jul 2026 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784026211; x=1815562211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UDju9VSeDUtFrtYH6SrfwoZfBHD3TEHpP2Sdtbu2zMo=;
 b=Tb5zvSDEHUomsyUZXvaxUr9I973wEx2erK9aL2Z678TW3Npy73IeZZbx
 EpfwwdNGXeGGy8oJYtszJL4ld5lB6KEyjfG2cDjXn938flG0MipFrkK/w
 0B6kukshLNin+vJXDKaUxG42Gi+vbBurmkIGCkBZreqcTWijIvs2oVeWn
 A53cNZWARKNcSGUduOptTXnpwGSVCvwxm6D7uq/h2/4rE1ycMbDo8Xc/N
 Km4d5ePP2O4p+SVHkTLFAuh4vMU9BkreO0D+nxVebsb5LUX5fGUl2+e9x
 aw7K+P9ilDhntAID3bBWdCwgRs9Es3/kyhIVI1UTLvWFRvZhpXswjE51J Q==;
X-CSE-ConnectionGUID: J5rQEhQDSW+4UaMEk32GiQ==
X-CSE-MsgGUID: R+xjfI42Sa6DqGG6yqNQlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88544453"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="88544453"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:50:10 -0700
X-CSE-ConnectionGUID: UtkdxWgBSACfNdu37vu7rQ==
X-CSE-MsgGUID: 7y7oKOGPT5CwI3gs0DR+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="260134521"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa005.jf.intel.com with ESMTP; 14 Jul 2026 03:50:09 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v3 6/8] drm/i915/vrr: Program CMRR enable/disable from
 transcoder timings
Date: Tue, 14 Jul 2026 16:09:35 +0530
Message-ID: <20260714103938.2371448-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
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

Split the CMRR M/N register programming into intel_vrr_enable_cmrr()
and intel_vrr_disable_cmrr(), and drive them from
intel_vrr_set_transcoder_timings() based on crtc_state->cmrr.enable.

VRR_CTL_CMRR_ENABLE is not set explicitly, writing TRANS_CMRR_N_HI
arms CMRR in hardware. Drop the now-unused cmrr_enable
argument to intel_vrr_tg_enable().

No functional change intended for non-CMRR configurations.

--v2:
- Commit message changes.
- Added Simplified enable/disable sequence. (Chaitanya)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 51 ++++++++++++++++++++----
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 95c7b0c05ec3..52fe40fdbdb3 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -624,6 +624,34 @@ static u32 trans_vrr_ctl(const struct intel_crtc_state *crtc_state)
 			VRR_CTL_PIPELINE_FULL_OVERRIDE;
 }
 
+static void
+intel_vrr_enable_cmrr(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
+		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
+	intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
+		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
+	intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
+		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
+	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
+		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
+}
+
+static void
+intel_vrr_disable_cmrr(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder), 0);
+	intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder), 0);
+	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder), 0);
+	intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder), 0);
+}
+
 void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -662,6 +690,13 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
 	intel_cmtg_set_vrr_timings(crtc_state);
 
+	if (HAS_CMRR(display)) {
+		if (crtc_state->vrr.cmrr.enable)
+			intel_vrr_enable_cmrr(crtc_state);
+		else
+			intel_vrr_disable_cmrr(crtc_state);
+	}
+
 	if (!intel_vrr_always_use_vrr_tg(display))
 		intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder),
 			       trans_vrr_ctl(crtc_state));
@@ -924,8 +959,7 @@ intel_vrr_disable_dc_balancing(const struct intel_crtc_state *old_crtc_state)
 	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
 }
 
-static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
-				bool cmrr_enable)
+static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
@@ -937,11 +971,12 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
 	vrr_ctl = VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state);
 
 	/*
-	 * FIXME this might be broken as bspec seems to imply that
-	 * even VRR_CTL_CMRR_ENABLE is armed by TRANS_CMRR_N_HI
-	 * when enabling CMRR (but not when disabling CMRR?).
+	 * This full TRANS_VRR_CTL write is the authoritative one, so it must
+	 * carry VRR_CTL_CMRR_ENABLE when CMRR is in use. Writing TRANS_CMRR_N_HI
+	 * arms the bit in hardware, but this later write would otherwise clear
+	 * it again.
 	 */
-	if (cmrr_enable)
+	if (crtc_state->vrr.cmrr.enable)
 		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
 
 	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
@@ -977,7 +1012,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 	intel_vrr_enable_dc_balancing(crtc_state);
 
 	if (!intel_vrr_always_use_vrr_tg(display))
-		intel_vrr_tg_enable(crtc_state, crtc_state->vrr.cmrr.enable);
+		intel_vrr_tg_enable(crtc_state);
 }
 
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
@@ -1004,7 +1039,7 @@ void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state)
 		return;
 
 	if (intel_vrr_always_use_vrr_tg(display))
-		intel_vrr_tg_enable(crtc_state, false);
+		intel_vrr_tg_enable(crtc_state);
 }
 
 void intel_vrr_transcoder_disable(const struct intel_crtc_state *old_crtc_state)
-- 
2.48.1

