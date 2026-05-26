Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85416CD5BD5
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 08:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D3810E465;
	Tue, 26 May 2026 08:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Syv0k3H+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C020D10E465
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 08:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779784042; x=1811320042;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R2jLWjAXBQ5zoBLQNOTxxu3vjsAaoZjiMkofYPkLQCY=;
 b=Syv0k3H+WdZmWNNrSkm7SqD2lWkbAL8l6mLcLTv00B5suTuhFMKQqfgM
 fQZPnBfH+Yxdr5eGQv6McyPAepjAehPfeomzqjS1IKNDam5CE2+Ivg9FB
 dCiAW3uipzIElgZXRfoS9NX9xGDOPoXyXgKGN204Hx5sEQdeTyVFD/JWw
 I79fYXeWjOc/rCuo/ptB4a3Sc0XwG/UlUTeIbJW0S9/PoWYSa+WPXoP+u
 z9FK5N6sqvKEDvJoNOHB3jKifv+kKcIGa3chmglcOO3oXUq23dcoEqmRk
 7wDQF1Xq6MAdJFLN2O4h4N8UczPL888opB5BfaYoULxnrfDf/b3KePZkd g==;
X-CSE-ConnectionGUID: hj7r3jnZSMqNzKPUwXoMWQ==
X-CSE-MsgGUID: A1pRYj5zQwCK7kRVfYHO/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91698379"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91698379"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 01:27:21 -0700
X-CSE-ConnectionGUID: SAbBPiJTQfWeDjxBf1HjJQ==
X-CSE-MsgGUID: WiSLvWf1Sy66r4EibfwiLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="239251697"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa008.fm.intel.com with ESMTP; 26 May 2026 01:27:19 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com, x.wang@intel.com,
 brian3.nguyen@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 0/5] fix LR TLB invalidation gaps 
Date: Tue, 26 May 2026 13:56:55 +0530
Message-ID: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

This series fixes LR/preempt-fence invalidation issues seen with
idle-skip optimization, devices based on context-based TLB invalidation
and fixes a suspend/resume ordering race exposed by reverting the idle-skip path.

Revert "drm/xe: Skip exec queue schedule toggle if queue is idle during suspend"
Reverts the idle-skip optimization because it can bypass GuC 
suspend/context-switch in LR flows, which may skip the flush
 behavior needed after userptr invalidation.

drm/xe: Clear pending_disable before signaling suspend fence
Fixes a race in schedule-disable completion: clear pending_disable
 first, then signal suspend fence, so resume cannot enter 
enable_scheduling with stale pending_disable state.

drm/xe: explcit TLB flush for context based tlb invalidation
Adds explicit invalidation submission for rebind windows in 
context-based TLB inval mode (notifier path and PT path)

drm/xe: add exec queue suspended ops callback
Introduces a suspended-state callback in exec queue ops and
a generic helper so callers can query suspended state in a
backend-agnostic way.

drm/xe: drm/xe: include suspended queues in TLB invalidation
Extends queue selection for context-based invalidation to 
include suspended queues, preventing missed invalidations
when queues are suspended but still associated with the VM.

This series is a continuation of the patch sent earlier
with different subject https://patchwork.freedesktop.org/series/166935/

Nguyen Brian3 (1):
  drm/xe: drm/xe: include suspended queues in TLB invalidation

Tangudu Tilak Tirumalesh (4):
  Revert "drm/xe: Skip exec queue schedule toggle if queue is idle
    during suspend"
  drm/xe: Clear pending_disable before signaling suspend fence
  drm/xe: explcit TLB flush for context based tlb invalidation
  drm/xe: add exec queue suspended ops callback

 drivers/gpu/drm/xe/xe_exec_queue.h       | 22 ++------
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 65 +++++-------------------
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 10 ++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c  | 10 +---
 drivers/gpu/drm/xe/xe_pt.c               |  4 ++
 drivers/gpu/drm/xe/xe_userptr.c          | 15 +++++-
 7 files changed, 46 insertions(+), 82 deletions(-)

-- 
2.46.0

