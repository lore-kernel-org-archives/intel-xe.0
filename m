Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816BECCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C61410E544;
	Mon, 27 Oct 2025 18:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CE+npwV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFF710E541
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761588255; x=1793124255;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zndWpwZ041GZjAvddglG9N1TQMJRlIOwC+rXOpLKJsg=;
 b=CE+npwV9mcTl9ele5l9xmO5ZecpxYmCNm4RJCGGwRXrwfsBrpn3fLeyf
 59NFjYzZGjzDIje0mK+pywNWyFcvIGxCLhdP0gfKXaFy9tKRPYelqXr9t
 7HjxruNqvWESXA7ISUJ3jRhTfn0wLd4s+2Ij+3jwya5H0RQM5oBuE+yR5
 saGXM4zsxlbkGKnCyyDsUUU9bXQ05EnST9NNaWqC6W3CqAx/+BVYdkaiH
 LsGxyNbgMYMeW2m93y7wNuB/0X30t2Zgeow+3hIqyrwFHvi+gDIxMJ5gO
 N+8wwNOr36a0GeW0iYitVv8w62HXGOiQ3PpQYsYF1gy0dXloSIogGoN+T w==;
X-CSE-ConnectionGUID: wrTAzTUkQXG0VOarf5laow==
X-CSE-MsgGUID: xlfjgfBKQnWdSm4u/fjJqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63575700"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63575700"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:04:14 -0700
X-CSE-ConnectionGUID: 1rS0bs2mSXiTIHdfX/dL5Q==
X-CSE-MsgGUID: Kb4MBso0R6OIpBlB5haUig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184291131"
Received: from dut4396arlh.fm.intel.com ([10.105.10.137])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:04:13 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 niranjana.vishwanathapura@intel.com, zhanjun.dong@intel.com,
 shuicheng.lin@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/6] Fix a couple of wedge corner-case memory leaks
Date: Mon, 27 Oct 2025 18:04:06 +0000
Message-Id: <20251027180412.63743-1-stuart.summers@intel.com>
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

The main interesting patch is the last one in the
series which fixes some corner cases when the
driver becomes wedged in the middle of either communication
with the DRM scheduler or in the event the GuC becomes
unresponsive. In both of these cases there is a chance
we could leak memory around the exec queue members
like the LRC and the LRC BO. This patch fixes those
scenarios.

This series depends on [1].

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
v3: Add back in the xe pause checks and instead just kickstart
    message handling in the guc_submi_fini() routine before
    doing the async wait there.
v4: Handle the CT communication loss during wedge asynchronously
    Also combine those last two patches into one to handle
    wedge cleanup generally.
v5: Add a new patch with a little documentation on the GuC
    submission handling stages.
    Move the scheduler kickstart and destruction call on the
    dangling queues into the wedged_fini() callback. These
    only get called now for queues which are in an error
    state - wedge was called, but these weren't fully
    cleaned up as seen by the lack of exec_queue reference
    at the time of wedging.
    Also fix the migration ordering teardown reference mistake
    pointed by Matt in the previous series rev.
v6: Implement and test against [1] with the changes Matt suggested.

[1]: https://patchwork.freedesktop.org/series/155315/

Stuart Summers (6):
  drm/xe: Add additional trace points for LRCs
  drm/xe: Add a trace point for VM close
  drm/xe: Add the BO pointer info to the BO trace
  drm/xe: Add new exec queue trace points
  drm/xe: Correct migration VM teardown order
  drm/xe: Clean up GuC software state after a wedge

 drivers/gpu/drm/xe/xe_exec_queue.c |  4 +++
 drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++---
 drivers/gpu/drm/xe/xe_lrc.c        |  4 +++
 drivers/gpu/drm/xe/xe_lrc.h        |  3 +++
 drivers/gpu/drm/xe/xe_migrate.c    |  7 ++---
 drivers/gpu/drm/xe/xe_trace.h      | 22 ++++++++++++++--
 drivers/gpu/drm/xe/xe_trace_bo.h   | 12 +++++++--
 drivers/gpu/drm/xe/xe_trace_lrc.h  | 42 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c         |  2 ++
 9 files changed, 101 insertions(+), 12 deletions(-)

-- 
2.34.1

