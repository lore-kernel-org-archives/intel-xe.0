Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89328D637DF
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 01:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4B410E311;
	Wed, 17 Dec 2025 01:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfjceaJx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B01210E311
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 01:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765934793; x=1797470793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EPPt2f6aNdr78zjsyuF9OHjN+tZtAQzjo8s+tIldVh8=;
 b=EfjceaJx2woNUSny8glke5Ktw+te1ljMDmw9h84/HWeRSXCY8cP5sioZ
 wkKqlV7M63KAJOAcx/hLahjRzUV1eOotc/4vXyCif9QH9HZKTv1e4Q+5s
 qL++OQMEjm9pls9zD67pB+zl5suvxtACHiHqa2ArHXRuaR7N63Q4yy0kO
 hGC9IvY0v+BgpBLMouJ2VXY6o513uUorhkZAgYrPfZxNc4Eid/MQIkBlG
 zHzhIyW3FUqUmJskzlU8XvlYac1Eiddz53ThgAPX5KFEwDXQ8iIW4IBVU
 Ule1mPh5TOa1nTK6PxkpsvBdhxEJuiBqUBHttozZctID5VkMZCFNs2+a7 w==;
X-CSE-ConnectionGUID: 6sR9d8EUTqaWber3uWOG1g==
X-CSE-MsgGUID: DqphiAMMSh6SJmA0hvB6hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67903825"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67903825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:33 -0800
X-CSE-ConnectionGUID: eSN+eqpoQV2YDxrhwYEu3g==
X-CSE-MsgGUID: LgtyaVy9Qfy5DSOfBKzWFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="202360587"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:32 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 00/13] Introduce SRIOV scheduler groups
Date: Tue, 16 Dec 2025 17:26:20 -0800
Message-ID: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The normal SRIOV setup timeslices the whole GT across VFs. While this is
fine in the great majority of cases, in some cases the admin knows that
a VF is not going to use all the GT HW and that some engines are going
to be permanently idle.
To increase HW utilization in such a scenario, starting from v70.53.0 the
GuC supports scheduler groups (a.k.a. Engine Group Scheduling or EGS);
this feature allows the driver to subdivide a GT into groups of engines,
which the GuC will then independently timeslice across VFs, thus allowing
multiple VF to access the HW at the same time. Given that each group is
independently scheduled, execution quantums and preemption timeouts are
settable per-group-per-VF. Note that while the GuC supports the feature
from v70.53.0, some fixes for it were merged in v70.55.1, so we require
the latter version in the driver.

While the GuC supports any group assignment (as long as each engine
belongs to only one group), we only allow specific tested configuration
to be set by the admin that are tailored to specific use-cases. This
series introduces one of those use cases: if each VF is doing a frame
rendering + encoding at a not-too-high resolution (e.g 1080p@30fps),
like it happens e.g. with a simple remote desktop, the render engine
can produce frames faster than the video engine can encode them.
However, our HW can have multiple video engines, so while one of them is
encoding a frame for a VF the other ones can be used for encoding frames
for other VFs. Given that media slices share some resources (e.g. SFC),
to obtain this parallel execution without impacting VF isolation we can
simply assign each media slice to a different group.

This series only allows enabling/disbling of this feature via debugfs
for now (like several other SRIOV features). Sysfs will be implemented
as a follow up, after the review of this series and the proposed
interface is complete.

The feature is enabled and disabled via the sched_groups_mode PF debugfs.
If any configs are supported on the GT, reading this file will dump the
available configs and which one is selected, e.g:

#cat sriov/pf/tile0/gt1/sched_groups_mode
[disabled] media_slices

Writing the config name to the file will enable that configuration.
Debugfs files are also available to set the per-group exec_quantum and
preempt_timeout, while a series of files under the sched_groups folder
lists the engines belonging to each group. Overall, the tree looks like
the following:

        /sys/kernel/debug/dri/BDF/
        +-- sriov
        :   +-- pf
            :   +-- tile0
                :   +-- gt0
                    :   +-- sched_groups_mode
                        +-- sched_groups_exec_quantums_ms
                        +-- sched_groups_preempt_timeout_us
                        +-- sched_groups
                        :   +-- group0
                            :
                :           +-- groupN
                +-- vf1
                :   +-- tile0
                    :   +-- gt0
                        :   +-- sched_groups_exec_quantums_ms
                            +-- sched_groups_preempt_timeout_us
			    :

v2: several fixes, flow and style improvements, drop per-group EQ/PT
settings, allocate debugfs files statically, bump requirements to BMG+
and GuC v70.55.1.

v3: split out the guc scheduler ABI to use it with the KLV defines,
use the guc_sched_group structure instead of a raw array of masks, don't
split out the guc version macro, limit the media_slice mode to BMG for
now.

v4: rebase on top of the series by Michal to better handle the threshold
(included squashed in patch 1), split mlrc patch in separate patches for
PF and VF, address minor nits

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Daniele Ceraolo Spurio (13):
  DO_NOT_MERGE: PF: Add handling for new adverse event thresholds
  drm/xe/gt: Add engine masks for each class
  drm/gt/guc: extract scheduler-related defines from guc_fwif.h
  drm/xe/sriov: Initialize scheduler groups
  drm/xe/sriov: Add support for enabling scheduler groups
  drm/xe/pf: Scheduler groups are incompatible with multi-lrc
  drm/xe/vf: Check if scheduler groups are enabled
  drm/xe/sriov: Add debugfs to enable scheduler groups
  drm/xe/sriov: Add debugfs with scheduler groups information
  drm/xe/sriov: Prep for multiple exec quantums and preemption timeouts
  drm/xe/sriov: Add functions to set exec quantums for each group
  drm/xe/sriov: Add functions to set preempt timeouts for each group
  drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  73 ++++
 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h    |  57 +++
 drivers/gpu/drm/xe/tests/xe_args_test.c       |  54 +++
 drivers/gpu/drm/xe/xe_args.h                  |  27 ++
 drivers/gpu/drm/xe/xe_exec_queue.c            |  19 +
 drivers/gpu/drm/xe/xe_gt.h                    |  12 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c           |   8 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h           |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |  20 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h           |   8 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 298 +++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  10 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 310 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 329 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  10 +
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  39 +++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  67 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |   2 +
 drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
 drivers/gpu/drm/xe/xe_guc.h                   |  21 ++
 drivers/gpu/drm/xe/xe_guc_ads.c               |   4 +-
 drivers/gpu/drm/xe/xe_guc_capture.h           |   2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h              |  54 +--
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   9 +
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |   6 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  40 ++-
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +
 30 files changed, 1405 insertions(+), 88 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h

-- 
2.43.0

