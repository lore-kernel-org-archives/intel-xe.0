Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C52FC02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 10:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3959710E94A;
	Fri, 24 Jan 2025 10:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1EA9bbp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3F410E7F8;
 Fri, 24 Jan 2025 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737716230; x=1769252230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rU58T4/IloM8kcndcHSYWtg0lCRpEimsj/REvpcYlUk=;
 b=b1EA9bbpK8OCSHV+PTpVpziTU9td7cHmNWLGDih3NDCRCF6Hu473lsI7
 Sj6mzL2/Y6d+8BjnLMkiHdwV6qFv1Hn+/0QiNcpWJ910wLAx1kAe0+08t
 z2Fv3oFlbNjTI/EwuIUASwW0HhHPLwV7Cd6lLRiVW9/ThQ2pCec8SHID8
 9AcDLKga5YzB+FNCXWbVlOKHHqFq4qAtquoGsO3QPt50FqLpRTzwiHEou
 8yjlQMxDLnONMPWrYhQqL+83Js8cl4Z049ggXMpwsWoXt/ZnAX563gM07
 qvPqlzm/4WHZwqo4xy0EI4wiMLmsFUE3vG5BHp3OrH6au3kB4TSRLCEfB Q==;
X-CSE-ConnectionGUID: 6lvRjiF7TA6IhqGX5nRRqQ==
X-CSE-MsgGUID: bskKNZu0S0yDBqabY1olMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="55660107"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="55660107"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 02:57:10 -0800
X-CSE-ConnectionGUID: 080ccsJVT/KP+U9x7XxkBA==
X-CSE-MsgGUID: 1jR9rNJYR/SldMgIz1KYkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="107864298"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 02:57:08 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, ville.syrjala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 12/13] drm/i915/display: Ensure we have "Frame Change"
 event in DSB commit
Date: Fri, 24 Jan 2025 12:56:23 +0200
Message-ID: <20250124105625.822459-13-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250124105625.822459-1-jouni.hogander@intel.com>
References: <20250124105625.822459-1-jouni.hogander@intel.com>
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

We may have commit which doesn't have any non-arming plane register
writes. In that case there aren't "Frame Change" event before DSB vblank
evasion which hangs as PIPEDSL register is reading as 0 when PSR state is
SRDENT(PSR1) or DEEP_SLEEP(PSR2). Handle this by adding dummy write
triggering the "Frame Change" event.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a189aa437d972..cd7e960bd29f1 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7666,6 +7666,7 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
+	struct intel_display *display = to_intel_display(crtc);
 
 	if (!new_crtc_state->hw.active)
 		return;
@@ -7708,6 +7709,15 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 		intel_crtc_planes_update_noarm(new_crtc_state->dsb_commit,
 					       state, crtc);
 
+		/*
+		 * Ensure we have "Frame Change" event when PSR state is
+		 * SRDENT(PSR1) or DEEP_SLEEP(PSR2). Otherwise DSB vblank
+		 * evasion hangs as PIPEDSL is reading as 0.
+		 */
+		if (new_crtc_state->has_psr && !new_crtc_state->has_panel_replay)
+			intel_de_write_dsb(display, new_crtc_state->dsb_commit,
+					   CURSURFLIVE(display, crtc->pipe), 0);
+
 		intel_dsb_vblank_evade(state, new_crtc_state->dsb_commit);
 
 		if (intel_crtc_needs_color_update(new_crtc_state))
-- 
2.43.0

