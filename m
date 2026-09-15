Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45809C88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CDC10F21F;
	Tue, 15 Sep 2026 17:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRJoaTFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A22310F11D;
 Tue, 15 Sep 2026 17:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789491820; x=1821027820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oZQKWhgW4FS1YESQI4Sb7xUNtGAxUmAby1VzZHk8PUk=;
 b=mRJoaTFNTPj7Ye+SyFRqt+GYsTI98/PtPm1ciAGKAzeYLF2O5PfP9OcT
 JctjmwqTHtJwNQGG5QvVvbN/osItp1o09NY8SUXAwhcZ2u+Rxy9r1nhak
 FZ2A36TCTHmkKZoUghblAbKQFKA8mqeiY7It0/I4pbERDyLIQnPgmYgFs
 /1IH2/KSAtfDPSrqOSPk5jEC6GDUOUe8HNamZLfJurj4fX0n3S4RK3u3z
 fIT2Dp6lg1yycRASVQoBzmU4y3i5vw20Lac09HBpJd4u5zaK7YGSj00+y
 bLb2rGQXVordJPX8g0KxN9YUhl7/yqQqlfiaBpIdePDZ/6nyRe+nimJaP A==;
X-CSE-ConnectionGUID: jPuYDY6zT4aYjbPGOvgX2g==
X-CSE-MsgGUID: RTl1zDHaT56W6nhRdt0UNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="371876"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="371876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:40 -0700
X-CSE-ConnectionGUID: IXjgWE8lR5uiGQut4Kpl7g==
X-CSE-MsgGUID: 6eg9xnqlQlWyUsyMBy4V8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270443895"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:38 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v7 05/14] drm/i915/display: Add crtc state for DIP
 transmission lines
Date: Tue, 15 Sep 2026 22:16:46 +0530
Message-ID: <20260915164657.3429075-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
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
index a5f18ac8a7d0..334179685ea2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1007,6 +1007,14 @@ struct intel_casf {
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
@@ -1315,6 +1323,8 @@ struct intel_crtc_state {
 		struct drm_dp_as_sdp as_sdp;
 	} infoframes;
 
+	struct intel_dip dip;
+
 	u8 eld[MAX_ELD_BYTES];
 
 	/* HDMI scrambling status */
-- 
2.50.1

