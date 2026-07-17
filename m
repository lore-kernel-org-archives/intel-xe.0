Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599B9C4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 15:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FA710E499;
	Fri, 17 Jul 2026 15:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7QuBvNk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6EC10E497;
 Fri, 17 Jul 2026 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784302964; x=1815838964;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+xfwONrMaBTuBF4japoIUrSG9EqyGlarE6aZXQdcwP4=;
 b=n7QuBvNkDCdIDEpDV0Ia6K+9WpLBZQ9Ndxwd0w/+2JqWXWw4lbGYt9J7
 g9cDxZwd+le19UvVzVEXQL68SY5WoiV3w2Unw1z7NBLGLay5mmsWAdjCk
 27kNjnUYK+qW2HjLq4C74QWhPwrflIlL8SWzBZ3G2AK8qVjU4i+nlVFIz
 FbJWccfdKWQaSJHYZTFwBF8knfXz/XTLAEhFhjJPe77YZp85fCU+z4qU9
 fD/u5Fq9a0rYaBmytyR5Z8b4iVCPje5Q+H7EgVzMmE1Br2NBQdl1ExHwl
 zzZpBU12monSdnI2JeBbWF/L73ABK/3HVhHi4cgE1FwNEp/zd1Uvb8zkL A==;
X-CSE-ConnectionGUID: 1sKWL7ImSeKYoxM9S0yR5g==
X-CSE-MsgGUID: z17eNgemThu2LkmvyyOuEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88652106"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88652106"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:42:43 -0700
X-CSE-ConnectionGUID: PNDv3cyVShqCqxTCYhrRvg==
X-CSE-MsgGUID: ChadIG9uSi+3bqpzyM6mgQ==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:42:41 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Further initial fb cleanups
Date: Fri, 17 Jul 2026 18:42:31 +0300
Message-ID: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Try to clean up most of the remaining mess in the initial FB
readout/pinning code. This simplifies the parent interface,
moves more display specific stuff to the display side of the
driver split, and reduces the amount of state we need to drag
across the border.

Ville Syrjälä (7):
  drm/i915: Clear plane_config->fb pointer when done
  drm/i915: Don't pass the vma to parent->initial_plane->setup()
  drm/i915: Return just the 'fb' from intel_reuse_initial_plane_obj()
  drm/i915: Simplify intel_reuse_initial_plane_fb()
  drm/i915: Move the BIOS FB intel_framebuffer_init() to the display
    code
  drm/i915: Use intel_parent_fb_pin_ggtt_pin() for BIOS FB pin
  drm/i915: s/dev_priv/i915/ in the initial fb .setup()

 .../drm/i915/display/intel_display_types.h    |  1 -
 .../drm/i915/display/intel_initial_plane.c    | 89 ++++++++++++-------
 drivers/gpu/drm/i915/i915_initial_plane.c     | 79 ++++------------
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 10 +--
 drivers/gpu/drm/xe/display/xe_fb_pin.h        | 12 ---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 76 ++--------------
 include/drm/intel/display_parent_interface.h  |  7 +-
 7 files changed, 88 insertions(+), 186 deletions(-)

-- 
2.54.0

