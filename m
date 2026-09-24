Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A00AC98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0D210E0F6;
	Thu, 24 Sep 2026 11:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bol6nE+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A361E10E0F6
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790248369; x=1821784369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=byuPRty1wiS0jzT7aNb4UXfenWgvLIjj1cpK/TuFv0U=;
 b=Bol6nE+Hp1emgRhsRNHolq3MoiNdqpYw9kG32fqW/LSH33VXUx/MInsQ
 BEo0wNfwBsm+2wc7ab240wKibQhHzk+Lebfy97RCqeuHuuu8C8KzsgpZg
 GdKPG1zGY7vwZ4wkQzpoXbr/eQ4DNmnEoytB3awi68GRaq/nE3hDm/7Fc
 tvuwrFnXihxavtIRYYXsyRwuCMBFhB8fMOLzboiAEve29o7jiA8WTPBG7
 DPz2Gcek2O8PFDjBYYGDQrBMFvnk46Wj8YGTE3P5yW57R1ON8b6L4efD0
 fwbyKAGSni7DFzt9jddPjy7YkWJQ+f6DdqH8qz+u+qxYZpyf+CgWLvKXX Q==;
X-CSE-ConnectionGUID: puReYZSHTp6FBMUcpRqPNQ==
X-CSE-MsgGUID: o0zk8qRJQkOBP2IG3AibxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101187706"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="101187706"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:12:49 -0700
X-CSE-ConnectionGUID: D5mMGRQUSreoYBaprlCctQ==
X-CSE-MsgGUID: 8m7tiVd2QRSa/TOO/cbxww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277394675"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:12:46 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 00/13] drm/xe/hwmon: Update hwmon thermal mailbox
Date: Thu, 24 Sep 2026 16:41:43 +0530
Message-Id: <20260924111156.2628915-1-karthik.poosa@intel.com>
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
  drm/xe/hwmon: Add platform-aware VRAM thermal channel support
  drm/xe/hwmon: use CRI-specific package and VRAM temperature registers
  drm/xe/hwmon: Decode CRI temperature registers as IEEE-754
  drm/xe/hwmon: Update memory controller temperature offset for CRI
  drm/xe/hwmon: Update PCIE temperature sensor offset for CRI

 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   3 +
 drivers/gpu/drm/xe/xe_device_types.h    |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c           | 452 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pci.c             |   4 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   2 +
 5 files changed, 393 insertions(+), 72 deletions(-)

-- 
2.25.1

