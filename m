Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC6EC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D17710E104;
	Thu,  3 Sep 2026 14:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGh79KP7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3111C10E104
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788445185; x=1819981185;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+fMGD++gNIpzOg37BvLwhUE81Efbnrg4WQ4aT3KVC+E=;
 b=TGh79KP7CYvb7G/wOflKjeF56rm9+B0YjHAwNVoI0yFHnKDJxZSCRGb8
 PYUVdOoliFX0qc50kvo4ZndsEmy+eKHjNV/srT5trNEi0YGIzHl4wsCcd
 uh0PuG44fiU3UXtlfT4Nv+G/AxOP1t9RS08Ly/ygvvUc35JZPeWkzKq5z
 3AC/p3pRQgSrKGlCxkUi2Rm9aBipQ4ew2mNYGwVj+CKHglRkOwEBZA8w7
 f0wYRtX3nNbse8+xAyy8G2/rA61WxpFVk7nWREQ65W5kUWyAfnQxh3XRO
 X46LiGLheimGCIVCrgGlPes48ZkdiqaGRE1UGgzDDg7D9rGyX4s7gS1j9 Q==;
X-CSE-ConnectionGUID: 6wWtAgr3ShW6verK2JzcQg==
X-CSE-MsgGUID: DYXlLIxYS0qyegTan54ESg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92797461"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92797461"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:19:44 -0700
X-CSE-ConnectionGUID: dAzNME9VSY2k7RB8CXYtjg==
X-CSE-MsgGUID: LS6wjq7+TR6iIJBEnLHOlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275014663"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2026 07:19:43 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 0/7] drm/xe: Capture additional HW register state in
 devcoredump
Date: Thu,  3 Sep 2026 19:48:27 +0530
Message-ID: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
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

v3:(Sashiko)
- Use the LOW_DW MMIO offset when printing combined 64-bit register values
  in capture snapshots
- Preserve the existing coredump register-name format and append register
  address as trailing metadata
- Replace the render is not awake message with raw POWERGATE_ENABLE
  bit-state output
- Move engine-class-specific registers out of COMMON_BASE_ENGINE_INSTANCE
  into class-specific capture lists

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
 drivers/gpu/drm/xe/xe_devcoredump.c       | 392 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  49 +++
 drivers/gpu/drm/xe/xe_device.h            |   5 +
 drivers/gpu/drm/xe/xe_guc_capture.c       |  58 +++-
 7 files changed, 536 insertions(+), 10 deletions(-)

-- 
2.43.0

