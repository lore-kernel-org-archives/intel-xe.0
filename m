Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23669CFA466
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 15:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B728984C;
	Mon, 24 Nov 2025 15:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbvSgTC9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEABC8984C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763999394; x=1795535394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bPF8bavHyLhTmsfCOCDFL62NmZkqdRXbOiAgep8bAWc=;
 b=XbvSgTC9ffzKZrYgh3L24+uOeL3iQgQH5G6njwZnIQxW8a8x0Z6TXkhM
 Spz7N2+5YKAeyjZEuPrdp+YkMASVr0ZgKJIMFAIIBoG0Bll8uc9qUi1h9
 7FWobjHZk+yv0jQ/HpfN0EFeZM1WSzZpMX8gCMAQLjewR5jEdyhSobRxo
 GSEXCIjIgRE+Zz9Chqf/rTbTPExAtwffc/wvNlhP2VgQBjFhSzcLO5+Gt
 tSBu0dOaEYe7IBMqzOvq7kVM6JIivMgyh/hvx6NoNB62A7FKrZf6/1k+Q
 fTgC+9NVNZdzkx6ZZhXGAlvQyv6s18sNLCw83JtJP8Ikgrhz3E1Us5r/V A==;
X-CSE-ConnectionGUID: DxftinVuRYKzeBpp1Qonzg==
X-CSE-MsgGUID: Y91cX31WSlG7emW5qlRr2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65002169"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="65002169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 07:49:53 -0800
X-CSE-ConnectionGUID: GKAzL4LOTyy+HQu0UApakQ==
X-CSE-MsgGUID: xse7GJF+TjmoBm9nyGZlag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196662191"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa005.fm.intel.com with ESMTP; 24 Nov 2025 07:49:52 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v6 0/3] VF double migration
Date: Mon, 24 Nov 2025 21:37:20 +0530
Message-ID: <20251124160719.29812-5-satyanarayana.k.v.p@intel.com>
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

Satyanarayana K V P (3):
  drm/xe/vf: Enable VF migration only on supported GuC versions
  drm/xe/vf: Introduce RESFIX start marker support
  drm/xe/vf: Add debugfs entries to test VF double migration

 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  67 +++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 137 ++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c   |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  13 ++
 drivers/gpu/drm/xe/xe_guc.c                   |  13 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c              |  59 +++++++-
 6 files changed, 252 insertions(+), 42 deletions(-)

-- 
2.51.0

