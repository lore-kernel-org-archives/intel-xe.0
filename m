Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208DCFF60F9
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 09:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ACD10E9F3;
	Tue, 31 Mar 2026 09:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eg1M4xON";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8679410E89B;
 Tue, 31 Mar 2026 09:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774950564; x=1806486564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8kJeuxgU3pZoqw8aQjktW74mP0phNNwx7K3nauID1Ew=;
 b=Eg1M4xON1IQ44oclpyssVbp+2l8lrzeuegi30t0N4n6VVR2ci7qsMT+Q
 Y+kxEZ0YZBKbDnewpzBQVInC5o17SVw0t6OgmoLEgEG2lYC4nShNvpyTp
 F+OhnDWEDh1aFQKYPKqKlVwJZxIZN4Fpmy3z8XFxn5p5XhuM/6S9/9vv0
 X4yKxW5vLy8XCFLOvVui+sWfrtAiP8zOL9Jd2EyyvQGBpYoUCjxSbAcT3
 MGvbFqW8OPgDMlL2HwJSwo/KL6+ul7Eth4OwbQOPKVXjaYpNLwjHl0ktL
 ZkarRTJ+fLjZIVDVNYjLwGprdqET7ckCDkg0tJ+4R4OdUY2PZFbx0w08t g==;
X-CSE-ConnectionGUID: Cpj3KjEfTGay9CqfLJn4OA==
X-CSE-MsgGUID: HN7tjyQoSCeTLSIj+2M3yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="101414037"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="101414037"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 02:49:24 -0700
X-CSE-ConnectionGUID: mk0ZfdaKQzq76HIz/vlLOA==
X-CSE-MsgGUID: WLvfA3GiQgydEd4LXUrQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="231252213"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 02:49:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 0/5] drm/{i915, xe}: move fbdev fb calls to parent interface
Date: Tue, 31 Mar 2026 12:49:13 +0300
Message-ID: <cover.1774950508.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Rebase of [1] on top of the AuxCCS changes, after some merges and
backmerges.


[1] https://lore.kernel.org/r/cover.1773840563.git.jani.nikula@intel.com

Jani Nikula (5):
  drm/xe/fbdev: put intel_fbdev_fb_prefer_stolen() behind
    IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION)
  drm/{i915,xe}/fbdev: drop drm device parameter from
    intel_fbdev_fb_fill_info()
  drm/{i915,xe}: move fbdev fb calls to parent interface
  drm/i915: pass struct drm_i915_private to
    i915_bo_fbdev_prefer_stolen()
  drm/xe: pass struct xe_device to xe_display_bo_fbdev_prefer_stolen()

 drivers/gpu/drm/i915/Makefile                 |   3 +-
 drivers/gpu/drm/i915/display/intel_bo.c       |  27 ++++
 drivers/gpu/drm/i915/display/intel_bo.h       |   8 ++
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  14 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 118 -----------------
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h |  24 ----
 drivers/gpu/drm/i915/i915_bo.c                | 114 +++++++++++++++++
 drivers/gpu/drm/i915/i915_bo.h                |   6 +
 drivers/gpu/drm/i915/i915_initial_plane.c     |   4 +-
 drivers/gpu/drm/xe/Makefile                   |   1 -
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 120 ------------------
 drivers/gpu/drm/xe/display/xe_display_bo.c    | 120 ++++++++++++++++++
 drivers/gpu/drm/xe/display/xe_display_bo.h    |   6 +
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   5 +-
 include/drm/intel/display_parent_interface.h  |   7 +
 15 files changed, 301 insertions(+), 276 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.c
 delete mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.h
 delete mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.c

-- 
2.47.3

