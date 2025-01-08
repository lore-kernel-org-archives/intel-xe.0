Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C50E77199
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 10:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513A110E84D;
	Wed,  8 Jan 2025 10:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWnePQEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDBD10E82C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 10:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736331613; x=1767867613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5tC/s6gPjHeukqqshPGZIrI7P36f3U76UR1X1jJZsmg=;
 b=nWnePQEGuUEhqefVW+cuQczQC5UjgJHKmY9sDNikxqo3hYjMb2VE144o
 8XQpomHm7yukqKBLmKueCp1HQOin5FDfho6gto/PC+rNGh4dkz6rMrmhD
 9CucOgRZZwlvPijD/amfBBqYszU/KpQAFYpaPVvrZK22pgxmXki+Jt6eu
 FyINV7MC40TUWpCOEaje0NMhzIy3BC358nXw3z4x4tZ3xcooiKCGCTxa1
 SzJ6yPgfCJabvceS6JDOYrq2GRUK+I1MlcdZKJBcChU0yNVzOD2xO5KMu
 1aCg05LQmmQiQixcMuUlnhA4YzlVAPRDSozjxJP5cOV5+mV8nQSG/w9gw g==;
X-CSE-ConnectionGUID: areLVQ+wTEK/FBqdrr+pNQ==
X-CSE-MsgGUID: +if+iuX7T5u6HWpe1/sMEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="59014976"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="59014976"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 02:20:12 -0800
X-CSE-ConnectionGUID: HxKISHuvS66+9PMCb/8SgQ==
X-CSE-MsgGUID: vfMtMSKdT16u/7S2PzaR4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133950040"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 02:20:08 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, jani.nikula@linux.intel.com,
 matthew.d.roper@intel.com, alexander.usyskin@intel.com
Subject: [PATCH v2 0/3] Enable Survivability Mode
Date: Wed,  8 Jan 2025 16:09:56 +0530
Message-ID: <20250108103959.1219312-1-riana.tauro@intel.com>
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

Riana Tauro (3):
  drm/xe: Add functions and sysfs for boot survivability
  drm/xe: Enable Boot Survivability mode
  drm/xe: Initialize mei and vsec in survivability mode

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   9 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_heci_gsc.c              |   3 +-
 drivers/gpu/drm/xe/xe_pci.c                   |  13 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |  14 +
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 254 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.h    |  18 ++
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
 9 files changed, 348 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h

-- 
2.47.1

