Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA188EB64DC
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jul 2023 06:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C69E10E653;
	Sat,  8 Jul 2023 06:43:48 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A528810E651
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jul 2023 06:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688798626; x=1720334626;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T3RWSR+lUp3qBOLTMoP6cnZ5I34uSfRFwXP6NvTqFuw=;
 b=fxO7VG6960nnqFPLGXaovqJZD4L/aVFvYK/ZXRtGqVtRMyj+9OrQD8sQ
 aAxd7uvFxYUmxsV2zEESQXWsx9uvO0+fTs4zJT+o0nKkiVJvP43kRyttS
 MAdxfLMziV+3WXf7j1XyEosmTJLK5Dx/i9BqmSx9u7QMZDSa9UCOJSb9D
 sjaec3p/YiWfd5IT4Nf0OK6l8V0QSe/TqyYLkFF0pUzNqc4lxt6uFzoaW
 JZ63166/OTbBQn+yt9Xbc+N1hCbpkQtXVzPcBjEEb6xUSA6kZe3+Rfja0
 VjZhShQ3PhzQnuz8KVLpRnx8RvqmJdqvap+jGIu1GeaK/9Z41Kg+nMJTw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="348834100"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="348834100"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 23:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="714240218"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="714240218"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 23:43:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri,  7 Jul 2023 23:43:53 -0700
Message-Id: <20230708064359.1743796-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/6] GPUVA with no uAPI changes
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

The patches from [1] rebased + address review feedback which do not
include uAPI changes. 

[1] https://patchwork.freedesktop.org/series/117156/

v2: Fix build error
v3: Fix lockdep splat CI caught
v4: Fix build error
v5: Pull in latest GPUVA versions

Danilo Krummrich (2):
  drm: manager to keep track of GPUs VA mappings
  drm: debugfs: provide infrastructure to dump a DRM GPU VA space

Matthew Brost (4):
  drm/xe: Ban a VM if rebind worker hits an error
  drm/xe: Add helpers to hide struct xe_vma internals
  drm/xe: Remove __xe_vm_bind forward declaration
  drm/xe: Port Xe to GPUVA

 Documentation/gpu/drm-mm.rst                |   36 +
 drivers/gpu/drm/Makefile                    |    1 +
 drivers/gpu/drm/drm_debugfs.c               |   40 +
 drivers/gpu/drm/drm_gem.c                   |    3 +
 drivers/gpu/drm/drm_gpuva_mgr.c             | 1743 ++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate.c       |    2 +-
 drivers/gpu/drm/xe/xe_bo.c                  |    9 +-
 drivers/gpu/drm/xe/xe_device.c              |    2 +-
 drivers/gpu/drm/xe/xe_engine.c              |   13 +
 drivers/gpu/drm/xe/xe_exec.c                |    8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   23 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
 drivers/gpu/drm/xe/xe_migrate.c             |   10 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  128 +-
 drivers/gpu/drm/xe/xe_pt.h                  |    2 +-
 drivers/gpu/drm/xe/xe_trace.h               |   15 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 1973 +++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                  |  106 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |   90 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |  183 +-
 include/drm/drm_debugfs.h                   |   25 +
 include/drm/drm_drv.h                       |    6 +
 include/drm/drm_gem.h                       |   52 +
 include/drm/drm_gpuva_mgr.h                 |  763 +++++++
 24 files changed, 3993 insertions(+), 1254 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 include/drm/drm_gpuva_mgr.h

-- 
2.34.1

