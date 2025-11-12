Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1015FCCFA1A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 10:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCBD10E1C6;
	Wed, 12 Nov 2025 10:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IECRAzOE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BD710E1B3
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762941905; x=1794477905;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pAb2NRByS0yVWgnO1np19IpwQQmqq/2jGeV1rsfzaio=;
 b=IECRAzOEzkn9dT4s0Ljl7n8oZrHv4TXuhi+CcKGjwVpUa5jsMngMOeeU
 P8CtK3d8nj+qwdDOJzKXvBHlPEOYDm61iY5+F0zMdHVkHfNn29MPtVZZ9
 v/dlQhWiWeaV2ob9quZziKquCRwgysDzrwCCp5pnXNrkHgvFMY9nOQWgo
 GCFqb/5l/hkl+aBHC9WuGTf03xwakBMM42/JksbYppXvod8LcetThTb2s
 3wtj3fi+CmZhmTXT7TZejR9RQBkUh3+g7SdXF9AAwXfbujp8xgB/cOxJg
 LKAI6PrN1QXIO5us+echyqTAppw92UoYtGVdEi0TDzEP4IfP7Mv+vyuRy Q==;
X-CSE-ConnectionGUID: HHstQGX6R4iz7ogBJTGhKg==
X-CSE-MsgGUID: b4fmlmR4QqW1Jw9rqeQYQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75307802"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75307802"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 02:05:02 -0800
X-CSE-ConnectionGUID: TObenv4WTrWx45T3Y234Zg==
X-CSE-MsgGUID: wVakxXT4QiigV8taA7bQLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="219908684"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 02:05:00 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com
Subject: [PATCH 0/2] Redesign survivability mode
Date: Wed, 12 Nov 2025 16:03:37 +0530
Message-ID: <20251112103336.1468261-4-riana.tauro@intel.com>
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
        a boot failure event. When a new failure event is logged by Pcode
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

	Userspace should check FDO mode entry in survivability sysfs before
	using the SPI driver to update firmware


Riana Tauro (2):
  drm/xe/xe_survivability: Redesign survivability mode sysfs entries
  drm/xe/xe_survivability: Add support for survivability mode v2

 drivers/gpu/drm/xe/xe_pcode_api.h             |   2 +
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 198 ++++++++++++++----
 .../gpu/drm/xe/xe_survivability_mode_types.h  |   7 +-
 3 files changed, 160 insertions(+), 47 deletions(-)

-- 
2.47.1

