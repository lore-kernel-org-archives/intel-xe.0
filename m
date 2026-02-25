Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021B0FD45FA
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 23:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A6C10E0A3;
	Wed, 25 Feb 2026 23:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTCT9r/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C575D10E0A3
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 23:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772063404; x=1803599404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cA187MxYi/qKJerlj8TSDxhGfPp5+EpwFBXXm6gsdGo=;
 b=LTCT9r/+7+gVPbxRALhAK3s8Uru8SH68f9bb4QlmxqChW/g71NokKK3S
 XV/Mxag666cGL3Fz9ZNjbLAMrDZGjNWX1zOz/TzRSXU4p0FhzI6KCvF45
 vj+4DHkJnPh5o0SvpgUtLMAf+4GAwFprvJp4lWdeH3qa3I1jGz5DNtSgi
 j2oyIpsLOqS8ASS9GVLyX2sK0d+DK0pah9qzqaD0Ks16AI63yvUgtNTdv
 VM6HPQ5lx6GVi7xDcdsaWSKPlPsJorXebIBwwijIJUxJhbpYqF+TM7oFr
 lIHCtjEEymQDwgPPKmNiGwVXobPE3893IwAKP3VaWjaQbgaz2f4DiwW44 w==;
X-CSE-ConnectionGUID: GAAI3u8CQhexoHLSMssGtw==
X-CSE-MsgGUID: kHOuxWC6RUalM65XIucTJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="95730741"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="95730741"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 15:50:04 -0800
X-CSE-ConnectionGUID: MEVYmoveR9WYEqk1Q9BGjA==
X-CSE-MsgGUID: G1Rtvj0pQneRGAR483sNRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="246934311"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa002.jf.intel.com with ESMTP; 25 Feb 2026 15:50:03 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 0/4] drm/xe/vf: Fix exec queue creation during
 post-migration recovery
Date: Thu, 26 Feb 2026 00:54:43 +0100
Message-Id: <20260225235447.2772383-1-tomasz.lis@intel.com>
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

Tomasz Lis (4):
  drm/xe/queue: Call fini on exec queue creation fail
  drm/xe/queue: Wrappers for setting and getting LRC references
  drm/xe/vf: Wait for all fixups before using default LRCs
  drm/xe/vf: Redo LRC creation while in VF fixups

 drivers/gpu/drm/xe/xe_exec_queue.c        | 121 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_exec_queue.h        |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  41 ++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   4 +-
 drivers/gpu/drm/xe/xe_lrc.h               |   3 +-
 6 files changed, 121 insertions(+), 52 deletions(-)

-- 
2.25.1

