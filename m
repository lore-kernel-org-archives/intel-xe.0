Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319ECCA5FCE
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 19:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03B410E3FF;
	Thu,  1 Oct 2026 19:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2LUktgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F15510E3FF
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790884281; x=1822420281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4jb3d45D5fAySaXuyIaYX/hzZl6NUsOyNCYQlcsiSoI=;
 b=Q2LUktgnlyCo3AHqJ2ACuQuQGGwt9Kh8Vd2z5/Ddv9x0C4x4R5+C9vbF
 iw7wyJO2zDGWdWJu0PwtcLOxvWtnmenb/DekZ1N663O0cM/lp1qgs6DzA
 7iUSkWoSrsvv/rr4ytxpkPfOwtqQy920OY9qCUD8ch6/L1oPT6BoVuTQY
 GeUpj70dFYyHDeYbBx6WMOpMuvsqKUe/gCEcefnng3WY0obTmmQvzeqZ/
 EVXd7r99eG8BznksiYbxSR5PbUwY7vO3iFMC73v5D+/lzZ7CAQ3gA596i
 15u7sLZvS716iJgnarZ5Wr9g/HgmRuIAEwfz79XnDyliEChN4XMs0UJ+A g==;
X-CSE-ConnectionGUID: FgPQlMUqQVSwamEYY2te6A==
X-CSE-MsgGUID: wnDuk5+kS9eE3lndk7QJSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102177797"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="102177797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:21 -0700
X-CSE-ConnectionGUID: UlMo5q2iQO+Z4f1cVvwIsg==
X-CSE-MsgGUID: DVccRR00TPKXEvuH6W5c3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="273893709"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:18 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 00/15] drm/xe/hwmon: Update hwmon thermal mailbox
Date: Fri,  2 Oct 2026 01:20:18 +0530
Message-Id: <20261001195033.3466205-1-karthik.poosa@intel.com>
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

Karthik Poosa (15):
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
  drm/xe/hwmon: Get PCIe temperature sensor offset from xe info
  drm/xe/hwmon: Add CRI PCIe temperature sensor offset
  drm/xe/hwmon: Simplify temperature channels config

 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   4 +
 drivers/gpu/drm/xe/xe_device_types.h    |   6 +
 drivers/gpu/drm/xe/xe_hwmon.c           | 429 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci.c             |   9 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h       |   2 -
 6 files changed, 353 insertions(+), 100 deletions(-)

-- 
2.25.1

