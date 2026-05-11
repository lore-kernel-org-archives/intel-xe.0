Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DFCCD484E
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 21:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4D810E1F0;
	Mon, 11 May 2026 21:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFNNWe73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D1E10E1F0;
 Mon, 11 May 2026 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778535688; x=1810071688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7W9KyHt0F/FY39vf1SkxzsgQgT1aNNz/w6w/H3zP+qQ=;
 b=LFNNWe73wZoJ8VO+7NxJVU1iU1/6PQmRXkXPdIvObaJDv9Tu1CjJbfbd
 DO1SvziwCmnU8UCjPfLj5NIKWgaarf25+9xEGcdh67y9ixC13ZkIDI9pn
 7BoCqaIYxblyStcRUR4SUT+g59BXdDuxh5Ku0sW3bvxBczEezOrm22b12
 yrX/VtJkqtk9Jaio09h+t8ecqRCL91kR8ql6cC3XqXlGmiqgqgqBHtns8
 gfjvCQ6dtxgij4bnLWlmjfT+XX42jWptlxsdMiZvWeJ8LfVwfmt/dXqCn
 kF/GQ1jZJy42GKJpUCHixqvjaoUNXlH/8xLIEKjGKI/fHJLhMrdlLi7vc w==;
X-CSE-ConnectionGUID: FdlzicepSLOjcwKae9ph6w==
X-CSE-MsgGUID: cMDOR5tSRdGCpAXcSILX4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79618467"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79618467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:41:27 -0700
X-CSE-ConnectionGUID: le0wSKfaRYKSttBaxaV4ew==
X-CSE-MsgGUID: 5McJSn9lQQqcbk5C2VBHSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="233097233"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:41:26 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/14] drm/{i915,xe}: BIOS FB takeover fixes
Date: Tue, 12 May 2026 00:41:08 +0300
Message-ID: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Try to fix the BIOS FB readout to actually work on xe+integrated GPUs.
It's still semi-crap due to the xe ggtt code being stupid, but at 
least it kinda works now.

I've also included some generic BIOS FB stuff that applies to both
i915 and xe, and I fixed a few minor issues in the i915 specific parts
as well.

Ville Syrjälä (14):
  drm/i915: Disable the plane if initial plane config readout failed
  drm/i915/fbdev: Extract bios_fb_ok()
  drm/i915: Throw away the BIOS fb if has the wrong depth/bpp
  drm/i915: Introduce intel_bo_fbdev_bios_fb_ok()
  drm/i915: Use drm_dbg_kms() for initial FB debugs
  drm/xe: Do the initial FB size alignment earlier
  drm/xe/ggtt: Decouple lmem/stolen physcial offset from GGTT offset
  drm/xe: Print a debug message if we have no stolen for the initial FB
  drm/xe: Abstract the initial FB PTE checks a bit
  drm/xe: Check the PTE local memory bit for initial FB in stolen
  drm/xe: s/bar2/lmembar/
  drm/xe: Use the correct stolen offset in initial FB readout
  drm/i915: Fix BIOS FB memory region name debug prints
  drm/i915: Print the phys_base in addition to the dma_addr for the BIOS
    FB

 drivers/gpu/drm/i915/display/intel_bo.c       |  5 +
 drivers/gpu/drm/i915/display/intel_bo.h       |  1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 40 ++++++--
 .../drm/i915/display/intel_initial_plane.c    |  6 +-
 drivers/gpu/drm/i915/i915_bo.c                | 13 ++-
 drivers/gpu/drm/i915/i915_bo.h                |  6 --
 drivers/gpu/drm/i915/i915_initial_plane.c     | 26 ++----
 drivers/gpu/drm/xe/display/xe_display_bo.c    | 14 ++-
 drivers/gpu/drm/xe/display/xe_display_bo.h    |  6 --
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  6 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 93 +++++++++++++------
 drivers/gpu/drm/xe/xe_bo.c                    | 56 +++++++----
 drivers/gpu/drm/xe/xe_bo.h                    |  4 +-
 drivers/gpu/drm/xe/xe_eu_stall.c              |  3 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 16 ++--
 include/drm/intel/display_parent_interface.h  |  1 +
 16 files changed, 191 insertions(+), 105 deletions(-)

-- 
2.52.0

