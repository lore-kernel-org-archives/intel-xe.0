Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E673C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B214810F206;
	Wed,  9 Sep 2026 16:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEIfo7W0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234C710F1FB;
 Wed,  9 Sep 2026 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970681; x=1820506681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=puGau2f19nadnxxl+/weP9lcwiitrDO6NYtWsqExxoU=;
 b=oEIfo7W01dAcOi/F8pKlMnBv1fFTFvDc6Jjp5g2Jggwg+WmkkOVWRvqf
 yX70R66Zb5h+/D4rpG9qlZJN3a7tbXG0t9Fn2IGU50SxIP/0Bj2gLzSo7
 bSHNuyGaNCc04JU8qTJYJL+nP5kaJGOZnFj8cyMoPYT2MuJ4CvWX/ls9H
 AYJGeI1TSgXAg+kjY9s1XI3OH6fHVYkvKztEKoNn+6s1VGVC46dOP6eVK
 7aKjYUuQsM12KnwgUGU6KGK8pQg43esXCd7qnX6ntKJHf+B0u+cNFQIEt
 3Gbwt26nAf9FFwiLcZsMOujkO2cP8qLPcbhkzFtM5Us31V+uoiwEcayxB A==;
X-CSE-ConnectionGUID: hpJjU3+/QtaPOWOluniMNQ==
X-CSE-MsgGUID: nfgU9J5TQAiU1ABZt8A9FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114946770"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114946770"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:59 -0700
X-CSE-ConnectionGUID: 2GI6j4D6SGy0fgRYk1Z1ng==
X-CSE-MsgGUID: RSG10T37S++wpVduu1C7GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296298893"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:58 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 06/13] drm/i915: Make intel_crtc_needs_vblank_work() easier
 on the eye
Date: Wed,  9 Sep 2026 19:17:23 +0300
Message-ID: <20260909161730.12969-7-ville.syrjala@linux.intel.com>
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

We will never use the vblank worker based LUT update path on
hardware with double buffered LUTs. Split that check out from
the semi-illegble mess in intel_crtc_needs_vblank_work()
so that it's clear what's happening.

The rest of the checks in that mess are more about dynamic
runtime state, so keeping those together makes some sense.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 58a99c265598..0de24d221e48 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -491,11 +491,13 @@ static bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_sta
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
+	if (HAS_DOUBLE_BUFFERED_LUT(display))
+		return false;
+
 	return crtc_state->hw.active &&
+		intel_crtc_needs_color_update(crtc_state) &&
 		!crtc_state->preload_luts &&
 		!intel_crtc_needs_modeset(crtc_state) &&
-		(intel_crtc_needs_color_update(crtc_state) &&
-		 !HAS_DOUBLE_BUFFERED_LUT(display)) &&
 		!intel_color_uses_dsb(crtc_state) &&
 		!crtc_state->use_flipq &&
 		!crtc_state->use_dsb;
-- 
2.54.0

