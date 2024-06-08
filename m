Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E0AC27C55
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 00:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6210ED0E;
	Sat,  8 Jun 2024 00:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nz4FpE8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C704010E1BF
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 00:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717806031; x=1749342031;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pZE5GLTl6Z2G9MgcDssbbewcPFgtEoeAvbpRuhiMghs=;
 b=Nz4FpE8KPZ2qe5W2QCUtWrkDuce+Q9TalFx/UU6aCtlrRy6VVIyLYBXK
 0Wg/202aIf4UjV/l4qlMRTbiYL3CGIsTXwOBZJYUKZS5/jvcv5kCLqTPR
 5b8Mon65TXrWq2+sqWo1Bok/KshbSdOjmnyH2GojAhY4m9zTOY6wV2VQo
 cQMfhG/J91cmwAmckgqDB17a6DL3EB5EMh5Prl+7IIPu1hSxpW1/M4/nE
 RfdikCPZ8dkP2ds3rMxQT2rRf3IzD2/XwpGiaTCcDHp5w1cRg3cMeiqkl
 mYPsbCk+LaTwTn93xiGF5hcJTmQZDPkfkQkJBYoNrUh7AhJR5ZpqEjFLW Q==;
X-CSE-ConnectionGUID: 08qG1+J+QY+TgZqsfUAIwQ==
X-CSE-MsgGUID: eAPxqMuKT0e3k8VOQInCJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25173691"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25173691"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:20:30 -0700
X-CSE-ConnectionGUID: BFIn5eGLQYmZ0MOYbTcuoQ==
X-CSE-MsgGUID: sAdw8jyWQva48YJNLxJvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38427010"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:20:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/6] Only timeout jobs if they run longer than timeout
 period
Date: Fri,  7 Jun 2024 17:20:57 -0700
Message-Id: <20240608002103.2371696-1-matthew.brost@intel.com>
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
v3:
- More testing
- Fix TDR state machine bugs exposed in testing
- Rebase for CI

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799
[2] https://patchwork.freedesktop.org/series/134640/

Matthew Brost (6):
  drm/xe: Add LRC ctx timestamp support functions
  drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
  drm/xe: Emit ctx timestamp copy in ring ops
  drm/xe: Add ctx timestamp to LRC snapshot
  drm/xe: Add xe_gt_clock_interval_to_ms helper
  drm/xe: Sample ctx timestamp to determine if jobs have timed out

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
 drivers/gpu/drm/xe/xe_gt_clock.c              |  18 ++
 drivers/gpu/drm/xe/xe_gt_clock.h              |   1 +
 drivers/gpu/drm/xe/xe_guc_submit.c            | 218 ++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.c                   |  72 ++++++
 drivers/gpu/drm/xe/xe_lrc.h                   |   5 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  21 ++
 7 files changed, 296 insertions(+), 43 deletions(-)

-- 
2.34.1

