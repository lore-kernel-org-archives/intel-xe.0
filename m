Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAAEE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 05:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B1410E086;
	Thu, 12 Dec 2024 05:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEXpoNo3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F1010E086
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 05:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733981440; x=1765517440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4A0bKitp1Dj0CS9hum0lr/7YOfGC+tW6tlZA8w6Y/rE=;
 b=hEXpoNo3KGt4EfHknPJ1PC7Rjb7NNG1IqW0df60titQrsYdFRmKX4CPW
 459VNlglldI9W63tRWYa7gAe7YSrXPYE8yvUR62fO12nZpezcF9KAv+Qm
 PJmmfok9vIFlxzgX7A54vteOgKIEtyU28X7Qyraw0D+7QgeYn0IMwjAcv
 5QoyAFY5EMNuOj8dF1oeZXTvW9vQSoD3yjNcWbZlDPrdtrcoY2RAMSzV2
 aUvd5/AlnGhYu9RDGY9UGczbTFUScb6cEUgwmzPCKnSzxT5NO+2oGI1+q
 c7/DOOzQy4I4wjnT/VtDq+FS74GXR8bfFMVHmDGSQOuXY+IX6Zuhun0cI A==;
X-CSE-ConnectionGUID: 2/FSQjGcTQafJglMFF7TxQ==
X-CSE-MsgGUID: HPSqGcxJQbuV+ByZ4x4ZaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34519700"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34519700"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 21:30:39 -0800
X-CSE-ConnectionGUID: X9JJPn91SMmZ9gSTPGomDA==
X-CSE-MsgGUID: 5BoM0MQjTJu3AKourJ/jAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96332995"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 21:30:38 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, aravind.iddamsetty@intel.com
Subject: [PATCH 0/2] Enable Survivability mode
Date: Thu, 12 Dec 2024 11:19:43 +0530
Message-ID: <20241212054945.1091894-1-riana.tauro@intel.com>
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
to allow the firmware to be flashed through mei/gsc and collect telemetry.
The driver's probe flow is modified such that it enters survivability mode
when pcode initialization is incomplete and boot status denotes a failure.
In this mode, drm card is not exposed and PCI sysfs is used to indicate
survivability mode and provide additional information required for debug

TODO : Notify mei

Riana Tauro (2):
  drm/xe: Add functions and sysfs for boot survivability
  drm/xe: Enable Boot Survivability mode

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   9 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_pci.c                   |  13 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 228 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
 8 files changed, 319 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h

-- 
2.47.1

