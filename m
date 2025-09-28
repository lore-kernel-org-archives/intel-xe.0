Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33E3CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 14:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425F310E124;
	Sun, 28 Sep 2025 14:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjPaXB4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A703710E124
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Sep 2025 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759068042; x=1790604042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qwr+MZtlRdFVWwyDy5FaRwQ48IoWm2TEGY9M8vmrH0M=;
 b=VjPaXB4h80jVuJDKcEgSn+FOS9OIOicmi1e4qsWvRyKvBbFXK+9pha91
 7CYB3AI6dYneHKHBdNSVJqyQZ5kOhiN0vhYsVjHIZIuKaoeXVdQerKn4m
 F+xl4wSe1EzgYrctc5lZTyRLT5fV0g66Dov9Tbz9AtlsK0EBaJRlDc1iR
 JHEXK3f75k1BWlNAIVyXsBicucFax+PSghV8jHVv012+d0ZvmLb+pffkk
 mc3w8ITAi8hvIKIi7Mpvn9jyvrJ8xN79T/ZtuCV0sQM2lbC+XSrFWSrFW
 mEjwgdRM6MPVQELiUpdavh5SWWZ9u/R7cce4WqdbD2skDkltMqTPf2ttd Q==;
X-CSE-ConnectionGUID: VYPvjrd0QHqmw5iPwRzywg==
X-CSE-MsgGUID: 3aQDesz5TEieD+GlAa8Gwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="48893869"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="48893869"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 07:00:42 -0700
X-CSE-ConnectionGUID: +eBsF3GFSCu6qnBWB4ks6Q==
X-CSE-MsgGUID: zZ2d9VaPQXStemXANITkMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="178761808"
Received: from jkhalil-mobl.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.85])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 07:00:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/6] Refactor PF debugfs
Date: Sun, 28 Sep 2025 16:00:22 +0200
Message-ID: <20250928140029.198847-1-michal.wajdeczko@intel.com>
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

This allows to place GGTT/VRAM attributes correctly under a tile,
without polluting 'native' entry with many function directories.

  /sys/kernel/debug/dri/0000:4d:00.0/
  ├── ...
  ├── gt0 -> tile0/gt0
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
  │   │   │   │   ├── lmem_provisioned -> ../vram_provisioned
  │   │   │   │   ├── lmem_spare -> ../vram_spare
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
  │   │   │   ├── vram_provisioned
  │   │   │   └── vram_spare
  │   │   ├── versions
  │   │   └── vfs
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
  │   │       │   ├── lmem_quota -> ../vram_quota
  │   │       │   ├── preempt_timeout_us
  │   │       │   ├── sched_priority
  │   │       │   ├── threshold_cat_error_count
  │   │       │   ├── threshold_doorbell_time_us
  │   │       │   ├── threshold_engine_reset_count
  │   │       │   ├── threshold_guc_time_us
  │   │       │   ├── threshold_irq_time_us
  │   │       │   └── threshold_page_fault_count
  │   │       └── vram_quota
  │   ├── vf2
  │   :
  ├── tile0
  │   ├── ggtt
  │   ├── gt0
  │   │   ├── ...
  │   │   ├── pf -> ../../sriov/pf/tile0/gt0
  │   │   ├── vf1 -> ../../sriov/vf1/tile0/gt0
  │   │   ├── vf2 -> ../../sriov/vf2/tile0/gt0
  :   :   └── ...

v1: https://patchwork.freedesktop.org/series/155064/#rev1
v2: use VRAM instead of LMEM (Lucas, Rodrigo)

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
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 108 +++++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h      |  18 +
 drivers/gpu/drm/xe/xe_tile_debugfs.c          |  14 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.h          |   3 +
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 247 +++++++++++
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h |  15 +
 12 files changed, 621 insertions(+), 227 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h

-- 
2.47.1

