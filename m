Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD15C25B76
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 00:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2A310E469;
	Thu,  6 Jun 2024 00:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTJMIhCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D5F10E459
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 00:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717633186; x=1749169186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qswupWDW8Yd3l42qWTksWIeTbvZ2xsx8x2HRqFSkWEM=;
 b=VTJMIhCZTBSuSVydevrYimZPhkK/xF3M73b7TQwqbqQh1whwoYBzhF0C
 o+buDS7d80ead2Dz2SkbLYrlrJb4k7YZmQxJX29ePPBFTPEJbcdIr24Ct
 EsrMFeImzTxpaMh8KSiFfKFLWj4GhFbFAt1CCu3sWacCo6Wqnxnucmt2w
 eW2kyqrdIKgkAispOva/IHjq7nXQM1/nuAWGwbCsaFKIFSb6m2m5hTjOC
 F5dVtP6sOU+c3mp55SKjnrDuxZP84+gujEmZH/Nr1YD9+1Obw6qXQFxnk
 WKQf/uP+11XEF4ztwEd5ZKpJwVWL74h3IjEke0LOOkbwCfP37aQTh7i58 w==;
X-CSE-ConnectionGUID: 1XV+j+plToSIZgqgWRTBIA==
X-CSE-MsgGUID: eauHhOFdR2OMs2Uy3ls0NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31820034"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="31820034"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:46 -0700
X-CSE-ConnectionGUID: peTTi7xrRNyFmoptt/ZE4Q==
X-CSE-MsgGUID: 4OfkWmbNRpGj8xibXU8Bcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="38328622"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:45 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: [PATCH v4 0/6] Tracing cleanup and add mmio tracing
Date: Wed,  5 Jun 2024 17:18:08 -0700
Message-Id: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_ct.c              |  13 +-
 drivers/gpu/drm/xe/xe_migrate.c             |   2 +-
 drivers/gpu/drm/xe/xe_mmio.c                |  24 +-
 drivers/gpu/drm/xe/xe_pt.c                  |   8 +-
 drivers/gpu/drm/xe/xe_trace.h               | 381 ++++----------------
 drivers/gpu/drm/xe/xe_trace_bo.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_bo.h            | 248 +++++++++++++
 drivers/gpu/drm/xe/xe_trace_guc.c           |   9 +
 drivers/gpu/drm/xe/xe_trace_guc.h           | 111 ++++++
 drivers/gpu/drm/xe/xe_vm.c                  |   2 +-
 14 files changed, 495 insertions(+), 344 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.h

-- 
2.34.1

