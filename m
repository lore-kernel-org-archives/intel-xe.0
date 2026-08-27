Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22665C61DC7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B221010E32D;
	Thu, 27 Aug 2026 12:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKUb20j5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CAB10E32D;
 Thu, 27 Aug 2026 12:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787834104; x=1819370104;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ln47hvTQDzWC67DnrB7Rh0/wZSvz6oCPARO/U94AQnE=;
 b=hKUb20j5jvNFZuiLxIDMffjnnR0RjWpEbpCQe1vwXtqjpdzcOI3DGsIv
 bMOGrqkVpyPLhjyPQIbSZOuzEQ1VDt/uqSwF4hyeXOfKLoCY4c6TiLJ7g
 b8EaHgZ7eRMzXryexV8iQ7sowu0m5KPqX1SAxlwiTw/upl0PcWwDWYCxt
 Cw2R1cLPpP4aHXXbVRZmoDSAVOxuH8wXiUnNjmLddWXnrXej6BfBOmN5q
 Wow6dVH50Q6EoUH0p5KQHaYuF8aiDD+P0hXv0d7W6F2xnMab48jER7bxh
 b57c9VsPSKr9Pv4lxXX4ynhEF9a7mrkZUm5hEkl3gP2cgDvTXdvB7vikp Q==;
X-CSE-ConnectionGUID: oP9MvexpRFqBhMGUOZM9mw==
X-CSE-MsgGUID: 0MlChszLS1CuGPT1NNZODQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98929251"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98929251"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:04 -0700
X-CSE-ConnectionGUID: dsID7Dg7RqSX9t2xMz3ofw==
X-CSE-MsgGUID: uFVP5oMGSPilhnf1+Jubqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="261734543"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.219])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH v2 0/7] drm/{i915,
 xe}/display: another stab at i915_fence_timeout() removal
Date: Thu, 27 Aug 2026 15:34:50 +0300
Message-ID: <cover.1787833879.git.jani.nikula@intel.com>
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

Here we go again, v2 of [1].

Add patches 1&2 and replace the last patch with two new ones.

Basically use fixed 10 second timeout on fence waits *only* when GPU
reset clobbers display or we're running forced display reset tests,
otherwise don't timeout, and unify both i915 and xe drivers on this.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1787148235.git.jani.nikula@intel.com


Jani Nikula (7):
  drm/i915/reset: move gpu_reset_clobbers_display platform property to
    display
  drm/i915/reset: make intel_display_reset_supported() static
  drm/i915/display: use struct intel_atomic_state *state variable naming
  drm/i915/display: reduce indent in intel_atomic_commit_fence_wait()
  drm/i915/display: debug log about fence wait timeouts and other errors
  drm/i915: only timeout on fence waits for display reset
  drm/i915/display: use fixed 10 second timeout for fence wait

 drivers/gpu/drm/i915/display/intel_display.c  | 34 +++++++++++++------
 .../drm/i915/display/intel_display_reset.c    | 10 +++++-
 .../drm/i915/display/intel_display_reset.h    |  2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |  7 ++--
 drivers/gpu/drm/i915/i915_pci.c               |  6 ----
 drivers/gpu/drm/i915/intel_device_info.h      |  1 -
 .../drm/xe/compat-i915-headers/i915_config.h  | 16 ---------
 7 files changed, 36 insertions(+), 40 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h

-- 
2.47.3

