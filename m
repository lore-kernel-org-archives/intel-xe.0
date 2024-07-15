Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321D2C3DA4B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 17:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F328110E47D;
	Mon, 15 Jul 2024 17:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gz7C1kzN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B75A10E47D
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 17:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721066109; x=1752602109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DMQTGblEsiwPAvLn2WiyvbzXxTXlEOkd9IWbt9WjiuI=;
 b=gz7C1kzNuAH+xxUH9ciy744IJEjj0GEuYiDnti/plTElD57aQhbhFMz+
 H2iQ68pxmKXd8k2fVHm2e/mfsIz0MoyFtyZ33Q5WZvFqPEHfC2hCFNhoQ
 fcLzCaeWhHAIHT/g3CKTlemCo5TMPuFQarWwakPYAP01nqef4UeUEKkNO
 SdPYh8FvNXIEhP+yd94Z7RAfu5MMigSMorCgj3lpvSb4Ram4dPKJJJD1z
 QR22AxU0pwjmHHhhrTbrCFE9aCRn9GeTkiTwmqqB8xW5DjfEB1XlMkJ5N
 qvKob1p8dELHHS1Q59dABJE9WuwAjPmkA+MO5HGdGqFhmyJQDL050aX/i g==;
X-CSE-ConnectionGUID: aB5G+PI9Q5mLJ0ONeFxuVw==
X-CSE-MsgGUID: glzUgRwNQkmNwS80ShMjqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18077428"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="18077428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 10:55:09 -0700
X-CSE-ConnectionGUID: /K3xsSAXRsCVc2EZNRrvrw==
X-CSE-MsgGUID: E8g7+/oWSZGn6UAcWP0j+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49654306"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 10:55:08 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 matthew.brost@intel.com, andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v7 0/6] Support PMT features in Xe
Date: Mon, 15 Jul 2024 13:54:44 -0400
Message-ID: <20240715175452.4010751-1-michael.j.ruhl@intel.com>
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
 .../vsec.h => include/linux/intel_vsec.h      |  48 ++-
 15 files changed, 426 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (63%)

-- 
2.44.0

