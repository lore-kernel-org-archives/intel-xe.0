Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A91C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE5810E7DC;
	Mon, 24 Aug 2026 16:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/sX3eX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA3910E579
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787589385; x=1819125385;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JB+lQEYGBNRZEXD9xCZEwjLaFIdI+fbe9FO5GTz5gUI=;
 b=N/sX3eX80RYaLwZvnDFki5POtVyilvPBcA9jqHl0zmwTYGIfLF87kpwV
 eB+2lHkqmthuYujV06MSFZ96EJyKwZDx+TAInjNSTItSTaDQErTopUjGQ
 P6Tnm4tCVbhG07Hd4odGOt5RvnCrdbavpskV/oS5qDSQI9SF3OdrHUpJj
 369HNZIa9mscoeLJAcJHjkR3ZwSKNiCm69hB4EIcGoSncjNmkSG6boMse
 dQ9CoQ6mu0qq9fvX5x31vVrMSSEyTWe+krXlYFwsR5WqkhbnaUYodIwg0
 56EdTsMms+X9wa6CeiUb9FEEVNTZGqEmDAi/FjtIHPGedJHvR9os2sGkU w==;
X-CSE-ConnectionGUID: Q8bdkbTqSNOVkxe13pdMWA==
X-CSE-MsgGUID: hroS560CTOuvEHqFmZhUJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99209640"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="99209640"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:36:24 -0700
X-CSE-ConnectionGUID: 5UtCi6PRRy6PMsUWa+lvOQ==
X-CSE-MsgGUID: UySMAINWTkqY6W1T7tlCeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263321822"
Received: from unknown (HELO tilak-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.239.38])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 09:36:23 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/xe/ggtt: fix stale GGTT mappings on unmap
Date: Mon, 24 Aug 2026 22:04:55 +0530
Message-ID: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
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

This series addresses two related GGTT teardown issues on multi-
queue platforms:

First issue: the unmap path mapped freed ranges to the scratch page.
Because scratch is a valid PTE, a re-walk of a freed range never
faults, so any stale TLB translation left behind is masked - the freed
range silently reads scratch instead of surfacing the problem. On
multi-queue platforms Patch 1 writes PTE=0 on unmap instead; other
platforms keep scratch, so free-hole and init-time handling are
unchanged.

Second issue: engines cache GGTT translations in their own TLBs. The
existing GGTT invalidation (xe_tlb_inval_ggtt()) does not reach those
engine-side TLBs, so after an unmap an engine can keep hitting the
stale translation and read the old page. Patches 2 and 3 add and use a
FULL_INTRA_VF invalidation to drain the engine TLBs on unmap.

Patch 1: drm/xe/ggtt: stop mapping unmapped GGTT pages to scratch
    On multi-queue platforms write PTE=0 on unmap so a stale-TLB
    access to a freed range faults instead of silently landing on
    scratch.

Patch 2: drm/xe/tlb_inval: add FULL_INTRA_VF GGTT invalidation helper
    xe_tlb_inval_ggtt_full() + GuC backend flush engine TLBs across
    all engines in the requesting VF partition.

Patch 3: drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue GTs
    Issue the FULL_INTRA_VF invalidation on the unmap path, gated on
    the GT having any multi-queue engine class. Draining the engine
    TLB on teardown guarantees a recycled range's next occupant cannot
    hit the predecessor's cached translation.

v2: Add xe_gt_has_multi_queue() helper and refactor.
    Add xe_tlb_inval_issue_op_wait and refactor.
    Other knits.

Tangudu Tilak Tirumalesh (3):
  drm/xe/ggtt: stop mapping unmapped GGTT pages to scratch
  drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT invalidation
    helper
  drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue GTs

 drivers/gpu/drm/xe/xe_ggtt.c            | 70 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt.h              | 13 +++++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 ++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 ++++++++++++---
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++
 6 files changed, 137 insertions(+), 20 deletions(-)

-- 
2.46.0

