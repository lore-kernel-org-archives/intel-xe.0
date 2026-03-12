Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC4FFED2F2
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0171410EA21;
	Thu, 12 Mar 2026 08:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bmc+vyfR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8616B10EA1E;
 Thu, 12 Mar 2026 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773304645; x=1804840645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+PDs5kO4XWxeWJLel8FIrYbpdAkDxtWwyfQYc507CXo=;
 b=Bmc+vyfRpl7h7xJc1gL+MM2UmjbjD/m5aOuJ5QnOUf+JrdzSHcdMrzhS
 cH2jPtqGUlFMPjKK41tBs709HJRFmlnuXJ1CbLaEDXvEEW/cLxiLncqeU
 rFbWiaIKMcx8i16gY8PYnWu35TYX7wvimj68JTNkHlfW7hmNaI053tM+1
 wu6KltH1ulhCBQFTD1xgnxGfqzklddCLgJ9AC+KutS8Zpe3GZXOjS9t7a
 jUTQ636jfDRex731tHsA4BOI86As8fe2xFnvYpCuc3SaYLiiqhKLGWIJI
 L+dcNSpkK60rep9u3TPKQxACTvSqcbpJA9O7dZSKCsHkiRjLsaQOoradi g==;
X-CSE-ConnectionGUID: wWE3xRzfSlScb+a4Aok2Iw==
X-CSE-MsgGUID: n5WObF4qRiCAqnjktRyBEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74280163"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74280163"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:37:25 -0700
X-CSE-ConnectionGUID: cKEma0IuQOCq4J9dLdzdiw==
X-CSE-MsgGUID: PZ+hXmPqSHKBUU9YXMSEkw==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO jhogande-mobl3.intel.com)
 ([10.245.245.57])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:37:23 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/2] drm/i915/psr: Disable PSR on update_m_n and update_lrr
Date: Thu, 12 Mar 2026 10:37:09 +0200
Message-ID: <20260312083710.1593781-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312083710.1593781-1-jouni.hogander@intel.com>
References: <20260312083710.1593781-1-jouni.hogander@intel.com>
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

PSR/PR parameters might be changing on update_m_n or update_lrr. Disable on
update_m_n and update_lrr to ensure proper parameters are taken into use on
next PSR enable in intel_psr_post_plane_update.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15771
Fixes: 2bc98c6f97af ("drm/i915/alpm: Compute ALPM parameters into crtc_state->alpm_state")
Cc: <stable@vger.kernel.org> # v6.19+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 5041a5a138d1..7e0e4c3bf985 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3112,6 +3112,8 @@ void intel_psr_pre_plane_update(struct intel_atomic_state *state,
 			 * - Display WA #1136: skl, bxt
 			 */
 			if (intel_crtc_needs_modeset(new_crtc_state) ||
+			    new_crtc_state->update_m_n ||
+			    new_crtc_state->update_lrr ||
 			    !new_crtc_state->has_psr ||
 			    !new_crtc_state->active_planes ||
 			    new_crtc_state->has_sel_update != psr->sel_update_enabled ||
-- 
2.43.0

