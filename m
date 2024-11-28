Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C17D65553
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 05:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF5A10E260;
	Thu, 28 Nov 2024 05:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoxNsxRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17F110E23C;
 Thu, 28 Nov 2024 05:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732773143; x=1764309143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8DJh+cxp1U/toHtCIUswqQ2Q9IO1zAtCTDqXcRSdJlo=;
 b=aoxNsxRBSbMHv5vrFoGv2Wwtolcm3g+Sp2XArj7DGkfZGmUmdy8eSQkC
 rcYpmnnVGPKQfzcn9Kt4IQPcLZ2SQlShJ1yIOo5PVFve8gbz99qCfIsym
 4dA9KxurZZhtBKZZrvT8sSjL+365dkPmJFMXmai+4oMk0gGWf3Vb3qSN5
 GFzoeaG5w+vNdQPyludRTIkzQVF096Z46Rth3HsrF82CYpCNg4MsLdor3
 JzYgSedocgF7pxMLyxuBLs0xGoPSGtNL7RhVRoIG3ABpbZzCWOy1DVX1/
 g0Rh77fdIrGChrPSbD+D5e1qwYnaq1iyc2bEcO+OL+6Mov3Xw9A7COuqz w==;
X-CSE-ConnectionGUID: mYA9noofQUOT6gtO92UDEQ==
X-CSE-MsgGUID: aPFdp03mT025W9JLnEOeMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32366803"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="32366803"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 21:52:22 -0800
X-CSE-ConnectionGUID: D/S7s5DVTMqPLQdX/8yu2Q==
X-CSE-MsgGUID: Cyw+or8dSiSXphBiK3SQSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97201713"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 21:52:21 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t V5 0/4] Add pci_membarrier test in xe_mmap
Date: Thu, 28 Nov 2024 11:26:43 +0530
Message-Id: <20241128055647.1677371-1-tejas.upadhyay@intel.com>
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
 tests/intel/xe_mmap.c                         | 211 ++++++++++++++++++
 tools/i915-perf/i915_perf_recorder.c          |   2 -
 7 files changed, 241 insertions(+), 11 deletions(-)
 create mode 100644 include/drm-uapi-experimental/intel_drm_local.h

-- 
2.34.1

