Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB4F1061B28
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 23:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14A810E80F;
	Mon, 30 Mar 2026 23:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQCSU+Ht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0517910E80F;
 Mon, 30 Mar 2026 23:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774914853; x=1806450853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ad/UOpLNScqhODp44W5RI8ZIVHKtQ/GO7tLI5JyGPeE=;
 b=lQCSU+HtIYDRnM6P72TBc4QM40Px0wDrIYHy6lZaSX5juK2YjeJZ6g9K
 7dadJh3ovpbYxzy3GoPw8kVN6VZmLmxzjgmNWJfSeA28M+ITTX7I1P/xz
 Ym8uE4C+ZlEb7uoWxWbpTe1Vw3VAEZNpzPwXHrt05qxtpld7tv1NVLWAy
 thjClLpjB834AYQKB9h77k+uvv/UC3OuQBmXtcCV9W5hqEsAVYz6sFHpX
 5XUOiP/xYKA61VnDaclyxJfCSCzkldTHGyDvLUGKMCKts+EimLc3Forin
 daI597eJd595MBImfnXoahv32SeyuY1Dq7TDuKmOk2F+zX1yz6CUiBVnm w==;
X-CSE-ConnectionGUID: ulv4jMRSTKOtpcdpT9fbbQ==
X-CSE-MsgGUID: Gyg3HB48RRGOJnmE24DUOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75979257"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75979257"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:54:13 -0700
X-CSE-ConnectionGUID: PK99DkpnQnOs8hWgHaTF7A==
X-CSE-MsgGUID: c3QXZRdYS2unbcen5mOHjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225208231"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:54:12 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 6/9] drm/i915/dp: Require a HDMI sink for YCbCr output via PCON
Date: Tue, 31 Mar 2026 02:53:36 +0300
Message-ID: <20260330235339.29479-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260330235339.29479-1-ville.syrjala@linux.intel.com>
References: <20260330235339.29479-1-ville.syrjala@linux.intel.com>
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

DVI sinks can't deal with YCbCr. Make sure we have a HDMI sink connected
after the PCON before doing YCbCr 4:2:0 output.

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 86319bf09a19..ce40d38557e1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1358,10 +1358,15 @@ intel_dp_sink_format_valid(struct intel_connector *connector,
 			   const struct drm_display_mode *mode,
 			   enum intel_output_format sink_format)
 {
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	const struct drm_display_info *info = &connector->base.display_info;
 
 	switch (sink_format) {
 	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		if (intel_dp->dfp.min_tmds_clock &&
+		    !intel_dp_has_hdmi_sink(intel_dp))
+			return MODE_NO_420;
+
 		if (!connector->base.ycbcr_420_allowed ||
 		    !drm_mode_is_420(info, mode))
 			return MODE_NO_420;
-- 
2.52.0

