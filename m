Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C80C83F2B
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 06:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672E210E25C;
	Thu, 31 Aug 2023 06:46:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90EC10E170
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 06:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693464398; x=1725000398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ddjs6zEBACrueya5pz8QIsQR3wiO8CYG+jv7on9QYHQ=;
 b=KHJXYpTuORfliFBCN0CslrI0icOedvosihksxNYppw4v26LEThNYw9U+
 R7kKoQvbMWz4AaQyVXuz0XwZ8Qj39bA7UjkT2l5Jts3/BbuPGaPkLSBnR
 4hegFA0nt97mQQ3DS8SL+1GI2uUBl9oLL5LfAkKmfCFmPbptXFmUPtXS1
 lDszI4rCrED4W2Hoz3gacJGrNR/TAyHUntec4UwCYK9+RtbNAXSVqQx7m
 JRCHiGNhg3FLfQlf8uADN63Tz9SeD1xMMwFkWIDPJvR6fcJa79T9gCZE5
 Bw2p/YNW7DhPZQFlPaWOwaIlRLzvcrwK7w8+PsIYgUSNjQcCgehk1vWEc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379584507"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="379584507"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 23:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="913096565"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="913096565"
Received: from sorenthe-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 23:46:37 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 08:46:10 +0200
Message-ID: <20230831064616.96445-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] drm/xe: Convert to drm_exec
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
 drivers/gpu/drm/xe/xe_vm.c                   | 462 +++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                   |  30 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c           |  30 +-
 18 files changed, 385 insertions(+), 507 deletions(-)

-- 
2.41.0

