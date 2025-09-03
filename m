Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6D5CA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 20:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2972B10E91E;
	Wed,  3 Sep 2025 20:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYD16SmY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AC110E179;
 Wed,  3 Sep 2025 20:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756931533; x=1788467533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NrtH7XpwvM0Z81gJGAVTiPKg1Z8ixF41krnmKOMgRpk=;
 b=bYD16SmYLHkpsm0cbm7Hr7pGFgB07AO+IzHS6TQ3OylrB889Z9nNgPog
 WjUIfJfGCAAhGeLtQQiLZT2hyuWvcO572vFHja8ksq8BQoV97HVVm4FkI
 SVlPwDDKPcIXJkVmxqeRK4Dfv5Uxf/C3zqplWZnM+6fvHuONDJm2fRoV5
 m/qF/jdA+vBSrP1W9CV5yuCxGwhpgYcYSItq6PrWCCObDu6N/Z2hYc/N0
 2VTnFlx+NRYWMZlazUpJGlJ25bzHRDhiW15wyFfecE2anuWAyhprPHphw
 2sb21TdG/9BKnJDt4H9RDLkax27RZQIZXtHeceSl68l/YfdXNlRibyZD3 w==;
X-CSE-ConnectionGUID: 7QIo9/SXT7CgUBw4RN283Q==
X-CSE-MsgGUID: rX0CFCRhQsizJaYz83IkKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="46833104"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="46833104"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 13:32:13 -0700
X-CSE-ConnectionGUID: NOHl2lHwQuKRgUDDusLhYg==
X-CSE-MsgGUID: BMfKqPpTQD+v/R5BSIWAJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171582406"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.55])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 13:32:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/9] drm/{i915,xe}/fbdev: refactor
Date: Wed,  3 Sep 2025 23:31:57 +0300
Message-ID: <cover.1756931441.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Clarify which parts are i915 and xe core specific code, and which parts
are display, and what the interface between the two is.


Jani Nikula (9):
  drm/{i915,xe}/fbdev: pass struct drm_device to intel_fbdev_fb_alloc()
  drm/{i915,xe}/fbdev: add intel_fbdev_fb_pitch_align()
  drm/{i915,xe}/fbdev: deduplicate struct drm_mode_fb_cmd2 init
  drm/i915/fbdev: abstract bo creation
  drm/xe/fbdev: abstract bo creation
  drm/{i915,xe}/fbdev: add intel_fbdev_fb_bo_destroy()
  drm/{i915,xe}/fbdev: deduplicate fbdev creation
  drm/{i915,xe}/fbdev: pass struct drm_device to
    intel_fbdev_fb_fill_info()
  drm/i915/fbdev: drop dependency on display in i915 specific code

 drivers/gpu/drm/i915/display/intel_fbdev.c    | 59 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 56 ++++++-----------
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h | 14 +++--
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 60 +++++--------------
 4 files changed, 99 insertions(+), 90 deletions(-)

-- 
2.47.2

