Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B96C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F72C10F20B;
	Wed,  9 Sep 2026 16:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRM/X66f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC6A10F1FF;
 Wed,  9 Sep 2026 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970676; x=1820506676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ny6o/Nj/2Ge+wdNDtO4WvJmNlubUBF94U1/YAGlSWUU=;
 b=WRM/X66fuytq3S1Fcjjx/JHNf8BsPaCcNjES3UC3G+zINzWRg7HpoVE3
 E+XigikkUS+sG+9vCqYnU8qfusg5/i8zeqHEJxkQrtBX2IWDLuVjoJPeF
 e5r/xdlOvzpo4x9ZeeEGPrlFHbLfVyZUA6PZmI+1ra01on8bO7AjKFcGr
 EEYYW4G5CBL48o9TXJECacWfoyjGq/ulUCpVzM1vdBH+hU2sNaOQqMcK3
 0VdsaIVksOYqhpS3kyEpYDudR5Flky4YQboY9D9RzbXOAL92Qw27ZYynu
 Bcj4OkdDDKP8E8E4FE3P0mYQPTXSTOW6CShwhRZVmMffMZp4TcuRFjtlo g==;
X-CSE-ConnectionGUID: Hxqmr5U8S+6xnbZEU8PChQ==
X-CSE-MsgGUID: 0rIE6Sa1QdWSf81fDYhWvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114946765"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114946765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:55 -0700
X-CSE-ConnectionGUID: 3hFBkYW3SpOAjQHSHoRYtA==
X-CSE-MsgGUID: RBN6NeltRpqj4pA0EySuKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296298855"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:54 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 05/13] drm/i915: Refine vblank evasion DSB check
Date: Wed,  9 Sep 2026 19:17:22 +0300
Message-ID: <20260909161730.12969-6-ville.syrjala@linux.intel.com>
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

Use intel_color_uses_chained_dsb() rather than intel_color_uses_dsb()
when deciding whether to evade the undelayed vblank/SCL in the mmio
based commit path.

A non-chained DSB will not wait for the undelayed vblank/safe window
before starting execution, and the LUT itself will be double buffered
in this case. Thus we only need to evade the delayed vblank.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 28d81199792e..72e04c4f0303 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -724,10 +724,10 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 	 * undelayed vblank, so with seamless M/N and LRR we must evade
 	 * both vblanks.
 	 *
-	 * DSB execution waits for the transcoder's undelayed vblank,
-	 * hence we must kick off the commit before that.
+	 * Chained DSB execution waits for the transcoder's undelayed
+	 * vblank, hence we must kick off the commit before that.
 	 */
-	if (intel_color_uses_dsb(new_crtc_state) ||
+	if (intel_color_uses_chained_dsb(new_crtc_state) ||
 	    new_crtc_state->update_m_n || new_crtc_state->update_lrr)
 		evade->min -= vblank_delay;
 }
-- 
2.54.0

