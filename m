Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096BDEDE9B4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 12:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80F110E562;
	Thu, 14 Sep 2023 12:11:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED1710E562
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 12:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694693484; x=1726229484;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m1ydN73zbm6Ph5t4iA9PRqGJZY0ixK710v+XOgSKpYY=;
 b=evr5CqSYpylxj6Y/b25S1mtSc/rmWfCLhtON6AsbKdXeIvcGYSOjkLeU
 OLV5zrxp2M/+E4qmKWzvs6DVwLe4FOOgk6Sh2v12hN0xrq25jqXdZUGVV
 I7FDBTWLa1/jff8dLKnWst/8XqeA8N6rQDwiXigPvwyXMyVlOvrE5tUmh
 AkFK9+XDOE9JxHiW8lQZmGJt5ndlTVu12NzyVhvAJF3n+ur3XssF2cuOD
 hUH7jw/h2uC42ZiuTGRIM2l/N90Oqc6TBI9GrhTVMBFxsM49AN6QxwnSv
 1WtHKqcBT1eugKKT9cQe8xck7xzJxaDTtV8eCSCEzEiwThTANu8mtad33 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377838115"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="377838115"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 05:11:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="918223757"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="918223757"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 14 Sep 2023 05:11:21 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 17:49:02 +0530
Message-Id: <20230914121909.3860392-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 0/7] drm/xe: fdinfo memory stats
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

This series enables enables fdinfo memory stats for xe.

I added tracking of most classes of bo (user bo, page tables, ring, lrc)
which contribute to client's memory usage. This follows similar lines to
what Rob's msm code and tvrtko's i915 code is doing with some xe way
of showing and tracking/fecthing objects which adds to client memory
stats.

Example fdinfo format:

#cat /proc/4620/fdinfo/3
pos:    0
flags:  0100002
mnt_id: 23
ino:    1140
drm-driver:     xe
drm-client-id:  19
drm-pdev:       0000:4d:00.0
drm-total-system:       0
drm-shared-system:      0
drm-active-system:      0
drm-resident-system:    0
drm-purgeable-system:   0
drm-total-gtt:  4 KiB
drm-shared-gtt: 0
drm-active-gtt: 0
drm-resident-gtt:       4 KiB
drm-total-vram0:        20 KiB
drm-shared-vram0:       0
drm-active-vram0:       0
drm-resident-vram0:     20 KiB
drm-total-vram1:        20 KiB
drm-shared-vram1:       0
drm-active-vram1:       0
drm-resident-vram1:     20 KiB

Testcase: https://patchwork.freedesktop.org/series/123264/#rev3

Tejas Upadhyay (7):
  drm/xe: Add drm-client infrastructure
  drm/xe: Interface xe drm client with fdinfo interface
  drm/xe: Add tracking support for bos per client
  drm/xe: Record each drm client with its VM
  drm/xe: Track page table memory usage for client
  drm/xe: Account ring buffer and context state storage
  drm/xe: Implement fdinfo memory stats printing

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |   9 ++
 drivers/gpu/drm/xe/xe_bo.h           |  11 ++
 drivers/gpu/drm/xe/xe_bo_types.h     |  10 ++
 drivers/gpu/drm/xe/xe_device.c       |  21 ++-
 drivers/gpu/drm/xe/xe_device_types.h |   6 +
 drivers/gpu/drm/xe/xe_drm_client.c   | 202 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h   |  71 ++++++++++
 drivers/gpu/drm/xe/xe_lrc.c          |   7 +-
 drivers/gpu/drm/xe/xe_pt.c           |   3 +
 drivers/gpu/drm/xe/xe_vm.c           |   8 ++
 drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
 12 files changed, 349 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h

-- 
2.25.1

