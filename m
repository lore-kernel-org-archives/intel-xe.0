Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D47C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 13:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905E910E369;
	Wed,  1 Jul 2026 13:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axwpOpiU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E6710E383;
 Wed,  1 Jul 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782913993; x=1814449993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FVTDbAhCw7j5yqY1VyNcmzbfLnmAr/sX+z8vjTC9A0o=;
 b=axwpOpiUrmnzShB7yss6ETZxLzjPfqJy+vjGPiwszXIOPnjoCiuP75eG
 ddFvXGCho4f1QUJRTHGzVi2FXlh1/vU+yH/crz/nx8bBeev+xWmPUifbB
 nhzKo0o9XLQJSlkM5oUuCVv6cTmtK4G5/4G3BUchjddiZhBmBGTVG5TA6
 Gpj/5e/bTRQGLEYLBAFTcjRZ27fgRlGPLn81QmXJ/I7ugVndhrlMJQRWQ
 A5dEuHQ/rKzzHQI5kGOTlFE4zx49tmcTLAGIBfgcH5z36kjgDNdr1ibHC
 lX4XjveM0Ag4LiqONE1o6DQHsnmJGSkrj86C5txvHTvWBwp48qYRTgY8a A==;
X-CSE-ConnectionGUID: PGEkQrsoTkGKQSXxNYkMUQ==
X-CSE-MsgGUID: xfbuXv0VRoSoUkfW7iVnAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83733869"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="83733869"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 06:53:12 -0700
X-CSE-ConnectionGUID: 7TTAG2pYTNyxacHrRjIJZw==
X-CSE-MsgGUID: sSrjJlNzQ0mo8hCtr4vB8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="249207277"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 06:53:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [RESEND v2 0/8] drm/{i915,xe}: unify runtime pm calls
Date: Wed,  1 Jul 2026 16:52:58 +0300
Message-ID: <cover.1782913901.git.jani.nikula@intel.com>
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

Resend of [1], which is v2 of [2].

[1] https://lore.kernel.org/r/cover.1782311749.git.jani.nikula@intel.com
[2] https://lore.kernel.org/r/cover.1781527161.git.jani.nikula@intel.com

Jani Nikula (8):
  drm/i915: call intel_uncore_runtime_resume() for each gt
  drm/i915: call intel_display_power_runtime_resume() on suspend error
    path
  drm/i915: move some display runtime suspend operations earlier
  drm/i915: add intel_display_driver_pm_runtime*() functions
  drm/{i915,xe}: add new
    intel_display_driver_runtime_pm_{enable,disable}()
  drm/xe/display: separate d3cold handling from
    xe_display_pm_runtime_suspend_late()
  drm/xe/display: add xe_display_pm_runtime_resume_early()
  drm/xe/display: unify runtime suspend/resume with i915 for non-d3cold

 .../drm/i915/display/intel_display_driver.c   | 71 +++++++++++++++++++
 .../drm/i915/display/intel_display_driver.h   |  8 +++
 drivers/gpu/drm/i915/i915_driver.c            | 58 ++++-----------
 drivers/gpu/drm/xe/display/xe_display.c       | 44 ++++++++----
 drivers/gpu/drm/xe/display/xe_display.h       |  1 +
 drivers/gpu/drm/xe/xe_pm.c                    |  2 +
 6 files changed, 125 insertions(+), 59 deletions(-)

-- 
2.47.3

