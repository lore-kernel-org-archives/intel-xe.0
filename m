Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D46FC04A94
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 10:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900E710E0CA;
	Tue,  1 Aug 2023 10:48:58 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8CA10E0CA
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 10:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690886936; x=1722422936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GFmuZVwApXpOXUlQo4+W9rsM1H+lIphaH5jeyz579tQ=;
 b=MQ9JEpw/BMlv55tRNkjimuAPtqoW9bR1VIXqn5GnXLAhtkB6Q3aQG5/Q
 O7MNKyHpse2N/ourTyT2AMY1pJH8aydJioVNT50+3X+vl6KF/Ed5FpCux
 pA6pB/OYlKP13HAGej1LHwt/ODQVcP2UGEuWC8CZHPGP3L0+5neavowUu
 rSKSgjmvgb1c0QAYaKqnahSICWMJWErSH75PZGvPp5ayTHJOQI2y3OH6P
 4sC9jKzS4wPV/hkW7tjc1Qz8YcJiNLjpWoy78c1oIr32XT8EtgxZ3oSvv
 SbNtjNMXLKtgbKsN6jWCXLg338heZuB8OdW5CQPfieEdVXW92wo9vqs1c g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371977812"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="371977812"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 03:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763714881"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="763714881"
Received: from aboros-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.210.9])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 03:48:54 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  1 Aug 2023 10:48:40 +0000
Message-Id: <20230801104842.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] Rename engine to exec_queue
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

v3: Rename xe_engine.[ch] in a separate commit to keep history

Francois Dugast (2):
  drm/xe: Rename xe_engine.[ch] to xe_exec_queue.[ch]
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

