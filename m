Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D929C27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 22:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B645010E012;
	Fri,  7 Jun 2024 22:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Olxciz8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAA210E012
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717797763; x=1749333763;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MyBGYGKn66EfDiE4wRzjI2GHWqNZJGV2yvuszlNjYTQ=;
 b=Olxciz8uf7tIfMl17BvvpyxWZMVGnn0ZbFC5O8f1kd852g6HKtQFWqTy
 nuqhrzP5hX1nbv5ogZO+Kr+GkQskVAA10TX4nJzBOa3UvEroWkroRpZxo
 0TVffu94A0QIeHW42igmMFAULDR1Y7MF5aMYHaCugFKOUNZafkJbU2NWK
 2jU/aUbuseaJvhgEDGu17ak1awmliFknHQxad7s7ccHG1k/xJjty2a1n5
 Wt57q5cdR/5blZKZ152O7Aq93/A5FcIX6heBCPU+PJMO+ZE6uKWJ9J1c3
 Zjidj1Jz8HX78SGx9yumCwuJdcTRFKaaKSJRBMrWM2vCQ9yEJIvaqVsNk Q==;
X-CSE-ConnectionGUID: 5PMe/kviRQyVfYGcfL/5nw==
X-CSE-MsgGUID: vx2l2ppsSLu0f0PlaY9rvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14657034"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14657034"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 15:02:42 -0700
X-CSE-ConnectionGUID: tve1WVShSaelv6t1wxCD5Q==
X-CSE-MsgGUID: uISwtyblTOGXVm/UWsAEgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38307940"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 15:02:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/6] Only timeout jobs if they run longer than timeout
 period
Date: Fri,  7 Jun 2024 15:03:08 -0700
Message-Id: <20240607220314.2318154-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Debugging [1] hit a known flaw in the job timeout mechanism - jobs
timeout after a period of time in which they have been submitted to the
GuC not how long they have actually been running on the hardware.
Attempt to fix this.

Algorithm is as follows:
- Copy ctx timestamp from LRC to saved location at beginning of every
  job
- On TDR kick jobs off hardware via schedule disable so ctx timestamp is
  updated
- Compare ctx timestamp to saved ctx timestamp, if jobs having been
  running less than timeout period re-enable scheduling are restart TDR

New job cancel IGT [2] for testing.

v2:
- Promote to non-RFC as issues which I view as blockers have been resolved
- Address Jani and Michal v1 feedback
- Add GT clock timer calculation

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799
[2] https://patchwork.freedesktop.org/series/134637/

Matthew Brost (6):
  drm/xe: Add LRC ctx timestamp support functions
  drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
  drm/xe: Emit ctx timestamp copy in ring ops
  drm/xe: Add ctx timestamp to LRC snapshot
  drm/xe: Add xe_gt_clock_interval_to_ms helper
  drm/xe: Sample ctx timestamp to determine if jobs have timed out

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
 drivers/gpu/drm/xe/xe_gt_clock.c              |  18 +++
 drivers/gpu/drm/xe/xe_gt_clock.h              |   1 +
 drivers/gpu/drm/xe/xe_guc_submit.c            | 153 ++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.c                   |  72 +++++++++
 drivers/gpu/drm/xe/xe_lrc.h                   |   5 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  21 +++
 7 files changed, 241 insertions(+), 33 deletions(-)

-- 
2.34.1

