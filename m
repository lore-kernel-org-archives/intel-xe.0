Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6A3CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 07:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53EE1120E3;
	Thu, 15 Oct 2026 07:15:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C37D1120F5
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792048537; x=1823584537;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=elSI+4nEwq5NnmVLgweGxWJT4yzIXkyDHFzE/5kgDwI=;
 b=DZidksiePIKZYaQX2ggMy0/xQyDPJHN38oqWazWGy/5T+a+wRMFOi1QV
 EU2Jh4K8x/vIh1PDUUTYb8mRKq0nIol0w7RxNTcfFxXP7rSqedu/GkNe/
 9ZYZFv3RbfK2jncZZ+Wy1TIddNMSALwhh+Lz/FS+lLRlDk5NzFOtxMEzT
 ewJD0Ci569QLB15AulVm+hBkTKbmld4UMTIat4dioiwoQfkIYjc0P+bQw
 PcTKC1j3LPxGHnx0lKsSZ/daBjBkU3krU4CYenqS0m1X5Z8KdnXpfu/KH
 MdT37vv6g0+O44oIeBeTNYUyxC5Czh0jQDRV4rouhtY4VUYhH4cywgqAY Q==;
X-CSE-ConnectionGUID: vhMe4AdYTIaMcMjjjadqTQ==
X-CSE-MsgGUID: lGtTMbNEQyO8JnEcDQuFwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="707147"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="707147"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:15:37 -0700
X-CSE-ConnectionGUID: qpfD/0YVRga5MZJujZr1Ew==
X-CSE-MsgGUID: 5kmS9OlzQsqPEFPoJ4lKJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1508927"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:15:34 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v14 00/16] drm/xe/hwmon: Update hwmon thermal mailbox
Date: Thu, 15 Oct 2026 12:44:18 +0530
Message-Id: <20261015071434.1063785-1-karthik.poosa@intel.com>
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

v13:
 - Address review comments from sashiko on v12.

v14:
 - Move default power limits write to helper in patch 1.

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
 drivers/gpu/drm/xe/xe_hwmon.c           | 608 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci.c             |   4 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   2 +
 drivers/gpu/drm/xe/xe_pcode_api.h       |   2 -
 6 files changed, 473 insertions(+), 151 deletions(-)

-- 
2.25.1

