Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DACDCCF2E3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB7910ED45;
	Mon, 19 Oct 2026 13:54:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECF810ED6D;
 Mon, 19 Oct 2026 13:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418041; x=1823954041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KyEe3aQO0YKuEi5bLC9NAyN6rucI3SvmWherne5KWlg=;
 b=hC+J70SV2x/N9oc9+srl/+DJLy1GjRWF2ZhoNt88PBYqz1UB4FL+eOWb
 6Jbqv5q94a2kmF3RxBsNBqxJ8i7dFgTlRVVto0LfU+qaw/obDyQ2Gs4hD
 ENQfRTcEErbC0Rpl6pQDozGbb77lCzY05R8bKoPON0R97lyod2+5jJ19D
 6Mmrf5Nx5F7YzhV89m5ST5+ak2cnps6ZX+niWiUUrkKOUZr7wg6Owv9v3
 nH0fE9OyGHijwrkFL717NIqZsdl8E1d7YrRlBJN/fs/DwOf40H5HSVye+
 mkcIXy8Kd4dFXGac0W1BUhaEBR1Rry3Q1NSsxcPJwF6uF3dnmN4w7CV30 w==;
X-CSE-ConnectionGUID: V3cKJAnMREuHRq1Nc/Lcig==
X-CSE-MsgGUID: RI22HFgDRBChqwJ6a5qw4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1085175"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1085175"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:54:01 -0700
X-CSE-ConnectionGUID: m7/5eHXQQfS0UZUmE0f/nQ==
X-CSE-MsgGUID: 5vD42mwfRhaymdQcaJmUzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2844461"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:59 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/15] drm/i915/pfit: No pfit one line mode on i965+
Date: Mon, 19 Oct 2026 16:53:07 +0300
Message-ID: <20261019135309.23578-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
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

i965+ panel fitter no longer appaers to have the "one line mode"
fallback for wide sources. Presumably the line buffers are now
big enough that the one line mode is not needed.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index d8daa463452e..6eb457047bf4 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -963,7 +963,10 @@ void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
 
 bool i9xx_pfit_is_one_line_mode(const struct intel_crtc_state *crtc_state)
 {
-	return crtc_state->gmch_pfit.control & PFIT_ENABLE &&
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	return DISPLAY_VER(display) < 4 &&
+		crtc_state->gmch_pfit.control & PFIT_ENABLE &&
 		drm_rect_width(&crtc_state->pipe_src) > 1024;
 }
 
-- 
2.55.0

