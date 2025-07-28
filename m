Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311D3C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 09:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F0310E119;
	Mon, 28 Jul 2025 09:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2OPtFnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E8610E119
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753695961; x=1785231961;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ecIANBBb9iWilEl8/hD2BdGHSh6xShBVZ3quyBTdl0Q=;
 b=c2OPtFnJZtUcvrD17fU2tA3frn0bmusN5n8h8ZDvnNF1rX3UFcEnc+0z
 rCgPblr572J3KNBMovJrIfvJbsb3qQXC28XFVy8gZjCSB3GEYaX7PKR5O
 B2/aygU1DVVONlf3NU3zdLw5TB77B+9dL2BB5wNG67u9WrfTPWuZKIy8K
 6YYPOyj4Eb1456S8mLHAWp1iJ1yYwv9IlDYNeSXezZOW9dVEqURHwK52w
 FD606gqWVs208U16IDjkoC7qN6ZYZlTCfuOarqY6lvOkYWfNbhnzeVyz4
 q0/b6w9PnQ6OnNn+xuB8x45nDv4QVJYBdS/tWnLXEeMlTmB0w4eYxHVpj Q==;
X-CSE-ConnectionGUID: 2NuMTXd9SBeTDpr7QM6xUQ==
X-CSE-MsgGUID: JmyxqR08R26dgLE4OcJVTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66207725"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66207725"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 02:46:01 -0700
X-CSE-ConnectionGUID: iF91CThlSBeDQUXWAa/FrA==
X-CSE-MsgGUID: Mldl8tqBRyyG9oCG1HrHTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167706168"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa004.fm.intel.com with ESMTP; 28 Jul 2025 02:46:00 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/3] Revert "CCS save restore for IGPU"
Date: Mon, 28 Jul 2025 15:32:45 +0530
Message-ID: <20250728100248.3333-1-satyanarayana.k.v.p@intel.com>
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

The VF CCS save/restore series (patchwork #149108) has a dependency
on the migration framework. A recent migration update in commit
d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
caused a VM crash during XE driver release for iGPU devices.

So, reverting CCS save restore for IGPU series.

Satyanarayana K V P (3):
  Revert "drm/xe/vf: Register CCS read/write contexts with Guc"
  Revert "drm/xe/vf: Attach and detach CCS copy commands with BO"
  Revert "drm/xe/vf: Create contexts for CCS read write"

 drivers/gpu/drm/xe/Makefile                |   1 -
 drivers/gpu/drm/xe/xe_bb.c                 |  35 --
 drivers/gpu/drm/xe/xe_bb.h                 |   3 -
 drivers/gpu/drm/xe/xe_bo.c                 |  23 --
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 -
 drivers/gpu/drm/xe/xe_device.c             |   4 -
 drivers/gpu/drm/xe/xe_device_types.h       |   4 -
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  39 ---
 drivers/gpu/drm/xe/xe_guc_fwif.h           |   5 -
 drivers/gpu/drm/xe/xe_guc_submit.c         |  34 +-
 drivers/gpu/drm/xe/xe_guc_submit.h         |   1 -
 drivers/gpu/drm/xe/xe_migrate.c            | 172 +---------
 drivers/gpu/drm/xe/xe_migrate.h            |  11 +-
 drivers/gpu/drm/xe/xe_pm.c                 |   4 -
 drivers/gpu/drm/xe/xe_sriov.c              |  19 --
 drivers/gpu/drm/xe/xe_sriov.h              |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 367 ---------------------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  17 -
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  53 ---
 drivers/gpu/drm/xe/xe_sriov_vf_types.h     |   6 -
 drivers/gpu/drm/xe/xe_vm.c                 |   6 +-
 21 files changed, 20 insertions(+), 788 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 delete mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 delete mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

-- 
2.43.0

