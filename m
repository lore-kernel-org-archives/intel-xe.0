Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89245CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBF010E6A6;
	Wed, 22 Oct 2025 05:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5BG5pgZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49B510E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110317; x=1792646317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vfNjtPVzoXmp+4U2EluaH2tYWEON2mxgvmYaFZ8yTRA=;
 b=R5BG5pgZThbB1aAhopiKMpzYkPPp6qoMysOQPTnv2AeNVpSH/4YnBO44
 +mDpXAzWsJ4Fz76gggrPhJQL/FPZPyD0vgUP56fYgliTcG3A41E2GwLdX
 TWqFKbjJYLO548oFn/wC88Bzo62ymQu3+jXRHauSQgDlPIhdv8o5UF6XB
 YYJrowoKr2snN7uZbPWXwbijOMhqVL08c74X9eXun6/gQgmk+J47T1dK6
 6dKkqRhQrw48SGl616SWZGU9bjDG7nVFiKE8PjGMcQX7F4FXwCnFmw9Rt
 fsvWONrpYb2IV2JZ+Nd0Jt+RFAhgA54JjTqK6lcl/RUVlux5Jb+nEoSZB Q==;
X-CSE-ConnectionGUID: BNKKxmIjTEu6sPT+uEkHww==
X-CSE-MsgGUID: Z5Gv3vesSt2aDpWJ0arEYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083970"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083970"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: jZypKsToRdq6icdrMSkdrg==
X-CSE-MsgGUID: cZBZVAE9TK+iyhwjSAlo6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959678"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Sk Anirban <sk.anirban@intel.com>,
 Soham Purkait <soham.purkait@intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 00/12] drm/xe: Add support for Crescent Island
Date: Tue, 21 Oct 2025 22:17:32 -0700
Message-ID: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251021-cri-928e5dcfde7e
X-Mailer: b4 0.15-dev-bd47d
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

Now that the support for the base IPs used by Crescent Island are in
place, add the platform and the rest of the basic enabling changes.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Ashutosh Dixit (1):
      drm/xe/oa/uapi: Expose MERT OA unit

Balasubramani Vivekanandan (2):
      drm/xe/cri: Add CRI platform definition
      topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

Lukasz Laguna (5):
      drm/xe: Add device flag to indicate standalone MERT
      drm/xe/pf: Configure LMTT in MERT
      drm/xe: Handle MERT interrupts
      drm/xe/pf: Add TLB invalidation support for MERT
      drm/xe/pf: Handle MERT catastrophic errors

Matt Roper (1):
      drm/xe/cri: Setup MOCS table

Raag Jadav (1):
      drm/xe/pm: Enable D3cold WAKE# support

Sk Anirban (1):
      drm/xe/cri: Add new performance limit reasons bits

Soham Purkait (1):
      drm/xe/cri: Add check to verify if CSC is a PCIe endpoint

 drivers/gpu/drm/xe/regs/xe_gt_regs.h       |  15 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h      |   1 +
 drivers/gpu/drm/xe/regs/xe_mert_regs.h     |  21 +++
 drivers/gpu/drm/xe/regs/xe_oa_regs.h       |   9 ++
 drivers/gpu/drm/xe/xe_device.h             |   5 +
 drivers/gpu/drm/xe/xe_device_types.h       |  12 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  19 +++
 drivers/gpu/drm/xe/xe_gt_throttle.c        | 249 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_heci_gsc.c           |  30 +++-
 drivers/gpu/drm/xe/xe_i2c.c                |  38 +++++
 drivers/gpu/drm/xe/xe_irq.c                |  26 +++
 drivers/gpu/drm/xe/xe_lmtt.c               |  12 +-
 drivers/gpu/drm/xe/xe_mocs.c               |  26 +++
 drivers/gpu/drm/xe/xe_oa.c                 |  36 ++++-
 drivers/gpu/drm/xe/xe_pci.c                |  17 ++
 drivers/gpu/drm/xe/xe_pci_types.h          |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h          |   6 +
 drivers/gpu/drm/xe/xe_platform_types.h     |   1 +
 drivers/gpu/drm/xe/xe_pm.c                 |  34 ++++
 drivers/gpu/drm/xe/xe_sriov_pf.c           |   3 +
 drivers/gpu/drm/xe/xe_uc_fw.c              |   1 +
 include/drm/intel/pciids.h                 |   4 +
 include/uapi/drm/xe_drm.h                  |   3 +
 23 files changed, 560 insertions(+), 9 deletions(-)

base-commit: fb0f56ad8a2c9953c57c3337a72ccbf9c5050687
change-id: 20251021-cri-928e5dcfde7e

Lucas De Marchi

