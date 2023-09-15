Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDAEEED61A
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 18:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BDB10E663;
	Fri, 15 Sep 2023 18:17:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAC010E663
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694801830; x=1726337830;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aUj7wBQzqZNk4CQopi4zWzljvNgvHBDjQQrybIMWofI=;
 b=KeGCKb2uXEvHBdSnOGkdGND0l2pNhZYlCGD+CPBT9/1+vpbYTVV1cECa
 q/vlRJSjdXyauliE5MS9P3sUAJVTM9sqY7NB/gEvte3TVGoaC2BUH2B3D
 iYs1964ksF9le26XVPRzjRUx7xi00sxQDd6qCmSTTRx8RKdYkbrcxmVAt
 IVO+CDeYbgBTV4g/1w8fvExOS2NLq/5+9bqTj+2mAKt/auBGL3ta0Z+EZ
 T7kQlbRsMZ6lrP9mAb/cy8U2cjkewH+j/6vd+J907DgrjnKhTITPI54KK
 p5cK11HhERtOXD8EhB4UYU7nuttx0sQ3Kn2ZBG+TIkzN4FRQImFs9fnhj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445786730"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445786730"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918733512"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="918733512"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 15 Sep 2023 11:17:07 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 23:54:50 +0530
Message-Id: <20230915182457.3951938-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4 0/7] drm/xe: fdinfo memory stats
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

Testcase: https://patchwork.freedesktop.org/series/123264/#rev4

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
 drivers/gpu/drm/xe/xe_drm_client.c   | 204 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h   |  71 ++++++++++
 drivers/gpu/drm/xe/xe_lrc.c          |   7 +-
 drivers/gpu/drm/xe/xe_pt.c           |   3 +
 drivers/gpu/drm/xe/xe_vm.c           |   8 ++
 drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
 12 files changed, 351 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h

-- 
2.25.1

