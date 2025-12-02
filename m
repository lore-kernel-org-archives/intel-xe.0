Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5B6D116F9
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 07:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A05310E575;
	Tue,  2 Dec 2025 07:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YK194VX5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2262610E575;
 Tue,  2 Dec 2025 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764661026; x=1796197026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R1cU2h1ePYpeLo8j2VcCrCUUlnn12rMqu6ZPDhMkjH0=;
 b=YK194VX5WxIQqpF/PoLDkmbzcGktA9Chf3UoYPb2LbUQDzfsJxgoVt8A
 B/oLz9Qaz4x96EOivfoEQskBij/qoSaLrDWsDRWBn6HDlDl7ynp/XGf64
 jvA7rmqvr7TXBZVDXKSODgqWUZXH/iVqStEqnbetD3dFs4Osl4j/G6gPn
 Hg8OwpOmfCSmPn7F+aVlNq+5Whv7lRNWGiBHU+rCnvc5Yv2dStdDN+u2E
 9vU2HaEB67G1fUenntPOmEzxoXv88vaqKWkARg1BTYRMComqc7UcL1Uhf
 V8iV8L3NBOmbi3K6M0qQSFgIiqDOeDyN9s/Q10VRseflwY6odTWz1q/wZ w==;
X-CSE-ConnectionGUID: Xfd/u1SuSu2Hpfgk7tbiHw==
X-CSE-MsgGUID: qdEOrTUYRC6VIQz58w5Kuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84219234"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="84219234"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:37:06 -0800
X-CSE-ConnectionGUID: 4ZdW8cbWQwWjiEbkoC2zTA==
X-CSE-MsgGUID: 9Ht9FqS6Qoe5yirSfFfs4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="198504847"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 01 Dec 2025 23:37:04 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, mitulkumar.ajitkumar.golani@intel.com,
 ankit.k.nautiyal@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, jani.nikula@intel.com
Subject: [PATCH v10 11/17] drm/i915/vblank: Extract vrr_vblank_start()
Date: Tue,  2 Dec 2025 13:06:46 +0530
Message-ID: <20251202073659.926838-12-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251202073659.926838-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20251202073659.926838-1-mitulkumar.ajitkumar.golani@intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Initialise delayed vblank position for evasion logic.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 671f357c6563..de20baeb9d99 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -652,6 +652,14 @@ intel_pre_commit_crtc_state(struct intel_atomic_state *state,
 	return pre_commit_crtc_state(old_crtc_state, new_crtc_state);
 }
 
+static int vrr_vblank_start(const struct intel_crtc_state *crtc_state)
+{
+	if (intel_vrr_is_push_sent(crtc_state))
+		return intel_vrr_vmin_vblank_start(crtc_state);
+	else
+		return intel_vrr_vmax_vblank_start(crtc_state);
+}
+
 void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 			     const struct intel_crtc_state *new_crtc_state,
 			     struct intel_vblank_evade_ctx *evade)
@@ -678,10 +686,7 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 		drm_WARN_ON(crtc->base.dev, intel_crtc_needs_modeset(new_crtc_state) ||
 			    new_crtc_state->update_m_n || new_crtc_state->update_lrr);
 
-		if (intel_vrr_is_push_sent(crtc_state))
-			evade->vblank_start = intel_vrr_vmin_vblank_start(crtc_state);
-		else
-			evade->vblank_start = intel_vrr_vmax_vblank_start(crtc_state);
+		evade->vblank_start = vrr_vblank_start(crtc_state);
 
 		vblank_delay = crtc_state->set_context_latency;
 	} else {
-- 
2.48.1

