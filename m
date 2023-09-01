Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6F7CA0FE5
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 14:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670F310E7EA;
	Fri,  1 Sep 2023 14:26:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C5E10E7EA
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693578406; x=1725114406;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y5RV6rYErfmccVSDsfmJoc1N0gEVgn4rIzLOpLTEWHU=;
 b=Wg+oj2AmYcN1RczJ9IuqjvO4+P2P7MBCVXXtUqGlwfaOEgL/uNyTq5e+
 600L5XyAiYxhmel1EYjrBdjSv1rqbBJjVZTlxSwqh+ngyF9hbwAGM3M2V
 UsqhNGRqwuBDwRG1eGvyy46bpC94n4Vccm5bhOyx0w8CZMySHvjZ7XEJJ
 DFqy/T2kYFUWdZOKEuKY7c1QzoVP1kSP8VRYV1E0qZY3HZbCR7Ko4Duem
 8hVkXvYjeDpwTIcPajENkMG+6+TDJ+SJ2YmKzDeHDdUE/p3B851ePcujV
 zYQEsgJBCvENgO5V0FggQwooB/llxN6MAzDgWH3+U2hhkfDH0rZaMUPTP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366456576"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="366456576"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070766829"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="1070766829"
Received: from nabdull7-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.112])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:26:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 16:26:23 +0200
Message-ID: <20230901142629.4125-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/6] drm/xe: Convert to drm_exec
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
v4:
- Reinstate a lost dma_resv_reserve_fences().
- Improve on xe_bo_lock() documentation (Matthew Brost)
- Improve on xe_vm_lock() documentation (Matthew Brost)
- Kerneldoc xe_vm_prepare_vma()
- Remove an unbalanced xe_bo_put() (igt and Matthew Brost)

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
 drivers/gpu/drm/xe/xe_bo.c                   |  48 +-
 drivers/gpu/drm/xe/xe_bo.h                   |  28 +-
 drivers/gpu/drm/xe/xe_bo_evict.c             |  19 +-
 drivers/gpu/drm/xe/xe_dma_buf.c              |   5 +-
 drivers/gpu/drm/xe/xe_exec.c                 |  71 +--
 drivers/gpu/drm/xe/xe_exec_queue.c           |   5 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c         | 117 ++---
 drivers/gpu/drm/xe/xe_lrc.c                  |  12 +-
 drivers/gpu/drm/xe/xe_migrate.c              |  10 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 475 +++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                   |  30 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c           |  30 +-
 18 files changed, 397 insertions(+), 509 deletions(-)

-- 
2.41.0

