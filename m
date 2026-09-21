Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B01DC982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E457910E59E;
	Mon, 21 Sep 2026 09:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+7NJZb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B5A10E5B9
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789982471; x=1821518471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NAPk5sM3WWmoWy9xJy0WzacMZS4FXJ6reGUS5Zlekvs=;
 b=b+7NJZb7s7rGPD1lgnb+d1YH9Nimd9LiGgajib2gnSyrfx3lpPDBT9KB
 7SkZMLW0sZerSI6MHPoO1sEvabkx/iSAur6oi0aNNTZVNoKGoM2d6jKQ+
 nXfR5Lj7/fYi+Xr5Nj0obSCr675Ej7NwjLGQfPhTHg7xeMC2D14Js/Jgj
 LGyNO34H0a9GxY0Wzl4uc6g8dixxtD5JxNRWvNmkBB8ZihBNspKPwfqeM
 BocgUp7sVxI4dR+QG/Cwhh80S1k9TyNWHt93fa0XMmZIuUDUTDMJSI3eF
 CfyKd9F5yBvgCyar7Ga3iOjoDMR59aV9aTAJMCs+oCOS6Kot+QHJqH5fK g==;
X-CSE-ConnectionGUID: OCF6XHtWSqKRisRt9ebg2A==
X-CSE-MsgGUID: YyaNpPaYSVCp3PXL3zf9sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90606593"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90606593"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:21:09 -0700
X-CSE-ConnectionGUID: /VLBzGRATu28vCsWsglGbw==
X-CSE-MsgGUID: MWdjZwpkQMKm2VEI8NmtyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3578347"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 21 Sep 2026 02:21:08 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v10 00/10] KUnit test for VF provisioning error handling
Date: Mon, 21 Sep 2026 14:50:59 +0530
Message-ID: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
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
  drm/xe/sriov: Add helper for VF GGTT provisioning alignment
  drm/xe/vf: Add bounds checking for queried GGTT base and size
  drm/xe/vf: Add alignment check for queried VRAM size
  drm/xe/ggtt: Add KUnit stub for xe_ggtt_shift_nodes()
  drm/xe/tests: Add KUnit tests for VF provisioning error handling

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   2 +-
 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 676 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c                    |   7 +-
 drivers/gpu/drm/xe/xe_device.h                |  10 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  25 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 113 ++-
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 drivers/gpu/drm/xe/xe_query.c                 |   2 +-
 drivers/gpu/drm/xe/xe_sriov.c                 |  11 +
 drivers/gpu/drm/xe/xe_sriov.h                 |   1 +
 drivers/gpu/drm/xe/xe_svm.c                   |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   4 +-
 16 files changed, 833 insertions(+), 35 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

-- 
2.53.0

