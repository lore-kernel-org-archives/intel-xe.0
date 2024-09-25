Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9FDCCFA08
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 23:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B050D10E866;
	Wed, 25 Sep 2024 23:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGesYP46";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6289010E866
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 23:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727306679; x=1758842679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xwjKUIfkwC6hi2SQ4JJekE86Ocf0IHjmTmT+EXHjaCU=;
 b=GGesYP46iDdqsTD2C8NY9/H56Y+2vQVDCxcUUC8x0akEkr8hquOUld1v
 TEgBvA2VBL+q4oI6kDVqiScaDEGM9RFJGsxSeakhm3y2vbz0zM/ksyJg1
 8hi/WCvqqG9zjLDS6EweEywnleisykaWi4X36IHtw6/OxUiCl2wZEprd+
 4jIiqaQMmCtJvyRiDZtGvu+Py8Q6Oy4CS09JkhWzbG/5hpMGexQvKplJ8
 Tu8llYeQ6hT9rUorKpyWDkwa4PFapYHu5AClszZBE069rae7XPgjdM0Zj
 sATSsuCkQw8gRZ74WdCrIgCgCzoXygF1ra9oVURitCkRe4JJm+iqPF1h/ A==;
X-CSE-ConnectionGUID: XepDLOWsQEyABh1p8huPxQ==
X-CSE-MsgGUID: Li5n/omYSbKgM4x5Ejm3IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30176171"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="30176171"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 16:24:39 -0700
X-CSE-ConnectionGUID: 4wBIdEJ+QKGO83A1F0elpg==
X-CSE-MsgGUID: eG4cPAmKTE2gFSYwjhk4yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="76320880"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2024 16:24:39 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/3] drm/xe/pmu: PMU interface for Xe
Date: Wed, 25 Sep 2024 16:21:56 -0700
Message-Id: <20240925232159.2057581-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Port i915 PMU event capture capability to Xe driver. This
has been requested by users of tools like gputop and turbostat
where PMU events are used to monitor GT freq and residencies.

Cc: Rui Zhang <rui.zhang@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (2):
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   6 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_gt.c           |   4 +
 drivers/gpu/drm/xe/xe_gt_idle.c      |  20 +-
 drivers/gpu/drm/xe/xe_gt_idle.h      |   1 +
 drivers/gpu/drm/xe/xe_module.c       |   5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 960 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  30 +
 drivers/gpu/drm/xe/xe_pmu_types.h    | 143 ++++
 include/uapi/drm/xe_drm.h            |  17 +
 11 files changed, 1186 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

