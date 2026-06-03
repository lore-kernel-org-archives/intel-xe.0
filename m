Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC45CD6E4A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 06:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7884510F8FB;
	Wed,  3 Jun 2026 06:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZTsvZav";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8465710F8FB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 06:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780469560; x=1812005560;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uf2PNsAghCUnc2BT8+3YBLqO5ef8vlETtc+SCkz7hIw=;
 b=HZTsvZavq4TI0Vb3tsYlen+QEo4AmVBmOGJSHiKV7J3suh58B2dP6JOj
 z+B2T0+U5gjbKTTEnMYKqbl9bdDobJ62bODGW7Z3yqd+A/UCg37ebsHLW
 rFB0wc73/dEet98KRD2MjSUgYE8e2ChIgsgbZ4IG8FC2k3PPhhX398Ncf
 F1n9fzs36VywLEovCl9lHiKV0eZxYw7/nlfuraUyS7mgCZargXUwCb90o
 jV1CGElPziTrLUI5DyyNjMw4prBF/m816zZcCvLU4a93QBl9hXthTSzuB
 tURQT15dDfE4Ln1Xa71FmpwG00ENMHf9w+D4FCoONHAFVqu+s01YYq7lM w==;
X-CSE-ConnectionGUID: 1gvchgBIRI2ULdn8jOdKyQ==
X-CSE-MsgGUID: 0+vBUL/FQMe00a8T1977mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81263628"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81263628"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 23:52:40 -0700
X-CSE-ConnectionGUID: sxIV4/Y3QgSnlXW08huz5A==
X-CSE-MsgGUID: GbMonoJuSqucQQuleDLcIA==
X-ExtLoop1: 1
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa003.fm.intel.com with ESMTP; 02 Jun 2026 23:52:38 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, daniele.ceraolospurio@intel.com,
 niranjana.vishwanathapura@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] fix LR TLB invalidation gaps
Date: Wed,  3 Jun 2026 12:22:14 +0530
Message-ID: <20260603065217.3131066-1-tilak.tirumalesh.tangudu@intel.com>
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
as PT path includes it.-Thomas

Dropped drm/xe: add exec queue suspended ops callback
Dropped drm/xe: include suspended queues in TLB invalidation
They will need proper fix and they will come in separate series.

v3:
Knit-Removed unrelated change -Thomas

v4:
Add Fixes tag - Daniele

v5:
Add stable@vger tag -Niranjana

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

