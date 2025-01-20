Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8406CC02185
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 06:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AC510E2DB;
	Mon, 20 Jan 2025 06:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzyD80Cp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F03C10E2DB
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 06:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737354041; x=1768890041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a85Wrk/ys5zdnwfeFmGG9sDoMVv5OGFeK9cWrwZurTo=;
 b=lzyD80CpgtU4XcWabKPj1Aa7tv8rFxWGBBDEccN8Mw1DVDffnGGZI5JK
 jB7PciOSiEdMX3weq5Occ9/acPJatejJZNxd23svH+BX/+x/8R8LnnoYf
 /QI+f76Z+Mcz4XSyZ/jN+YD18MzYZtjm1YvlKuqyQ6clo2c7Lg/7FpFua
 IveF8U7UXMIQ6oW80pg2qXvPPHC8lBM8DD5/pH9OxaVN+W9UQtUj3JoI+
 6TOog/EzkQ2OqTVIsdE0rbtmbfvBX22Q82BRFN7ps42+WX/0LFMFiuSq5
 lUcASXU5J2k5WSJQLNverbBQ3aWkxD2FFk99Ap6aKGHUiTeu5GSC9mdOe w==;
X-CSE-ConnectionGUID: 18YQw9r6QGOiWqkbHTqPCg==
X-CSE-MsgGUID: VeYryk91QxyjXR/WnhgWZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37953781"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="37953781"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:20:40 -0800
X-CSE-ConnectionGUID: B/EhtoPSRQWbYuuBpg6ygA==
X-CSE-MsgGUID: J217BnKJS7SgouLAHlypWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="111370320"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:20:38 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, jani.nikula@linux.intel.com,
 alexander.usyskin@intel.com
Subject: [PATCH v3 0/3] Enable Survivability mode
Date: Mon, 20 Jan 2025 12:10:39 +0530
Message-ID: <20250120064042.2596178-1-riana.tauro@intel.com>
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

Boot Survivability is a software based workflow for recovering a system
in a failed boot state. Here system recoverability is concerned with
recovering the firmware responsible for boot.

This is implemented by loading the driver with bare minimum (no drm card)
to allow the firmware to be flashed through mei-gsc and collect telemetry.
The driver's probe flow is modified such that it enters survivability mode
when pcode initialization is incomplete and boot status denotes a failure.

A survivability_mode sysfs entry is an indication of this mode.

Rev2: Initialize mei-gsc and vsec
      abstract survivability mode
      remove extra sysfs entry

Rev3: use dev logs 
      use for loop and helper functions
      return error on suspend

Riana Tauro (3):
  drm/xe: Add functions and sysfs for boot survivability
  drm/xe: Enable Boot Survivability mode
  drm/xe: Initialize mei-gsc and vsec in survivability mode

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   7 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_heci_gsc.c              |   3 +-
 drivers/gpu/drm/xe/xe_pci.c                   |  23 +-
 drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 238 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.h    |  18 ++
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
 9 files changed, 339 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h

-- 
2.47.1

