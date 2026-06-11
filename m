Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A30CD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7463D10ED40;
	Thu, 11 Jun 2026 07:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxfxcWRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A3110ED41;
 Thu, 11 Jun 2026 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781164273; x=1812700273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q6PqD2uwzQyjOb8tILJn6UCN+RFmYNiNCMtL+hf8Hyg=;
 b=gxfxcWRPhGM5ONFfIdfvVT9mkpQ7uWY26VwJl7MkWpZ/62Cv5Ahke5ht
 sA/8MG7O2VCvlY5L2zOlAyBjQpw8GPNZvL6CRxKlU+GhKMbWK/nVDdFIx
 h+U6PAyMvHpzFqbbglTizfJ0sUuSb+bAhUIT+rgFjR5U8G1SsfOKYDNGn
 aYYkT+iH+W5OyxnwSQ3ew3gvkQ6kXOhCeHN27CFyzayqTq3gdA88VeIFP
 ocdqh1UIZUpYfjRAgQmF8L+qA6CHb9jNQd/t8bImUWhzFR4/2z6Qzvb6Q
 L2EbFjPoZVPoRI1miKlQcfozpEFJAhvTz/ISpxisDxEGbcehVwO0CXwLY Q==;
X-CSE-ConnectionGUID: CIm1SBWmRbyjXx6NlCh8lA==
X-CSE-MsgGUID: vzP1/hodTk6hWn69tQKJkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93078755"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="93078755"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:51:13 -0700
X-CSE-ConnectionGUID: curK6M2UR82dRw1oMFOReQ==
X-CSE-MsgGUID: KF6FhG6LSx+jfwVNElU5Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251503358"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:51:10 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 09/12] drm/i915/dp: Store SDP transmission lines in
 crtc_state
Date: Thu, 11 Jun 2026 13:03:11 +0530
Message-ID: <20260611073316.1439306-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
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

Currently the driver only programs the transmission line for the
Adaptive-Sync SDP, while the hardware controls the transmission lines for
other SDPs.

Starting with Xe3p_lpd, the hardware allows the driver to program
transmission lines for additional DP SDPs. Prepare for this by adding
fields to struct intel_crtc_state to store SDP transmission lines, and
include them in pipe config comparison.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip.h     | 6 ++++++
 drivers/gpu/drm/i915/display/intel_display.c | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
index e9959356226e..03ef749a79ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.h
+++ b/drivers/gpu/drm/i915/display/intel_dip.h
@@ -51,6 +51,12 @@ struct intel_dip {
 	 * The programmed transmit line is (Vtotal - value)
 	 */
 	u16 emp_as_sdp_tl;
+	u16 gmp_sdp_tl;
+	u16 pps_sdp_tl;
+	u16 vsc_sdp_tl;
+	u16 vsc_ext_sdp_tl;
+	/* Common SDP Base transmission line (Xe3p_lpd+) */
+	u16 cmn_sdp_tl;
 };
 
 void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c84ee0e865ee..8807897538a4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5508,6 +5508,11 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_I(set_context_latency);
 
 	PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
+	PIPE_CONF_CHECK_I(dip.gmp_sdp_tl);
+	PIPE_CONF_CHECK_I(dip.pps_sdp_tl);
+	PIPE_CONF_CHECK_I(dip.vsc_sdp_tl);
+	PIPE_CONF_CHECK_I(dip.vsc_ext_sdp_tl);
+	PIPE_CONF_CHECK_I(dip.cmn_sdp_tl);
 
 #undef PIPE_CONF_CHECK_X
 #undef PIPE_CONF_CHECK_I
-- 
2.45.2

