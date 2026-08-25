Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A12DC5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390D610E8F2;
	Tue, 25 Aug 2026 06:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDTCNgVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC610E8E8;
 Tue, 25 Aug 2026 06:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638778; x=1819174778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4J7OQAF7hzU813kOt2pRmUVnwvWep9n6TT/LM7saOxU=;
 b=DDTCNgVeacOFAlMnSt/QcNHTtknud6ijKUUmObA1RTTVjCtAdrMtT2oA
 iU3gOI/I+64Td1kKTEShrr/dFqz7wFa81XOlvvbL+kheVUonDTEwIv77+
 gjyGO0DqFFXnSY3pZFo5Ja/Khn+6fJk1281Onw2M9CtcpEKUEsDT1J2my
 NY9NGcd2kxC0fyx8lkGWCzyLhjF7jO6igPcq0z4SREF2FDa0BCtb9SSBM
 JdtaT3z7/Ku9MNpuUg0wswYJu+YnoKWKG9kSX+TUYnB8CIPLgDpUqMzyA
 1UEDNEHaAq/C+sv+wqejKLTMYcAwKO83/Q6r92lf5cCfHlHzocWdG8Y3+ w==;
X-CSE-ConnectionGUID: 6Lk99F77QWyKVyS4z5rpUw==
X-CSE-MsgGUID: MFx4ThDRRFeCQL+KYnRy9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112694"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112694"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:38 -0700
X-CSE-ConnectionGUID: tgN44Rw1QTWAIqN+Uby+2g==
X-CSE-MsgGUID: e8FHtBYvRpiBCPTfzYKNOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912999"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:36 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 12/15] drm/i915/alpm: Replace is_edp() with
 alpm_is_possible()
Date: Tue, 25 Aug 2026 11:15:33 +0530
Message-Id: <20260825054536.3455704-13-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
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

Add a separate alpm_is_possible() which will check for both edp and dp.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 16 +++++++++++++---
 drivers/gpu/drm/i915/display/intel_alpm.h |  1 +
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index d23f3bdf1339..f3f6f40f9624 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -72,6 +72,16 @@ void intel_alpm_init(struct intel_dp *intel_dp)
 	mutex_init(&intel_dp->alpm.lock);
 }
 
+bool intel_alpm_is_possible(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	return (DISPLAY_VER(display) >= 12 && intel_dp->alpm_dpcd) ||
+		(DISPLAY_VER(display) >= 35 &&
+		intel_dp->lttpr_common_caps[DP_LTTPR_ALPM_CAPABILITIES -
+					    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV]);
+}
+
 static int get_silence_period_symbols(const struct intel_crtc_state *crtc_state)
 {
 	return SILENCE_PERIOD_TIME * intel_dp_link_symbol_clock(crtc_state->port_clock) /
@@ -519,7 +529,7 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 	if (intel_dp->alpm.sink_alpm_error)
 		return;
 
-	if (!intel_dp_is_edp(intel_dp))
+	if (!intel_alpm_is_possible(intel_dp))
 		return;
 
 	if (DISPLAY_VER(display) < 20)
@@ -685,7 +695,7 @@ void intel_alpm_lobf_disable(const struct intel_crtc_state *new_crtc_state)
 
 		intel_dp = enc_to_intel_dp(encoder);
 
-		if (!intel_dp_is_edp(intel_dp))
+		if (!intel_alpm_is_possible(intel_dp))
 			continue;
 
 		mutex_lock(&intel_dp->alpm.lock);
@@ -726,7 +736,7 @@ void intel_alpm_lobf_enable(const struct intel_crtc_state *new_crtc_state)
 
 		intel_dp = enc_to_intel_dp(encoder);
 
-		if (intel_dp_is_edp(intel_dp)) {
+		if (intel_alpm_is_possible(intel_dp)) {
 			intel_alpm_enable_sink(intel_dp, new_crtc_state);
 			intel_alpm_configure(intel_dp, new_crtc_state);
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index 7280865ed5f0..b0f6e2a9eede 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -18,6 +18,7 @@ struct intel_crtc;
 bool intel_alpm_source_supported(struct intel_connector *connector);
 void intel_alpm_init_dpcd(struct intel_dp *intel_dp);
 void intel_alpm_init(struct intel_dp *intel_dp);
+bool intel_alpm_is_possible(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
 void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
-- 
2.29.0

