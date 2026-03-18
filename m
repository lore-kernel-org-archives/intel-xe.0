Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46002103E177
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 13:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC04110E200;
	Wed, 18 Mar 2026 13:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJ88bvTn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5297710E200;
 Wed, 18 Mar 2026 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773840596; x=1805376596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uGfrEnu6dOrQnVySnIuTbznop60HuuYNX7sGAYdeW9s=;
 b=CJ88bvTnw0TlM6yRIEAlwm89TB5LHz3El4Gq0LG/PF9feh7M7VWazVdY
 rK2Lw+OBb63JuA6n6RvUEAGV/zja59YVmxkSkwKXBt3WwWWIDetQouLnG
 R+fX9ut1+Fe5NspJ1TlUq50sMtAgNrui/MR/5rQiYTuIfQeu/TAZgTLjR
 EthumrjHCCstsi5DI4+rEinGEkfVuoy0mMtX66m2/ZeHknyne4RzAvIz3
 VDaH/lM+HDrSFeGVmqJqAKYWcV5M5rLbckfGhiTlR0TMSs6TpK+w+1eZp
 5BlOGv7DGezIrQDsV35JwSRCgzaR2gx0wgIBxIME78bj60Em9fVsXnMl9 A==;
X-CSE-ConnectionGUID: ZeWgfFnJRXei1nVBSJfdFg==
X-CSE-MsgGUID: BcHV7MElRJGXXgqRxtVPTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75013160"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="75013160"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 06:29:56 -0700
X-CSE-ConnectionGUID: vdhSdIxzQU63vV2PrOmBnA==
X-CSE-MsgGUID: LU5+tBs0TvqgQEfyuqzJUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="218652388"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.79])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 06:29:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/5] drm/{i915,xe}: move fbdev fb calls to parent interface
Date: Wed, 18 Mar 2026 15:29:45 +0200
Message-ID: <cover.1773840563.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  14 +--
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 118 ------------------
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h |  24 ----
 drivers/gpu/drm/i915/i915_bo.c                | 114 +++++++++++++++++
 drivers/gpu/drm/i915/i915_bo.h                |   6 +
 drivers/gpu/drm/i915/i915_initial_plane.c     |   4 +-
 drivers/gpu/drm/xe/Makefile                   |   1 -
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 116 -----------------
 drivers/gpu/drm/xe/display/xe_display_bo.c    | 116 +++++++++++++++++
 drivers/gpu/drm/xe/display/xe_display_bo.h    |   6 +
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   5 +-
 include/drm/intel/display_parent_interface.h  |   7 ++
 15 files changed, 297 insertions(+), 272 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.c
 delete mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.h
 delete mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.c

-- 
2.47.3

