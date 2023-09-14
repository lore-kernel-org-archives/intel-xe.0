Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAA2EEAA71
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 20:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC2B10E15D;
	Thu, 14 Sep 2023 20:40:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4AF10E15D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 20:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694724040; x=1726260040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eRDt4M2aRf3kLRFmpObROFaOOrPJeHJ4Uxzql3igvjc=;
 b=aqoK+AvgKKvtqpwhaADAdLUs3M16N/709VvwnvHYh/fphJjRSu3ReBrQ
 nO6jgff7X3LrZ8jOSViI+tqz5yfEkzchsCNuS+2nx5/q9XEQWmVvdduJt
 bjgxZ4wcd/aVkiKMOuUZwsKAgLxinL/grYDTlMEVrbjfZZjF6OK+p22PH
 bUxy2ay30bSCwq7iGxs/rnoOqLuI7k/aRQBBlIUkK6UeGkhQXFa/YrICq
 JHDrkiH4OJU5GfTsL5TiUtN+uyVXiKIlqZowc5oTM5CkilouyhUJ0eP53
 DtaltyiFZ5Yv09o3iNCmpvM/raIbOFI9N+mnuUvM0YklYklsUhfypJ++D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369369361"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="369369361"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 13:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="694453569"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="694453569"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 13:40:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 14 Sep 2023 13:40:47 -0700
Message-Id: <20230914204053.2220281-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] uAPI changes to align with async binds
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

No error handling for cases where binds fail under memory pressure but
enough to stablize uAPI for upstreaming.

Matthew Brost (5):
  drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
  drm/xe: Remove async worker and rework sync binds
  drm/xe: Fix VM bind out-sync signaling ordering
  drm/xe: Allow num_binds == 0 in VM bind IOCTL
  drm/xe: Allow num_batch_buffer == 0 in exec IOCTL

Rodrigo Vivi (1):
  drm/xe/uapi: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS
    extension

 drivers/gpu/drm/xe/xe_exec.c             |  65 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       |  85 ++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |   7 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   9 +
 drivers/gpu/drm/xe/xe_sync.c             |  19 +-
 drivers/gpu/drm/xe/xe_sync.h             |   4 +-
 drivers/gpu/drm/xe/xe_vm.c               | 737 +++++------------------
 drivers/gpu/drm/xe/xe_vm.h               |   2 -
 drivers/gpu/drm/xe/xe_vm_types.h         |  42 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c  |  43 +-
 include/uapi/drm/xe_drm.h                |  90 +--
 11 files changed, 307 insertions(+), 796 deletions(-)

-- 
2.34.1

