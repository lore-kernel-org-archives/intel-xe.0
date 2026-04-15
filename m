Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D689FF428EC
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 21:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DE910E066;
	Wed, 15 Apr 2026 21:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwYi0bXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED6010E066;
 Wed, 15 Apr 2026 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776287056; x=1807823056;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ftny5u1xa/gfZFm5MFJPzgv5h1UF96HVeS7MxK3aIZI=;
 b=MwYi0bXI/kMicaZrBU6WbbD5b2TaAe068iPfr4O3tiREB68zdlqw2cBG
 77M0GkAqydPEkhChmm8RqamQUQ/Cxk+0+1r2OaduII5qmRRceA1CHsOMZ
 gFD+WVX8Ulz7eA/2hwTQq3Q/heEKUh34cB/v2l5Wn7DQlirdZzVGSow6B
 tH4C22LeYqC4teRmL+mqm7sX30igKUMYsl7oLBQxhHyt2CQ1F/Ll4sHVK
 m9G7mAATmCUnVwYVsSGIvwHK9LV/QEKDhsmUxUWf77oAvunUnMQDfBpAz
 jmf5cafCqKHLdVLYavhUEVl2gFSzX3RHmWtdSqgwOSA/KTstQHXIn0/0n g==;
X-CSE-ConnectionGUID: 6y0XdCYfQhicS6VvecgYxg==
X-CSE-MsgGUID: hbZlnKvTREeJY+Ea7KnbxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81158060"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81158060"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 14:04:16 -0700
X-CSE-ConnectionGUID: DoUaezJZScOQq0P36QbRKg==
X-CSE-MsgGUID: GTv1nKOOTSOeh02ma5huCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="225830429"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.108])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 14:04:14 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 0/7] drm/i915/reset: Expose "display_reset_count" in debugfs
Date: Thu, 16 Apr 2026 00:04:04 +0300
Message-ID: <20260415210411.24750-1-ville.syrjala@linux.intel.com>
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
v3: Deal with the stale i915->display floating around in the mock tests

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Ville Syrjälä (7):
  drm/i915: Clear i915->display when no longer valid
  drm/xe: Clear xe->display when no longer valid
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
 drivers/gpu/drm/i915/i915_driver.c            |  1 +
 drivers/gpu/drm/i915/i915_drv.h               |  2 +
 drivers/gpu/drm/i915/i915_fb_pin.c            |  9 ++---
 drivers/gpu/drm/i915/i915_overlay.c           |  6 +++
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 +
 drivers/gpu/drm/xe/Makefile                   |  1 +
 .../compat-i915-headers/intel_clock_gating.h  | 10 ++++-
 drivers/gpu/drm/xe/display/xe_display.c       | 13 +++---
 16 files changed, 86 insertions(+), 64 deletions(-)

-- 
2.52.0

