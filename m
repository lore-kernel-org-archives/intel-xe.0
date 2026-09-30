Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594EFCA5FCD
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 15:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEC610F470;
	Wed, 30 Sep 2026 15:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYYX+LaI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C4110F46C;
 Wed, 30 Sep 2026 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790780423; x=1822316423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wrdV/ew3ezoz7NW1bC/ZlsIjGeJV2HNeHUm57oqE/7U=;
 b=AYYX+LaId38mzH3agjEnlWuoG5gjKavnn1fH5vmv20A2fJKaNWkKzwrR
 wAao9RtqkD/S/DVeleonO74fFoyXQ1bLHs2SDSEa1ISKVdARbxyHYZPyA
 PpDwmbnHxeni2Q793s4X8yYlfudHL3mOL9x3ZU/pts7mOWfG/3iRH/a71
 DDw5wo9ajmHTStRfT0d6E3ANXWQIbTnDimaeLnQ0esowG1vv7BYF8sILM
 9AFtngxo0HpLuR4fTMVgbHxTyxAF1K77YU8fvb3fJOvSLO/LTZFyReMLT
 MZk0soKf1Rv0T8ixWAUTWzWi+Et5c1ZPBbfOtb6u3nYCKz52CRbLK7PAH w==;
X-CSE-ConnectionGUID: odc+91t6Qw2Ubwqq4wNJig==
X-CSE-MsgGUID: eDV1PeBmTieuxQsbsRlv4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="79086754"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="79086754"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:12 -0700
X-CSE-ConnectionGUID: kc4j6UDLQu2MJ31pnejLsg==
X-CSE-MsgGUID: eDh2SGNBQO+/VYB3qwpa/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="279505688"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [CI v2 00/10] drm/{i915,xe}: use a shared gtt_view_types.h header
Date: Wed, 30 Sep 2026 17:59:56 +0300
Message-ID: <cover.1790780340.git.jani.nikula@intel.com>
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

Move i915_gtt_view_types.h under include/drm/intel, and clean up.

v2 of [1]

[1] https://lore.kernel.org/r/cover.1789502902.git.jani.nikula@intel.com


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
 drivers/gpu/drm/i915/display/intel_fb.c       | 18 ++---
 drivers/gpu/drm/i915/display/intel_parent.c   |  4 +-
 drivers/gpu/drm/i915/display/intel_parent.h   |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 14 ++--
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           | 20 ++---
 drivers/gpu/drm/i915/i915_gem.c               |  6 +-
 drivers/gpu/drm/i915/i915_gem.h               |  6 +-
 drivers/gpu/drm/i915/i915_gtt_view_types.h    | 74 -----------------
 drivers/gpu/drm/i915/i915_vma.c               | 44 ++++-------
 drivers/gpu/drm/i915/i915_vma.h               | 12 +--
 drivers/gpu/drm/i915/i915_vma_types.h         | 29 ++++---
 drivers/gpu/drm/i915/selftests/i915_vma.c     | 60 +++++++-------
 .../compat-i915-headers/i915_gtt_view_types.h |  7 --
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 28 +++----
 include/drm/intel/display_parent_interface.h  |  8 +-
 include/drm/intel/gtt_view_types.h            | 79 +++++++++++++++++++
 20 files changed, 201 insertions(+), 228 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/i915_gtt_view_types.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gtt_view_types.h
 create mode 100644 include/drm/intel/gtt_view_types.h

-- 
2.47.3

