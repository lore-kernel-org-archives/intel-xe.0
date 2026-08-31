Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BAFC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2648210E72D;
	Mon, 31 Aug 2026 08:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3T3y1lg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F67010E72D
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788165376; x=1819701376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fqyvJYrAyFWSD8oaVKXaj+YxB2l45fQUZlG9s+kLkn0=;
 b=g3T3y1lgMrN3GBoBXheHV0DCuJVP5rjnQ4HVE9q7k35IlgDO3kdJsLWJ
 cY66+qHar1WkGtyvl7OLWVfv0QI4GcwmfQrDhZDZULkA8KOIZ+WXq6qxC
 58vvpF0Y8hqEsBfE/99WHJeneausWd3IW9VAPAQB1peImGdAcz8V/OSLj
 1M6HL/c3m+gGm72LajptXGwW9o9tLRNx0aDNYOHFW3fU8cHiQO1ldAayo
 ltcPH8gBaJmSmDtxepYc1Gq9v36Uc7wEJ6RKHlf2aolQy35Nh5GpBAes8
 BY3/L7QDDYBEWmTf3QPsEkQ+B3dRJZzrdEFv/CMNnR8T3Tc7+NI0CyIVi A==;
X-CSE-ConnectionGUID: ETrzXy1CRwiGaCzMpT2obg==
X-CSE-MsgGUID: +bM1FVsDSjGwOPUjZ8B6uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106089685"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106089685"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:36:16 -0700
X-CSE-ConnectionGUID: JSHQVwRwRJ+BQOD018rCvA==
X-CSE-MsgGUID: PryjwSoFTvetOAOADVT12w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="293546310"
Received: from unknown (HELO ksatya-dev.iind.intel.com) ([10.190.229.72])
 by fmviesa001.fm.intel.com with ESMTP; 31 Aug 2026 01:36:14 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 00/10] KUnit test for VF provisioning error handling
Date: Mon, 31 Aug 2026 14:06:02 +0530
Message-ID: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
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
  drm/xe: use SZ_4K for default VRAM region page size
  drm/xe: Introduce helpers for xe_vram size
  drm/xe/ggtt: Avoid integer overflow when validating VF GGTT range
  drm/xe/vf: Add bounds checking for queried GGTT base and size
  drm/xe/vf: Add alignment check for queried VRAM size
  drm/xe/ggtt: Add KUNIT stub for xe_ggtt_shift_nodes()
  drm/xe/tests: Add KUnit tests for VF provisioning error handling

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   2 +-
 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 391 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c                    |   6 +-
 drivers/gpu/drm/xe/xe_device.h                |  10 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  18 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  98 ++++-
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 drivers/gpu/drm/xe/xe_query.c                 |   5 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   4 +-
 14 files changed, 520 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

-- 
2.53.0

