Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF84C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 09:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6834210E612;
	Tue, 28 Jan 2025 09:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAalDN/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB54F10E612
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738056967; x=1769592967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2v5UO0J77Zkt77oqNTexAZyChVAEp0pkO4KuhYxdKAQ=;
 b=AAalDN/J6rrIXbrOb8nGbsGWDmk/ApscJK125J+XgDnkmi4jm588leak
 /z3t3ft09R6srA9HMbgFyAmas+VgyVvbz1zWf48RChLN+Mz9q+Tl4V9ba
 4XuNH2gnLIs7Fo4uTjNbZ00bJZUJvlVXaJ2HT8zs0wsBX5RJWwlG58RVE
 IZ0jVi13P6EINL4f6jgaQ0T2o19T1ugtvb4hCC6/yFX0Qz+JZPl7uVCMM
 4IArjjrcW4NMhcPzinI+tLVtmZd+eDvRPR/+KaZ6Vjp5cmrem8S0ZZzvJ
 lG6cKJ+l9i489d7Abvy5rrmM6BEpbqPz+KjZtoTm/27QSoVyfH9gpONWr w==;
X-CSE-ConnectionGUID: KuCYYKSpRUWp0SXdPdr/SA==
X-CSE-MsgGUID: RBG/qmBUTiiPFySqarEQNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49950874"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49950874"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 01:36:07 -0800
X-CSE-ConnectionGUID: FnHy5R/2SW6oiW0C3QcwAg==
X-CSE-MsgGUID: Sk4cIhGySDqIZk6/LmnwhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="108492195"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 01:36:05 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v6 0/3] Enable Survivability mode
Date: Tue, 28 Jan 2025 15:26:29 +0530
Message-ID: <20250128095632.1294722-1-riana.tauro@intel.com>
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

Rev4: fix space

Rev5: fix checkpatch warnings

Rev6: rebase

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

