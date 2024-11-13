Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD51D462A5
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 14:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E2C10E70E;
	Wed, 13 Nov 2024 14:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcpSIneP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B751510E70A;
 Wed, 13 Nov 2024 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731506776; x=1763042776;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z3pUKaMZ6GavDPc9LBLziKD/UdHvlihey3Lok3Y7CLw=;
 b=GcpSIneP1YY6RoObzJcfH8BrEZnKCQ1Z9BOqR9h8XUCmahpzFr2MYx3y
 YfSSMfFacqwbExKvcxIc35lChlGJUv85pWqWvcwnOCPG+KMLAx2fnsWch
 CFdJUz3388o3iycAMoYOIqVnrYH515EWaZD7QDGKvJTEnAL6pUwkFGUVg
 IPJX027iXlmRwJPhGf3TCq8kHPO24zaFRODsCv4KgSkpEwfZLEc2qlKJ0
 rE0FwPONis9b+0EKF3J2XohuzaCtZQbt3yyozL1vXpDQw4/fIb6BfFKD+
 iOhxkV7/6uGbQyGHRtcms5PpCrvgD4OQTfjfWwcVGjcp8PRibDUJj8/a9 g==;
X-CSE-ConnectionGUID: pNueM/B2ThqqIjXZJUA1Pg==
X-CSE-MsgGUID: KToo4M/OTWqoiE/IaRth2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30792351"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="30792351"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:06:15 -0800
X-CSE-ConnectionGUID: UxXyJsXwRE6rw0dilsxxqw==
X-CSE-MsgGUID: iLGTSt6lQvaCVmVOChjlPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="92654131"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:06:14 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 0/4] Add pci_membarrier test in xe_mmap
Date: Wed, 13 Nov 2024 19:40:08 +0530
Message-Id: <20241113141012.1362064-1-tejas.upadhyay@intel.com>
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
include
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
 lib/i915/gem_scheduler.c                      |  2 +-
 lib/i915/i915_drm_local.h                     |  6 --
 lib/i915/intel_memory_region.h                |  2 +-
 lib/igt_gt.h                                  |  2 +-
 tests/intel/xe_mmap.c                         | 96 +++++++++++++++++++
 tools/i915-perf/i915_perf_recorder.c          |  2 +-
 7 files changed, 129 insertions(+), 10 deletions(-)
 create mode 100644 include/drm-uapi-experimental/intel_drm_local.h

-- 
2.34.1

