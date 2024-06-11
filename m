Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FEFC41513
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 14:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4160F10E678;
	Tue, 11 Jun 2024 14:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yh/6VEzP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE24E10E678
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718116832; x=1749652832;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jyu4Os7PrJJ+3heuzkNPSECAZeH3QeZuRT6SLcsLioE=;
 b=Yh/6VEzPDqQxORS0q/W86O8bxf1fT8b+iWuYH7WkXOcjHmj1OePHwrBC
 RjgFrcLMNX7CEi3P7LJHHHSGFqu6Xd4Y8G3Riwe6t2yPR0DVO0A2XeBOf
 BbdX3cRv9t2we1QGoG2k8bwZ3VVoWzeYE6oKYexYHmvnbye6JyPKds25c
 cqWzjnRLmumIwssnrWLUS577KnBR4pNhLY7y5xQOOl1CqP+HFHmDHFLwm
 EtcxYo8/SK7ISoA+UOukK+Hs4eCK6Nr1QuGcIw4HTBKsedsk92Ra7qJdd
 8ji62k+dXp5v3J2kdmEQlTYJtw61UcZLAURFXjbD+YjvU5ZvoCN7KxI1D Q==;
X-CSE-ConnectionGUID: 06VQ0S1STWGrQV99aSQjow==
X-CSE-MsgGUID: AXa37q09R9y6+FL3JoAUtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14784558"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14784558"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
X-CSE-ConnectionGUID: 7MjT2wVMShi4a23oK0exIg==
X-CSE-MsgGUID: mL4h3mcPSryMG9h/n+x1vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44590312"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 00/11] Only timeout jobs if they run longer than timeout
 period
Date: Tue, 11 Jun 2024 07:40:42 -0700
Message-Id: <20240611144053.2805091-1-matthew.brost@intel.com>
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
v4:
- Address a few comments by John H
- Fix CI failure [3]
v5:
- Include all the patches
v6:
- Address John H's latest feedback including a new patch
- Fix CI hooks failure
- Fix assertion failure [4]

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799
[2] https://patchwork.freedesktop.org/series/134640/
[3] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134642v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-rebind.html
[4] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2445590

Matthew Brost (11):
  drm/xe: Add LRC ctx timestamp support functions
  drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
  drm/xe: Emit ctx timestamp copy in ring ops
  drm/xe: Add ctx timestamp to LRC snapshot
  drm/xe: Add xe_gt_clock_interval_to_ms helper
  drm/xe: Improve unexpected state error messages
  drm/xe: Assert runnable state in handle_sched_done
  drm/xe: Add GuC state asserts to deregister_exec_queue
  drm/xe: Add pending disable assert to handle_sched_done
  drm/xe: Add killed, banned, or wedged as stick bit during GuC reset
  drm/xe: Sample ctx timestamp to determine if jobs have timed out

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
 drivers/gpu/drm/xe/xe_gt_clock.c              |  20 ++
 drivers/gpu/drm/xe/xe_gt_clock.h              |   1 +
 drivers/gpu/drm/xe/xe_guc_submit.c            | 334 ++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.c                   |  84 ++++-
 drivers/gpu/drm/xe/xe_lrc.h                   |   5 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  21 ++
 7 files changed, 400 insertions(+), 69 deletions(-)

-- 
2.34.1

