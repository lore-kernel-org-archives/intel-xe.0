Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737A1E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 20:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3750810E625;
	Wed, 18 Feb 2026 20:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KndM9eKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A7D10E620
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 20:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448179; x=1802984179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iov9SqOA9lTkd2wn3jFvuvY4tBvMYjOKtVmImgvliFY=;
 b=KndM9eKSrMDMZ3bBu2puipqm2cph+7JsmCsa+ed5EbezmNNL70Jd8qLo
 6vuOP+X9LQDUUOmBc5oPr5tdTbGH+8fX+49i4co/lhhWHJbFiX1V2UKY2
 3efjk8ZfQZsCurmwaZ2Zi2Z79nCSnKsElhvDr69JQvO2mVz3cyhSSZVcG
 ZHUoQ3MaxnVy4EL0GRYHpJWTPh3ff3TIypSVRzhDSp4T4uPMQEo7kFr91
 YArz8P5uDswwA3EuUNS+16Q5w9J97QfOAL7vTsxMYejXbDCqadAMP+bJB
 19t+At35mpyF9BTiXp2kGN7mji7cjjRs1tk8UwHuYuA8DHHkm93fbpG13 g==;
X-CSE-ConnectionGUID: zL5h1GsbSTCPg7x+dSgk+A==
X-CSE-MsgGUID: 32YYgwDuSUqIomCPR7WIbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72710580"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72710580"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:18 -0800
X-CSE-ConnectionGUID: 3+B1zzgBTUOFiSB+/bpb3w==
X-CSE-MsgGUID: C/xiXwB6R6mHtFIFE1BLqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213548227"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.18.5])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:15 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 00/10] drm/xe/pf: Allow to change VFs VRAM quota using sysfs
Date: Wed, 18 Feb 2026 21:55:42 +0100
Message-ID: <20260218205553.3561-1-michal.wajdeczko@intel.com>
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

Extend Xe driver specific sysfs SR-IOV knobs with VRAM provisioning.

 /sys/bus/pci/drivers/xe/BDF/
 ├── sriov_admin/
     ├── .bulk_profile
     │   └── vram_quota                 [RW] unsigned integer
     ├── vf1/
     │   └── profile
     │       └── vram_quota             [RW] unsigned integer
     ├── vf2/
     │   └── profile
     │       └── vram_quota             [RW] unsigned integer

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

v1: https://patchwork.freedesktop.org/series/161625/#rev1
v2:
    add global helper for lmtt page size (Michal)
    add LMTT setup to .test_init (Michal)
    allow VRAM changes only when LMTT (Piotr)
    account for min_spare for PF (Piotr)
    fix typos (Piotr) and kernel-doc (CI)

Michal Wajdeczko (10):
  drm/xe/pf: Expose LMTT page size
  drm/xe/pf: Add locked variants of VRAM configuration functions
  drm/xe/pf: Add functions for VRAM provisioning
  drm/xe/pf: Allow to change VFs VRAM quota using sysfs
  drm/xe/pf: Use migration-friendly VRAM auto-provisioning
  drm/xe/tests: Add KUnit tests for new VRAM fair provisioning
  drm/xe/pf: Don't check for empty config
  drm/xe/pf: Prefer guard(mutex) when doing fair LMEM provisioning
  drm/xe/pf: Skip VRAM auto-provisioning if already provisioned
  drm/xe/pf: Add documentation for vram_quota

 .../ABI/testing/sysfs-driver-intel-xe-sriov   |  31 ++++
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  96 +++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 172 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   4 +
 drivers/gpu/drm/xe/xe_lmtt.c                  |  17 ++
 drivers/gpu/drm/xe/xe_lmtt.h                  |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c    | 119 ++++++++++--
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h    |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        |  31 +++-
 9 files changed, 446 insertions(+), 29 deletions(-)

-- 
2.47.1

