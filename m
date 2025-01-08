Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E3DE77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 18:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520EB10E439;
	Wed,  8 Jan 2025 18:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNEwrEg9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B153510E439
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 18:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736359377; x=1767895377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l6+G1JJAfpCEjJgj7U11EMA1juBb/pnDs7RDd8ffSTQ=;
 b=WNEwrEg9MvvU03+mgwQui8lnnA+X3nWe5v/+uV92iJcwAXXn+G5YQVEX
 geY68YUqXmKTnbDAo1QV70l80DSczchoaljwo8IGNFZM7vpjLKmJFaV8U
 ltoSWsJCEtPcz2Fe0Hd5nu72cab/dwf9pzwzILxE1RJOV9bKTTb016wWN
 Bj0H28qb5x4Ft1q35rlDd3NUlrsce8hgaSvRXyhhkt0lzRcGm7Dj5IbmG
 Er9YcqOt1ohHKX2a4DmClYgj/HbXX3tm2zs0pXcD22J00WwS/7Bl2qxQq
 S/KJzkvwsjzum+e8Jnn+pGb0eotFV1u3dv0M+jgKo15f1QU55HIltC0no Q==;
X-CSE-ConnectionGUID: mU+4KXidTVmSxJoH0hNqxA==
X-CSE-MsgGUID: FIxhTLEvS0SHyhPGEL2O7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36762052"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="36762052"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 10:02:57 -0800
X-CSE-ConnectionGUID: HOx9yjILTxy+atsid/Emvg==
X-CSE-MsgGUID: yN95WAiLTjCmgW/PqEtIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="103232829"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa006.jf.intel.com with ESMTP; 08 Jan 2025 10:02:56 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v12 0/4] drm/xe/pmu: PMU interface for Xe
Date: Wed,  8 Jan 2025 09:59:19 -0800
Message-Id: <20250108175923.2160130-1-vinay.belgaumkar@intel.com>
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
where PMU events are used to monitor GT freq and C6 residencies.

v10: Fix a leaked ref in pmu_enable(Riana)
v11: Acquire runtime ref before pmu lock
v12: Review comments (Rodrigo and Riana)

Cc: Rui Zhang <rui.zhang@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (3):
  drm/xe: Add locks in gtidle code
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile           |    2 +
 drivers/gpu/drm/xe/xe_device.c        |    3 +
 drivers/gpu/drm/xe/xe_device_types.h  |    4 +
 drivers/gpu/drm/xe/xe_gt.c            |    5 +
 drivers/gpu/drm/xe/xe_gt_idle.c       |   23 +-
 drivers/gpu/drm/xe/xe_gt_idle.h       |    1 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h |    3 +
 drivers/gpu/drm/xe/xe_module.c        |    5 +
 drivers/gpu/drm/xe/xe_pmu.c           | 1062 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h           |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h     |  153 ++++
 11 files changed, 1288 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

