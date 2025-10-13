Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665E8CCD196
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A0310E4AF;
	Mon, 13 Oct 2025 16:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nja1xFG2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B2A10E4A7
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760372713; x=1791908713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9xyNqUdiNPBS3UPvphQQrGQYkXJPSeyf6C4VFguIkjE=;
 b=nja1xFG2hddXy/LMAUUQWmadS2nKrVYxVMbNFhnpHSYvq+Cq1AmV1wKR
 /3IaQZZ0kHzY6Q4+FRK8ZpRoNPwyMmUB2UeiNrWDA0+ooAZB3nbWbVwQi
 Wt6YeLa6MAHO2r26wDwM9HlNM5nyHJ321giv3OD6KBnZIJBuMfvuAAqIi
 TyZqUS/d6nqNWKoHwYY56fK7XGi1zutJnWHqYaC/dmFRqN7NThpuUin93
 oLiQyytAsaZfTN87BLy+SWdda8TZHxFvLrEVNe7MAFNg4/ofd3TgcmQT8
 HWiMUQ5D7+040fZ0EKw/tRHJdaXLPqmtU3ULDUuwIptUojm6r9E+a0wCP Q==;
X-CSE-ConnectionGUID: HrwV6w4PSSqvXzHNnq3MYA==
X-CSE-MsgGUID: YEWA9vk1RlmZPBYFuan9oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73963493"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73963493"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:25:11 -0700
X-CSE-ConnectionGUID: vQJkhfskSyuNQH+Mkwf2yA==
X-CSE-MsgGUID: 9s4mLmf+TsGofwpsWGHPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185651395"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:25:10 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/7] Fix a couple of wedge corner-case memory leaks
Date: Mon, 13 Oct 2025 16:24:57 +0000
Message-Id: <20251013162504.7768-1-stuart.summers@intel.com>
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

Most of the patches in this series are just adding
some debug hints to help track these down. I split
these up in case we want to pick and choose which ones
to include in the tree. I found them useful.

The main two interesting patches are the last two in the
series which are fixing some corner cases when the
driver becomes wedged in the middle of either communication
with the DRM scheduler or in the event the GuC becomes
unresponsive. In both of these cases there is a chance
we could leak memory around the exec queue members
like the LRC and the LRC BO. These patches fix those
scenarios.

v2: Address feedback from Matt:
    - Let the DRM scheduler handle pausing/unpausing
    - Still do the wait after scheduling disable/deregister
      as with the previous patch, but skip the intermediate
      software-based schedule disable using the "banned"
      flag and instead just jump straight to the deregister
      handling which will fully reset the queue state.
      Note that for this case I am seeing a hardware failure
      after submitting to GuC but before receiving the
      response from GuC. So even if we wedge in this case
      (monitoring the hardware state change), the queue
      itself is not wedged because of the active GuC
      submission (CT is not stalled at that point).

Stuart Summers (7):
  drm/xe: Add additional trace points for LRCs
  drm/xe: Add a trace point for VM close
  drm/xe: Add the BO pointer info to the BO trace
  drm/xe: Add new exec queue trace points
  drm/xe: Correct migration VM teardown order
  drm/xe: Don't block messages to the GPU scheduler
  drm/xe: Check for GuC responses on disabling scheduling

 drivers/gpu/drm/xe/xe_exec_queue.c    |  4 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler.c |  6 +---
 drivers/gpu/drm/xe/xe_guc_submit.c    | 24 ++++++++++++---
 drivers/gpu/drm/xe/xe_lrc.c           |  4 +++
 drivers/gpu/drm/xe/xe_lrc.h           |  3 ++
 drivers/gpu/drm/xe/xe_migrate.c       |  2 +-
 drivers/gpu/drm/xe/xe_trace.h         | 22 ++++++++++++--
 drivers/gpu/drm/xe/xe_trace_bo.h      | 12 ++++++--
 drivers/gpu/drm/xe/xe_trace_lrc.h     | 42 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c            |  2 ++
 10 files changed, 106 insertions(+), 15 deletions(-)

-- 
2.34.1

