Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8C2C83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 15:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2E710E550;
	Wed, 30 Aug 2023 15:23:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF52B10E550
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693408993; x=1724944993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FeJi2xLoJ9z3J0674gvz3fFcskFnq0JF1rEWn8+SZqo=;
 b=QpxbP+VZDBx1kY4XAEJsENRtwupx40yIW3RGq0TurzxVr/sJAeEsy8nl
 M2nyR++uVZ7q7vDjU8gchqUiuo6NN4C5NUxlR3yARcZ8zswzIDxLBbDLD
 qP9pjvEcZh+/nML1w2bDuPBCEa7sXpmdXiAGpKBwNQfEFvFZBA1PqdWq/
 p/CKVEZBtNPuN3hZmrlSVM5xdIUPfqpvsutsBHQFQ2VBGdOhGo8PVth26
 1Q8+RadqST5vjOqVAza5z7T1a9cOCtLCipUa3oM50L2kc8WsPXwJ2/mdk
 TJKrU9ETWqwK2MA8LxNNJmveU1l0o0FclWMlcoh3mmwXeOWr+EAjh2Fc7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355985592"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="355985592"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 08:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="985798103"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="985798103"
Received: from nbint65x-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.156])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 08:23:10 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 30 Aug 2023 17:22:48 +0200
Message-ID: <20230830152254.51134-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Convert to drm_exec
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

Thomas Hellström (6):
  drm/xe/bo: Simplify xe_bo_lock()
  drm/xe/vm: Simplify and document xe_vm_lock()
  drm/xe/bo: Remove the lock_no_vm()/unlock_no_vm() interface
  drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec
    helper
  drm/xe: Convert pagefaulting code to use drm_exec
  drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to
    drm_exec

 drivers/gpu/drm/xe/Kconfig            |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c      |  35 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c |   7 +-
 drivers/gpu/drm/xe/xe_bo.c            |  47 +--
 drivers/gpu/drm/xe/xe_bo.h            |  28 +-
 drivers/gpu/drm/xe/xe_bo_evict.c      |  19 +-
 drivers/gpu/drm/xe/xe_dma_buf.c       |   5 +-
 drivers/gpu/drm/xe/xe_exec.c          |  71 ++--
 drivers/gpu/drm/xe/xe_exec_queue.c    |   5 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c  | 117 +++----
 drivers/gpu/drm/xe/xe_lrc.c           |  12 +-
 drivers/gpu/drm/xe/xe_migrate.c       |  10 +-
 drivers/gpu/drm/xe/xe_vm.c            | 462 ++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm.h            |  30 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c    |  30 +-
 16 files changed, 381 insertions(+), 502 deletions(-)

-- 
2.41.0

