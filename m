Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16819FF8864
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 05:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7EC10E26E;
	Wed, 29 Apr 2026 05:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUza3b0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A054510E26E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 05:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777439921; x=1808975921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bAzP7vAkujRBrgG6CUTh/BFTng6MnXWF19gSfusgsmU=;
 b=bUza3b0VSHTKIQOwi98UxocwSltVDSWXpCoH7UxUiAld8TKLIfgVkD6X
 rnr63kjvfOt9HA75wUNE+A9p2d5I29xgy+yRi5uDMz+lAE96CcVDBOAm9
 U6Xy41Ost0LLb5sMBXaXxYnr3jENSEToGi7ExLx/175Q1TXgfxuDT1IUN
 WLwH6uM03Tk8xaymZvsXdtTr/YBWz89WXjjg0AiCMRgEcK7Rs7Sr46ODd
 Cr1NtniZo6vAaW6GcscIco2qG9e/1O1E1dWn5B9eAg+bTHwC4LQ7Dl+OI
 0/romSzRbSNV2KJWzH4j0aeh8YGknjGAmVJ8C2bdUB2j4DOc2aLxg9pry g==;
X-CSE-ConnectionGUID: K13cw/N7QjWrzMgNdFHt0w==
X-CSE-MsgGUID: CAFZnT85TWGEVtqdOhRz+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82217473"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="82217473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:18:41 -0700
X-CSE-ConnectionGUID: ZcOmAgvbRnaIYu92aVlJMw==
X-CSE-MsgGUID: ajLAUeC8Tie6GoZii2o4TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="239153842"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:18:38 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 0/6] Add get-error-counter and clear-error-counter support
 for CRI
Date: Wed, 29 Apr 2026 11:21:44 +0530
Message-ID: <20260429055147.1579576-8-riana.tauro@intel.com>
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

Riana Tauro (6):
  drm/xe/uapi: Add additional error components to XE drm_ras
  drm/xe/xe_ras: Add support to get error counter in CRI
  drm/xe/xe_ras: Add helper to clear error counter
  drm/xe/xe_drm_ras: Wire get-error-counter and clear-error-counter
    support for CRI
  drm/xe/xe_ras: Move xe drm_ras registration
  drm/xe/xe_ras: Control xe drm_ras registration with a flag

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  19 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_drm_ras.c               |  39 ++--
 drivers/gpu/drm/xe/xe_hw_error.c              |  13 --
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   | 221 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  19 ++
 drivers/gpu/drm/xe/xe_ras_types.h             | 116 +++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  20 ++
 include/uapi/drm/xe_drm.h                     |  11 +-
 12 files changed, 429 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

-- 
2.47.1

