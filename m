Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D30CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5D610E038;
	Fri,  9 Oct 2026 12:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMEHcHqA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A018B10E038
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791547463; x=1823083463;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g2Y54lwZ029/YQVJ2oGO/oaVeraPb7zWWhZ/Kba8CAQ=;
 b=LMEHcHqATRA6/m2LyEHOyOJJv0wrBfTunumntWAdoyi0iQmKxv1iRLsq
 oUrV+4BnzcprED7Hl24sTvkX7EMzNJtD6PJ+jueblQT+GqlNeRUkdUuU2
 ooTeVe7Xa4HPjFP72whuakUz8szF9lkBKTVnvuFEE3dQahTPMn6NaAcEP
 mJOD/Cb72Qgebq4n/rZWxdtwShY9XcbADfjYCto9GyDMyk49EclW/woGv
 FEcTQyi/CS9J+NQ3Sq5cdtX5WBV/p0Vb1GETImCGc9bsL5raVCWns4zJp
 AiXNfHaXns1iWAjHpNN5oRQrexPrxrgbA3wKFY66PPdGai8bhlDw8Jf9R A==;
X-CSE-ConnectionGUID: SqubrKpJRtCarSYD2NNh+A==
X-CSE-MsgGUID: Np/wa8koRZqpt5tz/XPx2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="372019"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="372019"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:04:22 -0700
X-CSE-ConnectionGUID: 6sVXHGCASgGhX1zdXpjmfg==
X-CSE-MsgGUID: IpT032R+SNucAV8h9EKa9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="311837"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:04:19 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v9 00/14] drm/xe/hwmon: Update hwmon thermal mailbox
Date: Fri,  9 Oct 2026 17:33:21 +0530
Message-Id: <20261009120335.52973-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series adds CRI-specific temperature sensor handling to the Xe
hwmon implementation and fixes couple of hwmon issues.

CRI platforms may report unavailable temperature sensors and support
a variable number of VRAM temperature channels depending on platform
configuration. This series adds the required sensor presence checks and
uses platform-reported thermal configuration data to expose only valid
temperature-related hwmon attributes.

The series also corrects the telemetry group selection used for memory
controller temperature reporting.

v2:
 - Address review comments from Sashiko, Badal and Raag.
 - Enable IEEE 754 temperature decoding for MMIO temperature registers.
  - Split sensor validity check into mailbox vs MMIO handling; add
    is_temp_available() / is_temp_is_visible().
 - Temporarily disable memory controller and PCIe temperatures on CRI.

v3:
  - Detect unavailable temperature sensors: rephrase a debug log.
  - Decode mailbox temperatures as 8-bit sign-magnitude values instead of
    s8.
  - Use VRAM temperature sensor count from thermal config on CRI: address
    review comments from sashiko-bot@kernel.org and Rodrigo.
  - Decode CRI temperature registers as IEEE-754: reject temperatures that
    overflow long on 32-bit systems.

v4:
  - Address review comments and issues report from Rodrigo and
    sashiko-bot@kernel.org.
  - Decode mailbox temperatures as 8-bit sign-magnitude values.
  - Cache sensor availability during registration.
  - Enable memory controller and pcie sensors for CRI.
  - Derive the VRAM channel count from the CRI MSU enable mask.
  - Use CRI-specific package and VRAM temperature registers.
  - Handle the CRI memory controller and pcie sensor offsets as per CRI.

v5:
 - Remove the unintended IGT prefix from the patch titles.

v6:
 - Address issues reported by sashiko-bot@kernel.org.
 - Add VRAM individual channel CRI_VRAM_TEMPERATURE_N register for CRI.

v7:
 - Address review comments from Rodrigo.
    - Use ret instead of count in patch 1.
    - Return true for platforms without temperature sentinels support.
    - Rename has_mbx_temp_sentinel to has_temp_sentinel.
    - Add a info flag for pcie sensor offset.
    - Simplify temperature channels config.

v8:
 - Address review comment from Sashiko.
 - Revert the unconditional validation of temperature readings on
   non-sentinel platforms.
   This avoids creating spurious VRAM temperature channels when the
   corresponding sensors are unavailable.

v9:
 - Address review comment from Rodrigo.
 - Use helper for pcie sensor offset instead of info field.

Karthik Poosa (14):
  drm/xe/hwmon: Handle pcode read failures of
    xe_hwmon_pcode_rmw_power_limit
  drm/xe/hwmon: Decode mailbox temperature as sign-magnitude
  drm/xe/hwmon: Fix memory controller thermal data handling
  drm/xe/hwmon: Add helpers to validate thermal sensor readings
  drm/xe/hwmon: Handle unavailable memory controller sensors
  drm/xe/hwmon: Detect unavailable PCIe thermal sensors
  drm/xe/hwmon: Consolidate temperature sensor availability checks
  drm/xe/hwmon: Cache temperature availability to reduce probe time
  drm/xe/hwmon: use CRI-specific package and VRAM temperature registers
  drm/xe/hwmon: Add platform-aware VRAM thermal channel support
  drm/xe/hwmon: Decode CRI temperature registers as IEEE-754
  drm/xe/hwmon: Update memory controller temperature offset for CRI
  drm/xe/hwmon: add PCIe temperature support for CRI
  drm/xe/hwmon: Simplify temperature channels config

 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   4 +
 drivers/gpu/drm/xe/xe_device_types.h    |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c           | 450 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci.c             |   4 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   2 +
 drivers/gpu/drm/xe/xe_pcode_api.h       |   2 -
 6 files changed, 366 insertions(+), 100 deletions(-)

-- 
2.25.1

