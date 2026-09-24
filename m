Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470A5C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 10:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D7010E0F6;
	Thu, 24 Sep 2026 10:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJDednkY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF0B10E0F6
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 10:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790247057; x=1821783057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6NtSLlJLf3XAHRbGsr5F8LHhEZGqDVIsn15dhbANQ2o=;
 b=FJDednkYlsN5+hPB1Wzv6fYuIIwT+2NAQQouqdIHuzuYBuLK9IVuNanL
 UZc25p1tOF6dHqvSsdHN3YSZQKiVRCqZv3UQVDqiDgHV2G9/k/6eXVnfH
 0ot11L2Q7kWX73UNPCfP7mh4W6EP4TPfsH7cYc0lQal7S3UVOLHnBF+UC
 860ZZLqJSUaKzCido2kyq6lyvI9fqyvOZebT5QURB/52x8zW258hRoyoK
 c9C+nlNKBRrLJbwSCfo9I33XKqqCUlZLsPGeRNhjjIdVmhq6Cxaf8EMAA
 xEjXgcHb0muzz+pqOBlGy+LxqaKkQ4U9Z9hIY91BbXiSmXToUWCxNBCUG g==;
X-CSE-ConnectionGUID: PgsSCCKcQS22kyortFuJ/w==
X-CSE-MsgGUID: 5Fiom+RZS6Wy666K9/X3jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91032864"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="91032864"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 03:50:57 -0700
X-CSE-ConnectionGUID: d9yex7/3TO62yIKQadxvtA==
X-CSE-MsgGUID: 13ghkyQJRYyyC2+IJ/1Txw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277749973"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 03:50:54 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v4 00/13] drm/xe/hwmon: Update hwmon thermal mailbox
Date: Thu, 24 Sep 2026 16:19:47 +0530
Message-Id: <20260924105000.2627929-1-karthik.poosa@intel.com>
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

