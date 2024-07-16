Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D977C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF0510E8BC;
	Tue, 16 Jul 2024 21:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHBediKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F9510E8BC
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721164094; x=1752700094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5KornmEAf5kl0PDvjCkHFEC9MX4Ry9jlDgg7sDF9D94=;
 b=OHBediKdJQ2p0RLdOIIX/XTC5m8RXlqWy3HIwJACHgJ4z9Vi95xCtqte
 F0vrjJjrLYNFbKiGN9/JK0+ncOPmnEc3VQCl41hp2R+InuJ7ShC4L9Z6N
 v1HwIKwyNGQsICG6kE1PyevuQz6tHYwOtfkgFwXzsKelpm1snC97ydDZU
 RO8CR0fOLrvK5axaD7Y/lJkiwrI4nIUOeuW8o6emT4tnk1dBq8DZnzqBz
 1uu/9shqI8xTTTvss0qeYGJawSJFT2DxI84cItqEhCaVFNrLi3z2LLw6r
 lIT/euhdYgQEK/ykaEnzvz07X4NCtEOihlk3xCShvdK0QRWMlwz7GR45X Q==;
X-CSE-ConnectionGUID: 97kgXqSqTe2O3pvF9J/wTg==
X-CSE-MsgGUID: BOA6hxGASpev5e8juAeOWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18772985"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="18772985"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:08:13 -0700
X-CSE-ConnectionGUID: bw1M60+4QGCbwej+qNQ3Rg==
X-CSE-MsgGUID: mOA0XeCgQc61XltGvlB4xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="87638652"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:08:13 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 matthew.brost@intel.com, andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v8 0/6] Support PMT features in Xe
Date: Tue, 16 Jul 2024 17:07:57 -0400
Message-ID: <20240716210805.4012517-1-michael.j.ruhl@intel.com>
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

DG2 and Battlemage have the Intel Platform Monitoring Technology (PMT)
feature available, but not in the "standard" (pci endpoint) way.

Add support to the vsec and Xe drivers to allow access to the PMT space
for the DG2 and BMG devices.

The intel_vsec_register() function allows drivers to provide telemetry
header information (usually found at probe time), to allow the PMT
driver to probe the telemetry features.

Battlemage has a shared memory area (selected by index), so a callback
function is required to access the appropriate PMT data.

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

David E. Box (3):
  platform/x86/intel/vsec.h: Move to include/linux
  platform/x86/intel/vsec: Add PMT read callbacks
  platform/x86/intel/pmt: Use PMT callbacks

Michael J. Ruhl (3):
  drm/xe/vsec: Support BMG devices
  platform/x86/intel/pmt: Add support for PMT base adjust
  drm/xe/vsec: Add support for DG2

 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_vsec.c                  | 300 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h                  |  13 +
 drivers/platform/x86/intel/pmc/core_ssram.c   |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |  28 +-
 drivers/platform/x86/intel/pmt/class.h        |  11 +-
 drivers/platform/x86/intel/pmt/crashlog.c     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  21 +-
 drivers/platform/x86/intel/sdsi.c             |   3 +-
 drivers/platform/x86/intel/tpmi.c             |   3 +-
 drivers/platform/x86/intel/vsec.c             |   9 +-
 .../vsec.h => include/linux/intel_vsec.h      |  50 ++-
 15 files changed, 428 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (61%)

-- 
2.44.0

