Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D8606A32A
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GJit2rxJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E4910E3B1;
	Sat, 21 Nov 2026 18:23:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DADD10E291
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285401; x=1826821401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gzSDGwnzu1Mj0eD5KcbOprRk/argGjgq6FJviCrW41o=;
 b=GJit2rxJDZXDOGqbjtxaxL28JI9HemJZPdG4CdS7o+tj6LaKRkxeLgKt
 ODUGlp/RJmbsUP7CvHjk1wNtOm88+aACIqlM1nzN2sJYQn6hzZ1a32QuV
 fBj9W1ZQju0ze0OFJp8onMzVBgUm4Z3X/LP+NKEctQOEFdoVSFOLsDoQ3
 iwbE41jIqztiB7dR26lVCQ2WHypqFdlKAfwdqZW3e3CCBUIH1HAFyuDWJ
 hO8tb6E5kZjglgJ//8DtOD2yIi70CXfp2Y06LteMm8tKieUCut89yGnPS
 FgM2l2AIHT4X25sdZzQvZspqfXrK86yDqUnQwi8q+ySoD56yUh0kzgetm A==;
X-CSE-ConnectionGUID: Ag1XuN98TmiydtWpsSyiVA==
X-CSE-MsgGUID: q8Y7CMkFRz2QJRyRs8/Mjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034054"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
X-CSE-ConnectionGUID: 3JefAJeaRbez+GudBhQZaQ==
X-CSE-MsgGUID: iO7dfWe7RT6YGslbiPw3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934401"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 00/17] Work around media 52-bit limitation on CRI
Date: Sat, 21 Nov 2026 18:23:16 +0000
Message-ID: <20261121182317.48981-19-stuart.summers@intel.com>
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

Note this is somewhat of an RFC right now to get early feedback. I'm
planning a follow up to clean some of this up shortly.

This is a combination of two series I have on the list now, [1] and [2].
I've already gotten some feedback from Rodrigo and Sashiko on both of
these I'm planning to incorporate. Apologies those updates didn't make
it in to this series yet. I'm also planning on reviewing at least [1]
separately since this likely needs more discussion anyway and isn't
strictly related/required to the current series.

The main two patches I'm interested in getting feedback in the meantime
are:
  drm/xe: Add enable_media module parameter
  drm/xe: Work around media 52-bit limitation on CRI

The latter is the crux of the workaround here. The first sets up
the module parameter which will be used to disable media by default.

The reason to include a module parameter here is we have some customers
who are planning many CRI devices on a single host. The request from
those customers is to have a way to configure all of the cards on
that host at one time rather than having to loop through each device
separately (i.e. module parameter instead of configfs). We do already
have a configfs that allows media to be disabled
(gt_types_allowed = 'primary'), but this is both meant for developer
debug, not production configuration, and it requires that per-device
configuration.

The workaround details are provided in that last patch in the series
so I won't duplicate all of that here, but at a high level, media
is now disabled by default and in order to maintain performance for
compute when media is enabled on a system that supports 52-bit
addressing, PCIe level address translation is supported, but an
internal configuration of address translation for the media GAM
is disabled. Again, the details of how this is done are in that last
patch.

Again, I'm not planning on merging these as-is, but just to clarify,
[1] is attempting to separate the primary and media GT. This is mostly
for debug but also used to refactor for that last patch. Likely in
the repost I'll just drop this for now and review it completely
separately, skipping this refactor unless it's deemed particularly
interesting.

[2] is adding a few fixes and refactors in preparation for the actual
workaround so I'll be keeping these in the repost. Two of the three
patches there have been reviewed (with some feedback) already. The
third I'm planning to drop after feedback from Rodrigo.

v2:
 - Again, no plan to merge as-is. To facilitate some testing of
   different GFSP versions, temporarily downgrade the error handling
   for the media defeature command. See that last patch for details.

[1] https://patchwork.freedesktop.org/series/178247/
[2] https://patchwork.freedesktop.org/series/177792/

Stuart Summers (17):
  drm/xe/sysctrl: Use preallocated mailbox staging buffers
  drm/xe: Process device OOB workarounds during early info init
  drm/xe/sysctrl: Restore the SoC remapper on every runtime resume
  drm/xe: Add enable_media module parameter
  drm/xe: Detect each GMD_ID IP in a loop
  drm/xe: Tolerate a missing graphics IP in xe_info_init()
  drm/xe: Verify IP presence against GU_CNTL
  drm/xe: Guard per-tile primary GT accesses
  drm/xe: Stop assuming the root tile has a primary GT
  drm/xe: Do not claim flat CCS without a graphics IP
  drm/xe: Run page table updates on the media GT when there is no
    primary
  drm/xe: Document that gt_types_allowed=media now probes
  drm/xe: Fall back to CPU copies when the tile cannot blit
  drm/xe: Require a fully visible VRAM BAR without a primary GT
  drm/xe: Allow probe without a primary GT
  drm/xe: Work around media 52-bit limitation on CRI
  drm/xe: Don't error on failed media defeature

 drivers/gpu/drm/xe/regs/xe_regs.h             |   2 +
 drivers/gpu/drm/xe/xe_bo.c                    |  43 +++-
 drivers/gpu/drm/xe/xe_configfs.c              |  10 +-
 drivers/gpu/drm/xe/xe_defaults.h              |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  27 +-
 drivers/gpu/drm/xe/xe_device.h                |  17 ++
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_device_wa_oob.rules     |   1 +
 drivers/gpu/drm/xe/xe_exec_queue.c            |   5 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  11 +-
 drivers/gpu/drm/xe/xe_memirq.c                |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  45 +++-
 drivers/gpu/drm/xe/xe_migrate.h               |   2 +
 drivers/gpu/drm/xe/xe_module.c                |   7 +
 drivers/gpu/drm/xe/xe_module.h                |   1 +
 drivers/gpu/drm/xe/xe_oa.c                    |  24 +-
 drivers/gpu/drm/xe/xe_pagefault.c             |   4 +-
 drivers/gpu/drm/xe/xe_pci.c                   | 241 ++++++++++++++----
 drivers/gpu/drm/xe/xe_pm.c                    |  13 +-
 drivers/gpu/drm/xe/xe_query.c                 |   3 +-
 drivers/gpu/drm/xe/xe_ras.c                   |  18 +-
 drivers/gpu/drm/xe/xe_sysctrl.c               | 195 +++++++++++++-
 drivers/gpu/drm/xe/xe_sysctrl.h               |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       |   6 +-
 drivers/gpu/drm/xe/xe_sysctrl_event.c         |   2 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  81 +++---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  34 +++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  17 ++
 drivers/gpu/drm/xe/xe_tile.h                  |  32 +++
 drivers/gpu/drm/xe/xe_tlb_inval.c             |  20 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   2 +-
 drivers/gpu/drm/xe/xe_vram.c                  |  15 ++
 33 files changed, 710 insertions(+), 179 deletions(-)

-- 
2.43.0

