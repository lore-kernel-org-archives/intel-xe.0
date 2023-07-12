Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A1EEB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jul 2023 16:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F8810E595;
	Wed, 12 Jul 2023 16:38:01 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F2510E595
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jul 2023 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689179879; x=1720715879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XxfRkkyyUlyDqWCVbPVamR2dRgzEmkV8Gh0Put0NuXU=;
 b=SnMZ5D8hQSfjyqkaTnPb6n3/p9irulAC1+4QeA+/9jtSccLeAsl9PM2b
 ezcoBSvT6dAZvQTbUnvEsDUSiqJ4LdkSMtKIEfxgj++N5h7U1mw+9yad1
 Qij1bU2jVpi+wLrOQw+lx3ZvyZrbMOpCrNYkxSR+sXzwmSYAPeuNk9ftv
 8X35ePDMNPssG3Ru/48B8iNhdctQiUoPxjoBfHgNzidb6NxEEiVDgBVlt
 c27UWLhZtX2rOLGArAgUW6IeQmE+NzWXyXwBTBO4zkgQy/7WzXpJOgRgR
 9sLytZ3Eutfyjaw5Co2PD0265LJIOCmhAFLWCnf/KaRtstW3Cz6MidBKk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="349792278"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="349792278"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 09:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="835215323"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="835215323"
Received: from rvuia-mobl.ger.corp.intel.com (HELO 4e597ddea7eb.intel.com)
 ([10.251.221.170])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 09:37:56 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Jul 2023 16:37:38 +0000
Message-Id: <20230712163740.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe: switch to using drm_exec
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
Cc: Francois Dugast <francois.dugast@intel.com>, christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make Xe use the latest version of drm_exec (the execution context for GEM buffers v5) which is not
merged yet, see: https://patchwork.freedesktop.org/series/112995/#rev6.

This series is a follow-up of: https://patchwork.freedesktop.org/series/116774/.

Early tests seem ok but please review / test thoroughly.

Christian König (1):
  drm: execution context for GEM buffers v5

Francois Dugast (1):
  drm/xe: switch to using drm_exec

 Documentation/gpu/drm-mm.rst                 |  12 +
 drivers/gpu/drm/Kconfig                      |   6 +
 drivers/gpu/drm/Makefile                     |   2 +
 drivers/gpu/drm/drm_exec.c                   | 330 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.c |   7 +-
 drivers/gpu/drm/xe/Kconfig                   |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c             |  26 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c        |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                   |  41 ++-
 drivers/gpu/drm/xe/xe_bo.h                   |   6 +-
 drivers/gpu/drm/xe/xe_bo_evict.c             |  24 +-
 drivers/gpu/drm/xe/xe_bo_types.h             |   1 -
 drivers/gpu/drm/xe/xe_engine.c               |   7 +-
 drivers/gpu/drm/xe/xe_exec.c                 |  30 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c         |  55 +---
 drivers/gpu/drm/xe/xe_lrc.c                  |   8 +-
 drivers/gpu/drm/xe/xe_migrate.c              |  13 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 292 ++++++++--------
 drivers/gpu/drm/xe/xe_vm.h                   |  32 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c           |  37 ++-
 include/drm/drm_exec.h                       | 120 +++++++
 21 files changed, 734 insertions(+), 322 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

-- 
2.34.1

