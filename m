Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E79C36008
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 16:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF8F10E171;
	Mon, 24 Mar 2025 16:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHx6xM+u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4EC10E171
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742835322; x=1774371322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CnOFFowdvIpbnQHAMDcr7JXPxSDh2/4SXCnTnujInuA=;
 b=SHx6xM+uwAuAQ1qsgTSSmjf1WXZBWffCtHmu56cY5Pl8/S9IPGGQkkLd
 Y5VLcsJUYQrCK5gBxOOC/qkwwb5pS3+s6lkgacdHDTuMNEiTnX7Ag4fcx
 GHbgV4E3R+hiC+Hj8/POS5Vf5irPhF3atPoAsDll7r/e+arHCwwuceia/
 kKLkpe6zpbRoUJupEwGjAQU+vwS2Mh7dq8f891SRyA7Uff5ksgh00pQiz
 vmaWXKN+E3dopqM+kLp7jEji7RgWoRVuqlyBztA95PWQMNrq+sqcRFSYs
 Co72JIuM98i0ji9XV754D2zdfkOT/kIcdM64rUGRn3qYkCjsrQffsn3yL w==;
X-CSE-ConnectionGUID: 8+RMgo0+QgetNmWo9XCK+A==
X-CSE-MsgGUID: kCySTSlGTX6PDxeSsGdpfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54257235"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="54257235"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:55:21 -0700
X-CSE-ConnectionGUID: hSiDVmLsR1ObkVbSuJRusg==
X-CSE-MsgGUID: mHCGQyeESoCXeQwdmgc3RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="123911953"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.77])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:55:19 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 0/5] drm/xe: xe-only patches from the multi-device GPUSVM
 series 
Date: Mon, 24 Mar 2025 17:54:55 +0100
Message-ID: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

A collection of misc patches that are prerequisites for the multi-device GPUSVM
series but that are xe-only and can be merged separately.

Patch 1
- Improved conditional compilation for the Xe GPUSVM support
Patch 2
- Fix a pontential UAF
Patch 3
- Adds a bo remove callback. In addition to GPUSVM this will improve
  on our device unbind support.
Patch 4
- A small fix for multi-gpu-svm support
Patch 5
- A change in implicit UAPI and needed for multi-gpu-svm support.

v2:
- Address review comments for Patch 3 (Matthew Auld)
- Fix system memory atomic access in Patch 5 (Intel CI)
v3:
- Fix compilation errors on i386 with Patch 1.
- Don't introduce an additional pinned.external_evicted list
  in Patch 3 (Matthew Auld)
- Avoid the UAPI change in Patch 5.

Thomas Hellström (5):
  drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
  drm/xe/svm: Fix a potential bo UAF
  drm/xe/bo: Add a bo remove callback
  drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable
    devices
  drm/xe: Make the PT code handle placement per PTE rather than per vma
    / range

 drivers/gpu/drm/xe/Kconfig           |  16 +++-
 drivers/gpu/drm/xe/Makefile          |   2 +-
 drivers/gpu/drm/xe/xe_bo.c           |  66 +++++++++++---
 drivers/gpu/drm/xe/xe_bo.h           |   2 +
 drivers/gpu/drm/xe/xe_bo_evict.c     |  59 ++++++++++++-
 drivers/gpu/drm/xe/xe_bo_evict.h     |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   5 +-
 drivers/gpu/drm/xe/xe_device_types.h |  10 ++-
 drivers/gpu/drm/xe/xe_migrate.c      |   8 +-
 drivers/gpu/drm/xe/xe_pt.c           | 126 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_query.c        |   2 +-
 drivers/gpu/drm/xe/xe_svm.c          |  22 ++++-
 drivers/gpu/drm/xe/xe_svm.h          |  73 +++++++++++-----
 drivers/gpu/drm/xe/xe_vm.c           |   2 +-
 14 files changed, 287 insertions(+), 107 deletions(-)

-- 
2.48.1

