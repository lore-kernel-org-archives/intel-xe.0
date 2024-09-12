Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E2CEED63F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E4310EC0F;
	Thu, 12 Sep 2024 18:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g95PrPNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995A410E02A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726166539; x=1757702539;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bQI3VSmaJ9VzdOm3car7P0cb/Zew6wyniav/mQI+lYc=;
 b=g95PrPNeIfLIS9Ba//puamViWV+eM6dE1S0GZe/wVJR73DFiX17+MU+h
 3EU/zarRH94/D72G+FHpeqRxGzMqhI+51snEkipTHbDXSJ0TrCEUAiTaR
 SczqezW7r0imwj7pHIhe6QUXvba6UJoFRzqg25epEMrGc3ImDqMlyrBAG
 F/fjELipyOpu1pK6LRUueT5bC+/AW4EzeHrRRphVI9tvi1Ot2xAKWCmku
 ho65PjSgki0Wt+M2PkjuVcj55zFyJtS7zovjUixchg153280YYnAJ3SdR
 /RRBbAPyKul1wtp1T6aKUMpd2dw3T1EJTjirQ43VkCI/oFWyrPfVZuCuy A==;
X-CSE-ConnectionGUID: YQN9cNiqTiilw1EL0EU+0Q==
X-CSE-MsgGUID: 613LZvMDQVi1edYJS9IHEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36183405"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="36183405"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:42:19 -0700
X-CSE-ConnectionGUID: B20UpwLKRCWhGKt0M6b1qg==
X-CSE-MsgGUID: DxLAWQVEQ96VGE6LQq8FdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="72399401"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:42:17 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 michael.j.ruhl@intel.com
Subject: [PATCH v13 0/4] Support PMT features in Xe
Date: Thu, 12 Sep 2024 14:42:05 -0400
Message-ID: <20240912184210.914612-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
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

Battlemage has the Intel Platform Monitoring Technology (PMT)
feature available, but not in the "standard" (pci endpoint) way.

Add support to the vsec and Xe drivers to allow access to the PMT space
for the BMG devices.

The intel_vsec_register() function allows drivers to provide telemetry
header information (usually found at probe time), to allow the PMT
driver to probe the telemetry features.

Battlemage has a shared memory area (selected by index), so a callback
function is required to access the appropriate PMT data.

Note: patches 1 - 3 will be merged through the platform-drivers-x86
      tree.  This submission is for DRM CI.
V2:
  Re-worked DG2 support patches using a base_adjust rather than a
  quirk.
  Updated GUID decode, for correct decode.
v3:
  Fixed a documentation issue for the pmt struct.
v4:
  Fixed a documentation issue in the xe_vsec.c module
v5:
  Addressed review comments for patch 4 (Xe driver)
  Add r/b for the first three patches
v6:
  Added kernel doc to moved data structure
  Added required include files
  Correct usage for FIELD_PREP()/FIELD_GET()
  Whitespace clean up
  Removed unnecessary type cast
v7:
  Commit message updates
v8:
  Added some r/b (patch 2 and 3).
  Updated kernel doc patch 2 (priv_data) patch 5 (base_adjust)
v9:
  Add r/b for the Xe driver patches
v10:
  Use the mutex guard feature
  Use the xe_pm_runtime_get_if_active() return value correctly
  Add r/b from Ilpo
  Deferred DG2 patches for the future
v11:
  add include for cleanup.h
v12:
  use default clause in switch
  rename OFFSET to OFFSET_BASE
v13:
  updated mmio usage to use the current Xe mmio API

David E. Box (3):
  platform/x86/intel/vsec.h: Move to include/linux
  platform/x86/intel/vsec: Add PMT read callbacks
  platform/x86/intel/pmt: Use PMT callbacks

Michael J. Ruhl (1):
  drm/xe/vsec: Support BMG devices

 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_vsec.c                  | 223 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h                  |  13 +
 drivers/platform/x86/intel/pmc/core_ssram.c   |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |  28 ++-
 drivers/platform/x86/intel/pmt/class.h        |  10 +-
 drivers/platform/x86/intel/pmt/crashlog.c     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  12 +-
 drivers/platform/x86/intel/sdsi.c             |   3 +-
 drivers/platform/x86/intel/tpmi.c             |   3 +-
 drivers/platform/x86/intel/vsec.c             |   8 +-
 .../vsec.h => include/linux/intel_vsec.h      |  47 +++-
 15 files changed, 337 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (62%)

-- 
2.44.0

