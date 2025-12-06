Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3FBD3B7E5
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49EB10E30D;
	Sat,  6 Dec 2025 23:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkL3BVMY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7335C10E30D
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 23:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765062248; x=1796598248;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8SZ4c2dVZmVlFZJWtxKqkUb+HSDLn17fipVD5fqoM+4=;
 b=WkL3BVMY0cySkBTND1BZz92VkWAb5uK6M2Po39H763xB3tZEL6UqB/HX
 qxcBr1xWSOKXBu3hMJWNjxOM8Fy3/+X9QJbXdDlwtOuRI8Gx7lJxA/jKS
 t6j+Af51w8NkUKVwbI4aJN7bh2OOKasoBd3ziWfZakc8rwjmi3mjlMagh
 O8ZRF/NG9VCxHj3bRZdPvQJxDLWGVsHaekA1TeQVDFdNbBmh1TDPT/L88
 jyIHimYongJIsQrAyBIv4gYaYGM87sib1F1NHcHYSHaCbUtl1MH4E0GLZ
 JumB4tLH0K5wJdakxcsPGk658Ff9ssS9Ucu643sdxXxvlSssf9nlOjZ72 w==;
X-CSE-ConnectionGUID: xG44saQ1SqaB1wK2XFu8VQ==
X-CSE-MsgGUID: eJ2wUocURSKQUl8PCb5cJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78411676"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="78411676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:07 -0800
X-CSE-ConnectionGUID: AnaqPb3aTKa1EiE2mAQbZw==
X-CSE-MsgGUID: l9eA1VjeSKWtuDkHeChJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200045489"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:06 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 00/11] Introduce SRIOV scheduler groups
Date: Sat,  6 Dec 2025 15:03:56 -0800
Message-ID: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
        ├── sriov
        :   ├── pf
            :   ├── tile0
                :   ├── gt0
                    :   ├── sched_groups_mode
                        ├── sched_groups_exec_quantums_ms
                        ├── sched_groups_preempt_timeout_us
                        ├── sched_groups
                        :   ├── group0
                            :
                :           └── groupN
                ├── vf1
                :   ├── tile0
                    :   ├── gt0
                        :   ├── sched_groups_exec_quantums_ms
                            ├── sched_groups_preempt_timeout_us
			    :

IMPORTANT NOTE: this series now requires GuC 70.55.1 or newer, while in
linux-firmware we're still on 70.54.0. A new GuC should be published
within the next few days, but this series can't be merged until that
happens and 70.55.1 or a newer GuC is in linux-firmware. We can however
still continue the review and get the patches ready for when the GuC is
published. Once the new GuC is available I'll also re-submit the series
for CI testing.

v2: several fixes, flow and style improvements, drop per-group EQ/PT
settings, allocate debugfs files statically, bump requirements to BMG+
and GuC v70.55.1.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Daniele Ceraolo Spurio (11):
  drm/xe/gt: Add engine masks for each class
  drm/xe/sriov: Initialize scheduler groups
  drm/xe/sriov: Add support for enabling scheduler groups
  drm/xe/sriov: Scheduler groups are incompatible with multi-lrc
  drm/xe/sriov: Add handling for MLRC adverse event threshold
  drm/xe/sriov: Add debugfs to enable scheduler groups
  drm/xe/sriov: Add debugfs with scheduler groups information
  drm/xe/sriov: Prep for multiple exec quantums and preemption timeouts
  drm/xe/sriov: Add functions to set exec quantums for each group
  drm/xe/sriov: Add functions to set preempt timeouts for each group
  drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  68 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c            |  19 +
 drivers/gpu/drm/xe/xe_gt.h                    |  15 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c           |   8 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h           |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |  20 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h           |   8 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 298 +++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  10 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 325 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 311 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   6 +
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  33 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  60 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |   2 +
 drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
 drivers/gpu/drm/xe/xe_guc.h                   |   7 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   2 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   9 +
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  18 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  23 +-
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +
 drivers/gpu/drm/xe/xe_guc_version.h           |  36 ++
 25 files changed, 1245 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_version.h

-- 
2.43.0

