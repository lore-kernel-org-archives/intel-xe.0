Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABFE606A327
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k2mRw8Zg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308E110E6D3;
	Mon,  2 Nov 2026 21:06:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7755410E68B
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 21:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793653597; x=1825189597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j6zuVEUaPeJX1mDzUMJgSZI8HJ4J1VdVzTv4xkRR3vo=;
 b=k2mRw8ZgLx75l4QcNwq1FbvDZsh0vCZxHq/PWQml7frDEImeV19HasmN
 UGFZhRHxbov1suqNruQOCvplSN+5JcXvQKDJ1PAeiAF928bdy5bu4q+rZ
 fj5aJhfgtO8aBDc6DIMI5Qr7A30xGCjTN666riFxPFaP05eYVVmdqrcMX
 mB21UlzmNqQ16fNmet7JlPbaC2tatFGl47w6WbIqK9Ba1/4S1Ld8ssnlr
 /d7e0Mg0G6I5790qMfb2y64xz/xvKAuSR+Du/Jj7c1YuhCKJNeQlq4+ru
 I2KTJMf0uxp6xWiHYCsZGAUJ+RT09ZwkqC7vmwyPUersFg+mmiRbb0IHD g==;
X-CSE-ConnectionGUID: q2+egxInSgStTu+LtJ/mtw==
X-CSE-MsgGUID: ketYn3VlSWqkqo90GdfqfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2390411"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2390411"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:06:36 -0800
X-CSE-ConnectionGUID: WK/PYmJXQ7+d7HcEAi89HQ==
X-CSE-MsgGUID: eHlw5cQ3RKWXnmtYyyrYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6249846"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa004.fm.intel.com with ESMTP; 02 Nov 2026 13:06:35 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alan.previn.teres.alexis@intel.com,
 Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH 0/3] drm/xe: Add mode-3 fault inspection with debugfs release
Date: Mon,  2 Nov 2026 13:02:39 -0800
Message-ID: <20261102210242.635207-1-daniel.charles@intel.com>
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

This series adds wedged_mode=3 for best-effort hardware inspection after
a fault, without immediately proceeding into permanent device wedging.

The inspection worker stops GT submission and blocks new DRM ioctls
while waiting for a response through the wedged_pause_resume debugfs
interface:

  SKIP     (0xdeadf001): skip permanent wedging and reopen the ioctl gate;
                        GTs remain stopped and pending TLB fences paused.
  CONTINUE (0xdeadbbbb): complete permanent wedging and notify userspace.

Neither response restores normal execution. Existing wedge modes retain
their intended behavior.

The series is organized as follows:

  1. Add the mode, inspection worker, and debugfs release interface.
     This establishes the inspection and reply flow.

  2. Preserve pending TLB invalidations during inspection by pausing
     timeout and completion processing. CONTINUE resets them, while SKIP
     leaves them pending; document the resulting cleanup constraints.

  3. Request inspection from page-fault failures, GuC memory CAT errors,
     TLB invalidation timeouts, and MMIO-enabled PCI RAS reset requests.
     PCI recovery waits for inspection before reset preparation, and
     neither reply requests a reset from this device.

Inspection is not an atomic hardware or application-memory snapshot:
in-flight work and software cleanup can still progress. There is no
automatic inspection timeout, and preserved fences can obstruct teardown.
PCI-core-forced resets, reset requests from other devices, and system
suspend remain outside the inspection guarantee. A power cycle may be
necessary. Configure wedged_mode=3 before starting the workload.

Validation:
  - invalid-va testing reproduced the expected page fault and exercised
    both SKIP and CONTINUE, with dmesg and ftrace confirming inspection
    and permanent-wedge behavior.
  - Outstanding-TLB-fence preservation, PCI recovery coordination, and
    runtime lockdep coverage still require targeted testing.

Alan Previn (1):
  drm/xe/wedge: add fault inspection with debugfs release

Daniel Charles (2):
  drm/xe/wedge: preserve pending TLB invalidations during inspection
  drm/xe/wedge: request inspection for additional fault paths

 drivers/gpu/drm/xe/xe_debugfs.c         |  30 ++-
 drivers/gpu/drm/xe/xe_device.c          |  12 +-
 drivers/gpu/drm/xe/xe_gt.c              |  17 +-
 drivers/gpu/drm/xe/xe_gt.h              |   1 +
 drivers/gpu/drm/xe/xe_guc.c             |   2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c         |   2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c     |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |  24 +-
 drivers/gpu/drm/xe/xe_pagefault.c       |   3 +
 drivers/gpu/drm/xe/xe_pci.c             |  16 +-
 drivers/gpu/drm/xe/xe_pci_error.c       |  11 +
 drivers/gpu/drm/xe/xe_tlb_inval.c       |  61 +++++
 drivers/gpu/drm/xe/xe_tlb_inval.h       |   1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |   4 +
 drivers/gpu/drm/xe/xe_uc.c              |   2 +-
 drivers/gpu/drm/xe/xe_wedge.c           | 292 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_wedge.h           |   4 +
 drivers/gpu/drm/xe/xe_wedge_types.h     |  48 ++++
 18 files changed, 500 insertions(+), 32 deletions(-)

base-commit: d8a353e238652bec29fd452babdaae0044d30b9b

-- 
2.43.0
