Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E0AF9D0D1
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 14:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4978C10E0D2;
	Tue, 14 Apr 2026 14:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goGALJ2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B1910E0D2;
 Tue, 14 Apr 2026 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776176574; x=1807712574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IH/IM8tK12iPixpPTHHin+/XFpRF4vvcuRrvrsDl1FU=;
 b=goGALJ2dCSBgxmc3+NrJ5z7uTdM8ZRC+MmO/eNhpLaa9fWKoBNvL30pI
 8eeBw4T3RKsao56n3sniVk4+dK0QSGskqTBuxPgKgn2krF7w9ZPhZfov5
 5+2OwkMxXAaaH8I/zCA6k/z23mr5N492uoN886OgI0jtRBGn2JqnmZgx6
 AJAHPgvoVFdtacJWcvtlk1S6nh0cVFC07WyYyn/8JGPQjpCnvg1eKknLf
 bg3YtP3v7z56yVgQUjWXFx8E185OfUN28iAXPB+R2RF41Q3k7Q55cOzk7
 sRo8oYY3JAWr6Wiz89Vz2USc8JEMG1yr6QpgPV5JP+ceQf5tWJpAqDMsR w==;
X-CSE-ConnectionGUID: fIC28HM7S0GoJDuLfacrcQ==
X-CSE-MsgGUID: GEwYsyrOQeqtjzNIeTy/RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77039050"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77039050"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:22:53 -0700
X-CSE-ConnectionGUID: i6u05A2MTjCd+jPEQTpP0w==
X-CSE-MsgGUID: 76okmPKhQ3y8JofbcdpKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229973519"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:22:51 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 0/5] drm/i915/reset: Expose "display_reset_count" in debugfs
Date: Tue, 14 Apr 2026 17:22:42 +0300
Message-ID: <20260414142247.651-1-ville.syrjala@linux.intel.com>
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

Expose a display reset count in debugfs. It will be used
by kms_busy/*-with-reset tests to confirm they are actually
testing the thing they are meant to test.

This should now pass on all platforms, after the last patch
prevents the per-engine reset shortcut when using execlist
submission.

v2: Deal with the execlist per-engine reset issue

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Test-with: 20260413084545.2491-1-ville.syrjala@linux.intel.com

Ville Syrjälä (5):
  drm/i915/reset: Reorganize display reset code
  drm/i915/reset: Move pending_fb_pin handling to i915
  drm/xe/display: Add init_clock_gating.h stubs
  drm/i915/reset: Add "display_reset_count" debugfs file
  drm/i915/reset: Disable execlist per-engine reset for display reset
    tests

 .../gpu/drm/i915/display/intel_display_core.h |  5 ++-
 .../drm/i915/display/intel_display_debugfs.c  |  2 +
 .../drm/i915/display/intel_display_power.c    |  2 -
 .../drm/i915/display/intel_display_reset.c    | 40 +++++++++----------
 .../drm/i915/display/intel_display_reset.h    |  8 ++--
 drivers/gpu/drm/i915/display/intel_overlay.c  | 10 +----
 drivers/gpu/drm/i915/gt/intel_reset.c         | 35 +++++++++-------
 drivers/gpu/drm/i915/i915_dpt.c               |  5 +--
 drivers/gpu/drm/i915/i915_drv.h               |  2 +
 drivers/gpu/drm/i915/i915_fb_pin.c            |  9 ++---
 drivers/gpu/drm/i915/i915_overlay.c           |  6 +++
 drivers/gpu/drm/xe/Makefile                   |  1 +
 .../compat-i915-headers/intel_clock_gating.h  | 10 ++++-
 13 files changed, 77 insertions(+), 58 deletions(-)

-- 
2.52.0

