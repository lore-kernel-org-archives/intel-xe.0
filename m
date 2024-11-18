Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B4ED591A9
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 17:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490FF10E534;
	Mon, 18 Nov 2024 17:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+l5+n1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296B910E270;
 Mon, 18 Nov 2024 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731950847; x=1763486847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QnVTJuSNs6A8cbrHEW93SmfPJRzGCSxDmdQ9C3d3hKA=;
 b=b+l5+n1bWs+jlzLhaJ2K+6vrfjARFbwUZsFk1zixgSE7g+4/Uv2JZjp5
 FTObkmYRFadgjzufJ4krWAmdsYubhRDx20wYHdKmhxyG3XDb2sqLdZGoy
 kJLKqc23jFHf9KImfw61SjdShqxlu7hHs1KlJi40OR/T8woxB9ybSDOih
 HeW3UYS/6jPjzbBGLlcHBMmhkU6FqBD+hwKBGmqiu51Yp8LDEHMgYC6Hp
 VjzFuG4Xcn55rspNKzXfZPbWxhoXwiFwvgsZ8lJFOwMVlTBvo80XVL4Ek
 ar5FSdnLh9dVNr2Q1ahsxCIPa1TCTml0kVH+qWGuX/dHEeaLes7KvD/AW g==;
X-CSE-ConnectionGUID: 0ywmcpkYSVSWzlqkwZwuhg==
X-CSE-MsgGUID: 4R7Fms+KRMmPyVPUSO+h6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31857906"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31857906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 09:27:27 -0800
X-CSE-ConnectionGUID: MyTVxmUHTuatjVDWojfy0g==
X-CSE-MsgGUID: vDKSCIy4QAenLSmN5lriFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94099923"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 09:27:25 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t V4 0/4] Add pci_membarrier test in xe_mmap
Date: Mon, 18 Nov 2024 23:01:33 +0530
Message-Id: <20241118173137.1512581-1-tejas.upadhyay@intel.com>
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

V4:
 - Check if pci memory barrier is supported

Tejas Upadhyay (4):
  lib/i915_drm_local: Remove macros added via merged kernel
  include/drm-uapi-experimental: Move i915_drm_local.h to
    drm-uapi-experimental
  include/intel_drm_local.h: Add DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
  tests/xe/mmap: add tests for pci mem barrier

 .../drm-uapi-experimental/intel_drm_local.h   |  29 +++++
 lib/i915/gem_scheduler.c                      |   1 -
 lib/i915/i915_drm_local.h                     |   6 -
 lib/i915/intel_memory_region.h                |   1 -
 lib/igt_gt.h                                  |   2 +-
 tests/intel/xe_mmap.c                         | 111 ++++++++++++++++++
 tools/i915-perf/i915_perf_recorder.c          |   2 -
 7 files changed, 141 insertions(+), 11 deletions(-)
 create mode 100644 include/drm-uapi-experimental/intel_drm_local.h

-- 
2.34.1

