Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B53CC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 07:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF41910E4D2;
	Fri,  8 Aug 2025 07:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2VXlrta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9067610E4D1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 07:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754637578; x=1786173578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xsVhUhyw0eyBO2OikpcmInP0VEJHUn7A8hTfk2907+k=;
 b=l2VXlrtamQDWhG9npFBin1joobMtBHbfoiCcJDthkGddMBMTDiWzAVrO
 rTQK8Oo6NaqXXmUzG2gk50fgCOZddXkFmlr0PsvEe+qgubIGyqPeQQZGl
 /ei6pBoo/M2RZbm6FNhQEqBeHeJKu9ZAzaO4cxTkdN0y+qxQamunqCAhU
 bskUc4BshUc5sj5SvJbZVHYNu6KsgQ3GI0ePdrEqraYBXHgB4qgLMMCPZ
 DRJ9VgKR3Xi9gcBK5ujOjqBpPTWu1UM9giVswwokDXsZj5xYdEVmbBFej
 bwE0dRss2Cb3I0To+e8euRbXNKHmeZyEJ/WAPxco9IGguQk7g2E2LR2G9 g==;
X-CSE-ConnectionGUID: l1+vSGGJTYep8otdSKRezA==
X-CSE-MsgGUID: QmWV0AY1S9a/IE4xhIfjkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56904802"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56904802"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 00:19:38 -0700
X-CSE-ConnectionGUID: nUzx/5cTScW4rsBrqXxCLA==
X-CSE-MsgGUID: 9ddUqlciR0WcXoCuyTocbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="196091506"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa001.fm.intel.com with ESMTP; 08 Aug 2025 00:19:37 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 0/1] Improve CCS save restore series
Date: Fri,  8 Aug 2025 13:06:27 +0530
Message-ID: <20250808073628.32745-1-satyanarayana.k.v.p@intel.com>
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

V4 -> V5:
- Updated description of xe_exec_queue_lrc() (Stuart Summers)
V3 -> V4:
- Created a new helper function to get lrc from queue xe_exec_queue_lrc()
(John Harrison)
- Rename q to mig_q in xe_tile_vf_ccs structure (John Harrison)
- Corrected error handling in xe_sriov_vf_ccs_init() when
devm_add_action_or_reset() returns error.
- Removed commit "Scale mmio send/recv timeout for CCS save/restore with
smem size" from this series and will submit a new series as it may
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

 drivers/gpu/drm/xe/xe_exec_queue.c         | 15 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.h         |  1 +
 drivers/gpu/drm/xe/xe_migrate.c            | 21 +++++----
 drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                 |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 51 ++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  6 +--
 7 files changed, 63 insertions(+), 36 deletions(-)

-- 
2.43.0

