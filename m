Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA85F46C46
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC6C10E139;
	Mon,  6 Apr 2026 14:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BueJXjiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC110E139
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 14:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775485324; x=1807021324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1jxcq6Txp/0gTN1ZBvlh1gd2cyy/ArIJ1bqdwO1HvDw=;
 b=BueJXjiACWWgPepsCdzB1zAwWwSLQs6DxstA106PgEoUa+pvNHQdK3+8
 CGZZp5RbEFphp4NNSs+pQrCBQ4GKoRWj1G334gJrqoloFh6cFyEblEI+o
 sJ4gnMRH4Yu9Lx7OiB823M7S47DlD68WqERf1W8Xs+PcAaH7TAhxWrBZI
 kRn7zdZDwejoQ6YTDnEwg8tx8NmEFdTE1mAh1spckHM4ZBhB//0IVPF5b
 YMpSewasH3qBOPzV8Gye1nuf5s3r4NmETGeFzjmUaWuOrNoSONpZSG1lK
 AeSvAiS2/+ti+YlfVAEnpaVYaDq38TuVpj3Oorr1/C9ChTJXyMQ5m19t+ A==;
X-CSE-ConnectionGUID: fH5Llj4+Smy19g2qL3j+gQ==
X-CSE-MsgGUID: gOxZ6T/GQiCXn6EM0q5IyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="75473022"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="75473022"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:22:03 -0700
X-CSE-ConnectionGUID: GHWpH/XaSwSmt4aO35JiRA==
X-CSE-MsgGUID: 4pqpIOHxSdKr61mfrBLc8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="232746784"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:22:01 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v2 0/5] Add get-error-counter and clear-error-counter support
 for CRI
Date: Mon,  6 Apr 2026 20:24:39 +0530
Message-ID: <20260406145440.2016065-7-riana.tauro@intel.com>
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

Add support to query error counter for CRI in XE drm_ras.
This patch adds the necessary structures and commands to query error counter
from System controller. It also integrates with the existing XE drm_ras
framework to allow userspace to retrieve error counter value.

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

Also add helper function to clear error counter for CRI. This will be
integrated with drm_ras once https://patchwork.freedesktop.org/series/163019/
is merged.

Rev2: add helper for clear counter
      separate get error counter for other usecases
      move commands to sysctrl layer

Riana Tauro (5):
  drm/xe/uapi: Add additional error components to XE drm_ras
  drm/xe/xe_ras: Add structures and commands for get and clear counter
  drm/xe/xe_ras: Add support to query error counter for CRI
  drm/xe/xe_ras: Add helper to clear error counter
  drm/xe/ras: Add flag for Xe RAS

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_drm_ras.c               |  22 ++-
 drivers/gpu/drm/xe/xe_hw_error.c              |   2 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   | 171 +++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  18 ++
 drivers/gpu/drm/xe/xe_ras_types.h             | 176 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  15 ++
 include/uapi/drm/xe_drm.h                     |  11 +-
 11 files changed, 412 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

-- 
2.47.1

