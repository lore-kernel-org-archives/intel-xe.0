Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4DBCC6B2A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 11:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2A110FCF8;
	Wed, 14 Oct 2026 11:59:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5310FCF5
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979144; x=1823515144;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=icxfOQ6rhyHtWVzUKsAIn7eNoA/9z8XQzsY/g8Z4VoA=;
 b=npUeuIPvYrMyFQX2ry/R5eqcCme8pFEpHuonN0jSitHSUEZnQoU0tJey
 /w9Hrvd683T2zi6CBys9jaFRV7Fty0E8S647HLyops6+sraS19RheSE/3
 moxDPIkUTzW5d/ojS0U1z/JvTVjXJpr51DsCXJ697Aec92eMLUYmNgkbT
 HJAxnRdxgCw0/LMzLw0nqjiLSxF2FR9MNEc951dd2qaI0l44h9sTcdXOI
 Yt0BnySAZloKns2YKFeD0gPEtw2ducEH884UM9KNmFIlymbdOo304Z1tb
 A60Hiby7gKJ+1cPqYHRECZM4Um+8Pkl0bwQt1n2+SoXmKZSTRLeST3B/j g==;
X-CSE-ConnectionGUID: mONNSQ3+TyqTI0eZmZ0j5g==
X-CSE-MsgGUID: 0ezEcButSt+Jk+dV4k8ltw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="609559"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="609559"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:58:56 -0700
X-CSE-ConnectionGUID: wY6ztkAWTvuaE/uZ+Xq9Uw==
X-CSE-MsgGUID: 19je/uYZTpy9tVmXDDYVmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1752127"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:58:50 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v13 00/16] drm/xe/hwmon: Update hwmon thermal mailbox
Date: Wed, 14 Oct 2026 17:27:50 +0530
Message-Id: <20261014115806.831459-1-karthik.poosa@intel.com>
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

v13:
 - Address review comments from sashiko on v12.

Karthik Poosa (16):
  drm/xe/hwmon: Fix pcode power limit handling
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
 drivers/gpu/drm/xe/xe_hwmon.c           | 595 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci.c             |   4 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   2 +
 drivers/gpu/drm/xe/xe_pcode_api.h       |   2 -
 6 files changed, 463 insertions(+), 148 deletions(-)

-- 
2.25.1

