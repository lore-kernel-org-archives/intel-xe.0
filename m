Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76BFC61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 10:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2833910E3CB;
	Wed, 26 Aug 2026 10:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TY1SP2op";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1F110E3CB
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 10:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787740403; x=1819276403;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r6thLpYVRphYAWlxpXKSmRt9wIE6iQyu50H5Q1zdqmQ=;
 b=TY1SP2opa56aINjgpLtAo7B7kbMVmJTVV4b2r2GKEtB2GeonkoYYReM6
 v6nxyTvDxnXVWqxOBoMt0iZmN+ovl71W0xiS8gk2JsisQf0PI7zRJxikS
 VbgAZpviZs0zuhlN7MvjC9KhKN3+V7wzoJ2597vs0qgSSP9qhSLvkXm1s
 t0Skcf7R9sp8VDcWouJkrrHb54BZyFwrpKVtG0jXjJP7Lsk3z5Ylx4FLv
 DDQVU2FKRTR51EuJPEStECaWjXhQyVxAqcnrEUWPbxm69Pic21BXb43Uz
 JOzYvrF3fYRUZ5V5RrHVBKlo6HuTOE+aUOQ6F/T6nJYXTVFJoR3OOOn7/ g==;
X-CSE-ConnectionGUID: 1jQHDYluTieoLcO6BNK9iA==
X-CSE-MsgGUID: wacueiJ4Q0mU/lFA0JapMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98813192"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98813192"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:33:23 -0700
X-CSE-ConnectionGUID: wE51Xoq6TWu+9hIKt1iHZA==
X-CSE-MsgGUID: EX8KLIkRSCGByE6W4nkF6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="261411442"
Received: from unknown (HELO tilak-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.239.38])
 by fmviesa009.fm.intel.com with ESMTP; 26 Aug 2026 03:33:20 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/xe/ggtt: fix stale GGTT mappings on unmap
Date: Wed, 26 Aug 2026 16:01:53 +0530
Message-ID: <20260826103156.3233208-1-tilak.tirumalesh.tangudu@intel.com>
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

Second issue: engines cache GGTT translations in their own TLBs. The
existing GGTT invalidation (xe_tlb_inval_ggtt()) does not reach those
engine-side TLBs, so after an unmap an engine can keep hitting the stale
translation and read the old page. Patches 2 and 3 add and use a full
(INVAL_FULL, intra-VF) invalidation to drain the engine TLBs on unmap.

Patch 1: drm/xe/ggtt: fault on unmapped GGTT for multi-queue platforms
    Skip allocating the GGTT scratch page on multi-queue platforms so
    cleared and unmapped ranges hold PTE=0 and a stale-TLB access to a
    freed range faults instead of silently landing on scratch.

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
    - Patch 2: avoid the CT-state TOCTOU; (Matt Brost).
    - Patch 3: invalidate both the primary and media GTs, similar to
      xe_ggtt_invalidate() (Matt Brost)

Tangudu Tilak Tirumalesh (3):
  drm/xe/ggtt: fault on unmapped GGTT for multi-queue platforms
  drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT invalidation
    helper
  drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue GTs

 drivers/gpu/drm/xe/xe_ggtt.c            | 68 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt.h              | 13 +++++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 ++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 ++++++++++++---
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++
 6 files changed, 133 insertions(+), 22 deletions(-)

-- 
2.46.0

