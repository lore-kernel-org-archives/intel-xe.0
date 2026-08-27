Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA96C5DF9D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 08:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDF910E5B8;
	Thu, 27 Aug 2026 08:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvZFKd59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F1310E0CD
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 08:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787818898; x=1819354898;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bRsceO5zODKfF/xun6gJTZTbRBx5OqLf3bkqWnY7cns=;
 b=CvZFKd59M2DtcAEk90B+83QYQS3FwpFsw7stctK/TNI0FeSipKztK+kb
 uvuQPRcUVabb9igI2ejdePcvKqgAYibKiEUXozKzksIXiKwCMwXdzSrD6
 T3xuD+MQQhHqIelaZ2BkY6cNU9Q2yxwWajtCiB/VlhFN/b0hQMZZJXhBG
 lG9L8u628kgvyWNJUYKGlv/xSKR3uFjEGCrK/9Jsz4jlxOwAIZqzC+/8f
 v6VZKfWj+RlZfEBp07IlfPTTwdifPqZyIttTnzK8EetLYwqIDNAhxTjaQ
 uWMJjPZ61GGykXd8cWABpONFTNbImC7NtUE9SFzEb46T25vPr/a5vtpTr w==;
X-CSE-ConnectionGUID: EsIx/MzyRIi5A2uILorlAQ==
X-CSE-MsgGUID: M1naklNkRemTINdJsj3faQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99475708"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="99475708"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 01:21:37 -0700
X-CSE-ConnectionGUID: +IONw667Qq+kow4qTiUrPQ==
X-CSE-MsgGUID: zryfrP2sStuw30AccLbacQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264559590"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2026 01:21:35 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/xe/ggtt: fix stale GGTT mappings on unmap
Date: Thu, 27 Aug 2026 13:50:08 +0530
Message-ID: <20260827082011.3370672-1-tilak.tirumalesh.tangudu@intel.com>
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

This series addresses two related GGTT teardown issues on multi-queue
platforms:

First issue: unmapped GGTT ranges resolve to the scratch page. Because
scratch is a valid PTE, a re-walk of a freed range never faults, so any
stale TLB translation left behind is masked - the freed range silently
reads scratch instead of surfacing the problem. On multi-queue platforms
Patch 1 does not allocate the scratch page at all, so the whole GGTT -
initial clear and unmap alike - holds PTE=0 and faults consistently for
the entire boot. Other platforms keep scratch and are unchanged.

Second issue: engines cache GGTT translations in their own TLBs. A
full context restore on engine switch normally flushes them, but on
multi-queue GuC does a lite-restore on secondary queue append and
skips the full context restore, so those engine TLB invalidations are
missed. The existing GGTT invalidation (xe_tlb_inval_ggtt()) does not
reach the engine-side TLBs either, so after an unmap an engine can
keep hitting the stale translation and read the old page. Patches 2
and 3 add and use a full (INVAL_FULL, intra-VF) invalidation to drain
the engine TLBs on unmap.

Patch 1: drm/xe/ggtt: fault on unmapped GGTT for multi-queue platforms
    Skip allocating the GGTT scratch page on multi-queue platforms so
    cleared and unmapped ranges hold PTE=0. A missed engine TLB
    invalidation (see above) then faults instead of silently landing
    on scratch.

Patch 2: drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
         invalidation helper
    xe_tlb_inval_ggtt_full() + GuC backend flush engine TLBs across all
    engines within the requesting VF.

Patch 3: drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue GTs
    Issue the invalidation on the unmap path, gated on the GT having any
    multi-queue engine class, for both the primary and media GTs.
    Draining the engine TLB on teardown guarantees a recycled range's
    next occupant cannot hit the predecessor's cached translation.

v2:
    - Add xe_gt_has_multi_queue() helper and gate on it (Niranjana).
    - Add xe_tlb_inval_issue_op_wait() and refactor the GGTT
      invalidation entry points onto it (Niranjana).
    - Other nits.

v3:
    - Patch 1: drop the scratch page entirely on multi-queue platforms
      instead of toggling scratch vs faulting at unmap, so the behaviour
      is consistent for the whole boot (Matt Brost).
    - Patch 2: avoid the CT-state TOCTOU (Matt Brost).
    - Patch 3: invalidate both the primary and media GTs, similar to
      xe_ggtt_invalidate() (Matt Brost).

v4:
    - Patch 2: propagate real send errors instead of masking them as
      -ECANCELED (Sashiko).

v5:
    - Patch 1: document the rationale - GuC lite-restore on secondary
      queue append skips the full context restore, so engine TLB
      invalidations are missed (Matt Roper, Matt Brost).
    - Patch 2: handle -ENOTRECOVERABLE (wedged) alongside -ENODEV, and
      drop the redundant -ECANCELED check (Matt Brost, Niranjana).
    - Patch 3: guard NULL gt for parity with ggtt_invalidate_gt_tlb()
      and explain the multi-queue-only engine flush (Niranjana).

Tangudu Tilak Tirumalesh (3):
  drm/xe/ggtt: fault on unmapped GGTT for multi-queue platforms
  drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT invalidation
    helper
  drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue GTs

 drivers/gpu/drm/xe/xe_ggtt.c            | 74 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt.h              | 13 +++++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 29 ++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 ++++++++++++--
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++
 6 files changed, 147 insertions(+), 22 deletions(-)

-- 
2.46.0

