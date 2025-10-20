Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475B6CCD1A7
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3F910E4BA;
	Mon, 20 Oct 2025 18:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8rWsWWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B035D10E4B6;
 Mon, 20 Oct 2025 18:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760986262; x=1792522262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PPxF78AlFdKx/5TCYjXz8L51sUoUFs8/dnazCGYu2nU=;
 b=A8rWsWWyzWDjyDcEfJ9t2Rvlp7Xr6XzAki/x1Vp8NEI/XE4eMhy4H+PK
 ZYM5e0LYWaWMdyXF4qO2PSgzWV4Hnm0fH7yUYUECdrkeqBaS7wK/YMzy6
 BI2E7THrIvu1pUDUpzlMmTbjHJWe1wI8PSBlleV5ytVhnYyV8n0kdhByp
 XIRQ8lfHib7/ngplxzTplS/NzFOOKe0Qh1uubO1dZPxmL7TNL3lsyhLXb
 QFw/e99D/tqrTexVp+r0NmmB3qe74riYFGbqNvLYV0IZ0sT0QMitbWQx3
 RSCffKMdQ2HujFP87rgPkVcNPUlyrrfcf7xShVOAi14kmacszqF5kQutN A==;
X-CSE-ConnectionGUID: AVpRhDIfRryTbZ0Im6Mcmw==
X-CSE-MsgGUID: uTyNK+ImRcyDiD9BxLXpbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63147895"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63147895"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:51:01 -0700
X-CSE-ConnectionGUID: IYFS3LMlTtCpefzn1egHvg==
X-CSE-MsgGUID: Eblt4cVUSSOsmCph5qnZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="188684602"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:51:00 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/22] drm/i915/vrr: Reorganize
 intel_vrr_compute_cmrr_timings() a bit
Date: Mon, 20 Oct 2025 21:50:21 +0300
Message-ID: <20251020185038.4272-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251020185038.4272-1-ville.syrjala@linux.intel.com>
References: <20251020185038.4272-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Move the cmrr.enable assignment next to the mode_flags assignment
to keep things in a bit more logical order in
intel_vrr_compute_cmrr_timings().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 510dc199376f..01cb9cfe08e1 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -220,7 +220,6 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
 static
 void intel_vrr_compute_cmrr_timings(struct intel_crtc_state *crtc_state)
 {
-	crtc_state->cmrr.enable = true;
 	/*
 	 * TODO: Compute precise target refresh rate to determine
 	 * if video_mode_required should be true. Currently set to
@@ -230,6 +229,8 @@ void intel_vrr_compute_cmrr_timings(struct intel_crtc_state *crtc_state)
 	crtc_state->vrr.vmax = cmrr_get_vtotal(crtc_state, false);
 	crtc_state->vrr.vmin = crtc_state->vrr.vmax;
 	crtc_state->vrr.flipline = crtc_state->vrr.vmin;
+
+	crtc_state->cmrr.enable = true;
 	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 }
 
-- 
2.49.1

