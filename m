Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFA7C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 07:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C326310F25E;
	Fri, 21 Aug 2026 07:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cu5R71jS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D367D10F25E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787298244; x=1818834244;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NxRTPesOQyaCy6gQXg9li5fYFitcTsDd8Lnnp9rKtk4=;
 b=cu5R71jSnS747yGRuCKYKwKsMZZLc6FSf972h7brMcLRgjCRtjxl/0lB
 kFWt0Ote1eu4Bw7QZgcmOntYwRQZ/biTZYdM8EzoHENiS883N/4xHuXLQ
 xqJkLe/cXjxpwAcsBp6Omy1fuN90nEwwNQd1ocp5AmxiPd7TnvBSCRqMb
 cb6h9GMVMALfuST0shQbsYB4zpabHNMaP2hxrQ/eiBK8Jq/V1ODLtwnOF
 ktSnH5mn/CHz4TeW58ZZ/yOk4wSWEIFID5OdlbOF+Ri9mQSX6BWvxboUa
 iULn0QH4dos6h8qS7zJrvjdMHGvnlBXJgWyilH3+qibc2VYDaMaecM7yp Q==;
X-CSE-ConnectionGUID: 2m2AqPQgSUm3twAnrcaPYQ==
X-CSE-MsgGUID: YBZBB8YnTzaPjmC7pWP7FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87971596"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87971596"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 00:44:03 -0700
X-CSE-ConnectionGUID: tyZ5/AjsR5i1dfZ8p+yjtA==
X-CSE-MsgGUID: zM0RFtevQZu1uz87Q6TSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="296173576"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa002.jf.intel.com with ESMTP; 21 Aug 2026 00:44:01 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/xe/ggtt: fix stale GGTT mappings on unmap
Date: Fri, 21 Aug 2026 13:12:35 +0530
Message-ID: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
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

Tangudu Tilak Tirumalesh (3):
  drm/xe/ggtt: stop mapping unmapped GGTT pages to scratch
  drm/xe/tlb_inval: add FULL_INTRA_VF GGTT invalidation helper
  drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue GTs

 drivers/gpu/drm/xe/xe_ggtt.c            | 61 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 +++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 25 ++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++
 5 files changed, 104 insertions(+), 14 deletions(-)

-- 
2.46.0

