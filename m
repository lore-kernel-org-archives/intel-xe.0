Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAA1CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 08:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432A710E418;
	Thu, 30 Apr 2026 08:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqblducp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD96510E418;
 Thu, 30 Apr 2026 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777537738; x=1809073738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dMoiB2g7BpqhPuKukV8n7zRiRy8O6hK0EImlXaf41/Y=;
 b=bqblducp+MO4nwYyQyRgVkWFFv9Dj5Ec1YiSf0WB2os46vqLD6K+zwgI
 wyT1uK6Jj7dtFOsWZfHt5IiyMCAxBD7eYzZLOQEiEdNy2gieX7Y+lx44x
 Jpq3rDwSa2YCOLrqpOeKyZbsBJKlmVYfz7+d9u5/h3JGUnn8cuToXp5pO
 NDwwai0adM++FwxljSJHJ5qNNjltd2771xSVW/fzxBXGuC/BN/seA55LA
 MJSNXY3sldvF3u0HyxmXWB138t9A+xpC09xQmvnX9AJ5+92R91CQymdSQ
 iAMlhqzfrG8w41rMXBlurfbwC4L/DmcI5JV0W5PnFASySTcEUvsnOsgHB Q==;
X-CSE-ConnectionGUID: a1kKgkpaRlqqIAAmzVS+Kw==
X-CSE-MsgGUID: p9OuPCd6QRC6dXPSc0UVdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="88793341"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="88793341"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 01:28:57 -0700
X-CSE-ConnectionGUID: 3jRkgqmJQg2KBUeUonqyPQ==
X-CSE-MsgGUID: 1Y4YHHFNTTKeejwtdvY8+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="228015286"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 01:28:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/8] drm/i915/display: refactor display funcs
Date: Thu, 30 Apr 2026 11:28:44 +0300
Message-ID: <cover.1777537663.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

Split out the display function refactor from [1] into a separate series
for easier review and merging.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1777458161.git.jani.nikula@intel.com


Jani Nikula (8):
  drm/i915/display: move audio funcs under audio sub-struct
  drm/i915/display: move color funcs under color sub-struct
  drm/i915/display: move fdi funcs under fdi sub-struct
  drm/i915/display: move watermark funcs under wm sub-struct
  drm/i915/display: move hotplug irq funcs under hotplug sub-struct
  drm/i915/display: move dpll funcs under dpll sub-struct
  drm/i915/display: move cdclk funcs under cdclk sub-struct
  drm/i915/display: move display funcs under modeset sub-struct

 drivers/gpu/drm/i915/display/i9xx_wm.c        | 22 ++---
 drivers/gpu/drm/i915/display/intel_audio.c    | 22 ++---
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 84 +++++++++----------
 drivers/gpu/drm/i915/display/intel_color.c    | 58 ++++++-------
 drivers/gpu/drm/i915/display/intel_display.c  | 30 +++----
 .../gpu/drm/i915/display/intel_display_core.h | 57 +++++++------
 .../gpu/drm/i915/display/intel_display_irq.c  |  4 +
 drivers/gpu/drm/i915/display/intel_dpll.c     | 28 +++----
 drivers/gpu/drm/i915/display/intel_fdi.c      |  8 +-
 .../gpu/drm/i915/display/intel_hotplug_irq.c  | 30 +++----
 .../drm/i915/display/intel_initial_plane.c    |  4 +-
 .../drm/i915/display/intel_modeset_setup.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_wm.c       | 32 +++----
 drivers/gpu/drm/i915/display/skl_watermark.c  |  2 +-
 14 files changed, 191 insertions(+), 192 deletions(-)

-- 
2.47.3

