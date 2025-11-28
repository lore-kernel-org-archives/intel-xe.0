Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52223CFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 13:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C8B10E172;
	Fri, 28 Nov 2025 13:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwXwTqBS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6B210E172
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764335608; x=1795871608;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wPAWau+DNWkK11vbSVpD6SJwVsNwcDxw00ksn905qPU=;
 b=bwXwTqBSQxZ+X3y2220HXwrkpMO7CMxhqtlOufwXODQIMPjqvAQ3ufvb
 e34qdWxAeI9jZzo/nQks/76LnvCsYo4/jqZyFgz4GUNyIZBA9q40ZzO9H
 StsjpLvP9VdDwaqimZ4g669Nty0vhbUX1ztWAvX2eXfiQ+yxiOECeLdbV
 tgnJ7KfH87K6+LE3eh1aMTLKnqpPHJCxmt2RZhqHbOkN7X4n0CGhSDGAQ
 +wHhRBYZbCUFO+zGrtBFyhzcm/vwewaagMRQcRbktIuFDcOQXyDPSn6dI
 RXeRaItm20WUoIRWa7h7oRxmVkG8wVKiTdGbaX+V0eyj7wHvmm8GwpUgi Q==;
X-CSE-ConnectionGUID: J8kk3SHXT7m/cksctQQfdA==
X-CSE-MsgGUID: pLgOGVhJTNaK4p7b6Mo8ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66084607"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="66084607"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 05:13:28 -0800
X-CSE-ConnectionGUID: 6hhf7T55QzCjj81QeQEeQA==
X-CSE-MsgGUID: SFyhhPuXSGyefr0vqTNWNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="193126571"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 28 Nov 2025 05:13:26 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 0/4] VF double migration
Date: Fri, 28 Nov 2025 19:00:53 +0530
Message-ID: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
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

In scenarios involving double migration, the VF KMD may encounter
situations where it is instructed to re-migrate before having the
opportunity to send RESFIX_DONE for the initial migration. This can occur
when the fix-up for the prior migration is still underway, but the VF KMD
is migrated again.

Consequently, this may lead to the possibility of sending two migration
notifications (i.e., pending fix-up for the first migration and a second
notification for the new migration). Upon receiving the first RES_FIX
notification, the GuC will resume VF submission on the GPU, potentially
resulting in undefined behavior, such as system hangs or crashes.

To avoid these hangs, a new VF2GUC action `VF2GUC_RESFIX_START` is
sent along with marker and when GUC receives the same marker with
`VF2GUC_RESFIX_DONE`action, it starts scheduling work loads from VF.

---
V6 -> V7:
- Fixed review comments (Michal W).
- Made resfix_start marker width to u8.
- Moved XE_GUC_RESPONSE_VF_MIGRATED handling in xe_guc_mmio_send_recv()
function new patch.

V5 -> V6:
- Fixed review comments (Michal W).
- Updated resfix_done and res_fix_start function names.
- Handled XE_GUC_RESPONSE_VF_MIGRATED error case received from GuC.
- Remove skip_resfix error when another migration is in queue.
- Fixed review comments (Michal W).
- Removed timeout and VF KMD waits infinately when resfix_stoppers bits
are set.
- Created helper macro for WAIT positions.

V4 -> V5:
- Fixed review comments (Michal W).
- Created new function vf_migration_init_late().
- Fixed minor debug log levels and documentation part.
- Moved complete marker logic to vf_post_migration_resfix_start_marker()
- Updated debugfs entries.

V3 -> V4:
- Gated Save/restore on Guc version 70.54.0
- Enabled RESFIX_START by default.
- Updated RESFIX_DONE documention.

V2 -> V3:
- Fixed review comments (Michal W).
- Updated commit message.
- Fixed CI.BAT issues.
- Added helper function to assert on unsupported GUC versions.
- Added debugfs entries to test VF double migration.

V1 -> V2:
- Squashed "Enable RESFIX start marker only on supported GUC
versions" commit into a single commit. (Matt B)
- Use fault injection for testing VF double  migration feature (Matt B).


Satyanarayana K V P (4):
  drm/xe/vf: Enable VF migration only on supported GuC versions
  drm/xe/vf: Introduce RESFIX start marker support
  drm/xe/vf: Requeue recovery on GuC MIGRATION error during VF
    post-migration
  drm/xe/vf: Add debugfs entries to test VF double migration

 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  67 +++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 139 +++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c   |  12 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  13 ++
 drivers/gpu/drm/xe/xe_guc.c                   |   6 +
 drivers/gpu/drm/xe/xe_sriov_vf.c              |  86 ++++++++++-
 6 files changed, 276 insertions(+), 47 deletions(-)

-- 
2.51.0

