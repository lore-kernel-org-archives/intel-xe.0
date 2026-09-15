Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58916C982C1
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6B110E1D5;
	Tue, 15 Sep 2026 20:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zve8BI37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0103D10E163;
 Tue, 15 Sep 2026 20:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789502970; x=1821038970;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YAPiXUBth7DlDGtf4/mzgEHjxwdMoovNsdriYSmBzew=;
 b=Zve8BI37Qazsng8GlLX2+Bs5lwP7pzHsOltZCwhxsGmPILhxoJWEBDFh
 Ea2z6Pckk88d2anXGxN1pr/J3RFhIx+DK6xJUOFVuGv7rFuqFq1XyltIL
 0ReJQz0pErZBFegpeyHEUcX7JAqA+BcNOljpQ+1PNVzHOGKrWg9hbSUds
 TEer3xYb7lXuH5+cWiX85OHx6xWepDG2D8wSUbDUyQXxrJp5ErBLbc4HS
 FP5mDuFzaeLiDGqX8Mrf+FpR99EsuzUd2FW/S7ACOjx8G5FP0L3lhRqJg
 +bgPtILZmuHHUdhU0+XT3brafuVbywSEHTlpSLfIpC5NPAnxYoiZXkm6W A==;
X-CSE-ConnectionGUID: mHVgwaGTTR+GKYOc7vFQ/Q==
X-CSE-MsgGUID: MIiek9XGTWmkLueNafgEMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89014989"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89014989"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:29 -0700
X-CSE-ConnectionGUID: QSBW1tdLQGyugyRQjEEr4A==
X-CSE-MsgGUID: EOTKN8s/QHm7bRUzoPZTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272644180"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 00/10] drm/{i915,xe}: use a shared gtt_view_types.h header
Date: Tue, 15 Sep 2026 23:09:11 +0300
Message-ID: <cover.1789502902.git.jani.nikula@intel.com>
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

Move i915_gtt_view_types.h under include/drm/intel, and clean up.

Jani Nikula (10):
  drm/intel: move i915_gtt_view_types.h to include/drm/intel
  drm/intel: rename i915_gtt_view_is_*() helpers to
    intel_gtt_view_is_*()
  drm/intel: rename i915_gtt_view* struct/enum to intel_gtt_view*
  drm/intel: add intel_gtt_view_is_partial() for completeness
  drm/xe/display: use intel_gtt_view_is_*() helpers more
  drm/i915/gem: use intel_gtt_view_is_*() helpers more
  drm/i915/vma: use intel_gtt_view_is_*() helpers more
  drm/i915/selftests: use intel_gtt_view_is_*() helpers more
  drm/i915/debugfs: use the intel_gtt_view_is_*() helpers more
  drm/intel: rename I915_GTT_VIEW_* enumerations to INTEL_GTT_VIEW_*

 .../drm/i915/display/intel_display_types.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_fb.c       | 18 +++---
 drivers/gpu/drm/i915/display/intel_parent.c   |  4 +-
 drivers/gpu/drm/i915/display/intel_parent.h   |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 14 ++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           | 20 ++-----
 drivers/gpu/drm/i915/i915_gem.c               |  6 +-
 drivers/gpu/drm/i915/i915_gem.h               |  6 +-
 drivers/gpu/drm/i915/i915_vma.c               | 44 +++++---------
 drivers/gpu/drm/i915/i915_vma.h               | 12 ++--
 drivers/gpu/drm/i915/i915_vma_types.h         | 29 +++++----
 drivers/gpu/drm/i915/selftests/i915_vma.c     | 60 +++++++++----------
 .../compat-i915-headers/i915_gtt_view_types.h |  7 ---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 28 ++++-----
 include/drm/intel/display_parent_interface.h  |  8 +--
 .../drm/intel/gtt_view_types.h                | 37 +++++++-----
 19 files changed, 143 insertions(+), 170 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gtt_view_types.h
 rename drivers/gpu/drm/i915/i915_gtt_view_types.h => include/drm/intel/gtt_view_types.h (50%)

-- 
2.47.3

