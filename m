Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B29109B492
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 15:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A94A10EADD;
	Tue, 31 Mar 2026 15:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1BXkM/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2E810EAB8;
 Tue, 31 Mar 2026 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774971825; x=1806507825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4kdtJVV0zl0YSrEdTy6Z5kT0LvwKXYX2b7hQUyBcVyM=;
 b=e1BXkM/z8BmR1nBRJaOHU3xWZrbC0MXAm0y0Z3TT/sKvXhBFgUnaHO3m
 e413ZU4cCLeYOd9WOZuFcGAJ1B/iF2xwSOBNP8olOhAgflhKILdPj6wfX
 EwQ2xn5DYn/8//FUNPB8ObN3y+jqugNWsG3fAyPvzxxyZF5UKaCaQr7Lg
 KIXW4xKjMwO/OUxM/UFvZKv6fI9f9nVHE8gQHgjfP7D3ue2Q/E1pRZxf/
 8X4jkKDvtGJYMUGWYnC97Nby0+Q/GTTcKKRYAjYZePovjQmwkFPAi5ddf
 Bfuw58gcjg36Uz8z/iHVWotM12y8oVbIEDWZ9WBAVIXXMnZKZHVB2XpZa Q==;
X-CSE-ConnectionGUID: vQvjFx0BQnGK59KV+ynTsQ==
X-CSE-MsgGUID: 47CPgrNlQy615H1Ha3sEAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76181013"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="76181013"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:43:45 -0700
X-CSE-ConnectionGUID: suYUY8GpRfmFyPt8JuVC+g==
X-CSE-MsgGUID: ADjh0tfcRCm9MoO2BcC3TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="223519364"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:43:43 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 10/12] drm/i915/vrr: Use intel_de_read64_2x32()
Date: Tue, 31 Mar 2026 18:42:57 +0300
Message-ID: <20260331154259.24600-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
References: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
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

Replace the pointless use of intel_de_read64_2x32_volatile()
with the simpler intel_de_read64_2x32().

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index ae5385e92889..fae1186a90b2 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1053,11 +1053,9 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 
 	if (crtc_state->cmrr.enable) {
 		crtc_state->cmrr.cmrr_n =
-			intel_de_read64_2x32_volatile(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
-						      TRANS_CMRR_N_HI(display, cpu_transcoder));
+			intel_de_read64_2x32(display, TRANS_CMRR_N_LO(display, cpu_transcoder));
 		crtc_state->cmrr.cmrr_m =
-			intel_de_read64_2x32_volatile(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
-						      TRANS_CMRR_M_HI(display, cpu_transcoder));
+			intel_de_read64_2x32(display, TRANS_CMRR_M_LO(display, cpu_transcoder));
 	}
 
 	if (DISPLAY_VER(display) >= 13) {
-- 
2.52.0

