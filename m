Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D490D49211
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 11:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EF210E4A0;
	Mon, 18 Nov 2024 11:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7QeMkVD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B8810E49D;
 Mon, 18 Nov 2024 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731929519; x=1763465519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8S5tUtCV4IjOK36g2LgkyVq3z9Vc4k3RPMvjuueOGJE=;
 b=J7QeMkVDjYP7GqvwE0/1ZeM9XVzyhJG4IvmvdyXwi6IrmvuYsPC7HjC3
 0LJJx7CQGF/My1Q0vqQaC52sy9Z73j5SDUHFw2H3v96WDI6aEad45Od5k
 eP5wYmK/UD9R0UjzX9uRtRO7vg1r404CqG+mjVT+i0TWSwSNPPmG+733t
 uFfsKoDachi5mbwc8/AtMNBYmf1yxk39p+J1b8yqSd5q9PzXZ+f2AAmlI
 61fP33oCd3DJpgmARpVvIzHdeNCe5Q3p+VkatoIfnQI2sBnSyiTnLDz0U
 eBwDHsb0qyoBvLjNh5RMSV6FOD8cOWJ0umYNe04jIlOqqpyu57gVddmGY Q==;
X-CSE-ConnectionGUID: ICWLQWRdTPuXJWzixFccBA==
X-CSE-MsgGUID: 2syjMXGARHaMnZDW+8C5BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35655436"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="35655436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:31:58 -0800
X-CSE-ConnectionGUID: GSesa82+RjqxbcczRe4sSA==
X-CSE-MsgGUID: QrwhxgIlSFGsLzlsU+180Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="93655303"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:31:56 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t V3 0/4] Add pci_membarrier test in xe_mmap
Date: Mon, 18 Nov 2024 17:06:02 +0530
Message-Id: <20241118113606.1490397-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Series adds,
1. Remove all local defines which are landed from upstream kernel
include. Keeping include in igt_gt.h as its common header for all
such defines.
2. New flag in mmap_offset ioctl to provide query
support for special offset.
3. Adds pci_membarrier subtests xe_mmap test

Note: Similar drm-uapi change made here is under review
in KMD as well

Tejas Upadhyay (4):
  lib/i915_drm_local: Remove macros added via merged kernel
  include/drm-uapi-experimental: Move i915_drm_local.h to
    drm-uapi-experimental
  include/intel_drm_local.h: Add DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
  tests/xe/mmap: add tests for pci mem barrier

 .../drm-uapi-experimental/intel_drm_local.h   | 29 ++++++
 lib/i915/gem_scheduler.c                      |  1 -
 lib/i915/i915_drm_local.h                     |  6 --
 lib/i915/intel_memory_region.h                |  1 -
 lib/igt_gt.h                                  |  2 +-
 tests/intel/xe_mmap.c                         | 95 +++++++++++++++++++
 tools/i915-perf/i915_perf_recorder.c          |  2 -
 7 files changed, 125 insertions(+), 11 deletions(-)
 create mode 100644 include/drm-uapi-experimental/intel_drm_local.h

-- 
2.34.1

