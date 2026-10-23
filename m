Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C825B606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LzHXkPn2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8101810E61D;
	Fri, 23 Oct 2026 16:58:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A703710E083;
 Fri, 23 Oct 2026 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774688; x=1824310688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SOmd1GQiVKA9t+MfwjDQZVwH/H7lRhx9T5q1/aliX8A=;
 b=LzHXkPn2PfCVtFEnGwP/92o788INEkhVl5EQ0euYtL8AcYE0VA7dK6xi
 XNYKwbNdUWAnC/h/MMIFk5maYEI+W019HtuGO1JGSPA63746WOARFMfK/
 Xy2RqsPmPTmu7AsRmWu/+y6u+0Aqs5suF8izZS+M+FH7dGETdQeMBsFJD
 N7ipAO8HkykyH7x2xzyXfzXZegh+b/HWX3OHoSM2i3TnXuvnXdp1GTfQm
 6B2xiTdfZ85ddx1EZeLdG0GQKa4tQvrg+xaZ1iptoEGgbWHzvgi+JFw5Q
 kJ/LPHBxyS//9gsaIN8T5nTitmH3eEbaNZKxk0qdWzWHVF2WXoYvOObKB Q==;
X-CSE-ConnectionGUID: 5Uy218hQRiiaOnasYgJ8xg==
X-CSE-MsgGUID: AlYQ1DuNQiegBBkV+1xyIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1435216"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1435216"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:08 -0700
X-CSE-ConnectionGUID: g5rhvKxrRTC39ONyc8Y9jg==
X-CSE-MsgGUID: 2EnAIkCtTg+AVXTLdapCEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3570262"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/13] drm/i915/vrr: Fixes and cleanups
Date: Fri, 23 Oct 2026 19:57:50 +0300
Message-ID: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I wanted to know the safe window limits, didn't find them
in the state dumo, started to add them, and then I noticed
a buich of stuff in the VRR code that needed fixes/cleanups.
And here we are.

Ville Syrjälä (13):
  drm/i915/vrr: Fix intel_vrr_dcb_vmin_vblank_start()
  drm/i915/vrr: Drop bogus intel_vrr_hw_value() call
  drm/i915/vrr: s/intel_vrr_vblank_start()/vrr_vblank_start()/
  drm/i915/vrr: Reuse vrr_vblank_start() in more places
  drm/i915/vrr: Add a local 'adjusted_mode' variable to
    intel_vrr_get_config()
  drm/i915/vrr: Use the local 'adjusted_mode' intel_vrr_compute_config()
  drm/i915/vrr: Annotate live functions
  drm/i915/vrr: Shuffle code around
  drm/i915/vrr: Extract vrr_safe_window_end()
  drm/i915/vrr: Extract intel_vrr_vmin_vblank_start_live()
  drm/i915/vrr: Introduce intel_vrr_vblank_start_live() and use it for
    MMIO vblank evasion
  drm/i915/vrr: Include VRR safe window in state dump
  drm/i915: Add more vertical timing diagrams

 .../drm/i915/display/intel_crtc_state_dump.c  |   3 +
 drivers/gpu/drm/i915/display/intel_dsb.c      |  10 +-
 drivers/gpu/drm/i915/display/intel_vblank.c   |  80 +++++----
 drivers/gpu/drm/i915/display/intel_vrr.c      | 163 ++++++++++++------
 drivers/gpu/drm/i915/display/intel_vrr.h      |  11 +-
 5 files changed, 175 insertions(+), 92 deletions(-)

-- 
2.55.0

