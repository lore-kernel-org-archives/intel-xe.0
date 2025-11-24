Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB834CFD348
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 19:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C34A10E184;
	Mon, 24 Nov 2025 19:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6UglCsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A802110E184
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 19:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764010967; x=1795546967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VBz7IW2b8X44/fst8dILEhSrgoDQktzYpoiHS53G9Uo=;
 b=S6UglCsVp5L8Dsf9BOPHHJC7XyCGVJsdpyYV5GL8Kc/1H26jrxgqH1Bu
 1f/VjH/weqI/Kw/PEzV3i69vrvZ2MQNV7get7bAylVvCMgol33xEViCHA
 iJjsDHBcggTBDDA6CIeLgeO2kW9WW6iC9cCZMx7kwwunRkAZmjYbNAzVx
 rOSXrzm5Uf2NNgo/vO4sGmTjsesnAlU4K+kiLUO0dYPRpcL9nj4X7pqv2
 DhmDZE9PXvjE7d/DEabyImg2/KMoJT5pjza6xsNzaAdf0XlsT5LkJqFau
 mngzhKWGvMcmY6CprLCiYUnIxAp8blX5lD5AckOTnp59baoL+OexjTOxT w==;
X-CSE-ConnectionGUID: UAhH3mdaSbeGOnkSW1Posg==
X-CSE-MsgGUID: l7Fo7xd1QHOUCkA5KYmjCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83410024"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="83410024"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:02:47 -0800
X-CSE-ConnectionGUID: NsOlWgVjSweCTdSYgS3AeQ==
X-CSE-MsgGUID: djEDuoxzRmaCwykgPwRIEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196858103"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:02:46 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v3 0/4] PF: Add support for MERT
Date: Mon, 24 Nov 2025 20:02:33 +0100
Message-Id: <20251124190237.20503-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

The MERT subsystem manages memory accesses between host and device. On
the Crescent Island platform, it requires direct management by the
driver.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Lukasz Laguna (4):
  drm/xe: Add device flag to indicate standalone MERT
  drm/xe/pf: Configure LMTT in MERT
  drm/xe/pf: Add TLB invalidation support for MERT
  drm/xe/pf: Handle MERT catastrophic errors

 drivers/gpu/drm/xe/Makefile            |  1 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h  |  1 +
 drivers/gpu/drm/xe/regs/xe_mert_regs.h | 21 +++++++
 drivers/gpu/drm/xe/xe_device.h         |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h   |  6 ++
 drivers/gpu/drm/xe/xe_irq.c            |  2 +
 drivers/gpu/drm/xe/xe_lmtt.c           | 25 +++++++-
 drivers/gpu/drm/xe/xe_mert.c           | 82 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mert.h           | 32 ++++++++++
 drivers/gpu/drm/xe/xe_pci.c            |  2 +
 drivers/gpu/drm/xe/xe_pci_types.h      |  1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c       |  4 ++
 12 files changed, 179 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mert_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_mert.c
 create mode 100644 drivers/gpu/drm/xe/xe_mert.h

-- 
2.40.0

