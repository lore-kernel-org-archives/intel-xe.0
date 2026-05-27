Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89798CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 05:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C39110E243;
	Wed, 27 May 2026 05:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlZrCDBF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9EC10E243
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 05:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779859745; x=1811395745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X122KuRwIBBwTE9TJfctUbfNQdKyoMvHfOnON00WD7I=;
 b=PlZrCDBFwZmdT9TdnHttXW88kd1muCabUHChfKKwxQ3dJTgxieIY18Oh
 O0gbhoGDh5niWeIbPnWb5GGwixfugWoZxXHQytaSTbt6XxI4oTjpqUMQp
 G4DrkbZzur+rZD2ntZsZz5mnqLvYR5kYqL5mjKC18bfntTFOpbMj35Xse
 SDrKOya2p8/Vfr1SHr/mKozgYKtTFd/DrDkF8WUMn5FOmmjId/8zJpZVX
 Pmt6vkVwxREA6H4D8DcDOJI149D+6vvO5LMubKCoS+VeR89Ap2oipF+2s
 DXLLxkRqEgrteUoglKBn7D+ivYXxB4BHjeoRKM4AQQQPcQF6U3+wqgpkE w==;
X-CSE-ConnectionGUID: 0aZGrCWaTrWD2dldYxRQyg==
X-CSE-MsgGUID: EwA8Ac39Rqmp0A5PaOlQEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84306583"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="84306583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 22:29:05 -0700
X-CSE-ConnectionGUID: 17RddEF+RXOn7nz5/vPMMw==
X-CSE-MsgGUID: I0yxnBduSsiEtxtiKkwyYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="241301096"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 22:29:02 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v7 0/6] Add get-error-counter and clear-error-counter support
 for CRI
Date: Wed, 27 May 2026 11:32:42 +0530
Message-ID: <20260527060241.3351323-8-riana.tauro@intel.com>
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
controller to get/clear counter values for CRI if supported.

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

Clear counter using ynl

$ sudo ynl --family drm_ras  --do clear-error-counter --json '\
{"node-id":1, "error-id":1}'
None

Rev2: add helper for clear counter
      separate get error counter for other usecases
      move commands to sysctrl layer

Rev3: integrate clear-error-counter with drm_ras
      use drm_ras flag
      move drm_ras registration to ras init flow

Rev4: rebase

Rev5: rename error_class to counter
      add prepare comman helper to sysctrl layer
      add a debug log on success
      skip drm_ras flag for vf update info

Rev6: simplify structure member names
      use local variable for counter
      rename sysctrl helper function
      fix log

Riana Tauro (6):
  drm/xe/uapi: Add additional error components to xe drm_ras
  drm/xe/xe_ras: Add support to get error counter in CRI
  drm/xe/xe_ras: Add support to clear error counter
  drm/xe/xe_drm_ras: Wire get/clear counter callbacks
  drm/xe: Move xe drm_ras initialization
  drm/xe/xe_ras: Add drm_ras feature flag

 drivers/gpu/drm/xe/xe_device.c                |  20 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_drm_ras.c               |  41 ++--
 drivers/gpu/drm/xe/xe_hw_error.c              |  13 --
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   | 192 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   5 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  53 +++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 include/uapi/drm/xe_drm.h                     |  11 +-
 13 files changed, 339 insertions(+), 37 deletions(-)

-- 
2.47.1

