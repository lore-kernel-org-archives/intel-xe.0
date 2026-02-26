Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFC5FD9E0A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 21:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB46F10E9AF;
	Thu, 26 Feb 2026 21:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxQ3KW00";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6A310E9AF
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772140939; x=1803676939;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zKuj+rfRSzKHYWxyAFIeVmWI3DTqswQ66tmgfCA42Og=;
 b=TxQ3KW00VnlJJ5c3wa9A/ioGxjcKM3ayiW2QSm91wLSQEQfDC3xVJdp7
 37meT2IZEXRjd94n/1MBgnJeqUS8EKuJBaSHF/iqxzXaV/Chzaa5Sp9s1
 x34U94isZrJJEm5ia6x47pznWM3YXn2nT9P45c03GyJmMFvxoHXRSA0vC
 X/TZg/BuYAz68aH1LQ3WDsfhmlQma01xPgN7464MhrQZwk36wYXB69q/8
 o3BN/IFtr9cMcR3a3/0NgAkFuaypYxL46/r97Cnus3+WTPa/dkl+WtCll
 /UgL5jv7FLbpLJCncZrCp345+eWl92TICTXV5Fe04/FezkkOMQv+nO993 g==;
X-CSE-ConnectionGUID: nX/0U0r+Qqqdh4Xnx0LY/g==
X-CSE-MsgGUID: bGnEZxe6QX2oA4SjD56RDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84307897"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="84307897"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:22:18 -0800
X-CSE-ConnectionGUID: y5tOABcuRaW4MH06IDZgsg==
X-CSE-MsgGUID: 2VzMULViTv2TAeFVVuKEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221698662"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa005.jf.intel.com with ESMTP; 26 Feb 2026 13:22:17 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 0/4] drm/xe/vf: Fix exec queue creation during
 post-migration recovery
Date: Thu, 26 Feb 2026 22:26:57 +0100
Message-Id: <20260226212701.2937065-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

Fix a few issues which sporadically happen due to a race between
post-migration fixups procedure, and exec queue creation routine.

Tests which create a lot of exec queues were sporadically failing
due to one of LRCs having its state within VRAM damaged. This series
fixes all such issues, by prolonging wait for fixups within EQ
creation, and also re-creating the one LRC whose creation happened
at the time of VF switch.

v2: Add a patch with atomic value increase which allowed to solve the
  few very rare test fails which were still happening.

v3: Reuse _xe_exec_queue_fini(). Add setter and getter for LRC
  references. Move fixups confirmation forwardr in time. Refactor
  changes to __xe_exec_queue_init().

v4: Separate lock, only for LRCs. Kerneldoc fixes. Rename
  fixups_complete_count.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>

Tomasz Lis (4):
  drm/xe/queue: Call fini on exec queue creation fail
  drm/xe: Wrappers for setting and getting LRC references
  drm/xe/vf: Wait for all fixups before using default LRCs
  drm/xe/vf: Redo LRC creation while in VF fixups

 drivers/gpu/drm/xe/xe_exec_queue.c        | 123 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_exec_queue.h        |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h  |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  54 ++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   4 +-
 drivers/gpu/drm/xe/xe_lrc.h               |   3 +-
 7 files changed, 141 insertions(+), 52 deletions(-)

-- 
2.25.1

