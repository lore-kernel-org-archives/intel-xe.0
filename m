Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17AACCA468
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 07:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A3910E394;
	Sun, 28 Sep 2025 07:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOnnTe5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2F510E384;
 Sun, 28 Sep 2025 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759043970; x=1790579970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n7GGox2IKOZ2mIYXXsI3YEnGy4HbK2KlYy7OUjGPCcM=;
 b=gOnnTe5PqROp5sANQOP4Ej3DKnyG4QrKuhnABK6aEChdkLgdbDVkZNQ1
 h+9LveYgpP4mMEnlnirtajws6HfVQUAhJJjSfepT9LNpcpmQ+p+fun8kO
 0VvUcclm8KhY0C4OJeAz/f5WLcE3ePrmfrR5FPKXAEVKbVer3y8HjF3Cr
 qkIW4Ac0zfB+jQcDnPuMyCNhyyCjt18Vh+5RawAp9OLmreDx79GycNBma
 nWmFmRHu3dog3+aNwnIZKlwtnaTi9iexRUjKkDk925tBgPRKLDPBjy8fL
 rRaAL9H4pNh8OSJqsXlsBKUfPceV6/3JLb8cdR4aQT9Hb06wdWKRsh8FP g==;
X-CSE-ConnectionGUID: vfaZzjV4Sou8bZJw36sm4A==
X-CSE-MsgGUID: 8qBlczmQSJeeINR6WXu5HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="60528576"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="60528576"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 00:19:28 -0700
X-CSE-ConnectionGUID: wt6yhIIPR8SFI1YmF/do8Q==
X-CSE-MsgGUID: JvV0k9dVQjqnPyRFOcH+JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="215094068"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 00:19:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 13/15] drm/i915/display: Recompute crtc_vblank_start for
 optimized guardband
Date: Sun, 28 Sep 2025 12:35:38 +0530
Message-ID: <20250928070541.3892890-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250928070541.3892890-1-ankit.k.nautiyal@intel.com>
References: <20250928070541.3892890-1-ankit.k.nautiyal@intel.com>
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

Currently crtc_vblank_start is read out either from VBLANK_START (pre
ADL) or from set context latency and vactive, in
intel_get_transcoder_timings().

As we move the delayed vblank to reduce the guardband, we need to use
the guardband to readout the new vblank start.

Recompute and overwrite the new vblank start when optimized guardband is
used in intel_vrr_get_config().

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 0b4694a1e2b5..dfd4f7456db0 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -832,6 +832,15 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 	 */
 	if (crtc_state->vrr.enable)
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
+
+	/*
+	 * If guardband is optimized then vblank start is vtotal - vblank_start
+	 */
+	if (intel_vrr_use_optimized_guardband(crtc_state))
+		crtc_state->hw.adjusted_mode.crtc_vblank_start =
+			crtc_state->hw.adjusted_mode.crtc_vtotal -
+			crtc_state->vrr.guardband;
+
 }
 
 int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
-- 
2.45.2

