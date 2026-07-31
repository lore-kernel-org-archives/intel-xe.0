Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2896AC55172
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 02:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F1A10E111;
	Fri, 31 Jul 2026 02:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHIHqklF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B573A10E111
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 02:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785464685; x=1817000685;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EbzQIPTHNXJJaM713vMGmn4bZT2F9vSIkXqy/x0SOr4=;
 b=GHIHqklFyBv987gVJ4XcnL9iMnugtTrKGyDTeIZ0cWCPymO2sVyRdhLp
 Vf3Cp9LEP5m2+6yz0XAkkksresHJxzwsLdCh6yjAfVPwxFjpIfpc8ngcz
 T1/QIONPcmhJA0lUZcfH2xjPKG89fK8Op3868xJejhCB3sGTHgwoimzr4
 erUEzEx34DhlVccGX+rNgFuM60dGgz/VmvNPwP5C143zENwI0e4g9I+2/
 GUO+lNp9+6oac1CCGYe001r/qRQ1qCnjaUbM9pTle7wP6jgr49+cgZ46j
 ohuZzWzzrTtYgOAa9qZgLTpWdwyvcx65MV1e9Deu/BI7q9XOXwgPIx6vW A==;
X-CSE-ConnectionGUID: bWEytH0URGWG6fXNLrc98Q==
X-CSE-MsgGUID: OxuqJIY+QJOVhz+up6BE3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88623484"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="88623484"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:44 -0700
X-CSE-ConnectionGUID: VvrBhAWFQj2iCO2Z6doVuQ==
X-CSE-MsgGUID: wIxremsvT160gz1PUOQAxw==
X-ExtLoop1: 1
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 0/8] drm/xe: Prioritize BO eviction based on VM exec queue
 priority
Date: Thu, 30 Jul 2026 19:24:31 -0700
Message-Id: <20260731022439.2446486-1-matthew.brost@intel.com>
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

This series ties a BO's TTM LRU priority (i.e. how likely it is to be
picked for eviction/shrinking under memory pressure) to how userspace
is actually using the VM and BOs it belongs to, instead of treating
every BO the same.

The reasoning behind the heuristic:

 - Kernel BOs, and any BO not private to a single VM (no vm_id, e.g.
   shared/exported buffers), are given the highest priority so they
   are the least likely to be evicted -- these are foundational or
   shared resources.
 - BOs private to a VM are then prioritized based on the highest
   priority band userspace has assigned to any exec queue attached to
   that VM: a VM with a HIGH priority exec queue keeps its BOs at the
   highest priority (matching kernel/shared BOs), a VM with only
   NORMAL priority queues (or none yet) gets the next priority band
   down, and a VM with only LOW priority queues gets the band below
   that.
 - The lowest priority band is reserved exclusively for BOs (private
   or shared) that have no VMA mappings left anywhere. This lets
   userspace use an unbind as a signal of "drop this from my working
   set, but keep the backing store around in case I need it again" --
   the BO is retained, just made a preferred candidate for
   eviction/shrinking until it is rebound.

v3:
 - Rebase for CI
v4:
 - Fix issues raised by Sashiko
v5:
 - Fix more issues raised by Sashiko
v6:
 - Move DONTNEED to lowest priorty + continue purge scan across entire band
 - Create sub-bands favoring WB over WC/UC for shrinking

Matt

Matthew Brost (8):
  drm/xe: Track exec queue priority band counts for user VMs
  drm/xe: Re-prioritize VM's private BOs when adding an exec queue
  drm/xe: Lower BO TTM priority to lowest when fully unmapped from VM
  drm/xe: Fix up BO TTM priority for late VM binds
  drm/xe: Adjust BO TTM priority on DONTNEED/WILLNEED madvise
    transitions
  drm/xe: Limit purge shrinker pass to the lowest TTM priority band
  drm/ttm: Increase maximum TTM priorities to 8
  drm/xe: Favor evicting WB-cached BOs within each priority band

 drivers/gpu/drm/xe/xe_bo.c        |  35 ++++-
 drivers/gpu/drm/xe/xe_bo.h        |  37 ++++-
 drivers/gpu/drm/xe/xe_bo_types.h  |  17 ++-
 drivers/gpu/drm/xe/xe_dma_buf.c   |   2 +-
 drivers/gpu/drm/xe/xe_pagefault.c |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c  |  15 ++
 drivers/gpu/drm/xe/xe_vm.c        | 246 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h        |   4 +
 drivers/gpu/drm/xe/xe_vm_types.h  |  13 ++
 include/drm/ttm/ttm_resource.h    |   2 +-
 10 files changed, 350 insertions(+), 23 deletions(-)

-- 
2.34.1

