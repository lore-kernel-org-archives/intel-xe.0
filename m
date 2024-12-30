Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E645E77188
	for <intel-xe@archiver.kernel.org>; Mon, 30 Dec 2024 12:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3083410E4CC;
	Mon, 30 Dec 2024 12:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCsHKbNO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0612510E4CB;
 Mon, 30 Dec 2024 12:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735563177; x=1767099177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/M31RbGTDRzIeT8aAjwCdIKjpnlqRtfEA8uwwix1ga4=;
 b=oCsHKbNOSrKZfZTeLpIgE+142hLHwAKovhhAidPgCCuXCafo2sp7zzWA
 DYc/9X+STErmIIgUZwX56JC4+F9jWn/u8/Qiso9WxiLUYH0+fsL3BiB/U
 1aNd1yuVXcDeRDtNg702yWk89locpMesfa0m3icYE7k1mGu5mrZn1eGbs
 eE7IN+TXt8DwtJapwmLnxVBH/XPDQ0574uCwpWU9WKiN3S35AWbrlxUW+
 pqBOQD3+g/IGr6qibVBSUPbvr5QCedJjn3giWiZBe5o5w1fo2TKopTWow
 YkIxHuhpva/S6Ooel+pSXw+8+kuJuBTHnUwFkv9BEBOTCUXG6SHkVdVCN A==;
X-CSE-ConnectionGUID: m4GPrdiaST6UukI9mPB9cQ==
X-CSE-MsgGUID: 820qjBUeRhardbOxWTb1EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46846500"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="46846500"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 04:52:56 -0800
X-CSE-ConnectionGUID: pHjKw5zlT42PjLTd1ixrvw==
X-CSE-MsgGUID: u0BrB3dNQPWZtHczT0DrPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105780633"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 04:52:55 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Auld@freedesktop.org, Matthew <matthew.auld@intel.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V6 0/4] Add pci_membarrier test in xe_mmap
Date: Mon, 30 Dec 2024 18:27:53 +0530
Message-Id: <20241230125757.2581381-1-tejas.upadhyay@intel.com>
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
 tests/intel/xe_mmap.c                         | 190 ++++++++++++++++++
 tools/i915-perf/i915_perf_recorder.c          |   2 -
 7 files changed, 220 insertions(+), 11 deletions(-)
 create mode 100644 include/drm-uapi-experimental/intel_drm_local.h

-- 
2.34.1

