Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADB5C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 15:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E71610EAAB;
	Thu, 30 May 2024 15:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XL/5qluR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0002310E8DB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082086; x=1748618086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qRZiu69DUUHeh3ELfnjNxze52i4h9hboFS4pTy1HO/Y=;
 b=XL/5qluRZ2/N/ogHb66UszdRklC+M1K+eAhnaTf7RoJH1Q7wn9SiVzsx
 peCzaJYUfFAI6oPVP5AxDIxhgvY35GLAm1x2KbFvkPOvpcaXrjMhSvxQF
 Qq0AlrZbSgtwV9KobPXRHl0oHjnqc6jYDp0y1zLIvsXN/+itGt5N8AEL0
 6ElA+eLGHF9H6vMIY/OmF3qdXWh2R9FD2rLhM6EvqsEMl+efdOQwwfzqL
 GlIcrSz4KQNJrGxHBC8B8d7B8OWG1yCbEledLjK+cMsfC+9k4uFqxqgrF
 oXc3GTKaVeMVqfAcXjDrLi9tLHLaneBEacB/v1gKgkBeTDSrz6re8YoFx A==;
X-CSE-ConnectionGUID: /e9ZtnqTS2W272J6DWDYyQ==
X-CSE-MsgGUID: Z4EAJw4BR6+qMuhILOuWHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24695858"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24695858"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:41 -0700
X-CSE-ConnectionGUID: qRyKIzsJRmiRC9RpL89lwQ==
X-CSE-MsgGUID: huY307lTTvewBP9NyeTF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36326433"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:41 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: [PATCH v3 0/6] Tracing cleanup and add mmio tracing
Date: Thu, 30 May 2024 08:13:07 -0700
Message-Id: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
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

xe_trace.h is getting bloated. Group related events to their own
files. All bo, vm and vma related events have been moved to 
xe_trace_bo.h. GuC related trace events have been moved to
xe_trace_guc.h. Patches 1 and 2 splits the trace events into
seperate files.

In multi gpu environments, it is important to know the device from
which the event was triggered. Print the device id information along
with the trace information being printed. Patches 3, 4 and 5 make
changes to print the device id's if not already captured.

Mmio reg read writes are important tracing information that needs to be
captured and will be helpful in display debug. Patch 6 adds the reg
read/write tracing support.

Earlier versions of patch 6 can be found here:
v1: https://patchwork.freedesktop.org/series/119312/
v2: https://patchwork.freedesktop.org/series/132626/

Radhakrishna Sripada (6):
  drm/xe/trace: Extract bo, vm, vma traces
  drm/xe/trace: Extract guc related traces
  drm/xe/trace: Print device_id in xe_trace_bo events
  drm/xe/trace: Print device_id in xe_trace_guc events
  drm/xe/trace: Print device_id in xe_trace events
  drm/xe: Add reg read/write trace

 drivers/gpu/drm/xe/Makefile                 |   2 +
 drivers/gpu/drm/xe/xe_bo.c                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  27 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |  15 +-
 drivers/gpu/drm/xe/xe_migrate.c             |   2 +-
 drivers/gpu/drm/xe/xe_mmio.c                |  22 +-
 drivers/gpu/drm/xe/xe_pt.c                  |   8 +-
 drivers/gpu/drm/xe/xe_trace.h               | 368 +++-----------------
 drivers/gpu/drm/xe/xe_trace_bo.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_bo.h            | 244 +++++++++++++
 drivers/gpu/drm/xe/xe_trace_guc.c           |   9 +
 drivers/gpu/drm/xe/xe_trace_guc.h           | 107 ++++++
 drivers/gpu/drm/xe/xe_vm.c                  |   2 +-
 14 files changed, 480 insertions(+), 339 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.h

-- 
2.34.1

