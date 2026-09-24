Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9D3C98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 20:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FEB10E1F0;
	Thu, 24 Sep 2026 20:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="liDEnEtR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4DE10E1F0
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 20:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790283320; x=1821819320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LImLd9uaXjAMFCktMnKaVm0S/1F8RcN1uOffMThQQxI=;
 b=liDEnEtRT+Ch8KKmgpYVslHf7QvGq2+dAjSoCFONhcMo1HtwSYYTqUYA
 k1VrSaVtCXNQkGmlZd6p10iwANUviIwpw4ZmPUKugEk1/GE9pgZNiGH2d
 S05OXtSqr9Nx3GVM7elQUjIdHc5Wy6quW6Qdk4tLr0U7dMe4gKj7vUSe1
 8FC5GaHrDe560NL9ouGGd9wiMjLhvuQBvcXbOrRMVN7M0hZCk/i60ls1L
 lOVECShFi5dq9j7RlrdTmpDfxNePNzearbPwYhjamUDl4lZWgqgyWF9jR
 L/XbU1wwt2vWDf2u1N9xdLA0ivTdvjKNAVmVcbBkJP4UJHmJfdlZI/IPm w==;
X-CSE-ConnectionGUID: rEoGf8jHRlWvQ4fx8ovvfw==
X-CSE-MsgGUID: JqA9zF5/TjKx5W5vzjOiHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94886141"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="94886141"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:19 -0700
X-CSE-ConnectionGUID: Run5cupES76SH3bRN2c0ag==
X-CSE-MsgGUID: 1rnNu9ZCTkGceBauEopXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="273347236"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:15 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 00/13] drm/xe/hwmon: Update hwmon thermal mailbox
Date: Fri, 25 Sep 2026 02:24:16 +0530
Message-Id: <20260924205429.2846256-1-karthik.poosa@intel.com>
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

Karthik Poosa (13):
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
  drm/xe/hwmon: Update PCIE temperature sensor offset for CRI

 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   4 +
 drivers/gpu/drm/xe/xe_device_types.h    |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c           | 453 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pci.c             |   4 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   2 +
 5 files changed, 395 insertions(+), 72 deletions(-)

-- 
2.25.1

