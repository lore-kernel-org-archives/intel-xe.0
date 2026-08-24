Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2E2C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BFE10E818;
	Mon, 24 Aug 2026 18:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eILiVlpy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F3D10E818
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787597091; x=1819133091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MifJYhudA/NEPis7B3wv+Ms0x6VwuIFECSDgmjFAxqQ=;
 b=eILiVlpyPBwSVWkeY9msTtEPSepdxlYtyChWZJ05H0lRVZ0iBN0lWTPj
 /GfJ21kK0Do5SqsAifmyAzSJi8mGglyuYbEmWH387a5E8nRQtyhhKr1gV
 OX11bvpcZHK9I0zAe856Hogc0RL4tF+yQ1RQjXI2O4nRQj/qDN74n7XQC
 ZBkBNXka5hXObMpVAcZy34FcvQSsvkXmKDoavaWkoRXCaEuBlVXiw3j+s
 OG7GN6HqtNdZdll2hRXYi/6NEDyJ84NCspFTBvNoQ84gVCyqTFcnAYiLh
 O8y+I4SSHgcn2BznyFz9iAuX/hpY1dcdJL2TOEYmyH9uM2NecH42IU98h A==;
X-CSE-ConnectionGUID: 5b0pTXJySMylwzRyB5M7/A==
X-CSE-MsgGUID: NeNVWZeoQGa7D81OfL6dsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="75592755"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="75592755"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:44:50 -0700
X-CSE-ConnectionGUID: Gwoq+NqsRDeTQjFmLvfY9g==
X-CSE-MsgGUID: CGAOv6VcRVSgk3KaH8bMwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263351734"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 11:44:49 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 0/7] drm/xe: Capture additional HW register state in
 devcoredump
Date: Tue, 25 Aug 2026 00:13:49 +0530
Message-ID: <20260824184356.1960708-1-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series extends the Xe devcoredump with additional hardware register
state to improve post-mortem debugging of GPU hangs and faults on Xe3p.

Today the devcoredump captures GuC log/CT, engine and submission state.
When triaging hangs it is often necessary to also know the static HW
configuration (fuses), GuC status/error state, GAM page-fault reporting
and L3 node status at the time of the hang. Collecting these at capture
time makes the dump self-contained and avoids relying on separate
probe-time logging.

To do this, the series adds a small generic MMIO register-dump helper
(descriptor list -> snapshot -> print/free) and uses it for several
register groups. Each group is captured for both the primary GT and,
where applicable, the media GT, and is gated to Xe3p (GRAPHICS_VER >= 35).
Registers requiring MCR steering are read through
xe_gt_mcr_unicast_read_any(); the remaining GAM registers use INSTANCE0
default steering and are read directly.

Snapshots are allocated with GFP_ATOMIC as capture runs inside the
dma_fence signalling section, matching the surrounding captures, and are
freed in the existing devcoredump teardown path.

Patches:
  1  Add the generic reg-dump helpers and capture GT/media fuse registers.
  2  Capture GT and media GuC status/error registers.
  3  Print register offsets alongside names in the GuC engine capture
     output (32- and 64-bit), easing cross-reference with the bspec.
  4  Capture the GAM page-fault report head/tail registers.
  5  Add the TDL gfx registers to the XeHPG extended GuC capture list.
  6  Capture L3 node status registers (MCR, read via unicast_read_any()).

Sample devcoredump output gains the following sections:
  **** GT Fuse Register Dump ****
  **** Media GT Fuse Register Dump ****
  **** GT GuC Register Dump ****
  **** Media GT GuC Register Dump ****
  **** GAM PF Report ****
  **** Node Status ****
  ****  Additional engine state registers ****

Nareshkumar Gollakoti (7):
  drm/xe/devcoredump: Capture GT fuse registers in devcoredump
  drm/xe/devcoredump: Add GuC register snapshot to devcoredump
  drm/xe/guc: Print register addresses in capture snapshot output
  drm/xe: dump GAM page fault report registers in devcoredump
  drm/xe/guc: add TDL,SLICE gfx registers to capture list
  drm/xe: capture L3 node status registers in devcoredump
  drm/xe/guc: capture additional engine state registers

 drivers/gpu/drm/xe/regs/xe_engine_regs.h  |  22 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  15 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     |   5 +
 drivers/gpu/drm/xe/xe_devcoredump.c       | 391 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  49 +++
 drivers/gpu/drm/xe/xe_device.h            |   5 +
 drivers/gpu/drm/xe/xe_guc_capture.c       |  36 +-
 7 files changed, 517 insertions(+), 6 deletions(-)

-- 
2.43.0

