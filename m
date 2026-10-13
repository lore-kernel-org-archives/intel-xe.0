Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A1FCC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955E310E401;
	Tue, 13 Oct 2026 18:50:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B0310E401
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917428; x=1823453428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=szLNHfrZ0ghp9NbhD1oC7qyF85QM9pAObDnYqNkt5Io=;
 b=Hp6NFMoUWRjaCUOisvV2Rk5M1x4rbgrzXxQ+faEmbWGHfuCqGURvxUuZ
 vK0/3A4Rt4/ysutAM9Bf1FvnLp1s46UNZ2f4LF89lzXzALNWypDrib0D3
 Ck/51Bf8OJLITb+iFcPS7vaSN15ga5kNoX/qbEjo/KzsBNmugP0LnICqL
 rLjMPdZ8HjL0BGXJlyVeEvwmKhbfe8a3a4JAbuDFhaGHqz/0CnbRZ5/8W
 nE/f8tj4flywl8EnIUhvdQFx+6MQQinbMJTksmr6uVfjFm4fls+Rf8R5N
 nQrqIljLPutHjAgDFhp0KvDzz4TRwViv8LNrVNrackcons8xnhVcoCAfN Q==;
X-CSE-ConnectionGUID: ebDlj67ZSq+oxACAO2Ug6w==
X-CSE-MsgGUID: fcYlOdA5QYabr2/x5pn+Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="545764"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="545764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:28 -0700
X-CSE-ConnectionGUID: XqmHkHTTRTqQ2uWs90AK2g==
X-CSE-MsgGUID: BjmGBC+RReKBGwLJ7HO/WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1596099"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:26 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v12 00/16] drm/xe/hwmon: Update hwmon thermal mailbox
Date: Wed, 14 Oct 2026 00:19:23 +0530
Message-Id: <20261013184939.694945-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
a
v9:
 - Address review comment from Rodrigo.
 - Use helper for pcie sensor offset instead of info field.

v10:
 - Address review comments from sashiko.

v11:
 - Add https://patchwork.freedesktop.org/series/175943/ part of this
   series as patch 16. (Rodrigo)
 - Resubmit to get CI results as v10 didn't have it.

v12:
 - Address review comments from sashiko.

Karthik Poosa (16):
  drm/xe/hwmon: Handle pcode read failures of
    xe_hwmon_pcode_rmw_power_limit
  drm/xe/hwmon: Decode mailbox temperature as sign-magnitude
  drm/xe/hwmon: Fix thermal sensor data handling
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
  drm/xe: Validate thermal sensor count before reads
  drm/xe/hwmon: Propagate all hardware read errors

 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   4 +
 drivers/gpu/drm/xe/xe_device_types.h    |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c           | 565 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci.c             |   4 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   2 +
 drivers/gpu/drm/xe/xe_pcode_api.h       |   2 -
 6 files changed, 442 insertions(+), 139 deletions(-)

-- 
2.25.1

