Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C42CF8FA78
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 14:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A373810E1FC;
	Tue, 21 Apr 2026 14:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHMo3ktl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAE710E8C8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776781086; x=1808317086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H+sMzB7RgsM1u0IcpJ+Vmd/wpYHy2HVLJBzuNH8q1D0=;
 b=fHMo3ktlON+3hxizlNPonzfIoeJv+B/rSvR01wFvlvHmi/tfKo/IAzSP
 91UTHv6qCp/w+U+1U7jnseUDsslZSGhEb+pbtXXmzCplvbBukABTk12mG
 90UnEivWW+VeEj7aP7RWanmm03UjuZBSaKHAQ2Ap3h19eiYoYqniZ5L6G
 7GO2TSLxZ1Z9FvGWiupqOi3naiP8J9nmXBqIny+RjOogI+U5u3qT/KgJe
 1DEqQ4mYuup6oZmwRkheUJG5xTPwVwNLcyycgsGfVp98lt4W1yPxBb1Yq
 jPoKPvzNviZ2544rhQtpYkOVSdAngmlqHHXBmubDXBbsgegE5NbpDJy/E Q==;
X-CSE-ConnectionGUID: V6SqYrSxTQiGFaERy5rGnw==
X-CSE-MsgGUID: de7jiGm3QcyO1HfEwTlWUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95272268"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="95272268"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:18:05 -0700
X-CSE-ConnectionGUID: oi3t38YHTmqqrFQR3yc1vA==
X-CSE-MsgGUID: 6MvKx41SQyKfrZqO7COEEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="233829012"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:18:03 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 0/5] Add get-error-counter and clear-error-counter support
 for CRI
Date: Tue, 21 Apr 2026 20:20:56 +0530
Message-ID: <20260421145056.253300-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Define request/response structures and helper functions to query system
controller to get/clear counter values for CRI.

Integrate get-error-counter with xe_drm_ras.

Usage:

Query all error counters using ynl

$ sudo ynl --family drm_ras --dump get-error-counter --json \
'{"node-id":0}'
[{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
 {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0},
 {'error-id': 3, 'error-name': 'device-memory', 'error-value': 0},
 {'error-id': 4, 'error-name': 'pcie', 'error-value': 0},
 {'error-id': 5, 'error-name': 'fabric', 'error-value': 0}]

Query single error counter using ynl

$ sudo ynl --family drm_ras  --do get-error-counter --json \
  '{"node-id":1, "error-id":1}'
{'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}

Clear counter will be integrated with drm_ras implementation once
clear-error-counter patch https://patchwork.freedesktop.org/series/164601/
is merged.

Riana Tauro (5):
  drm/xe/uapi: Add additional error components to XE drm_ras
  drm/xe/xe_ras: Add support to get error counter in CRI
  drm/xe/xe_ras: Add helper to clear error counter
  drm/xe/xe_drm_ras: Wire CRI get-counter support into drm_ras
  drm/xe/ras: Add flag for Xe RAS

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_drm_ras.c               |  19 +-
 drivers/gpu/drm/xe/xe_hw_error.c              |   2 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   | 194 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  18 ++
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  15 ++
 include/uapi/drm/xe_drm.h                     |  11 +-
 11 files changed, 375 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

-- 
2.47.1

