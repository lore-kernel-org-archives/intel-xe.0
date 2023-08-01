Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1ABEB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 06:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8769910E0D6;
	Tue,  1 Aug 2023 06:38:02 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0862A10E0D6
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 06:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690871880; x=1722407880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j0MYHCZg3hVCfXjVApi5BcmfyWcFuRFH0CrqePfFLJo=;
 b=O5yIaI04OfliS6vyTVcf6DdFsX/uGf7HaLqDM4we5vLAW3QqE6IyhiPG
 szvt0lWj3FMHtG4WMe/7DKCMXh2qH5UvUEliM0WwLrtA8F6VAmKOTDl9l
 hjJVZUeZ25xVrL7k6bA38OXYp94txQ1GYYWKlLCZA/Tzzl534tvMohtat
 TjWDS9PDM/0UF03QXrr1P9N1nZ1g1AqJUekuENzdGp4RTUnsxoVGJBmpf
 DpC4KGP1fS8NW1ILwHexP092qSbzLopqoPxovOPVvHbk5i7otGWbpb6Y2
 EAz66q2E4aR97uao1EDwXsRQvZDiTicRIQ8mddLMMwsqwuPwLZNP0zI+M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="349508366"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="349508366"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 23:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="794023621"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="794023621"
Received: from etrunovx-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.36.142])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 23:37:59 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  1 Aug 2023 06:37:49 +0000
Message-Id: <20230801063750.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] Rename engine to exec_queue
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
Cc: Francois Dugast <francois.dugast@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is an attempt to rename engine to exec queue in order to prevent confusion
between engine and hw engine, as discussed here:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/162

Looking for feedback on potential mixups between engine and hw engine, either
because an occurrence of hw engine has incorrectly been renamed to exec queue
or because an occurrence of engine has not been renamed to exec queue.

v2:
  - No longer sent as RFC
  - Fix kernel doc and some comments

Francois Dugast (1):
  drm/xe: Rename engine to exec_queue

 drivers/gpu/drm/xe/Makefile                   |    2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |   18 +-
 drivers/gpu/drm/xe/xe_bb.c                    |   26 +-
 drivers/gpu/drm/xe/xe_bb.h                    |    8 +-
 drivers/gpu/drm/xe/xe_devcoredump.c           |   40 +-
 drivers/gpu/drm/xe/xe_devcoredump.h           |    6 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |    2 +-
 drivers/gpu/drm/xe/xe_device.c                |   62 +-
 drivers/gpu/drm/xe/xe_device.h                |    8 +-
 drivers/gpu/drm/xe/xe_device_types.h          |    4 +-
 drivers/gpu/drm/xe/xe_engine.c                |  850 -------------
 drivers/gpu/drm/xe/xe_engine.h                |   63 -
 drivers/gpu/drm/xe/xe_exec.c                  |   62 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  850 +++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h            |   63 +
 ...e_engine_types.h => xe_exec_queue_types.h} |  110 +-
 drivers/gpu/drm/xe/xe_execlist.c              |  126 +-
 drivers/gpu/drm/xe/xe_execlist_types.h        |    8 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   72 +-
 drivers/gpu/drm/xe/xe_gt_types.h              |    6 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |    2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   10 +-
 ...gine_types.h => xe_guc_exec_queue_types.h} |   26 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h              |    6 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            | 1076 ++++++++---------
 drivers/gpu/drm/xe/xe_guc_submit.h            |   20 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h      |   20 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |    4 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |   10 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |    4 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   66 +-
 drivers/gpu/drm/xe/xe_migrate.h               |    6 +-
 drivers/gpu/drm/xe/xe_mocs.c                  |    2 +-
 drivers/gpu/drm/xe/xe_mocs.h                  |    2 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c         |   32 +-
 drivers/gpu/drm/xe/xe_preempt_fence.h         |    4 +-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h   |    7 +-
 drivers/gpu/drm/xe/xe_pt.c                    |   18 +-
 drivers/gpu/drm/xe/xe_pt.h                    |    6 +-
 drivers/gpu/drm/xe/xe_query.c                 |    4 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |   38 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |   76 +-
 drivers/gpu/drm/xe/xe_sched_job.h             |    4 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h       |    6 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  140 +--
 drivers/gpu/drm/xe/xe_vm.c                    |  178 +--
 drivers/gpu/drm/xe/xe_vm.h                    |    4 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |    6 +-
 include/uapi/drm/xe_drm.h                     |   86 +-
 49 files changed, 2124 insertions(+), 2125 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_engine.c
 delete mode 100644 drivers/gpu/drm/xe/xe_engine.h
 create mode 100644 drivers/gpu/drm/xe/xe_exec_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_exec_queue.h
 rename drivers/gpu/drm/xe/{xe_engine_types.h => xe_exec_queue_types.h} (52%)
 rename drivers/gpu/drm/xe/{xe_guc_engine_types.h => xe_guc_exec_queue_types.h} (59%)

-- 
2.34.1

