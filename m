Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C75E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 13:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514EC10E241;
	Tue,  7 Jan 2025 13:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuNUtnNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC68410E241;
 Tue,  7 Jan 2025 13:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736258120; x=1767794120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zlg5V+yhTrAYM3PSLZVlUUeCE/x+VhLpQoK53YrrV7A=;
 b=HuNUtnNh+rpfWdp9Q43QCAZnD9G9wm2nH4dxGdYRKjrR9KTX0eieUXI0
 oQVIRhpRNgM/Epoe2jAJiUxJyIK2K+4uSZ9VRpzzQdfL6XJIr5AKWDe7z
 ef33s/KKl5AMA5T2wonMG1pyyG4XBTwV+GiEmii54IvSzLAMQlnu3iNAL
 RHHHbvvBiK8HeBLGVJj4cuKQu/BUY95JR7IGy1Acrg/axi0mBwVcH2kpd
 RNOWiZaP75CloBMHU4iQSgxYosVSvOaHwSGZKqaAo5QvDDOdjlxu4PzUp
 5n90SL607+1fDqkcL5//kqiAkbjni774zrwjrwFHtHRMXDbjjm+fl4xOq g==;
X-CSE-ConnectionGUID: TtSGAuXmR7GNOrU6MzscYA==
X-CSE-MsgGUID: GdJco3MjRa6fB8t/d2OB7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36558787"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36558787"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 05:55:20 -0800
X-CSE-ConnectionGUID: OljBVr95TRWUUdVAi8lbSQ==
X-CSE-MsgGUID: 8nx9qutZTxSiS/xi52wo0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="102678763"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 05:55:17 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Auld@freedesktop.org, Matthew <matthew.auld@intel.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V8 0/4]  Add pci_membarrier test in xe_mmap
Date: Tue,  7 Jan 2025 19:30:19 +0530
Message-Id: <20250107140023.2940684-1-tejas.upadhyay@intel.com>
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

V8:
 - Move open driver below igt_require
V7:
 - Modify parallel test to update random number every test
 - Update cross client value check
V6:
 - Modify parallel test to check only diff cross client value
V5:
 - Add pci-membarrier-parallel subtest
V4:
 - Check if pci memory barrier is supported


Tejas Upadhyay (4):
  lib/i915_drm_local: Remove macros added via merged kernel
  include/drm-uapi-experimental: Move i915_drm_local.h to
    drm-uapi-experimental
  include/intel_drm_local.h: Add DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
  tests/xe/mmap: add tests for pci mem barrier

 .../drm-uapi-experimental/intel_drm_local.h   |  29 +++
 lib/i915/gem_scheduler.c                      |   1 -
 lib/i915/i915_drm_local.h                     |   6 -
 lib/i915/intel_memory_region.h                |   1 -
 lib/igt_gt.h                                  |   2 +-
 tests/intel/xe_mmap.c                         | 172 ++++++++++++++++++
 tools/i915-perf/i915_perf_recorder.c          |   2 -
 7 files changed, 202 insertions(+), 11 deletions(-)
 create mode 100644 include/drm-uapi-experimental/intel_drm_local.h

-- 
2.34.1

