Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50248C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC62510EF95;
	Wed, 12 Aug 2026 12:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Arwxyy2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D7110EF97
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786538481; x=1818074481;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G1dmYhp12xqE31SupQwaAQ4bTyFekyC/ymekZXGlz2A=;
 b=Arwxyy2HcXtjYe0r3kSjfxA540mJED935cKuB0Nov9NF6yHHKG/H03dG
 VxZUpHTum1gPYrPv+Zk1hdXZpYF7V2iG4+b5qt9CgLsK+UYVzL2OSRnVi
 sbrPhUue25QrHaJmITKYaScLgKexOdSfMs007Rju7waspxZPeNdvY3KLr
 5AoLq09P68IteupmAZ9XhHCnXst6FcG5g7S5RJyKgA+9yxZ+WSEptiA8C
 bLelgg4ZmiTHugnXfsbrG6LQcFe0xPl9zI5cs7J1kvwyPNICL4qN2bXD/
 e24MoUnehwhrZ/n0PEnlXgwC4cxEDwhG9iU22M3h4W2s3TdfqAYQk1Zs8 w==;
X-CSE-ConnectionGUID: liOACxamQDCJvEohH330IQ==
X-CSE-MsgGUID: a5lbs1FUROmkn2/RAv1xgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98238678"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98238678"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:41:20 -0700
X-CSE-ConnectionGUID: D8s44bsLT0yN1fjwBLS1Jw==
X-CSE-MsgGUID: mYjJQeWcT1m40ge/8uD0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="263674009"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 05:41:19 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v6 0/7] KUnit test for VF provisioning error handling
Date: Wed, 12 Aug 2026 18:13:12 +0530
Message-ID: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
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

Satyanarayana K V P (7):
  drm/xe/guc: Allow to replace xe_guc_mmio_send_recv() with KUNIT stub
  drm/xe/vf: Split submission config query helpers
  drm/xe/vf: Add bounds checking for queried context and doorbell counts
  drm/xe: Introduce helpers for xe_vram size
  drm/xe/vf: Add bounds checking for queried GGTT base and size
  drm/xe/vf: Add bounds checking for queried VRAM size
  drm/xe/tests: Add KUnit tests for VF provisioning error handling

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   2 +-
 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 484 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c                    |   6 +-
 drivers/gpu/drm/xe/xe_device.h                |  10 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  81 ++-
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 drivers/gpu/drm/xe/xe_query.c                 |   5 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   4 +-
 13 files changed, 585 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

-- 
2.53.0

