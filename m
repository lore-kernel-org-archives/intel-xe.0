Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB6EEB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 20:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDB210E3F4;
	Thu, 29 Jun 2023 20:10:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF93410E0B4
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 20:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688069436; x=1719605436;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6EGtTCS1i/UX6+SBmEU0i+ft3M3sc1chwwJK51I5OLI=;
 b=euInI01YznNXbyJDCUwW5ZdkX4PiOhQG1+Kxn5/3xtS3WXty5pXJ7WkD
 terLHBLOr6ZDO0nm2IuQ2jXMoVWF9DOXfOsnMAmFbCCezLp7R/kVcjh6r
 14gaLTLD9lWMp1/B0cDVT1WI9+EMP3mfbmt0bDRwLuYaOWaf/R2MS/58m
 ftudL7QoK3oT9aaTnAv0KnLS6+hS9Tp5VhzLj6uVoXG4x0qOZ8BsTzZSw
 WzpTv/8j4cHYOtZfn7TrnVyDu90aRfBJqZ5jgJiRekPqU23bNUAU2sS1P
 WzSGWypMPjGiWJxIVq7DMjZ89RSPfUWalNE7BRp+BpAT7rZVuaG+UMIzD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352039539"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="352039539"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711569603"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="711569603"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:10:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 29 Jun 2023 13:10:37 -0700
Message-Id: <20230629201046.989033-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/9] GPUVA with no uAPI changes
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

Danilo Krummrich (3):
  maple_tree: split up MA_STATE() macro
  drm: manager to keep track of GPUs VA mappings
  drm: debugfs: provide infrastructure to dump a DRM GPU VA space

Matthew Brost (6):
  drm/xe: Ban a VM if rebind worker hits an error
  drm/xe: Add helpers to hide struct xe_vma internals
  maple_tree: Export mas_preallocate
  drm/xe: Remove __xe_vm_bind forward declaration
  drm/xe: Port Xe to GPUVA
  drm/xe: Avoid doing rebinds

 Documentation/gpu/drm-mm.rst                |   42 +
 drivers/gpu/drm/Makefile                    |    1 +
 drivers/gpu/drm/drm_debugfs.c               |   41 +
 drivers/gpu/drm/drm_gem.c                   |    3 +
 drivers/gpu/drm/drm_gpuva_mgr.c             | 1971 ++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate.c       |    2 +-
 drivers/gpu/drm/xe/xe_bo.c                  |    9 +-
 drivers/gpu/drm/xe/xe_device.c              |    2 +-
 drivers/gpu/drm/xe/xe_engine.c              |   13 +
 drivers/gpu/drm/xe/xe_exec.c                |    8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   23 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
 drivers/gpu/drm/xe/xe_migrate.c             |   10 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  129 +-
 drivers/gpu/drm/xe/xe_pt.h                  |    2 +-
 drivers/gpu/drm/xe/xe_trace.h               |   15 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 2011 ++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h                  |  104 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |   91 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |  175 +-
 include/drm/drm_debugfs.h                   |   25 +
 include/drm/drm_drv.h                       |    6 +
 include/drm/drm_gem.h                       |   52 +
 include/drm/drm_gpuva_mgr.h                 |  682 +++++++
 include/linux/maple_tree.h                  |    7 +-
 lib/maple_tree.c                            |    1 +
 26 files changed, 4186 insertions(+), 1253 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 include/drm/drm_gpuva_mgr.h

-- 
2.34.1

