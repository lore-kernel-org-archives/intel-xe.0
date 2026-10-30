Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3169E606A326
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jovov1T5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E43112939;
	Fri, 30 Oct 2026 17:13:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B7B112939;
 Fri, 30 Oct 2026 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380412; x=1824916412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xzseLuViJguH/kuXBX8A8rj+ajzTRnzAFTw28dI9s2M=;
 b=Jovov1T5DonxO4WyTV/GgM8l5z2NyNy89GpN6/yEc+dhr6LWko9uz6nI
 Nqa2P5jk+74uGvaqwNZZu2hDTf1K6QimvatKN/7GRpEwPkfdFtUcECev/
 mDbuLlNjNW89FNVqRe+g2dKom828jm80LZgd/d7dSiROyuOj1g7V4e2qd
 ijAeTNhCTG7TiBqfKIw9hMk0bK4KluiBLLR636uxH9dypvsr6vgasnmaR
 es1ipZw0z/f8N3A75aq38Al7Avyw5zaIt+PK20iNSzr3c/1w/TDm+CBjx
 PToE5SALjjI6+eFN8RWz0XhJa9lbw0RrmnXZNZhthrRriHLWm/mmkcgIv Q==;
X-CSE-ConnectionGUID: 0PWXCjjES7qFUcT2G0z6aA==
X-CSE-MsgGUID: h9AOUI9TSSKQsmQjO5gFKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2174304"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2174304"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:32 -0700
X-CSE-ConnectionGUID: lpoFqzUXSuOMUlcIu0q7bg==
X-CSE-MsgGUID: qy2SJULqTue0KQgKTN8aRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7311362"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:30 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/10] drm/i915: Enable vblanks after the timing generator has
 started
Date: Fri, 30 Oct 2026 19:13:16 +0200
Message-ID: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently we may enable the vblank machinery before the
timing generator has actually started, which means the
frame/scanline counters read out during the vblank enabling
may be complete nonsense. When the timing generator finally
starts running and we get the first vblank interrupt the
sampled counters may jump erratically, which could cause
the vblank code to get confused as to how many frames have
actually elapsed.

The series fixes the problem for HSW+ by making sure the
timing generator is actually ticking before we enable
the vblank machinery. I also plan to fix the pre-HSW
platforms but I'll need to do a bit more reverse
engineering to figure out the final details.

While doing this I also ended up fixing some related
FEC issues with port sync, and finally enable joiner+port
sync because we no longer have any need to keep the two
apart from each other.

Ville Syrjälä (10):
  drm/i915: Disable port sync if VRR is enabled
  drm/i915: Do intel_crtc_vblank_on() later on HSW+
  drm/i915: Handle joined pipes inside intel_crtc_vblank_{on,off}()
  Revert "drm/i915/display: Avoid stale PIPE_SCANLINE values after
    crtc_enable"
  drm/i915: Fix intel_crtc_vblank_on() with port sync
  drm/i915: Wait for timing generator to start in intel_crtc_vblank_on()
    on HSW+
  drm/i915: Reduce the sleep inside pipe_scanline_is_moving()
  drm/i915: Document timing generator start/stop behaviour on HSW+
  drm/i915: Fix FEC wait with port sync on pre-LNL
  drm/i915: Allow joiner with port sync

 drivers/gpu/drm/i915/display/icl_dsi.c        |   4 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |   6 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |  45 ++++++-
 drivers/gpu/drm/i915/display/intel_crtc.h     |   8 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 120 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_display.c  |  12 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  17 +--
 .../drm/i915/display/intel_modeset_setup.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c   |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   4 +-
 10 files changed, 166 insertions(+), 54 deletions(-)

-- 
2.55.0

