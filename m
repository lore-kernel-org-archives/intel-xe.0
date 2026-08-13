Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D30C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA36610F337;
	Thu, 13 Aug 2026 13:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7U3tEKs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680FB10F337
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786627866; x=1818163866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7kZpzfrWf7zZeidpSLqAez1vTCRndnjpiejWZDSqpAY=;
 b=i7U3tEKsrSOAutf63vGtl2ncRwod4BgVkVHrH1OZVj04hrIljrEO8QM4
 9G6lY/nNoLO4nWHVccsNGkxRvn/HOBuKFY2pclA4drvY9lf85N/QuoI+Q
 KZsoBmIu11+vz1ruXq+jChF++QS/Ed9TxPeEn9nvQTvXQFwSKMViGZWCw
 t3J73fV4Hj9LGUgdioMmUgSI/1yU9E/mLTcetiVuE6/O82eI3JqMbq92x
 CJCP1fw/rXRS7OS51QYPsdtkqCYks9+tpzdFNWA340kNSetcwcBtfszJt
 Xu5AjPW5viVv2KzNaQBg4mr06NzrYbDB/a5ShbiTPbV+MMH/4HFlv2iNO g==;
X-CSE-ConnectionGUID: UhOEf+tgSACFk14ADVSuig==
X-CSE-MsgGUID: W8Phpr0KRK6axnOMlWDrHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97547682"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97547682"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:31:06 -0700
X-CSE-ConnectionGUID: h9SJRGPLSEmJk5KccNR+uQ==
X-CSE-MsgGUID: uphXeBOiQGSHYn+rrH+q9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="268207315"
Received: from unknown (HELO gfx-coremm-kmd15.iind.intel.com) ([10.223.55.8])
 by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 06:31:05 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 0/6] drm/xe: Capture additional HW register state in
 devcoredump
Date: Thu, 13 Aug 2026 19:00:31 +0530
Message-ID: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
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

Nareshkumar Gollakoti (6):
  drm/xe/devcoredump: Capture GT fuse registers in devcoredump
  drm/xe/devcoredump: Add GuC register snapshot to devcoredump
  drm/xe/guc: Print register addresses in capture snapshot output
  drm/xe: dump GAM page fault report registers in devcoredump
  drm/xe/guc: add TDL gfx registers to capture list
  drm/xe: capture L3 node status registers in devcoredump

 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  17 ++
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     |  13 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 266 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  45 ++++
 drivers/gpu/drm/xe/xe_device.h            |   5 +
 drivers/gpu/drm/xe/xe_guc_capture.c       |  15 +-
 6 files changed, 356 insertions(+), 5 deletions(-)

-- 
2.43.0

