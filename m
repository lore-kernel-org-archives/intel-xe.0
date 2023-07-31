Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831ABC001DE
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 16:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F3210E2BF;
	Mon, 31 Jul 2023 16:09:37 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0710E2BA
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690819774; x=1722355774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qrFJFlYgczoSXwMnjbrIadjFL0FlUi3dExiyA8SpxMc=;
 b=Gf+/o7utg/yYMOoYwwKle1RVpUB+UGgtrVz2BCeUB0LBn66lYW95jLIt
 5BhYHthWpV81u0cjFQZkECalCeeDttcNvPT9iTbiMowczV68hUl75yi+l
 ghBiRy3EywOUEKCevTnTqljXiYOGEq05MTHofVUnr28RJ6vUlO5IVNkXz
 fWGiNmDyfhHVbWK3sonk51Lm3/rsCiGQU5i85o1+Uiq6+/0XJY3Wfcw8z
 FjBnKGjCfgaSCDa6/5zTx33kdymgZSG5kIV1hAzCVC9R/s9MuZVFSKOc7
 stbqDN6Gc7toG5TQW+2SNOLuGOKUg0gz75dxgwQmfXU66q6u+CJaeV3LM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400006561"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="400006561"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798292201"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="798292201"
Received: from ttellerx-mobl1.ger.corp.intel.com (HELO 1655ee4c191f.intel.com)
 ([10.251.209.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:08:59 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 31 Jul 2023 16:08:48 +0000
Message-Id: <20230731160849.6-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/1] Rename engine to exec_queue
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is an attempt to rename engine to exec queue in order to prevent confusion
between engine and hw engine, as discussed here:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/162

Sending as RFC to get feedback on potential mixups between engine and hw engine,
either because an occurrence of hw engine has incorrectly been renamed to exec
queue or because an occurrence of engine has not been renamed to exec queue.

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
 drivers/gpu/drm/xe/xe_device_types.h          |    2 +-
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
 ...gine_types.h => xe_guc_exec_queue_types.h} |   10 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h              |    6 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            | 1074 ++++++++---------
 drivers/gpu/drm/xe/xe_guc_submit.h            |   20 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h      |   20 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |    4 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |   10 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |    4 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   62 +-
 drivers/gpu/drm/xe/xe_migrate.h               |    6 +-
 drivers/gpu/drm/xe/xe_mocs.c                  |    2 +-
 drivers/gpu/drm/xe/xe_mocs.h                  |    2 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c         |   32 +-
 drivers/gpu/drm/xe/xe_preempt_fence.h         |    4 +-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h   |    5 +-
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
 49 files changed, 2111 insertions(+), 2112 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_engine.c
 delete mode 100644 drivers/gpu/drm/xe/xe_engine.h
 create mode 100644 drivers/gpu/drm/xe/xe_exec_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_exec_queue.h
 rename drivers/gpu/drm/xe/{xe_engine_types.h => xe_exec_queue_types.h} (52%)
 rename drivers/gpu/drm/xe/{xe_guc_engine_types.h => xe_guc_exec_queue_types.h} (88%)

-- 
2.34.1

