Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3A8C88E69
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FF310E947;
	Sun, 13 Sep 2026 15:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zwrksr6L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0B610E93F;
 Sun, 13 Sep 2026 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312410; x=1820848410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6xJGKAknXRkrxvxu/fFd4o1qkmOhYv1+KBgXkg4lzEA=;
 b=Zwrksr6LYu4RrsWNGVdpOxWZb0ETkLFlMZntWXvVagiU8Ivr7RJcC6SQ
 rPiX8QdJnEk33kuaUmuG6umduKQUgmEpOWU8ZT+rZdvy8A25/tpa2eW8p
 Ordd0deMZzGZMZ1mVYmBaNNR/YxUj6n+AAKcDd1UvDe0cpnZMn+rlNgpY
 aK0HNhx/8b3Vd97/3y3+loYfau4GVnCzvhSNYljQlcO66koSFUG+vDe44
 m4KThUOOtT8evt9PUDn44XEUL15wMTIS3se88NaEEihEhKJAzai42aRTv
 AGaUbCi+XFrd2ubqAcdQXCqUwI0ACTwkeNcQF8ocBt7YTycCPuFndDiW2 g==;
X-CSE-ConnectionGUID: UmVyohj4QvC6loyDUUTtjQ==
X-CSE-MsgGUID: y1h8fp7+T8ORx9wBnvtQXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388765"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388765"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:29 -0700
X-CSE-ConnectionGUID: EGhyQheLQnuY/G6u4j/Teg==
X-CSE-MsgGUID: p6QMt3EJS9WrqBP6XplavQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310694136"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 05/13] drm/i915/display: Add crtc state for DIP
 transmission lines
Date: Sun, 13 Sep 2026 20:26:40 +0530
Message-ID: <20260913145649.3240904-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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

The Adaptive Sync SDP is currently the only packet with a programmable
transmission line.

Make a structure struct intel_dip for Data Island Packets. Add a member to
track Adaptive-Sync SDP transmission line. Include the new member in the
pipe configuration comparison.

This will pave the way for supporting more packets' programmable
transmission lines, including the common base SDP transmission line
introduced with Xe3p_lpd.

v2:
 - Move struct intel_dip from intel_dip.h to intel_display_types.h (Jani)
 - Move PIPE_CONF_CHECK for emp_as_sdp_tl in !fastset block. (Sashiko)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com> (#v1)
---
 drivers/gpu/drm/i915/display/intel_display.c       |  1 +
 drivers/gpu/drm/i915/display/intel_display_types.h | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9151ea6c15ab..5e8f2e48e95b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5602,6 +5602,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_I(vrr.dc_balance.max_increase);
 		PIPE_CONF_CHECK_I(vrr.dc_balance.max_decrease);
 		PIPE_CONF_CHECK_I(vrr.dc_balance.vblank_target);
+		PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
 	}
 
 	if (!fastset || intel_vrr_always_use_vrr_tg(display)) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 9016be52c7ea..bcaf42cefa17 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1006,6 +1006,14 @@ struct intel_casf {
 	bool enable;
 };
 
+struct intel_dip {
+	/*
+	 * DIP Transmission line, relative to the Vtotal.
+	 * The programmed transmit line is (Vtotal - value)
+	 */
+	u16 emp_as_sdp_tl;
+};
+
 struct intel_crtc_state {
 	/*
 	 * uapi (drm) state. This is the software state shown to userspace.
@@ -1312,6 +1320,8 @@ struct intel_crtc_state {
 		struct drm_dp_as_sdp as_sdp;
 	} infoframes;
 
+	struct intel_dip dip;
+
 	u8 eld[MAX_ELD_BYTES];
 
 	/* HDMI scrambling status */
-- 
2.50.1

