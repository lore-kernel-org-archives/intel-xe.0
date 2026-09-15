Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EDEC88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AB910F788;
	Tue, 15 Sep 2026 17:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maI/VE+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEF510F3FA;
 Tue, 15 Sep 2026 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789491840; x=1821027840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EnMtPY5XeonmeiIHc8rX2pOaWlmxjUomXBfpoL2KFNo=;
 b=maI/VE+YoXUngbN2oUTDb+39qfdFISO34GBrP+cjA4r/MVZ0oiSH/He/
 OIFV6S2Kfao/H2NvDC71RB110QOgXTa3f7UeKVS8/YS1ebf98ZlaY6iQo
 iB8RTtIa8aYP0nytX6bJhweCqacgWCvupUv3jRqBqZ+WRBYQIyJsTESom
 LnpF8fs15e+OEE0auaFG/o3RbGOAaEECcUivU9mTQe42vfiHUR9NwS9JK
 ywige2WnPPbs+ZE7xdiCo5QAK+9SrQ33wBGVWVH2uDppNrF4H2SYMsRkw
 7/oqnll52N3eSu5OMybQdOAZTvaJrKuKt/rNX/Xusk4rfgTwSnMQhsqo0 g==;
X-CSE-ConnectionGUID: zBMIwnIATdKlvOGLf5xF/A==
X-CSE-MsgGUID: tCHMJBuuT2GKcM0IGwPh7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="371925"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="371925"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:04:00 -0700
X-CSE-ConnectionGUID: 6RqCvr5WQca/CjqPBej/cQ==
X-CSE-MsgGUID: xkunnncjSPe8V3Uc2EHTiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270443946"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:58 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v7 14/14] drm/i915/display: Dump DIP Transmission lines
Date: Tue, 15 Sep 2026 22:16:55 +0530
Message-ID: <20260915164657.3429075-15-ankit.k.nautiyal@intel.com>
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

Add DIP transmission lines to the CRTC state dump.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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

