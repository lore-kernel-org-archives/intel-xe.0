Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D1CCD6E44
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 12:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A250010F12B;
	Thu, 28 May 2026 12:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqYanlDi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9711710F12B
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779972243; x=1811508243;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oVbNQ1CYAWZ+752AdVlGc/XjrLTh0tfhFWLX2D0Jb0s=;
 b=iqYanlDieRSAK0XRT9nQherjyWnKlIwBm0kq6ixDM7zLsAkKgVPaPnup
 zMKWyLdaaitqL5CUx1CP6D62OkJHNWGT/4r0kL0CiRQ4R0mta73WVplnF
 kHtr7t25QPxHUaBYoPFP5k/63sz3i6iwAuwaYuF/NIVm/SnLxvlNlMswV
 YeIZuC1ZxJwgzgm4HDE99LJDrTJmiBoc7tOd9dLaPjrjzfb337ljZkKr5
 rPaL/Dd1cwNwnqFMQna0BZ+hVqad+bhXKd1J1va23laxQ502Ky+U4wEIa
 f7lvQouxoD5BgMsBsZSu2RPnpOk8rLsJ1wwD5kmsEI1oDzhtjd8Bl1prD A==;
X-CSE-ConnectionGUID: WvKyksugRNKxuhWmfHWrrA==
X-CSE-MsgGUID: lwia5oANSQy8rfjmUA7MQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91499317"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="91499317"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 05:44:02 -0700
X-CSE-ConnectionGUID: ODsqzzJ5Seuaj2hlfVEMqA==
X-CSE-MsgGUID: oTube7vVT36xZzxbWzBJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="272871021"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa002.jf.intel.com with ESMTP; 28 May 2026 05:43:59 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com, x.wang@intel.com,
 brian3.nguyen@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] fix LR TLB invalidation gaps
Date: Thu, 28 May 2026 18:13:37 +0530
Message-ID: <20260528124340.1864215-1-tilak.tirumalesh.tangudu@intel.com>
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

Tangudu Tilak Tirumalesh (3):
  Revert "drm/xe: Skip exec queue schedule toggle if queue is idle
    during suspend"
  drm/xe: Clear pending_disable before signaling suspend fence
  drm/xe: explcit TLB flush for context based tlb invalidation

 drivers/gpu/drm/xe/xe_exec_queue.h      | 17 --------
 drivers/gpu/drm/xe/xe_guc_submit.c      | 57 ++-----------------------
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 10 +----
 drivers/gpu/drm/xe/xe_pt.c              |  6 +++
 drivers/gpu/drm/xe/xe_userptr.c         |  2 +-
 5 files changed, 13 insertions(+), 79 deletions(-)

-- 
2.46.0

