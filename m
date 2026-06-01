Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED504CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 14:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5CE10E7E8;
	Mon,  1 Jun 2026 14:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Af3NTjeo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E68710E7E8
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780324223; x=1811860223;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FCI4PNBpqbpQpqLnbRUczCeiQN3jipeIP9MnLUVz8pw=;
 b=Af3NTjeoWHygQ8+OzVq2wXLfzJEPuqHD8W2jrVHH/Bw/dvpWSS+wjbVk
 mtBVPXkor1i8K52j/6Jo2jmD481QG7Beoq5ac0mC8GyJIPBzGrTxbS4Iu
 YKWfpDpNNBig2KUE0FnNubhmGYbo9yGQm6URq/Aq2RaTZNj4SkPy5R9kK
 VzahaIg5ytXXlfXatDwQq7cCRp2BOhk8Z+/YKMZGP1spcYr0a9LMbWpEt
 oGgWbZWA3JtzKYglkt2Oz1XGp+wHkfRdJLmS5B61C6ffD5AK8n+DhG7lF
 vu0Cw65tDnv8BgU6HxvxynXcszZkvjkEr5aqWzSBhYa/+tr1qSyiAtCHa A==;
X-CSE-ConnectionGUID: 4o8xXTHfRXW/AAuJdzDGcw==
X-CSE-MsgGUID: rKogat/kSdOpTzMsBj4yTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92195392"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="92195392"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 07:30:23 -0700
X-CSE-ConnectionGUID: FQY7ybcLQwOGYWBcUjW90w==
X-CSE-MsgGUID: +Ta2cLU1RguOnzX0Xi+z0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="245408786"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa004.fm.intel.com with ESMTP; 01 Jun 2026 07:30:20 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com, x.wang@intel.com,
 brian3.nguyen@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] fix LR TLB invalidation gaps
Date: Mon,  1 Jun 2026 19:59:57 +0530
Message-ID: <20260601143000.2830227-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

v2:
drm/xe: explcit TLB flush for context based tlb invalidation
Removed userptr TLB invalidation in notifier path and
as PT path includes it.

Dropped drm/xe: add exec queue suspended ops callback
Dropped drm/xe: include suspended queues in TLB invalidation
They will need proper fix and they will come in separate series.

v3:
Knit-Removed unrelated change

Tangudu Tilak Tirumalesh (3):
  Revert "drm/xe: Skip exec queue schedule toggle if queue is idle
    during suspend"
  drm/xe: Clear pending_disable before signaling suspend fence
  drm/xe: explicit TLB flush for context based tlb invalidation

 drivers/gpu/drm/xe/xe_exec_queue.h      | 17 --------
 drivers/gpu/drm/xe/xe_guc_submit.c      | 57 ++-----------------------
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 10 +----
 drivers/gpu/drm/xe/xe_pt.c              |  6 +++
 4 files changed, 12 insertions(+), 78 deletions(-)

-- 
2.46.0

