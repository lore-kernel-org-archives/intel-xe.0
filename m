Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC7EC83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 09:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1926A10E5DC;
	Thu, 31 Aug 2023 09:29:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954B510E5DC
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693474195; x=1725010195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yOzql30TLzQ+12YUYiLVnq1ngmubyI0QiphHxfkARZg=;
 b=cBFMvPpKVyJEpiKiNEcD3e5wM0Oc23JjuW/R1qpj5R4EXMxfHcp/t1/T
 HPJQZZmV8K4S1VkDX4wCEitu12TwPCxW2PXkatm7kDMIx1v4xhNOH1Gy0
 Ob//OFygMrQkTJ8w/j+XsZgoi3xOc+LaVJvx6FS6dX6wZUSZvmc3R+vWY
 UJwoZeZy0BVG3O8MsL8+yzFik33at8w+yC0oX21LFQsiKvD2NNofZTKeo
 554ns8YgwhpdCL0kiKw7EbinZHTJh5ICZX8bb53QOKs5Iq9/mH34Junvf
 t+02uXmGaBZHXHJpIAP52QM8QcpUOYgxsh9pCimNujnQNf+qUNqPZzYk2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442241441"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="442241441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774465673"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="774465673"
Received: from zhanfan-mobl2.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.112])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:29:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 11:29:31 +0200
Message-ID: <20230831092937.2197-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/6] drm/xe: Convert to drm_exec
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

Convert the driver to use drm_exec instead of ttm_eu_reserve_buffers().

v2:
- Update also the xe display subsystem.
v3:
- Rebase to fix compilation failure with latest drm-xe-next.
- Disallow duplicate locks also in the rebind worker, where it was
  previously needed in a draft version.

Thomas Hellström (6):
  drm/xe/bo: Simplify xe_bo_lock()
  drm/xe/vm: Simplify and document xe_vm_lock()
  drm/xe/bo: Remove the lock_no_vm()/unlock_no_vm() interface
  drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec
    helper
  drm/xe: Convert pagefaulting code to use drm_exec
  drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to
    drm_exec

 drivers/gpu/drm/i915/display/intel_display.c |   5 +-
 drivers/gpu/drm/i915/display/intel_fb.c      |   4 +-
 drivers/gpu/drm/xe/Kconfig                   |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c             |  35 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c        |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c        |   7 +-
 drivers/gpu/drm/xe/xe_bo.c                   |  47 +-
 drivers/gpu/drm/xe/xe_bo.h                   |  28 +-
 drivers/gpu/drm/xe/xe_bo_evict.c             |  19 +-
 drivers/gpu/drm/xe/xe_dma_buf.c              |   5 +-
 drivers/gpu/drm/xe/xe_exec.c                 |  71 +--
 drivers/gpu/drm/xe/xe_exec_queue.c           |   5 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c         | 117 ++---
 drivers/gpu/drm/xe/xe_lrc.c                  |  12 +-
 drivers/gpu/drm/xe/xe_migrate.c              |  10 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 456 +++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                   |  30 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c           |  30 +-
 18 files changed, 379 insertions(+), 507 deletions(-)

-- 
2.41.0

