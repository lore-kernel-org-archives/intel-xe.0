Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3D2CD98EE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 14:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C577910EC3A;
	Tue, 16 Jun 2026 14:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYeW/eZn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EADD10EC2F;
 Tue, 16 Jun 2026 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781621602; x=1813157602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JbSijaHP23Uo7TS0kjxUbBpQmL66Q/uJxab+Y04aIBs=;
 b=BYeW/eZngZg/cjAulkxe+WJ4SsyX3w2MMGgMr6fTA0dOed2xnAwIrGk2
 /oR2bf5inE9/qhbtL5Us5/3/A99AaGLBOO52KEtN1FrXrd9pS6Fq/BW0c
 X8MYJdlvT0oI5VhqiTyiBb4XurG4U5RBaQnl3LNeAupSGVl6dklQFmdfP
 yySA3GrO1RAhDVperDN/PMd2j+zAqPGhz0aaGZp57JMHE9vyTqTsc6Zet
 CJT0nNagGTSeBrpWm0Fm/SHELkTnsFn7TxjGLB+6pQIwDqqv8ai8Bj3x+
 AbvSpU0uiO6fbqAi6rwoyBexG5+Vj6280FcPykSB3loFwzTyMGYV/OZGk w==;
X-CSE-ConnectionGUID: iBeP/giIT/uvvvcNS/EyaA==
X-CSE-MsgGUID: u7WMJBirTQi2UzAAhGoWeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69932835"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="69932835"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 07:53:21 -0700
X-CSE-ConnectionGUID: 1ikL04o/Q9uYbSaKMtucsw==
X-CSE-MsgGUID: fG4goWD1QzuGegAexZ8cVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="285896319"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 16 Jun 2026 07:53:19 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH v2 05/11] drm/i915/vrr: Enable/Disable CMRR based on
 enable/disable preconditions
Date: Tue, 16 Jun 2026 20:12:26 +0530
Message-ID: <20260616144233.832276-6-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Enable or disable CMRR based on it is being computed and set of
preconditions. Should be enabled when dueing adaptive mode as well
as conditions which sets cmrr.enable gets set similarly to disable case.
Also separate out register writes for both enable and disable case.

Remove VRR_CTL_CMRR_ENABLE write in the current path, add the same
when actually CMRR is enabled.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 81 ++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 5678c3a86796..c979950d32cb 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -34,6 +34,43 @@
 #define DCB_CORRECTION_AGGRESSIVENESS	1000 /* ms × 100; 10 ms */
 #define DCB_BLANK_TARGET		50
 
+#define is_enabling(feature, old_crtc_state, new_crtc_state) \
+	((!(old_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)) && \
+	 (new_crtc_state)->feature)
+#define is_disabling(feature, old_crtc_state, new_crtc_state) \
+	((old_crtc_state)->feature && \
+	 (!(new_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)))
+
+static bool intel_crtc_cmrr_enabling(struct intel_atomic_state *state,
+				     struct intel_crtc *crtc)
+{
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
+	const struct intel_crtc_state *new_crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+
+	if (!new_crtc_state->hw.active)
+		return false;
+
+	return is_enabling(cmrr.enable, old_crtc_state, new_crtc_state) ||
+		(new_crtc_state->cmrr.enable);
+}
+
+static bool intel_crtc_cmrr_disabling(struct intel_atomic_state *state,
+				      struct intel_crtc *crtc)
+{
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
+	const struct intel_crtc_state *new_crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+
+	if (!new_crtc_state->hw.active)
+		return false;
+
+	return is_disabling(cmrr.enable, old_crtc_state, new_crtc_state) ||
+			(old_crtc_state->cmrr.enable);
+}
+
 bool intel_vrr_is_capable(struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
@@ -831,6 +868,34 @@ static void intel_vrr_set_vrr_timings(const struct intel_crtc_state *crtc_state)
 		       intel_vrr_hw_flipline(crtc_state) - 1);
 }
 
+static void
+intel_vrr_enable_cmrr(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
+		       upper_32_bits(crtc_state->cmrr.cmrr_m));
+	intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
+		       lower_32_bits(crtc_state->cmrr.cmrr_m));
+	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
+		       upper_32_bits(crtc_state->cmrr.cmrr_n));
+	intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
+		       lower_32_bits(crtc_state->cmrr.cmrr_n));
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
 static void
 intel_vrr_enable_dc_balancing(const struct intel_crtc_state *crtc_state)
 {
@@ -934,8 +999,6 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
 	 * even VRR_CTL_CMRR_ENABLE is armed by TRANS_CMRR_N_HI
 	 * when enabling CMRR (but not when disabling CMRR?).
 	 */
-	if (cmrr_enable)
-		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
 
 	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
 
@@ -962,10 +1025,15 @@ static void intel_vrr_tg_disable(const struct intel_crtc_state *old_crtc_state)
 void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_atomic_state *state = to_intel_atomic_state(crtc_state->uapi.state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
 	if (!crtc_state->vrr.enable)
 		return;
 
+	if (intel_crtc_cmrr_disabling(state, crtc))
+		intel_vrr_disable_cmrr(crtc_state);
+
 	intel_vrr_set_vrr_timings(crtc_state);
 	intel_vrr_enable_dc_balancing(crtc_state);
 
@@ -976,6 +1044,8 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_display *display = to_intel_display(old_crtc_state);
+	struct intel_atomic_state *state = to_intel_atomic_state(old_crtc_state->uapi.state);
+	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 
 	if (!old_crtc_state->vrr.enable)
 		return;
@@ -984,6 +1054,10 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 		intel_vrr_tg_disable(old_crtc_state);
 
 	intel_vrr_disable_dc_balancing(old_crtc_state);
+
+	if (intel_crtc_cmrr_enabling(state, crtc))
+		intel_vrr_enable_cmrr(old_crtc_state);
+
 	intel_vrr_set_fixed_rr_timings(old_crtc_state, old_crtc_state->cpu_transcoder);
 }
 
@@ -1066,9 +1140,6 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 	trans_vrr_ctl = intel_de_read(display,
 				      TRANS_VRR_CTL(display, cpu_transcoder));
 
-	if (HAS_CMRR(display))
-		crtc_state->cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
-
 	if (crtc_state->cmrr.enable) {
 		crtc_state->cmrr.cmrr_n =
 			intel_de_read64_2x32(display, TRANS_CMRR_N_LO(display, cpu_transcoder));
-- 
2.48.1

