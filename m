Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5F4C79FBF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120EA10E1FA;
	Thu, 10 Sep 2026 18:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1knPNGE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897C410E1FA
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 18:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789064926; x=1820600926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=07LDAsrIhGz7P48bCOo6cVMtfK83jXWBTFfVTnc98kQ=;
 b=K1knPNGEXi/JP3Dc8z+VJOhCp69cUqQKRXtzgatwjgI3xE8/jVA77W5T
 UXnMofo835GNCpy9WL13LgyrF4lVwZCZ6iPeD6cYRiDDDUja2B/+J1Ybl
 8T7+5wNB3u+FBlV/MaL0yW+9P4vdAXTxVJswaop0DwEWrQxgeh4qkJBbl
 WYYz5YB77hvN98den2xQIDgB/wNEwaUnR4I0auRyngDGXtx6O7AvvQep7
 PEoMeSsVhxjS8m9OV5cm4VcD/VZvnNTnLS3a37Wo/E/i6jPWGYtYHhgDv
 j2Fgt7BJgUDhF+3NeHq+uaHwn7QF4CcfxDvwXkvhbbuPGeZOS9An+u06n Q==;
X-CSE-ConnectionGUID: TtG8SzqvS+6YnEbA4Aa0Pw==
X-CSE-MsgGUID: jSJuFyCoRDKgXT8aSGNbeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89397569"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89397569"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:46 -0700
X-CSE-ConnectionGUID: d1TjL0J8Qa6UF2yKN9dUrg==
X-CSE-MsgGUID: i2VBSmP/RXWwv3Ydag4vJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="296700976"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:43 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 0/5] drm/xe/hwmon: Update hwmon thermal mailbox handling
Date: Thu, 10 Sep 2026 23:57:51 +0530
Message-Id: <20260910182756.638830-1-karthik.poosa@intel.com>
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
hwmon implementation.

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
  - Use VRAM temperature sensor count from thermal config on CRI: address
    review comments from sashiko-bot@kernel.org and Rodrigo.
  - Decode CRI temperature registers as IEEE-754: reject temperatures that
    overflow long on 32-bit systems.

Karthik Poosa (5):
  drm/xe/hwmon: Detect unavailable temperature sensors
  drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on
    CRI
  drm/xe/hwmon: Fix memory controller thermal data handling
  drm/xe/hwmon: Decode CRI temperature registers as IEEE-754
  drm/xe/hwmon: Disable memory controller and PCIe temperatures on CRI

 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c        | 322 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pci.c          |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h    |   1 +
 5 files changed, 273 insertions(+), 57 deletions(-)

-- 
2.25.1

