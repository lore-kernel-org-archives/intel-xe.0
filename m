Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDFDCCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F1B10EA48;
	Thu, 30 Oct 2025 22:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZXJVJNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2FE10EA48
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863047; x=1793399047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oyDBCFh68A+RQ4XZzJH+PoRbrqZZVFyGIyZQWObv+ec=;
 b=NZXJVJNpJtstqN2xe25DUO0jBsDnv7clMxGcYybBIM8yJcZVDJPZV6P9
 WRz9zzx5/Tu/tbRvwRcYJxWejgmEoYIhXd6qRtMrKGJt6g9jqJESZusIy
 5L2072+OcBCchsk1gwtfKNoGLwRzuTJZhNFBUvub2ZWpGsvLljLKRe+xz
 SNHPlUoRHi8M7FIQ2EWhRcCMdcVwiPboURZUJ+CrSa9Rf9nADgNg0uduU
 Pyf3fH7aa4R6HU91YAznRWEhM96dd2cZzPMkzqc61rUAhrIM1vZLFxIgk
 BwwVF83IfrlxIYIEj0maNAFK/Xwso12ARTAwpg1+Iw9r3OwdRUgnfj4By w==;
X-CSE-ConnectionGUID: +TgcHuJ4QACZzmZByphw/w==
X-CSE-MsgGUID: rr9L7NCkQpayKXkSPt7RXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63040448"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63040448"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:07 -0700
X-CSE-ConnectionGUID: WVK99DWDS427fOmUuf48hg==
X-CSE-MsgGUID: NDfPN4sJTS+8bkLFEzZZBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185346353"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 00/17] PF: Add sriov_admin sysfs tree
Date: Thu, 30 Oct 2025 23:23:31 +0100
Message-ID: <20251030222348.186658-1-michal.wajdeczko@intel.com>
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
  │   └── stop
  ├── vf2
  │   ├── device -> ../../../0000:00:02.2
  │   ├── profile
  │   │   ├── exec_quantum_ms
  │   │   ├── preempt_timeout_us
  │   │   └── sched_priority
  │   └── stop
  └── vf3
      ├── profile
      │   ├── exec_quantum_ms
      │   ├── preempt_timeout_us
      │   └── sched_priority
      └── stop

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Matthew Brost <matthew.brost@intel.com>

v1: https://patchwork.freedesktop.org/series/156220/#rev1
v2: https://patchwork.freedesktop.org/series/156220/#rev2
    drop dbg messages about unexpected attr usage (Lucas)
    use single lock while configuring all GTs (Lucas)
    drop redundant comment (Piotr)
    drop reset file (Rodrigo, Lucas)
    update kernel version (Rodrigo)
v3:
    fix typo, unify kernel-doc (Piotr)
    add debug message about inconsistency (Piotr)
    small nit in emit_choice (Lucas)
    fix patch title (Piotr)
    some doc rewording (Lucas)

Michal Wajdeczko (17):
  drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
  drm/xe/pf: Take RPM during calls to SR-IOV attr.store()
  drm/xe/pf: Add _locked variants of the VF EQ config functions
  drm/xe/pf: Add _locked variants of the VF PT config functions
  drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
  drm/xe/pf: Relax report helper to accept PF in bulk configs
  drm/xe/pf: Fix signature of internal config helpers
  drm/xe/pf: Add functions to bulk configure EQ/PT on GT
  drm/xe/pf: Add functions to bulk provision EQ/PT
  drm/xe/pf: Allow bulk change all VFs EQ/PT using sysfs
  drm/xe/pf: Add functions to provision scheduling priority
  drm/xe/pf: Allow bulk change all VFs priority using sysfs
  drm/xe/pf: Allow change PF scheduling priority using sysfs
  drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
  drm/xe/pf: Add sysfs device symlinks to enabled VFs
  drm/xe/pf: Allow to stop the VF using sysfs
  drm/xe/pf: Add documentation for sriov_admin attributes

 .../ABI/testing/sysfs-driver-intel-xe-sriov   | 159 +++++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 200 ++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  10 +
 drivers/gpu/drm/xe/xe_pci_sriov.c             |  41 +-
 drivers/gpu/drm/xe/xe_pci_sriov.h             |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c              |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c    | 284 ++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h    |  14 +
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        | 647 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h        |  16 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  11 +
 12 files changed, 1337 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h

-- 
2.47.1

