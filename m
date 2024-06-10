Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBFFC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 13:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C6610E189;
	Mon, 10 Jun 2024 13:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxfbyHE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B365D10E14C
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718027383; x=1749563383;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tt6siEOtDTQW6/MAlrSLl6NqBvtjdQgESC/4tnsl/ZY=;
 b=QxfbyHE0XqS0fNIFMpwUTulm1k3z44mnujg8WPRA7q80LvYR1UQ+It+6
 xw7qybOjmz0cCpzU5mfE4Wfsweknom7j74XYVKiORw0cC8BNPRvbWBL45
 MMad/YdoWzEzmPzSqinx3DZuc8jP7ayhUOUtIlP2EJsa9VxFEuLjfZP3G
 CdqAnUeLIeadKJvvCMb+wUW1iqHTfeZ+0w+Ob9PmIfgbrPUtovgPvQdlf
 33u4axGCrHaz0jus+DOEtB79lt78Q6kPDhSBSqXY/16ipeVPMTS9ugANR
 unRIYTg2wuBzYDs93f7IUYTAIvb+UdNY7GsqchqLdUdcsDCtiMlOPFp6U Q==;
X-CSE-ConnectionGUID: eGL3cC4wR8CmE0FLHyKS0Q==
X-CSE-MsgGUID: UfAcfQA7SL+v1Q/W/UYyDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14419829"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14419829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:49:42 -0700
X-CSE-ConnectionGUID: mbzj/jOXRjOSClhUEzKQTg==
X-CSE-MsgGUID: G9LItc9DRASw+iEeBk+Wag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="76523123"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:49:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/7] Only timeout jobs if they run longer than timeout
 period
Date: Mon, 10 Jun 2024 06:50:04 -0700
Message-Id: <20240610135011.2605272-1-matthew.brost@intel.com>
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

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799
[2] https://patchwork.freedesktop.org/series/134640/
[3] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134642v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-rebind.html

Matthew Brost (7):
  drm/xe: Add ctx timestamp to LRC snapshot
  drm/xe: Add xe_gt_clock_interval_to_ms helper
  drm/xe: Improve unexpected state error messages
  drm/xe: Add GuC state asserts to deregister_exec_queue
  drm/xe: Add pending disable assert to handle_sched_done
  drm/xe: Add killed, banned, or wedged as stick bit during GuC reset
  drm/xe: Sample ctx timestamp to determine if jobs have timed out

 drivers/gpu/drm/xe/xe_gt_clock.c   |  18 ++
 drivers/gpu/drm/xe/xe_gt_clock.h   |   1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 316 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_lrc.c        |   6 +
 4 files changed, 277 insertions(+), 64 deletions(-)

-- 
2.34.1

