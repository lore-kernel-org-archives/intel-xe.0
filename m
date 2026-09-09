Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E7CC79FBF
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C911A10F203;
	Wed,  9 Sep 2026 16:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NX+oBEOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB23310F200;
 Wed,  9 Sep 2026 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970671; x=1820506671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7u/trAEbjHY9nxiNmCY4701Af5AglM7UpqmwwnwiW/w=;
 b=NX+oBEOL6nHVsXAwrnQNTDe9VL+aDo6P23gN64nebkg+3g4sfnlZ615W
 zEWieIp4crgyQRLZBoYmxo+N2Y82F3vjgU9bBQ78y0jKxxmkS6Zu8s2Ik
 DDq81wh4Jwi/4uUGJN/uKOpjcWdGUpDx4t3aUHN+GcF48EKXONDKdKjct
 7dpq/9wdirwyU2Ahb0T+LUQDndLGbYHbyVdRaTp8ktoZmFSlCIOVZ5Tmk
 kyEuwmvVYlVse4+ldaxnupUgOHE4x0hZDnxo7mqNLMr81u2tLV9VfiLJo
 YaWdZUV9186Ukz/mg7tYKNYLusZG3NCge2tH4gzcVB/q+49OkvnSJGuR6 A==;
X-CSE-ConnectionGUID: gZpWKK35RBaEYm/8OrCMaw==
X-CSE-MsgGUID: RDg6H7i0T5CUlUJqKzL9HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100064579"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100064579"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:51 -0700
X-CSE-ConnectionGUID: JqSme8pPS1qMsnM6ws32KQ==
X-CSE-MsgGUID: utrFW6joQ3ueg/s77KHeOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275503205"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:51 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 04/13] drm/i915: Warn about use_flip==true in MMIO commit
 codepaths
Date: Wed,  9 Sep 2026 19:17:21 +0300
Message-ID: <20260909161730.12969-5-ville.syrjala@linux.intel.com>
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

Warn if use_flipq==true in intel_pipe_update_{start,end}().
These functions are part of the MMIO based commit codepath,
so should never get there with use_flipq==true.

We were also warning about use_dsb==true for the same reason.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index c7a85dce6aca..58a99c265598 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -596,7 +596,7 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 	struct intel_vblank_evade_ctx evade;
 	int scanline;
 
-	drm_WARN_ON(display->drm, new_crtc_state->use_dsb);
+	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
 
 	intel_psr_lock(new_crtc_state);
 
@@ -735,7 +735,7 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
 	ktime_t end_vbl_time = ktime_get();
 
-	drm_WARN_ON(display->drm, new_crtc_state->use_dsb);
+	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
 
 	if (new_crtc_state->do_async_flip)
 		goto out;
-- 
2.54.0

