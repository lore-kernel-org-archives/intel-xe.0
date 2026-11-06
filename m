Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008B3606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dROt3FOK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B7010EAC5;
	Fri,  6 Nov 2026 22:17:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A678B10E489
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 22:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794003433; x=1825539433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qp3UlE7NXK2nnCkkivwcGV3nh03AdWsI7jg0/6dXaRY=;
 b=dROt3FOK1c/ZtFr+hJWyVyZbz8eQ/Iq2H0HxGoVLJSOxSw5att0rRV9Y
 vknKWbvuZdr7Grdp/oTbu5apZrMeAtokg1YtkuXvDsHc6Ax5eNGKitGIr
 VmKV3tjM2GoSEnPj2AYX8VGeSvBsEvYl+vWPhtQy0lTf53uZR1taC9obu
 YD8TuaT5h0tg4Mb90IIenF1pcEVxe9RIT6JDkA+eAQF3MWPQT3nvQ8bSq
 0AA+3dToFSTbiglf6HIORNBL7Lrcia1UmHIRwd7ZsW+LsMyhpJnOM46xr
 sxF5oec/oEJVDwvmcDt+4kx8Mu7073uc7vEeZxpAA9sPIAPx6EhdK8iw3 A==;
X-CSE-ConnectionGUID: Xw4CmivRTWiIzxKivJAJEw==
X-CSE-MsgGUID: zDAHKHxuRF+LBiQ+Rf4KuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2724258"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2724258"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 14:17:13 -0800
X-CSE-ConnectionGUID: YZHjUNmoQ1ePOUz0zF4dew==
X-CSE-MsgGUID: /vAlLU6fS+u7zT5FDfqGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7407611"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by orviesa002.jf.intel.com with ESMTP; 06 Nov 2026 14:17:13 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v2 0/3] drm/xe: add wedged_mode=3 fault inspection
Date: Fri,  6 Nov 2026 14:13:20 -0800
Message-ID: <20261106221323.1207676-1-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds wedged_mode=3, a best-effort inspection mode for examining
Xe after a fault without automatically restarting the GTs. An operator can
release inspection through debugfs by choosing to skip or continue into
permanent wedging.

The patches add the inspection framework, preserve pending TLB invalidation
fences while inspection is active, and request inspection for additional
fault paths while coordinating MMIO-enabled RAS reset requests.

Changes in v2:
- Make inspection one-shot after GT stopping or runtime-resume failure,
  close the teardown admission window, and handle aborted inspection without
  leaving stale TLB pause state.
- Extend the GuC submission timeout guard to recognize inspection startup
  before the execution queues are marked wedged.
- Clarify the power-management requirements and that SKIP leaves the GTs
  stopped; it does not restore normal operation.
- Document that TLB preservation is not a freeze of mapping activity or new
  invalidations. New requests may be canceled and signaled while older
  fences remain preserved, and GGTT invalidations may still program MMIO
  while CT is disabled. Cancellation signaling does not imply hardware
  completion; inspection is not an atomic snapshot.
- Document that preserved fences can block process exit, unbind, or unload,
  and that recovery may require a power cycle.

The TLB behavior does not prevent subsequent mapping changes or independent
reset/resume activity during inspection. Holding newly issued invalidation
fences could also block synchronous callers indefinitely, including callers
holding the GGTT mutex. The series documents these limitations rather than
claiming inspection is an atomic hardware snapshot.

Runtime validation of the specific inspection-startup timeout interleaving
remains pending.

Alan Previn (1):
  drm/xe/wedge: add fault inspection with debugfs release

Daniel Charles (2):
  drm/xe/wedge: preserve pending TLB invalidations during inspection
  drm/xe/wedge: request inspection for additional fault paths

 drivers/gpu/drm/xe/xe_debugfs.c         |  39 +++-
 drivers/gpu/drm/xe/xe_device.c          |  12 +-
 drivers/gpu/drm/xe/xe_gt.c              |  17 +-
 drivers/gpu/drm/xe/xe_gt.h              |   1 +
 drivers/gpu/drm/xe/xe_guc.c             |   2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c         |   2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c     |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |  25 +-
 drivers/gpu/drm/xe/xe_pagefault.c       |   3 +
 drivers/gpu/drm/xe/xe_pci.c             |  16 +-
 drivers/gpu/drm/xe/xe_pci_error.c       |  11 +
 drivers/gpu/drm/xe/xe_tlb_inval.c       |  63 +++++
 drivers/gpu/drm/xe/xe_tlb_inval.h       |   1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |   4 +
 drivers/gpu/drm/xe/xe_uc.c              |   2 +-
 drivers/gpu/drm/xe/xe_wedge.c           | 292 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_wedge.h           |   4 +
 drivers/gpu/drm/xe/xe_wedge_types.h     |  48 ++++
 18 files changed, 512 insertions(+), 32 deletions(-)

-- 
2.43.0
