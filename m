Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AF9C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EF110F200;
	Wed,  9 Sep 2026 16:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKHVfM3U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807FC10F1FD;
 Wed,  9 Sep 2026 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970658; x=1820506658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XFDe8Qe++Aszenwbdkkhvhs9KMmNHG869iHpsOSr+Ms=;
 b=BKHVfM3UOQpA1paoxI23CVSJTGm26CUW79MizO5/6UIf6lyWjuyiM/UL
 rMUYfMFxEIh7DO2KIzF1K4JbIUhHWemV+voF21xTM/0nDVlEbRnBu7vwu
 flwF6gZY2xhkOQxTXI8Z9LdZjI06rdRHm+1gDcSrx5jprVbVGtBgI9VRF
 WajzSf/PBckrsNJBoFivdaWDXSqkDsxo9CtVdB8N1Fd1hbECZ1Yn8WsTf
 XPEUgiwj8TogR6WQSZS9ICEJFVAERFtnAA8BE+7y7kUOWATQJOGzkaUPs
 LbRU9BzRR6qBGienxySOwOJT6ORh1Y7hLYHVz7/8zEqiYZqBr6v2xI0G2 A==;
X-CSE-ConnectionGUID: SjI7TwgDQ5GzQ3MAl3CjKA==
X-CSE-MsgGUID: PsnxWnMOSY+q1AQrhEM2Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114946745"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114946745"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:38 -0700
X-CSE-ConnectionGUID: hSLpJCPaS+GsA4ZUM3CeSQ==
X-CSE-MsgGUID: x95126jiTGufdCqmUeTD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296298814"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:37 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 01/13] drm/i915: Give up on DSB/flip queue if we fail to
 allocate the color DSB buffer
Date: Wed,  9 Sep 2026 19:17:18 +0300
Message-ID: <20260909161730.12969-2-ville.syrjala@linux.intel.com>
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

We don't have a codepath that does the color LUT update via
MMIO while writing the double buffered registers via DSB/flip queue.
So if we fail to allocate the DSB buffer for the LUT update we have
to fall back to a full MMIO based update. Make it so.

If we hit this with the current code then the entire LUT update
is simply skipped. After the fix the entire update, including
the LUT, will happen.

v2: Keep the use_dsb check in intel_crtc_needs_vblank_work()
    for the case when we need a color update but we have no
    LUTs, and thus we can end up doing the update via the DSB
    with intel_color_uses_dsb()==false

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 87ced9f6ff40..26e92221fa19 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2028,8 +2028,11 @@ void intel_color_prepare_commit(struct intel_atomic_state *state,
 	else
 		crtc_state->dsb_color = intel_dsb_prepare(state, crtc, INTEL_DSB_1, 1024);
 
-	if (!intel_color_uses_dsb(crtc_state))
+	if (!intel_color_uses_dsb(crtc_state)) {
+		crtc_state->use_flipq = false;
+		crtc_state->use_dsb = false;
 		return;
+	}
 
 	display->color.funcs->load_luts(crtc_state);
 
-- 
2.54.0

