Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F0AC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 19:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7565010E1AE;
	Thu, 10 Sep 2026 19:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hi2drf54";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF90710E1AE;
 Thu, 10 Sep 2026 19:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789069362; x=1820605362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5H4nGAayLM/1jsNrxCVgMrKs0YPG9muun6oGZYiOPlM=;
 b=Hi2drf549D6ZyWZLwUtlLsPGBQC6rSCKkdMKD6ThN96rCFjQ1psiMpCy
 6F9rwWLsTz7aWkO/a0M0kzLL6l6QdR5fS84Xajv4QajbaRZHv9UnB/379
 uexM6ucPV7g4LiPRLgNHz2L4zw/EcTZFVeQF8FIj5f5DyKB0XAWjzm8RZ
 XWievotqYzDUptR/3/pCIqIfXP+fC8bF2e9m2xqomsJLAuISa9OXbQqKr
 yfiEEUc9znJhncty2tNph7NrGTca1+xwW47WNDenqEtB+kxAOWyfvitDa
 g0QKgFhBk5RlZN0FIqS6NG8j3jc7n43/FMVbG/o15+PNVJxdsY2rhPSoS Q==;
X-CSE-ConnectionGUID: iXu9a7G1SWePMiEdQRbQmw==
X-CSE-MsgGUID: NO8R7Q9fT0GT36U+dsrUOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92041690"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="92041690"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 12:42:41 -0700
X-CSE-ConnectionGUID: W5qTRzfnSpCO/o37L5Mcrg==
X-CSE-MsgGUID: 7YPMlVU2Q1e19r4fs4MpSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="276959655"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.208])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 12:42:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/4] drm/i915/display: stop using the configurable fence
 timeout, cleanups
Date: Thu, 10 Sep 2026 22:42:32 +0300
Message-ID: <cover.1789069102.git.jani.nikula@intel.com>
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

This is a combination and rebase and rehash of a number of patches from
before, and I've lost count. So no series version number...

Patch 1 is the same as [1], but it should work now that we do full wedge
on display reset.

Patches 2-4 are from [2] and [3].

Fingers crossed.


[1] https://lore.kernel.org/r/20251113155332.789554-1-jani.nikula@intel.com
[2] https://lore.kernel.org/r/cover.1787148235.git.jani.nikula@intel.com
[3] https://lore.kernel.org/r/cover.1787833879.git.jani.nikula@intel.com

Jani Nikula (4):
  drm/i915/display: stop using the configurable fence timeout
  drm/i915/display: use struct intel_atomic_state *state variable naming
  drm/i915/display: reduce indent in intel_atomic_commit_fence_wait()
  drm/i915/display: debug log about fence wait errors

 drivers/gpu/drm/i915/display/intel_display.c  | 23 +++++++++++--------
 .../drm/xe/compat-i915-headers/i915_config.h  | 16 -------------
 2 files changed, 13 insertions(+), 26 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h

-- 
2.47.3

