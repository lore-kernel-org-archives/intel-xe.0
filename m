Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E982ED116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 14:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA15C10E030;
	Mon,  1 Dec 2025 14:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBYltLdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB58210E030
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764597922; x=1796133922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kQ3p0RTrz9UDJT3Zt5/PGp1iDzYX1xGigNK+RMtXJCg=;
 b=aBYltLdbvdnRuVTIXB5OYIufexXn0/gavHIkCV6bowH5zLU291Jo9U5g
 bSM3uiwH0q/diiDxvsmAvojBKTLebBAEUJs+Dbwhs+dDxd3NyMGJpAu0m
 1YBd4zvKw3MbwcN2TsHuvBRLa7b6yANjiWmQE7oFs6vgybWDH1T/f711T
 kliXgswWxtNXe82Rsn6huUAcw05ImZt9wKMJ8kTuUqS+yaErwIjaDD7Mz
 o3cznh+a8yh88u0IJxeEpAttNpxwNePhTiREzRZAeWiV8rErxoQJwG9gE
 dxEJt2cZo2bjfiK6RNG7ueB7U/uQ5xBK7JSOvKguZj3Yqnq/nBwm+VrPE A==;
X-CSE-ConnectionGUID: mWJbRCMgTq2QNvhKe2UttA==
X-CSE-MsgGUID: PyzDJIQUTwe3s4/dw5KdNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="92013639"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="92013639"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:05:22 -0800
X-CSE-ConnectionGUID: aMVhcN9qRvqdxO90XZM48A==
X-CSE-MsgGUID: NBk4VpbnTWKVnmrJWFHdOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194187184"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:05:19 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com
Subject: [PATCH v2 0/2] Redesign survivability mode
Date: Mon,  1 Dec 2025 20:04:21 +0530
Message-ID: <20251201143420.3158372-4-riana.tauro@intel.com>
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

Capability_info:

        Provides data about boot status and has bits that
        indicate the support for the other breadcrumbs

Postcode Trace / Postcode Trace Overflow :

        Each postcode is represented as an 8-bit value and represents
        a boot failure event. When a new failure event is logged by PCODE
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

Riana Tauro (2):
  drm/xe/xe_survivability: Redesign survivability mode
  drm/xe/xe_survivability: Add support for survivability mode v2

 drivers/gpu/drm/xe/xe_pcode_api.h             |   2 +
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 241 ++++++++++++------
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  28 +-
 3 files changed, 180 insertions(+), 91 deletions(-)

-- 
2.47.1

