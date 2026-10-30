Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51AA606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CISsGfZA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC5210E234;
	Fri, 30 Oct 2026 20:34:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8D910E234;
 Fri, 30 Oct 2026 20:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793392468; x=1824928468;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4bjRXEurCx1kAE9bMStv6VWouOY3XQeF3XoccE3UgFc=;
 b=CISsGfZAJD4/mbKIxpd0tm7zCUW0o1dF4REpwtHHiom8pX+3SlmVBBH7
 39ohJ21B+Wh0NTzgk+VkM+7Ozg+25f4yaOKfwmgwXjdUPM6AkIKMNAtBM
 4ouWzQBmrsckzI1+jtwjmlL5NID3Odrk9bMAX/cJjRRfuIrU3pB6LBJqA
 wa+Vtcge6yvFWn98i5j+qySqn3sDRiIJKc0SVdvcm1vj1/5zOaGcy7XcX
 kHE5GI8iRR9GZJ2HWKEPmCH99xv4iYZQ4BZ7NWKONjaO3n7vDRNX/uwY3
 g8WAigwxo8y2WtgZ2ccRk/tjM6QOIs+WDf7fJYs2W3j7To1aGh3pB2/A9 w==;
X-CSE-ConnectionGUID: fChZlGI/SAy4NXKPSKx1WQ==
X-CSE-MsgGUID: WZ9SvGqDQyS8kkB4LyYrcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2042434"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2042434"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 13:34:27 -0700
X-CSE-ConnectionGUID: hKx/+ovsR6S8tMiIiCjewg==
X-CSE-MsgGUID: zWn9yv4YTaWKLrTpzSbv1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5500617"
Received: from astead-desk.fm.intel.com ([10.80.113.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 13:34:27 -0700
From: Alan Stead <alan.stead@intel.com>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 vivek.kasireddy@intel.com, dongwon.kim@intel.com, james.xiong@intel.com
Subject: [RFC v1 0/3] drm/i915/vrr: HDMI 2.1 VRR support
Date: Fri, 30 Oct 2026 13:32:19 -0700
Message-ID: <20261030203314.1085262-1-alan.stead@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Variable Refresh Rate is currently only enabled for DP/eDP. This series
enables it on HDMI 2.1 sinks that advertise a VRR range in the HDMI Forum
VSDB, for display version 20+.

HDMI 2.1 VRR is signalled to the sink with a Video Timing Extended
Metadata (VTEM) packet sent through the HDMI EMP registers. The VRR
timing generator programming already in the driver is reused as is. The
series adds:

 1. The EMP transmission line for HDMI: send the EMPs on the 2nd line of
    the V. Blank instead of the start of the VSYNC pulse used for the DP
    AS SDP.
 2. The VTEM packet, written when VRR is enabled and disabled.
 3. Enabling VRR (and the vrr_capable property) on HDMI, using the VRR
    range that the DRM core now parses into display_info.hdmi.vrr_cap.

The patches are ordered so that HDMI VRR stays disabled until the last
one.

Testing: related implementations have been exercised on a WCL
(display version 30) board with an HDMI 2.1 VRR monitor advertising
48-120 Hz. With VRR enabled, measured vblank intervals were
approximately 20.83 ms (48 Hz) at idle and 16.67 ms (60 Hz) during
verified atomic page flipping. Fullscreen glmark2 under GNOME Wayland
also enabled VRR, with intervals predominantly at 60 Hz and occasional
longer intervals up to 20.83 ms. VTEM enable/disable programming was
observed in the driver logs.

Alan Stead (3):
  drm/i915/dip: Send HDMI EMPs early in V. Blank when VRR is in range
  drm/i915/dip: Send the HDMI 2.1 VTEM when VRR is enabled
  drm/i915/vrr: Allow VRR on HDMI 2.1 sinks

 drivers/gpu/drm/i915/display/intel_dip.c      | 94 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dip.h      |  2 +
 drivers/gpu/drm/i915/display/intel_dip_regs.h | 17 ++++
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  8 ++
 drivers/gpu/drm/i915/display/intel_vrr.c      | 58 ++++++++++--
 5 files changed, 170 insertions(+), 9 deletions(-)

-- 
2.53.0

