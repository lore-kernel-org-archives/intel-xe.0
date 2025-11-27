Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BBED116E4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37A710E0A5;
	Thu, 27 Nov 2025 01:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a18Q5DAO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5A310E0A5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 01:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764207917; x=1795743917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j9rvlD64qAO6STwS5a0VQ8T77vKEkq4pe5whb4Zzz7Y=;
 b=a18Q5DAOApa7RHhVaP4Y2GYo3wvYJsmGv9zulPDleTXdV+XsIjLG7WA7
 rg50doHU4VBJMVcs7iLek7UAkgrMFbhNhZKdSL5bGr0SjK0hxVFC/TtVU
 YTxV0J/GF+icLkAYaARZ7F1zS+29XCwaxOre7Vq6XhrDSCZIFnc650Hdc
 al24osuSr3yEScXJWdCnz101peuB/xUZGjktAz9JNBCvvSsoLoNtQ3g+a
 6PIdIlSl6Zhr4Fu75D7JQkjNeCm48IpnuSohHA22HQbrBKwJ6K+Po0wjW
 qJBDMv3v6oX7XVLJJnIPhpAaQRXmYN88K7YngJcd47MJN4z9QVS+P4RxE g==;
X-CSE-ConnectionGUID: CDzzxBhpQYyjWoqh+orI6w==
X-CSE-MsgGUID: yVARvd4wQCu72xI+BOuePg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70114837"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70114837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:17 -0800
X-CSE-ConnectionGUID: LQcQ1XqjQ1WJGhMMZmoQyA==
X-CSE-MsgGUID: sHoMi4y+RumQOmQ6r6bW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192753319"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:17 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 00/10] Introduce SRIOV scheduler groups
Date: Wed, 26 Nov 2025 17:45:06 -0800
Message-ID: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
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
settable per-group-per-VF.

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
to obtain this parallel execution we can simply assign each media slice
to a different group.

This series only allows enabling/disbling of this feature via debugfs
for now (like several other SRIOV features). Sysfs will be implemented
as a follow up, after the review of this series and the proposed
interface is complete.

While the feature is disabled, only one debugfs file is available.
If any configs are supported on the GT, reading this file will dump the
available configs and which one is selected, e.g:

#cat sriov/pf/tile0/gt1/sched_groups_mode
[disabled] media_slices

Writing the config name to the file will enable that configuration and
create a new debugfs folder for PF and each VF called sched_groups, inside
of which are debugfs files that allow listing which engines are assigned
to each group and setting of the EQ/PT values, either for all groups in
one go (by providing a list of values) or for each group individually:

	:
	├── vf1
	:   ├── tile0
	    :   ├── gt1
		:   ├── sched_groups
		    :   ├── exec_quantums_ms
			├── preempt_timeouts_us
			├── group0
			:   ├── engines
			    ├── exec_quantum_ms
			    └── preempt_timeout_us
			:
			└── groupN
			    ├── engines
			    ├── exec_quantum_ms
			    └── preempt_timeout_us

Refer to the individual patches for more details about the debugfs
usage.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Daniele Ceraolo Spurio (10):
  drm/xe/gt: Add engine masks for each class
  drm/xe/sriov: Initialize scheduler groups
  drm/xe/sriov: Add support for enabling scheduler groups
  drm/xe/sriov: Scheduler groups are incompatible with multi-lrc
  drm/xe/sriov: Add debugfs to enable scheduler groups
  drm/xe/sriov: Add debugfs with scheduler groups information
  drm/xe/sriov: Prep for multiple exec quantums and preemption timeouts
  drm/xe/sriov: Add functions to set exec quantums for each group
  drm/xe/sriov: Add functions to set preempt timeouts for each group
  drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  62 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  19 +
 drivers/gpu/drm/xe/xe_gt.h                    |   9 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 418 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  16 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 417 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 294 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   5 +
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  15 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  59 +++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |   2 +
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |   1 +
 drivers/gpu/drm/xe/xe_sriov.c                 |  18 +
 drivers/gpu/drm/xe/xe_sriov.h                 |   1 +
 18 files changed, 1323 insertions(+), 30 deletions(-)

-- 
2.43.0

