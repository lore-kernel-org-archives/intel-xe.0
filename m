Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B51EC44507
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jul 2026 02:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18A110E29F;
	Sat, 11 Jul 2026 02:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JN1vs+RY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A0310E295
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Jul 2026 02:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783735506; x=1815271506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=06bSWSwffpOF47Ch07iJnTycE+fIYAYdMNEEA3HOjNo=;
 b=JN1vs+RYfVCM0kjXn2mNFLBYRnR6GO/vonJPpeooBw9EqlPek8C+jt0k
 vSwu1gWBTyBIbQDVeLEY4FY3yzW6CoMf2WGKYFMRvW20Q8Y4kNos/xm2R
 1S2zx9n58tMvp5RBN3Fzp155ilQpD6zsPwz8VNms4FxscYkG4c5qpR0t/
 ScCN23/TnMGUvYhuRS4++Aqd3VnTLDRfy8UkcUjYb9L20/zTbu54lDnvQ
 EnhQ7Fy8Bbw75hQJYj3uhQzt+sgF8Jr0ZwlQ4a73rsj0kA8cPLDij54GQ
 K5A9oIyg6gu3ORyE5bfg0s98hNyZbdxdug19CWdRfxXeRV0APN8Wn3NyV A==;
X-CSE-ConnectionGUID: O3aDEq0LRemfmy+SNxtIMg==
X-CSE-MsgGUID: nrgv6nFURZizmaxbGXU/0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71957062"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="71957062"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 19:05:05 -0700
X-CSE-ConnectionGUID: 57E78hF/RUCtCqLzvFYRgQ==
X-CSE-MsgGUID: cwJHDwWiTPyengvjKFvagg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="248654387"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 19:05:05 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 0/6] drm/xe: balance exec queue suspend/resume
Date: Fri, 10 Jul 2026 19:04:57 -0700
Message-ID: <20260711020459.2049523-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series fixes and hardens the exec queue suspend/resume balance in
the Xe driver, and builds on that to make multi-queue group suspend
actually preempt the group's GuC context.

Today a consumer that suspends an exec queue (preempt fences, the hw
engine group fault-mode switch, ...) unconditionally issues the
matching resume(), even when the suspend() never took effect because the
queue was killed, banned or wedged in the meantime. Resuming a queue
that was never suspended is incorrect: with the GuC backend it can trip
the !suspend_pending assertion or leave scheduling state inconsistent.

The series addresses this in layers:

 - Track whether a consumer's suspend() actually succeeded and only
   issue resume() when one is owed (patch 1), and apply the same
   discipline to the hw engine group fault-mode switch, including
   undoing partial suspends on failure (patch 4).

 - Harden the GuC suspend wait so a GuC timeout bans the queue or the
   multi-queue group and tears it down instead of leaving it suspended
   forever (patch 2).

 - Add uninterruptible suspend wait support for cleanup/undo paths
   that must complete a suspend on behalf of a queue that may belong to a
   different process without causing cross-process DOS (patch 3)

 - Add a suspend reference count to the exec queue ops so overlapping
   suspends from independent callers stay balanced (patch 5).

 - Use that refcount to forward a multi-queue secondary's suspend to the
   group's primary, so suspending a secondary actually disables the
   primary's GuC context and preempts the group's in-flight GPU work
   (patch 6).

v2: In suspend_wait(), add additional comment and ban whole group
    upon error.
v3: Refactor patches, add suspend_wait_blocking(), revert to interruptible
    wait in suspend_wait(), don't let a dying queue block the switch,
    update comments.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (5):
  drm/xe: only resume exec queues that were actually suspended
  drm/xe/guc: ban exec queue on suspend timeout
  drm/xe/guc: add uninterruptible suspend wait for cross-process cleanup
  drm/xe/hw_engine_group: propagate suspend failures during mode switch
  drm/xe/multi_queue: preempt primary on queue group suspend

Thomas Hellström (1):
  drm/xe/guc: Add suspend refcount to exec queue ops

 drivers/gpu/drm/xe/xe_exec_queue.c           |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |  27 ++
 drivers/gpu/drm/xe/xe_execlist.c             |   1 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 251 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c      |  85 ++++++-
 drivers/gpu/drm/xe/xe_preempt_fence.c        |   7 +
 drivers/gpu/drm/xe/xe_vm.c                   |  18 +-
 8 files changed, 375 insertions(+), 22 deletions(-)

-- 
2.43.0

