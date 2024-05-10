Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DA9C25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 21:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2B210E14F;
	Fri, 10 May 2024 21:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQrB2R1s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D2310E14F
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 21:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715374803; x=1746910803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fSJESqmSVw/QhWOZNxFutMH0gg51diu8bReydXCh1ck=;
 b=fQrB2R1s5spU6vSpC/uYw3srirKPHKRuzKlqoeEUKvIRAuJQoPBvRLs/
 KIAyYkkwbesPI0IGSk7G5NO3bf8YrAgA4J4QxzJYctgenEuYIyrgxvney
 NxOD4H34/yT0G0UMc8btKdNpCHA3XT+hKm/Z1mnDVGtnkVCM7d1hQ7zJJ
 7f1qgF+vtGgqINuB8mscMD0F4VnGL9Rwm9q29slVzLl0MqD4sF3oARv+S
 /L7062jRMitvCtkRdkv58RQ8CFg5suJcNz7uP7MqHQCGPykjzDub/lMsC
 K4ZFOmb4cSP5wT9uHXekz7X+tTwI7swedIf6pxxQqq4RvPkfhpmwNb+5h w==;
X-CSE-ConnectionGUID: F4lK3Z0sT/S2PyHO052K1Q==
X-CSE-MsgGUID: rOuKYyaXS6eO2FrxU/yVBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22048285"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22048285"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:02 -0700
X-CSE-ConnectionGUID: CPmpK7wTSl6XlJfFpwBH5A==
X-CSE-MsgGUID: FRS1OARNQiebeFmGh4rtvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34604045"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:02 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: david.e.box@linux.intel.com, "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 0/6] Support PMT features in Xe
Date: Fri, 10 May 2024 16:59:32 -0400
Message-ID: <20240510205948.904409-1-michael.j.ruhl@intel.com>
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

David E. Box (3):
  platform/x86/intel/vsec.h: Move to include/linux
  platform/x86/intel/vsec: Add PMT read callbacks
  platform/x86/intel/pmt: Add support to use provided read callbacks

Michael J. Ruhl (3):
  platform/x86/intel/pmt: Add quirk for BAR0 offset adjustment
  drm/xe/vsec: Add support for DG2
  drm/xe/vsec: Support BMG devices

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   5 +
 drivers/gpu/drm/xe/xe_vsec.c                  | 241 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h                  |  13 +
 drivers/platform/x86/intel/pmc/core_ssram.c   |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |  33 ++-
 drivers/platform/x86/intel/pmt/class.h        |  10 +-
 drivers/platform/x86/intel/pmt/crashlog.c     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  14 +-
 drivers/platform/x86/intel/sdsi.c             |   3 +-
 drivers/platform/x86/intel/tpmi.c             |   3 +-
 drivers/platform/x86/intel/vsec.c             |  10 +-
 .../vsec.h => include/linux/intel_vsec.h      |  12 +-
 14 files changed, 325 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (92%)

-- 
2.44.0

