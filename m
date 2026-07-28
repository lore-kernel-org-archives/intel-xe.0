Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B8CC54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 15:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C32210E331;
	Tue, 28 Jul 2026 15:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcaeM0Vw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA8110E2AF;
 Tue, 28 Jul 2026 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785251472; x=1816787472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e/80Y17VmjZ0oRbT2HyAtawQbaKw3SLgoI7hgQ3pDqE=;
 b=HcaeM0VwuB5UxBr88kOrqJU3LFWU9gNSSYWSjPLlz7Hulj7vyFy+cRgm
 Bqf4z+p3hzWn0mN2qvwFPUoP37nvWKjj9pgAwdnMC38VPu5MdByxRQNpa
 D0nHtc/Iu/fYEvNXelKJaz9EUa5Lu+FLIdkWHqT5laBSAqKBE59CZY1jY
 nhQzIENWRi+SBtojIBSlUVtWXZP5DRQZbTKqydEd0WGfp6pp5Qf4UCngA
 fh0bCOclePUQb1dYZMbUKWB7rpN6VHWCFNAExHCLw0ZARATlG69+U6RHj
 TscchnesFtKiED7aodA7pyip4Gt1bJwmRIuEXYRBrs11qpYblcEUl2Qge g==;
X-CSE-ConnectionGUID: GUIv8POuTWuUIBsteBLEbg==
X-CSE-MsgGUID: W/480HDSRaunLPp+afY+8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88376897"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="88376897"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:09:57 -0700
X-CSE-ConnectionGUID: vDOyO+NxS6StpaDEYwx8Hw==
X-CSE-MsgGUID: m4yUC+hBSiGajzaQ3x6EFw==
X-ExtLoop1: 1
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 08:09:55 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v7 00/10] Enable CMRR in fixed-RR VRR path
Date: Tue, 28 Jul 2026 20:29:32 +0530
Message-ID: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

The existing CMRR fractional-timing code was permanently
disabled (if (!HAS_CMRR || true)), eDP-only, and relied
on a heuristic to guess when the fractional path was needed.
This series reworks it into a generic, debugfs-driven feature,
which later will be controlled via userspace when respective
uapi will be in-palce.

Mitul Golani (10):
  drm/i915/vrr: Return from PSR2 compute config in case of CMRR enabled
  drm/i915/vrr: Restrict CMRR enable condition to VRR-TG-default
    platforms
  drm/i915/vrr: Add per-CRTC vrr/cmrr debugfs control
  drm/i915/vrr: Update AS_SDP target_rr_divider based on CMRR config
    request
  drm/i915/display: Move CMRR crtc_state members under VRR
  drm/i915/vrr: Compute CMRR fractional timings generically
  drm/i915/vrr: Latch CMRR ratio via fastset on debugfs write
  drm/i915/vrr: Program CMRR enable/disable from transcoder timings
  drm/i915/vrr: Dump CMRR state in the crtc state dump
  drm/i915/vrr: Enable cmrr

 drivers/gpu/drm/i915/display/intel_cmtg.c     |   2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  10 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |  17 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   9 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   6 +
 drivers/gpu/drm/i915/display/intel_vrr.c      | 387 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
 9 files changed, 339 insertions(+), 99 deletions(-)

-- 
2.48.1

