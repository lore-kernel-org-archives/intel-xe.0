Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C54FD6DDC4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 06:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5C010E1F9;
	Mon, 18 Nov 2024 06:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nW/QPH/1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EAF10E26C;
 Mon, 18 Nov 2024 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731913080; x=1763449080;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XhSq2VyR+p3Vp8mQbTkV6O8ZZf35BOgonsNRGrchGKQ=;
 b=nW/QPH/1VERGMtjBtf3eEEiC8g6VD59wy4v1NkK3xTWEbviqu6i62miG
 Ez62xUbtzzvnZWRXvuEapf2fpo8zAQTZRWF08MzIcXXXPOo6BTNPuuUsI
 ixPxUTuWW/V9ijmmOgGqe2x3TqcpkODNM3cXzFtrFmB6F9POeJQd7Nvzo
 XDbb3OcSpFeIEIdR+WwA3bbWKFycuYLlwGMEkBF9PyMv1xK+8yHTrp2eB
 n6F1ObRA3RX+bQTVaXArzYI7yfBzxPiCrxjRd22Cg4B50WF7XOGSGtJ4r
 WWHyKGJqHVF1lHQs7rkYjiD5Bv+Eheg7j0U8p6v7kPGB8QbXHrTr1RIRO g==;
X-CSE-ConnectionGUID: V0z947QwTIaXGYf6CdDRvQ==
X-CSE-MsgGUID: 1Y1yuCbQSY2DHJ0HzCwhhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42927334"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="42927334"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 22:57:59 -0800
X-CSE-ConnectionGUID: LKOGnxHsTZ2VAd6mg3UtlA==
X-CSE-MsgGUID: s80awZiuT72VS6n2hcKHyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89542997"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 22:57:58 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t V2 0/4]  Add pci_membarrier test in xe_mmap
Date: Mon, 18 Nov 2024 12:32:07 +0530
Message-Id: <20241118070211.1474372-1-tejas.upadhyay@intel.com>
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

