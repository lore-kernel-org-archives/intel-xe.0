Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029EDEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 17:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1D310E4DF;
	Fri, 30 Jun 2023 17:58:19 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFE210E4DB
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 17:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688147878; x=1719683878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9nFoIOie2eziSTtZTghEcs7vomsQjQdRjTlYSwTVQJ8=;
 b=lRRjUk4XVU1eDzH/p9M4qqPxVHGTuaxwJrYj2wNvS1HhyAMKeMZaYhIh
 uP578Al+rcQJcktoaWiweJnyYRMEqi+8UbvmpspAmta5kMbeFxoeqvXSF
 /uLSz2iZxDWYIa9ky2+vm2Ee8/zOTMXLAMqXyiAN8Is/5ksIXRx7ft0zx
 6onuijcgC5yrJdFZ3lPpgiqDYnydIWqzQRtJF+ouHUyIzk5U1yPwMGVPZ
 1/ok1hf68rWZn2xvxcxv2ry4ZeP3QgDDZzh7nH7ai4Mtyf03fuBj0uJWU
 ZYabH9pwIZ66qmmPVPNIO56NkFv29zLo9RLep4ZNriMvBh+oY69wT5wcW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="365942720"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="365942720"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841925436"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="841925436"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:57:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 30 Jun 2023 10:57:55 -0700
Message-Id: <20230630175804.1096370-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/9] GPUVA with no uAPI changes
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
 drivers/gpu/drm/xe/xe_vm.c                  | 2009 ++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h                  |  104 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |   91 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |  175 +-
 include/drm/drm_debugfs.h                   |   25 +
 include/drm/drm_drv.h                       |    6 +
 include/drm/drm_gem.h                       |   52 +
 include/drm/drm_gpuva_mgr.h                 |  682 +++++++
 include/linux/maple_tree.h                  |    7 +-
 lib/maple_tree.c                            |    1 +
 26 files changed, 4186 insertions(+), 1251 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 include/drm/drm_gpuva_mgr.h

-- 
2.34.1

