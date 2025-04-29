Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D3CC369CB
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 07:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89C010E3A5;
	Tue, 29 Apr 2025 07:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J01Np4P/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B88110E3A9
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745912171; x=1777448171;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wgcPTI/2ceV2UTASrBk+jASABeOH+izXf2IKvDNOVvU=;
 b=J01Np4P/s7ocZZhODGEOKXQ1tijzP2+pVvSG7/ifdLVnjdUk4H0+hoQt
 FadCDJqa7ZF1+cG1N/c43S4I15awZLk1KO27tIHBAF09A9WiJ1GUkgcmD
 j1pheJvnW8JqNrOJ1lAnBT0lPRtoSUdZUwJ5Yq8py9zZQewoqwTSFn9AL
 Jap2CgG/ImiqKvaMlNPEOjPmyukXy1+V8cPCITmO7eMqrFMb/7F8GmuWI
 lp0XeNFa8IEb03AKvmT95snihfJ383crSf9IX6fQ5GBi9KT37bgR4WxcJ
 HBkGWHWlXeQAlEOTfFaSWWPLLHOK1lhRUMajBZcIVjGL4dGdnVC970uv/ A==;
X-CSE-ConnectionGUID: 5Lp8Yt1JRamwh5t0k2DeWw==
X-CSE-MsgGUID: oi+aw3wWQSm4kNYZ1jMYPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58178141"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="58178141"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 00:36:10 -0700
X-CSE-ConnectionGUID: fJwUYhJ1S7yVvBYU1WwG8A==
X-CSE-MsgGUID: y0X/gKTMQ3qdaL/8wlwqlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="138559795"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:36:08 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedeskop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org
Subject: [RFC 0/9] Introducing firmware late binding
Date: Tue, 29 Apr 2025 13:07:55 +0530
Message-Id: <20250429073804.972137-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
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

Introducing firmware late binding feature to enable firmware loading
for the devices, such as the fan controller and voltage regulator,
during the driver probe.
Typically, firmware for these devices are part of IFWI flash image but
can be replaced at probe after OEM tuning.

Alexander Usyskin (2):
  mei: late_bind: add late binding component driver
  mei: bus: add mei_cldev_mtu interface

Badal Nilawar (6):
  drm/xe/late_bind_fw: Introducing late_bind_fw
  drm/xe/xe_late_bind_fw: Initialize late binding firmware
  drm/xe/xe_late_bind_fw: Load late binding firmware
  drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
  drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3 resume
  drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late
    binding

Rodrigo Vivi (1):
  {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl

 Documentation/userspace-api/fwctl/index.rst   |   1 +
 drivers/gpu/drm/xe/Kconfig                    |   2 +
 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c               |  42 +++
 drivers/gpu/drm/xe/xe_device.c                |   7 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c          | 289 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h          |  18 ++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |  97 ++++++
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode_fwctl.c           | 218 +++++++++++++
 drivers/gpu/drm/xe/xe_pcode_fwctl.h           |  13 +
 drivers/gpu/drm/xe/xe_pm.c                    |   7 +
 drivers/misc/mei/Kconfig                      |   1 +
 drivers/misc/mei/Makefile                     |   1 +
 drivers/misc/mei/bus.c                        |  13 +
 drivers/misc/mei/late_bind/Kconfig            |  12 +
 drivers/misc/mei/late_bind/Makefile           |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c    | 261 ++++++++++++++++
 include/drm/intel/i915_component.h            |   1 +
 .../drm/intel/xe_late_bind_mei_interface.h    |  49 +++
 include/linux/mei_cl_bus.h                    |   1 +
 include/uapi/fwctl/fwctl.h                    |   1 +
 include/uapi/fwctl/xe_pcode.h                 |  80 +++++
 24 files changed, 1134 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.h
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/xe_late_bind_mei_interface.h
 create mode 100644 include/uapi/fwctl/xe_pcode.h

-- 
2.34.1

