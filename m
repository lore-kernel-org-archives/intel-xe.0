Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90225C79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 09:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3696E10EAC6;
	Tue,  8 Sep 2026 09:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAc92Dbc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CA510EAC4;
 Tue,  8 Sep 2026 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788858583; x=1820394583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vpdsqpQ/zc4WxfQ3lyw0eCUJQwPlgYxZxWew7LrFmlw=;
 b=hAc92DbcheorcZihcJZ+gm8pFykngUByYivH687CqyC7n77+T9jZeh1K
 Ym5IwVY6W6kfYwwyG98CJoh11MtbDSekDqaxUDGzqtteqVGgEhYh2xyWR
 AOjd4k7SG11bOC4OfTGX/HjBmk43dLyU3VrPXy963lptiGc1e9fofCRJR
 2O1+UvXKGEue6LE6zVRIKcM6UbK80XacAwHuTY3AOAAkYJg3y6b6dmeg5
 IFdtv/E5eeSGjKetSU7cz+3a/msJAeEI7Bvrrd9xcuU8ucX6Hhx0/yECx
 DASpJXz72MXLh/DOmsR2A7nhTWOaIC8QHGjE84/CrGZ5Gqfl+XTz2xAuB Q==;
X-CSE-ConnectionGUID: LRGxUrsIT3ebmZYJ+lVEiQ==
X-CSE-MsgGUID: UEmhyM+FRg+KQ06142dhKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89285080"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89285080"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 02:09:43 -0700
X-CSE-ConnectionGUID: XNTnqAqWQmK76jAYudgW2w==
X-CSE-MsgGUID: YotVjCG4Sn+z08PyF5lMTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="267690307"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.144])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 02:09:40 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v4 0/2] drm/i915/display: reduce clock_gating interface
 between core and display
Date: Tue,  8 Sep 2026 11:43:01 +0300
Message-ID: <20260908090924.52117-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
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

Hi,

This is v4 of the series to reduce the clock gating interface between
the display code and core i915.  The first three patches received
Reviewed-by tags and have already been merged, so this version contains
only the two remaining patches.

Sashiko pointed out that the original patch 4/5 dropped the HSW/BDW
GT/uncore clock gating workarounds when replacing the call to
intel_clock_gating_init() on PC8+ exit.  Fix this by restoring the
display/PCH registers directly in display code and restoring the
GT/uncore workarounds through the display parent interface.

Only the former patch 4/5 has been modified.  The former patch 5/5 is
unchanged apart from rebasing.

Previous versions:
https://patchwork.freedesktop.org/series/169493/

In v2:

  * Reworked the previous version so we have only one entry point,
    instead of an _early() and a _late() function.  It turns out that
    this is not necessary because some platforms were using only
    _early() and the others were using _late() (not both);
    
  * Removed back-dependency from the display code into the core code
    by avoiding calls to intel_clock_gating_init() (Jani);

In v3:

  * Added intel_display_clock_gating.o to xe's Makefile to prevent
    linking breakage;

In v4:

  * Drop the three patches already merged.
  * Preserve HSW/BDW GT/uncore clock gating workarounds on PC8+ exit
    through the display parent interface (Sashiko).

Please review.

Cheers,
Luca.


Luca Coelho (2):
  drm/i915/display: add a way to restore only display/pch registers in
    clock_gating
  drm/i915/display: split part of intel_display_reset_finish() to a new
    function

 .../i915/display/intel_display_clock_gating.c |  7 ++++
 .../i915/display/intel_display_clock_gating.h |  1 +
 .../drm/i915/display/intel_display_power.c    |  7 +++-
 .../drm/i915/display/intel_display_reset.c    | 19 +++++++---
 .../drm/i915/display/intel_display_reset.h    |  1 +
 drivers/gpu/drm/i915/display/intel_parent.c   |  9 +++++
 drivers/gpu/drm/i915/display/intel_parent.h   |  3 ++
 drivers/gpu/drm/i915/gt/intel_reset.c         |  5 +++
 drivers/gpu/drm/i915/i915_driver.c            |  1 +
 drivers/gpu/drm/i915/intel_clock_gating.c     | 37 ++++++++++++++++---
 drivers/gpu/drm/i915/intel_clock_gating.h     |  2 +
 drivers/gpu/drm/xe/Makefile                   |  1 +
 include/drm/intel/display_parent_interface.h  |  7 ++++
 13 files changed, 86 insertions(+), 14 deletions(-)

-- 
2.53.0

