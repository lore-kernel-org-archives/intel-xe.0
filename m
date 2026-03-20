Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818DC108B8E6
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 09:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3079810EAC8;
	Fri, 20 Mar 2026 09:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpAUTp9Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F69F10EABC
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774000434; x=1805536434;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zor0A6vpBq8XdP1qgWstvwsks7V+T1GfzP8IQk+GJ08=;
 b=XpAUTp9QG7bAyFoaRwQoO6iWmWqHSD1ocMHJ/WWqkoTNpyhd6KsaJG17
 XIBotAvsy2ddbGuqZbjqkFINIb1jQ8/snnp2vvrFJKukuTO7MbHNmfUuj
 9hVjqoSDZPrZNiqw3OM8kUs2Ac8gDn1nFqqLpBR6kNAI9hhckyulhZPpW
 OUO5J4DTgEgIZ8i9MbzZH6DXUEO8JFyRpIgRkhR2JYWZkLEMYMU0mxd/R
 V6jIM1tv2kH9neSxZq0tUtR5g+Aqw7VW+jlIaG7qSrJ+7PGWwJNuo5gRN
 PL3Ijfa0W7lCXuRorTTlzZgVZvL6AiHPN0sycGO8dhy/T5Pyt/s8l8y7T Q==;
X-CSE-ConnectionGUID: o6S+6fFYSfazNzVWpy/FlQ==
X-CSE-MsgGUID: K4fXVgKlRlqQWemj02EPtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92469214"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92469214"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:53:53 -0700
X-CSE-ConnectionGUID: MB/XseySSb+Vnm6BWI+x7A==
X-CSE-MsgGUID: /+Ojb4JRTX6lp00TQd1Wew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227968070"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:53:50 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH 0/5] Add get-error-counter support for CRI
Date: Fri, 20 Mar 2026 15:55:55 +0530
Message-ID: <20260320102607.1017511-1-riana.tauro@intel.com>
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

Add support to query error counter for CRI in XE DRM RAS.
This patch adds the necessary structures and commands to query error counter
from the System controller. It also integrates with the existing XE DRM
RAS framework to allow userspace to retrieve error counter vaue.

Example: Query error counter using ynl tool

$ sudo ynl --family drm_ras  --dump get-error-counter \
 --json '{"node-id":1}'
 [{"error-id": 1, "error-name": "core-compute",  "error-value": 0},
  {"error-id": 2, "error-name": "soc-internal",  "error-value": 0},
  {"error-id": 3, "error-name": "device-memory", "error-value": 0},
  {"error-id": 4, "error-name": "pcie",          "error-value": 0},
  {"error-id": 5, "error-name": "fabric",        "error-value": 0},]

Query single error counter

 $ sudo ynl --family drm_ras  --do get-error-counter --json \
   '{"node-id":1, "error-id":1}'
   {'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}

Anoop Vijay (1):
  drm/xe/xe_sysctrl: Add System controller patch

Riana Tauro (4):
  drm/xe/uapi: Add additional error components to XE DRM RAS
  drm/xe/ras: Add flag for Xe RAS
  drm/xe/xe_ras: Add structures and commands for get counter
  drm/xe/xe_ras: Add support to query error counter for CRI

 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  74 ++++
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   8 +
 drivers/gpu/drm/xe/xe_drm_ras.c               |  22 +-
 drivers/gpu/drm/xe/xe_hw_error.c              |   2 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   2 +
 drivers/gpu/drm/xe/xe_pm.c                    |  11 +
 drivers/gpu/drm/xe/xe_ras.c                   | 111 ++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  16 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 151 +++++++
 drivers/gpu/drm/xe/xe_sysctrl.c               | 128 ++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  23 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 369 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  31 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  40 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
 include/uapi/drm/xe_drm.h                     |  11 +-
 20 files changed, 1070 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

-- 
2.47.1

