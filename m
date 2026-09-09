Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5ACC79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BAC10F21D;
	Wed,  9 Sep 2026 16:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdKvxyVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F45C10F21A;
 Wed,  9 Sep 2026 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970699; x=1820506699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f/jFilUcdGG9WuheNUNKYBZn1Sq6wieRTrCPEfNnX9U=;
 b=VdKvxyVtJTAps6N7k8jTV71cMcB7BazEv/lQPmwxXYQNHkDAc+pvQYmI
 BlB7mpbI4R4irx6wZ0ywq78KmVObp1xiXwQ9xE9qL2Q/Q87pzgfri9seY
 qHA/P3UozUpOIcn/1s9hlWfwtq1xpwFOXgIw6JdO6ftXnNGZSTbIlqo66
 0na2LZWoP8ZVvKKju288FM35V/pAUCnseG6M8o5v7SjDU8eKU7XYYBUKy
 EpUc/8ae7M2Xy6rOKMChZYK1l5PZrP9nD6x/px2UCCH2WTvTErp/d+K0X
 QUUNb7E6R+zg1Intez7z1/usO75QbAB9vy2EKkD+2UiVyomieZxdy7b7S g==;
X-CSE-ConnectionGUID: +zDn043nTLK5deFJ0RRivg==
X-CSE-MsgGUID: 6HBS1Q9sSOW9K78eIM7vHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93225093"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="93225093"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:19 -0700
X-CSE-ConnectionGUID: al77AsWNTvaZD0w0Q5voBw==
X-CSE-MsgGUID: KSY2lHGFSxqpUpwPXn1prg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="265155471"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:18 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 11/13] drm/i915: Carve intel_atomic_commit_type() up a bit
Date: Wed,  9 Sep 2026 19:17:28 +0300
Message-ID: <20260909161730.12969-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

We can't currently do full modesets, fastsets, nor async
flips via either DSB nor flip qeueu. Let's checks for those
up front to reduce the clutter in the if statements.

And while at it, throw in some TODO comments to remind
us that we may want to implement these via DSB/flip queue
eventually.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 22 +++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9a24eb16025a..eea2c2b40304 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7388,21 +7388,27 @@ intel_atomic_commit_type(struct intel_atomic_state *state,
 	if (state->base.legacy_cursor_update)
 		return INTEL_COMMIT_MMIO;
 
-	/* FIXME deal with everything */
+	/* TODO maybe enable/disable planes via DSB/flip queue during modeset? */
+	if (intel_crtc_needs_modeset(new_crtc_state))
+		return INTEL_COMMIT_MMIO;
+
+	/* TODO implement fastsets via DSB/flip queue */
+	if (intel_crtc_needs_fastset(new_crtc_state))
+		return INTEL_COMMIT_MMIO;
+
+	/* TODO implement async flips via DSB/flip queue */
+	if (new_crtc_state->do_async_flip)
+		return INTEL_COMMIT_MMIO;
+
+	/* TODO handle VRR with flip queue */
 	if (intel_flipq_supported(display) &&
-	    !new_crtc_state->do_async_flip &&
 	    !new_crtc_state->vrr.enable &&
 	    !new_crtc_state->has_psr &&
-	    !intel_crtc_needs_modeset(new_crtc_state) &&
-	    !intel_crtc_needs_fastset(new_crtc_state) &&
 	    !intel_crtc_needs_color_update(new_crtc_state))
 		return INTEL_COMMIT_FLIPQ;
 
 	if (intel_dsb_supported(display) &&
-	    !new_crtc_state->do_async_flip &&
-	    (DISPLAY_VER(display) >= 20 || !new_crtc_state->has_psr) &&
-	    !intel_crtc_needs_modeset(new_crtc_state) &&
-	    !intel_crtc_needs_fastset(new_crtc_state))
+	    (DISPLAY_VER(display) >= 20 || !new_crtc_state->has_psr))
 		return INTEL_COMMIT_DSB;
 
 	return INTEL_COMMIT_MMIO;
-- 
2.54.0

