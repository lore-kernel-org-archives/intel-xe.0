Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A87C79FAA
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9542110EA03;
	Tue,  8 Sep 2026 06:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3tq+jOj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA8A10E9ED;
 Tue,  8 Sep 2026 06:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849565; x=1820385565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YACImiOueloMZifuNriSqmxbAXMh5BnzauLUegbSR7s=;
 b=G3tq+jOj1EjwIj3vkBXl1h3ZS4fS8cOfWGtBybRcsNpMXQMuhIPgPXtC
 XrnLmg8ukqX7a/vL7teAp4xsq/goQHtmklEKRoC1LU0ZVr7G9qpEPEOBk
 qrNPwpmHoiIlcjaF4KKoODhoj4RP192n8qG+qiJlnEg6+SWFJM4qhL6tn
 Nbpoe5n/hAMZ2AbCvOM/18okAwuXwCVj4yAhQk1n4m2ZBW7KlZCE6vI2Y
 nTW6ofH2VVZz4WtoEf/koaV8LQlhXxp9i4UHru8IpLdFxneqdc3S69GSz
 Dhze5WaWpwxgMRq2ITbOJ+tTB1SFOh8TU5DUAOSglt/BUghKWo/iBFis4 g==;
X-CSE-ConnectionGUID: 75hq8uNMSa2Js4u5yz0qxA==
X-CSE-MsgGUID: vkTlZOECT5eooj0hkX9K9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061809"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061809"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:25 -0700
X-CSE-ConnectionGUID: /PzH38G5R7acOV/n/vgdKg==
X-CSE-MsgGUID: alMKQ7F5Q3KpotfY+F3hbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702490"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:22 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 12/12] drm/i915/display: Dump DIP Transmission lines
Date: Tue,  8 Sep 2026 11:52:23 +0530
Message-ID: <20260908062224.2897987-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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

Add DIP transmission lines to the CRTC state dump.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index ad4f362e0c09..92675a88b969 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -251,6 +251,15 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   str_enabled_disabled(pipe_config->has_panel_replay),
 			   str_enabled_disabled(pipe_config->enable_psr2_sel_fetch));
 		drm_printf(&p, "minimum hblank: %d\n", pipe_config->min_hblank);
+
+		drm_printf(&p, "DIP Transmission Lines: EMP/AS SDP: %u\n",
+			   pipe_config->dip.emp_as_sdp_tl);
+		drm_printf(&p, "DIP Transmission Lines: Common Base SDP: %u, GMP SDP: %u, PPS SDP: %u, VSC SDP: %u, VSC_EXT SDP: %u\n",
+			   pipe_config->dip.cmn_sdp_tl,
+			   pipe_config->dip.gmp_sdp_tl,
+			   pipe_config->dip.pps_sdp_tl,
+			   pipe_config->dip.vsc_sdp_tl,
+			   pipe_config->dip.vsc_ext_sdp_tl);
 	}
 
 	drm_printf(&p, "audio: %i, infoframes: %i, infoframes enabled: 0x%x\n",
-- 
2.50.1

