Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC54606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MoKucmx5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9751610E99D;
	Tue, 10 Nov 2026 23:14:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1389710E99D
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794352490; x=1825888490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3y2p+p+qpYNGIBqM0Bfo3VFAxtgYDfXFEhZug20D9xo=;
 b=MoKucmx58NzelRrnkyJUK9k+hDglMYZ7VQJcQcbU1oBpWaIiunMSQUcC
 9twUgTIqwcGTsly+fwc9axMc4zFsd4fwgqiTRU9bl9Y+zH2E6g3wRMLW+
 8rpqOdPwaKno+wzl9Y29USFFk4T1iXYZyS9iXsBOI/0RQT2rhrSFfpxOp
 zqymm2PmWHFb8f44Zd54G6skYnVgF+0Hlihdu2GExsvn5n0KOGhNt7c4c
 CyDcpE4oS8a+ZMaSxmufT1iYfXv3gTaKTOhSPHViffNwjunL4dqpZEw7w
 39lLBwt3J5djWBx5tnNfEbswhLcfdAmwExeuovrAQVgoO30umrO1WMPtC g==;
X-CSE-ConnectionGUID: /VA9IKQpQ2GGs0XZuGY5Ig==
X-CSE-MsgGUID: U/jMJidYSA+6Jz2s/EuVRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3120822"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3120822"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:50 -0800
X-CSE-ConnectionGUID: H9sKvCykRnKTK48xOYQDkw==
X-CSE-MsgGUID: o4DbPPcqREqpzM1M5vxWHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8133943"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:50 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com, fei.yang@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 00/11] Allow boot with only media GT
Date: Tue, 10 Nov 2026 23:14:42 +0000
Message-ID: <20261110231442.218721-13-stuart.summers@intel.com>
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

There is a configfs right now which allows enabling either the
media GT, the primary GT, both, or neither. The driver right now
cannot load without a primary GT though. For debug purposes, it
can be interesting to load with only a media GT though. This of
course means we lose access to blitter and a lot of the core functions.

This series attempts to cover the most basic scenarios needed to
support a media-only configuration by splitting the handle_gmdids
function, adding proper NULL handling and reworking some of the
root_tile logic. With media we can't use flat_ccs or
resizeable bar. These are as much as possible split into separate
patches to help with reviewability.

I tested this on CRI in each combination of media, primary, and both.
The configuration without either GT is still not supported and the
probe will fail. But at least now the driver load can complete
with only the media GT.

In addition to the split, there is a patch here which also starts
checking the GU_CNTL register for IP presense. This is interesting
because, particularly for debugging, we can fuse off one or both
GTs and we still want the driver to comprehend that at runtime. Of
course the VF can't access this register so it still spins off of
the GMD ID. I confirmed that the GMD ID reads out as 0 when the
media is fused off since it is powered down.

Note that while CPU copies used for migrations and page table updates
when only media GT is enabled, instead of reworking the migration
structure to move the VM out of the migration queue and back into
the migration structure itself, I decided for now to just add a
kind of "fake" engine (just VDBOX class). This isn't actually
expected to work, but since we're doing CPU copies it shouldn't
matter. Hoping to get some review feedback here before doing too much
extensive refactoring here. I can look there if this isn't acceptable
though.

I used claude opus 5 through the process here.

Stuart Summers (11):
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

 drivers/gpu/drm/xe/regs/xe_regs.h  |   2 +
 drivers/gpu/drm/xe/xe_bo.c         |  43 +++++---
 drivers/gpu/drm/xe/xe_configfs.c   |   7 +-
 drivers/gpu/drm/xe/xe_device.h     |  16 +++
 drivers/gpu/drm/xe/xe_exec_queue.c |   5 +-
 drivers/gpu/drm/xe/xe_gt.c         |  11 +-
 drivers/gpu/drm/xe/xe_memirq.c     |   9 +-
 drivers/gpu/drm/xe/xe_migrate.c    |  45 ++++++---
 drivers/gpu/drm/xe/xe_migrate.h    |   2 +
 drivers/gpu/drm/xe/xe_oa.c         |  24 ++++-
 drivers/gpu/drm/xe/xe_pagefault.c  |   4 +-
 drivers/gpu/drm/xe/xe_pci.c        | 156 +++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_query.c      |   3 +-
 drivers/gpu/drm/xe/xe_tile.h       |  32 ++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c  |  41 ++++----
 drivers/gpu/drm/xe/xe_vm.c         |   2 +-
 drivers/gpu/drm/xe/xe_vram.c       |  15 +++
 17 files changed, 295 insertions(+), 122 deletions(-)

-- 
2.43.0

