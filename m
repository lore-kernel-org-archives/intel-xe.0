Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B83D3B7DD
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 08:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35FF10E0C3;
	Mon,  8 Dec 2025 08:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5OA799W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8FF10E0C3
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 08:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765181798; x=1796717798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7B2k2YYybyoZJBE0gRrBsqSDfbnly+4cBu/i8Wnhb0A=;
 b=P5OA799WJCbZG+2ZLQeEjh8OTOjr+gDZySa7UjLQwDMSG+oU64wptKpV
 MJ9YUxnrqfiTwsfQiFYeI8Q4q653yyTCDXkAg/pzJRzCtmSvaYdv8PP6X
 byztbte/cz0+gOvwMnPVlvwuDKj/zqAiS+M07d/+Wdh2uMxKAQ9zoai5d
 ZZaXfbB4Wy2Nb5A4sVwIzG3l3Kwh2+JuQKi5+b9iFRWgVMp3uM0jcxY+K
 hW6JQNT3bYBelyMNqTw1Yk9xlsTMyjR+u+BK4Edy+UytlgS7RPn3Honks
 fz/9DfAe7AX1J0PLVn2WtkiKxGD0mfXzSHiYL3lYIuZIv1b3Ar4G4t/1n A==;
X-CSE-ConnectionGUID: swV/Da7XSkWGcuSGoRk4bg==
X-CSE-MsgGUID: usFHIYPfQpuMXYLtMJkD9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="70736051"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="70736051"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:16:38 -0800
X-CSE-ConnectionGUID: VwYakJaUQv2R1ncZoD69Aw==
X-CSE-MsgGUID: 3c9UqhnIQluAsThPROkfiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195152986"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:16:35 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com
Subject: [PATCH v3 0/2] Redesign survivability mode
Date: Mon,  8 Dec 2025 14:15:40 +0530
Message-ID: <20251208084539.3652902-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Redesign survivability mode to have only one value per file.

1) Retain the survivability_mode sysfs to indicate the type

        cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
        (Boot / Runtime)

2) Add survivability_info directory to expose boot breadcrumbs.
Entries in survivability mode sysfs are only visible when
boot breadcrumb registers are populated.

        /sys/bus/pci/devices/0000:03:00.0/survivability_info
        ├── aux_info0
        ├── aux_info1
        ├── aux_info2
        ├── aux_info3
        ├── aux_info4
        ├── capability_info
        ├── fdo_mode
        ├── postcode_trace
        └── postcode_trace_overflow

Capability info:

        Provides data about boot status and has bits that
        indicate the support for the other breadcrumbs

Postcode Trace / Postcode Trace Overflow :

        Each postcode is represented as an 8-bit value and represents
        a boot failure event. When a new failure event is logged by
PCODE
        the existing postcodes are shifted left. These entries provide a
        history of 8 postcodes.

Auxiliary Info:

        Some failures have additional debug information.

FDO Mode :
	v2 survivability breadcrumbs introduces a new mode called
	SPI Flash Descriptor Override mode (FDO). This is enabled by
	PCODE when MEI itself fails and firmware cannot be updated via
	MEI using igsc. This mode provides the ability to update
	the firmware directly via SPI driver.

	Xe KMD initializes the nvm aux driver if FDO mode is enabled.

	Userspace should check FDO mode entry in survivability sysfs
        before using the SPI driver to update firmware

Rev2: Fix review comments (Rodrigo)
Rev3: Fix review comments

Riana Tauro (2):
  drm/xe/xe_survivability: Redesign survivability mode
  drm/xe/xe_survivability: Add support for survivability mode v2

 drivers/gpu/drm/xe/xe_pcode_api.h             |   2 +
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 264 ++++++++++++------
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  28 +-
 3 files changed, 199 insertions(+), 95 deletions(-)

-- 
2.47.1

