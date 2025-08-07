Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B74C87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 11:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D8210E82B;
	Thu,  7 Aug 2025 11:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/63y1Sf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3222010E481
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754565051; x=1786101051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DZGNSaFPRgmUJzwPOOiMD9mEDG8IBwrMazzHgFS2M/U=;
 b=a/63y1SfOvNee2eD0eGuA//79xBJByeElIA2/BnVUCJFkAzdruduiv+n
 2erDK2tu9J+OjFOV6bMiP/yb+XKugDcr9B8B7zi3V0vZRTGKeIo11GZGi
 fTHLBKNiqsG23zSKivwOYVEthVAMcdMq9UMxrLtPhUhED4vUN5eI9fwQs
 WGaR+Fq3IPWDQ0LCax1B2g19owmScGjSRu/o4dOVdJgvLhv4226uiWrsd
 hj1fen2XYp60V17YFPoze7zTVkU/Uu145M4+l0C6b+0Hcw7c12XtwlqxI
 6LzZ1yjicHaMc4FP4XUpcslGvm36W3jvDKsRcPKcaahxgM+uVdxQSJwRO Q==;
X-CSE-ConnectionGUID: BbrFnNtjQlSYs9FvRaHXSg==
X-CSE-MsgGUID: BlgX5mlhSZyHJGgrSBEImw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67593184"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="67593184"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 04:10:50 -0700
X-CSE-ConnectionGUID: s15on84cQsaaCEKvFWsSIg==
X-CSE-MsgGUID: 5r9UFW5aSF2M4ql+eiFMUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="165396947"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 07 Aug 2025 04:10:50 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 0/1] Improve CCS save restore series
Date: Thu,  7 Aug 2025 16:57:39 +0530
Message-ID: <20250807112740.2421-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Previously, CCS save/restore operations created separate migration
contexts with new VM memory allocations, resulting in significant
overhead.

This series eliminates redundant context creation reusing the default
migration context by registering new execution queues for CCS save and
restore on the existing migrate VM.

Also fixed corruption issue with save/restore followed by S3/S4 cycle.

V3 -> V4:
- Created a new helper function to get lrc from queue xe_exec_queue_lrc()
(John Harrison)
- Rename q to mig_q in xe_tile_vf_ccs structure (John Harrison)
- Corrected error handling in xe_sriov_vf_ccs_init() when
devm_add_action_or_reset() returns error.
- Removed commit "Scale mmio send/recv timeout for CCS save/restore with
smem size" from this series and will be submitted a new series as it may
take time to close some opens around it.

V2 -> V3:
- Fixed review comments.
- Added new commit "Scale mmio send/recv timeout for CCS save/restore with
smem size"
- Squashed "Re-register CCS save/restore contexts post S3/S4 resume" into
"Refactor CCS save/restore to use default migration context" commit as per
review comments.

V1 -> V2:
- Fix kernel-doc issues reported by patchworks.
- Added new commit "Re-register CCS save/restore contexts post S3/S4
resume"

Satyanarayana K V P (1):
  drm/xe/vf: Refactor CCS save/restore to use default migration context

 drivers/gpu/drm/xe/xe_exec_queue.c         | 11 +++++
 drivers/gpu/drm/xe/xe_exec_queue.h         |  1 +
 drivers/gpu/drm/xe/xe_migrate.c            | 21 +++++----
 drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                 |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 51 ++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  6 +--
 7 files changed, 59 insertions(+), 36 deletions(-)

-- 
2.43.0

