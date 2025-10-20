Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C2CCCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209EE10E4AC;
	Mon, 20 Oct 2025 18:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAkARFgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE84010E4AC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984670; x=1792520670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1e9n8H4tgbiWr+QanxO9tS3gCU5fu+oVZW3arTf5ab4=;
 b=FAkARFgnxYy2g2Y4o/7IKvqCztZzads7Xjcb7HPJ9WCFJbC2yqfn4fvF
 Zg4bbcFWw4RVu9GHYo7NPF8PYcC3F3o/F9NG3iOg9r0RW5Vq1tfL2UKyr
 KNhrCTJrTu7Qvo3Y+04h1GrDljY3eKt6pZ4YvC/NtDCUvoNPM0NffyyBP
 CxyeFAM0MQQj+ljNt2aM088K070nQlhRkdqvrJEDDJSi5iYS3Rdgww2hj
 H6iD9qhTV82W0+CsUTR2mUKD6D1b12mkvZ1cS6n0t+kaX6lTbc0k1xpOU
 QL9nkAOBGM/bUcgQXGTJ7++sFHIFPcRGD09yTDoccjBLOgQ470K4jOFCu g==;
X-CSE-ConnectionGUID: LuPzWJJURn++P3EL+058eA==
X-CSE-MsgGUID: xzT8y6csTbSEsJaBNGNJjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013050"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013050"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:29 -0700
X-CSE-ConnectionGUID: b+HktfyxTtGinCZ2zAfyZw==
X-CSE-MsgGUID: L6lce0NFT2ujoEbNeEKJsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802063"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 00/14] PF: Add sriov_admin sysfs tree
Date: Mon, 20 Oct 2025 20:24:00 +0200
Message-ID: <20251020182414.576-1-michal.wajdeczko@intel.com>
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

To allow the admin to provision VFs using production quality vGPU
profiles, we need to expose some of the SR-IOV knobs at the sysfs
level as existing debugfs entries may not be available.

Start with some basic scheduling parameters and apply them to all
tiles/GTs where VF can be running. Provisioning of the other hard
resources (like GGTT, VRAM) is still fully done by the PF, which
uses fair auto-provisioning, but soon we will try to expose that
to the admin too (after this series).

Below is an example of the new sysfs attributes tree on the PF
with 2 of 3 VFs enabled (VFs were limited by max_vfs config):

  /sys/bus/pci/drivers/xe/0000:00:02.0/sriov_admin
  ├── .bulk_profile
  │   ├── exec_quantum_ms
  │   ├── preempt_timeout_us
  │   └── sched_priority
  ├── pf
  │   ├── device -> ../../../0000:00:02.0
  │   └── profile
  │       ├── exec_quantum_ms
  │       ├── preempt_timeout_us
  │       └── sched_priority
  ├── vf1
  │   ├── device -> ../../../0000:00:02.1
  │   ├── profile
  │   │   ├── exec_quantum_ms
  │   │   ├── preempt_timeout_us
  │   │   └── sched_priority
  │   ├── reset
  │   └── stop
  ├── vf2
  │   ├── device -> ../../../0000:00:02.2
  │   ├── profile
  │   │   ├── exec_quantum_ms
  │   │   ├── preempt_timeout_us
  │   │   └── sched_priority
  │   ├── reset
  │   └── stop
  └── vf3
      ├── profile
      │   ├── exec_quantum_ms
      │   ├── preempt_timeout_us
      │   └── sched_priority
      ├── reset
      └── stop

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Michal Wajdeczko (14):
  drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
  drm/xe/pf: Take RPM during calls to SR-IOV attr.store()
  drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
  drm/xe/pf: Relax report helper to accept PF in bulk configs
  drm/xe/pf: Add functions to bulk configure EQ/PT on GT
  drm/xe/pf: Add functions to bulk provision EQ/PT
  drm/xe/pf: Allow bulk change all VFs EQ/PT using sysfs
  drm/xe/pf: Add functions to provision scheduling priority
  drm/xe/pf: Allow bulk change all VFs priority using sysfs
  drm/xe/pf: Allow change PF scheduling priority using sysfs
  drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
  drm/xe/pf: Add sysfs device symlinks to enabled VFs
  drm/xe/pf: Allow to stop and reset VF using sysfs
  drm/xe/pf: Add documentation for sriov_admin attributes

 .../ABI/testing/sysfs-driver-intel-xe-sriov   | 164 +++++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  69 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   2 +
 drivers/gpu/drm/xe/xe_pci_sriov.c             |  42 +-
 drivers/gpu/drm/xe/xe_pci_sriov.h             |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c              |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c    | 261 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h    |  14 +
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        | 658 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h        |  16 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  11 +
 12 files changed, 1226 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h

-- 
2.47.1

