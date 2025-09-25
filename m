Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9782CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 22:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DFE10E9C1;
	Thu, 25 Sep 2025 22:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejyyS9Ha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E19D10E9BF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 22:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758837890; x=1790373890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CrQ2p771LsrCvPaIGEj3vMGb3q9D8nyP37PrhEBNJcs=;
 b=ejyyS9Hae2XSCVysyIQpY3nXIDcI/UB35bC52VmH4LAoEyHpQ9/w6jQv
 nAMCxqGPbg2pj6CdXlukBEfgu91SddA0Zvxt6xXNWGytpQGIpmPz8Lcnt
 LcaNlxug+vj5wbDskgOZsQVpj25KU/NitckVRABK5YJypXFhZUPvClT2z
 7R63zyNEcq5n4/7bv7vSwGuUTXja44JacZ9mDAQy/zBMirupkw4+yG4Gn
 Xsnl0nxFVb5mfcwGrJbf08fw/Qbf0y2LWAtykmNC0LglzwzyqyiQ5BrOu
 9KcKhUapC722Ax3PNs2t5ezVTec8er/0ahsgnobUEhF0jTz5jRscoeu4n g==;
X-CSE-ConnectionGUID: EluTQszYTZyy/rBE1ed+zA==
X-CSE-MsgGUID: tvJxyO31Th60191Z0IX2HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61222119"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="61222119"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:04:49 -0700
X-CSE-ConnectionGUID: tej5aE+yTJ6g0M2bULpHPQ==
X-CSE-MsgGUID: q3UqjCDCRbq2keftcPa7iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="201129378"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:04:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/6] drm/xe/pf: Refactor PF debugfs
Date: Fri, 26 Sep 2025 00:04:17 +0200
Message-ID: <20250925220425.196860-1-michal.wajdeczko@intel.com>
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

In new debugfs layout, all SR-IOV files are grouped under single
"sriov" directory, where each SR-IOV function is represented by
its own separate directory, with individual tile/GT structure.

This allows to place GGTT/LMEM attributes correctly under a tile,
without polluting 'native' entry with many function directories.

For backward compatibility, some symlinks are still provided.

  /sys/kernel/debug/dri/0000:00:02.0/
  ├── sriov
  │   ├── pf
  │   │   ├── tile0
  │   │   │   ├── ggtt_available
  │   │   │   ├── ggtt_provisioned
  │   │   │   ├── ggtt_spare
  │   │   │   ├── gt0
  │   │   │   │   ├── adverse_events
  │   │   │   │   ├── contexts_provisioned
  │   │   │   │   ├── contexts_spare
  │   │   │   │   ├── doorbells_provisioned
  │   │   │   │   ├── doorbells_spare
  │   │   │   │   ├── exec_quantum_ms
  │   │   │   │   ├── ggtt_available -> ../ggtt_available
  │   │   │   │   ├── ggtt_provisioned -> ../ggtt_provisioned
  │   │   │   │   ├── ggtt_spare -> ../ggtt_spare
  │   │   │   │   ├── preempt_timeout_us
  │   │   │   │   ├── reset_engine
  │   │   │   │   ├── runtime_registers
  │   │   │   │   ├── sample_period_ms
  │   │   │   │   ├── sched_if_idle
  │   │   │   │   ├── sched_priority
  │   │   │   │   ├── threshold_cat_error_count
  │   │   │   │   ├── threshold_doorbell_time_us
  │   │   │   │   ├── threshold_engine_reset_count
  │   │   │   │   ├── threshold_guc_time_us
  │   │   │   │   ├── threshold_irq_time_us
  │   │   │   │   └── threshold_page_fault_count
  │   │   │   └── gt1
  │   │   │       ├── ...
  │   │   :       :
  │   ├── vf1
  │   │   └── tile0
  │   │       ├── ggtt_quota
  │   │       ├── gt0
  │   │       │   ├── config_blob
  │   │       │   ├── contexts_quota
  │   │       │   ├── control
  │   │       │   ├── doorbells_quota
  │   │       │   ├── exec_quantum_ms
  │   │       │   ├── ggtt_quota -> ../ggtt_quota
  │   │       │   ├── guc_state
  │   │       │   ├── preempt_timeout_us
  │   │       │   ├── sched_priority
  │   │       │   ├── threshold_cat_error_count
  │   │       │   ├── threshold_doorbell_time_us
  │   │       │   ├── threshold_engine_reset_count
  │   │       │   ├── threshold_guc_time_us
  │   │       │   ├── threshold_irq_time_us
  │   │       │   └── threshold_page_fault_count
  │   │       └── gt1
  │   │           ├── ...
  │   │           :
  :   :
  ├── tile0
  │   ├── ggtt
  │   ├── gt0
  │   │   ├── ...
  │   │   ├── pf -> ../../sriov/pf/tile0/gt0
  │   │   ├── vf1 -> ../../sriov/vf1/tile0/gt0
  │   │   ├── vf2 -> ../../sriov/vf2/tile0/gt0
  │   │   ├── vf3 -> ../../sriov/vf3/tile0/gt0
  │   │   └── ...
  :   :

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Michal Wajdeczko (6):
  drm/xe/pf: Promote PF debugfs function to its own file
  drm/xe/pf: Create separate debugfs tree for SR-IOV files
  drm/xe/pf: Populate SR-IOV debugfs tree with tiles
  drm/xe/pf: Move SR-IOV GT debugfs files to new tree
  drm/xe/debugfs: Promote xe_tile_debugfs_simple_show
  drm/xe/pf: Make GGTT/LMEM debugfs files per-tile

 drivers/gpu/drm/xe/Makefile                   |   4 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 389 ++++++++++--------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h   |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  42 --
 drivers/gpu/drm/xe/xe_sriov_pf.h              |   5 -
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 123 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h      |  18 +
 drivers/gpu/drm/xe/xe_sriov_types.h           |   3 +
 drivers/gpu/drm/xe/xe_tile_debugfs.c          |  14 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.h          |   3 +
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 247 +++++++++++
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h |  15 +
 13 files changed, 639 insertions(+), 227 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h

-- 
2.47.1

