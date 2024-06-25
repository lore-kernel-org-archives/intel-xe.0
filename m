Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3813DC3064D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 12:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50C310E646;
	Tue, 25 Jun 2024 12:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqIClSRA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2692210E28E
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 12:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719319581; x=1750855581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7lyoFOuBeyKz+ztgDIid7b/pLo00IS/mwzOWmgL+zkA=;
 b=mqIClSRALGPX16wKVLqRboCZl23fqn6UeEUWCKvaCJ1KD9L8xQjKwpSK
 s2uuRsAQreiISQbjjPrS55B1nG5o6Gv5pVa1JG1Fd+E2pfcjc23mGDg+5
 uTgFWIDvbKfdJe3p2ZhBKIMWovoz7Q5pQEppWd/UkYmnlLGmr6CYkiHog
 KGjslXqUa6URHZzBJvPTmYa9X2lssvFMaUoO/jO7JqBM9BbXFVZkjWnvj
 WYe8Lm5SPM30LoPYSGCvQ0CYL+9ZusSR0Kzpyq1kaDkG44aq7hT3YM2Ma
 BUXw2omGeVSPeXNoLlZKE8ndj7SDtFP6o/lnr3tL9kndKkHPgRb82ykDN w==;
X-CSE-ConnectionGUID: hKidfNYdSliNxdcV8TqKCw==
X-CSE-MsgGUID: 4VZuVBcURtq8vVitv+w18g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26955326"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="26955326"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 05:46:14 -0700
X-CSE-ConnectionGUID: NSH5aog2Rwiw2Kj5wBuc1Q==
X-CSE-MsgGUID: jjX4Wz1nSn+at7R9k4tBbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48547059"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 05:46:13 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v3 0/6] Support PMT features in Xe
Date: Tue, 25 Jun 2024 08:45:46 -0400
Message-ID: <20240625124554.3358460-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
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

David E. Box (3):
  platform/x86/intel/vsec.h: Move to include/linux
  platform/x86/intel/vsec: Add PMT read callbacks
  platform/x86/intel/pmt: Use PMT callbacks

Michael J. Ruhl (3):
  drm/xe/vsec: Support BMG devices
  platform/x86/intel/pmt: Add support for PMT base adjust
  drm/xe/vsec: Add support for DG2

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_vsec.c                  | 295 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h                  |  13 +
 drivers/platform/x86/intel/pmc/core_ssram.c   |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |  28 +-
 drivers/platform/x86/intel/pmt/class.h        |  11 +-
 drivers/platform/x86/intel/pmt/crashlog.c     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  21 +-
 drivers/platform/x86/intel/sdsi.c             |   3 +-
 drivers/platform/x86/intel/tpmi.c             |   3 +-
 drivers/platform/x86/intel/vsec.c             |   9 +-
 .../vsec.h => include/linux/intel_vsec.h      |  18 +-
 15 files changed, 391 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (88%)

-- 
2.44.0

