Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0634BCCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 21:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A0F10E52B;
	Mon, 20 Oct 2025 21:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpE0CBrj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5821010E52B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 21:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760996732; x=1792532732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=468xImGwSrdAiXNJ1lm5XpXz5KH/6Kc1GwYn3gCmh60=;
 b=dpE0CBrjglXV+gptg5Uk6wHfF2YkR0e8k2jC62GpS2ja3jiHaaeQ6gxu
 PA9agLarFCjUnS44RU3bEXm0ClK/Kmx60Y/yIjlpfrC0tsKquo/Vq9AMO
 ixsAS/TBpDYi4IiDditKk8LKXJU8ArXW31VcdngUlYt9H2RVldfvRo52y
 2TaKvK33dC7uwPiOWyc44irzn4zVjqR2oVhhJcSeNv8scam0YSxwKH0eG
 7ea0RvqwlbQ+CfpI/BfeHUxKbN/S4v9A1Sc7MyJ5CawgNQOMkZrvCBav/
 z1ZveIqcyYEZopvMnKIfYiqBcJFZj6DQZIhyz5aa7S4UxE6w1UU/lM8lg Q==;
X-CSE-ConnectionGUID: AREvjxFsS5CA3A9JP/dGSA==
X-CSE-MsgGUID: eEl/fwsrSVWEvOjVBzYhEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63160721"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63160721"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:32 -0700
X-CSE-ConnectionGUID: DNy/PfVsTB64gbaVPyfEiA==
X-CSE-MsgGUID: eO2iGTN7SYGWsp8yEcULMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183451174"
Received: from dut4084arlh.fm.intel.com ([10.105.10.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:31 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 niranjana.vishwanathapura@intel.com, zhanjun.dong@intel.com,
 shuicheng.lin@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/7] Fix a couple of wedge corner-case memory leaks
Date: Mon, 20 Oct 2025 21:45:22 +0000
Message-Id: <20251020214529.354365-1-stuart.summers@intel.com>
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

Also add a little documentation on the various stages
handled within the GuC exec queue submission path.

The main interesting patch is the last one in the
series which fixes some corner cases when the
driver becomes wedged in the middle of either communication
with the DRM scheduler or in the event the GuC becomes
unresponsive. In both of these cases there is a chance
we could leak memory around the exec queue members
like the LRC and the LRC BO. This patch fixes those
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

Stuart Summers (7):
  drm/xe: Add additional trace points for LRCs
  drm/xe: Add a trace point for VM close
  drm/xe: Add the BO pointer info to the BO trace
  drm/xe: Add new exec queue trace points
  drm/xe: Correct migration VM teardown order
  drm/xe: Clean up GuC software state after a wedge
  drm/xe/doc: Add GuC submission kernel-doc

 Documentation/gpu/xe/index.rst         |  1 +
 Documentation/gpu/xe/xe_guc_submit.rst |  8 +++
 drivers/gpu/drm/xe/xe_exec_queue.c     |  4 ++
 drivers/gpu/drm/xe/xe_guc_submit.c     | 93 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_lrc.c            |  4 ++
 drivers/gpu/drm/xe/xe_lrc.h            |  3 +
 drivers/gpu/drm/xe/xe_migrate.c        |  9 +--
 drivers/gpu/drm/xe/xe_trace.h          | 22 +++++-
 drivers/gpu/drm/xe/xe_trace_bo.h       | 12 +++-
 drivers/gpu/drm/xe/xe_trace_lrc.h      | 42 +++++++++++-
 drivers/gpu/drm/xe/xe_vm.c             |  2 +
 11 files changed, 187 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_guc_submit.rst

-- 
2.34.1

