Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1442C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6857410E244;
	Tue, 15 Sep 2026 07:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kanTpagb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9866810E08F
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 07:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789456330; x=1820992330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gfYo81xB6JOGe3P5DFZT2jl254Rb0+f+A4E+z430kBg=;
 b=kanTpagb+kFByQJcZl3Ecrpju1k5PjtGJLvTCMFDYJIwqS/UM+xrQhkz
 Z4l3Jg0teXwQb5Hrx9xDo+Tft+36s5xrg05BQhghNhxruMFj5IMruUCCy
 qO06hCiPCPHuRnydSWwBqdlyBay54mRjXehbi2CwXkVe9GF3cg2R7Rxql
 SFIJppF6w1gBHf0EN/P8yU+zCsWmDN0Lz7zB7n64HhQtzdaN9YXRCQuTM
 MeYAQRc9rLNtPn5Jk6jUCJyxHWJAbMDElBC8GEASFpOo7xNMs2mF5dWMS
 T9YeiSOfBcBPL2ZrVgSZ3zepEqhLK3tiu0h1Uf2O5hoTKDaq+UN1GrBra Q==;
X-CSE-ConnectionGUID: gCU9EjGoTX2YghcwCdY/oQ==
X-CSE-MsgGUID: 86MBO1G+R2+B2BOlsX9iJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93511733"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93511733"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 00:12:10 -0700
X-CSE-ConnectionGUID: PAmaXsFnStCXYmpvhpaDOg==
X-CSE-MsgGUID: ljp8KemgTBmZaxMUtrq2Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1081562"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 15 Sep 2026 00:12:07 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v8 00/10] KUnit test for VF provisioning error handling
Date: Tue, 15 Sep 2026 12:41:57 +0530
Message-ID: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
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

This patchset adds infrastructure and tests to verify that a VF
properly handles malformed or invalid device configuration
responses from the PF.

A VF relies on the PF to provide valid hardware configuration through GuC
KLV responses during initialization. If the PF is misconfigured or
malfunctioning, a VF may receive zero, incomplete, or out-of-range
values for critical resources like GGTT, VRAM, Contexts or Doorbells.

Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
bad KLV responses and verify that VF can survive without crashing for
the invalid configuration data received.

While adding this kunit test, found some missing error handling in the VF
code path for invalid doorbell,  GGTT and VRAM configurations. This
patchset also adds the missing error handling to the VF code path.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Satyanarayana K V P (10):
  drm/xe/guc: Allow to replace xe_guc_mmio_send_recv() with KUNIT stub
  drm/xe/vf: Split submission config query helpers
  drm/xe/vf: Add bounds checking for queried context and doorbell counts
  drm/xe: Introduce helpers for VRAM alignment
  drm/xe/ggtt: Avoid integer overflow when validating VF GGTT range
  drm/xe/vf: Add bounds checking for queried GGTT base and size
  drm/xe/pf: Align VF GGTT allocations to PAGE_SIZE
  drm/xe/vf: Add alignment check for queried VRAM size
  drm/xe/ggtt: Add KUNIT stub for xe_ggtt_shift_nodes()
  drm/xe/tests: Add KUnit tests for VF provisioning error handling

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   2 +-
 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 393 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c                    |   6 +-
 drivers/gpu/drm/xe/xe_device.h                |  10 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  18 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 113 ++++-
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 drivers/gpu/drm/xe/xe_query.c                 |   2 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   4 +-
 14 files changed, 533 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

-- 
2.53.0

