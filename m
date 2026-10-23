Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A943606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Veta8Qo9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB4C10E4D8;
	Fri, 23 Oct 2026 06:08:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCD710E4D8
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 06:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792735702; x=1824271702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uExwfYXcXnBPsZVIcAuAPSsssognjVpqX91MAtj0e3g=;
 b=Veta8Qo9AlnmaetVfIZzKA5pv76vbDGQ2mpVu8Fv3zvdMeXU1KABj3yB
 +vSmewryfyRvbTu6sHpqodwQtFkwMLgF5VbbD7rL9yFkrx47vdJxcv1av
 lcrrXB3Z3JStMOfXWLPLbMtBOnR7iBJ6YV62MdwCM7TMxBRjZeDvM8ED3
 EoW0KTHje02mPTA00v5Imi9mxpeNroNRUBJMl85WyojxTafzTO36swaSp
 h6eDIaUomYCYNJVzANhHraN12kMf04SfgOxn3NpBShKXYyKM00JYD4BB7
 n3llUe2Oqf4zAvDNH0wwNmU8dfsl142HNqOD8IxCeZ+fU1Eq3A6iP3UvE w==;
X-CSE-ConnectionGUID: ESyUj7owSfuhK+cbaNrNfQ==
X-CSE-MsgGUID: ygBj46RtSHiJc0ccNRyc4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1386717"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1386717"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 23:08:22 -0700
X-CSE-ConnectionGUID: BkXxOw8NTnujd/sZmz37Mw==
X-CSE-MsgGUID: zCJESlO9Qgqq3tFFExOwCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3646524"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2026 23:08:19 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v5 0/7] drm/xe: Capture additional HW register state in
 devcoredump
Date: Fri, 23 Oct 2026 11:35:47 +0530
Message-ID: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
where applicable, the media GT.
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
  7  Capture additional engine state registers

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

v4:
- optimized APIs and reduced few structs(Tejas)
- Fixed CI hook error

v5:
- Fixed Null derefence possibilities and ensured proper forcewake scope
- refactor struct member documentation(Tejas)

Nareshkumar Gollakoti (7):
  drm/xe/devcoredump: Capture GT fuse registers in devcoredump
  drm/xe/devcoredump: Add GuC register snapshot to devcoredump
  drm/xe/guc: Print register addresses in capture snapshot output
  drm/xe: dump GAM page fault report registers in devcoredump
  drm/xe/guc: add TDL,SLICE gfx registers to capture list
  drm/xe: capture L3 node status registers in devcoredump
  drm/xe/guc: capture additional engine state registers

 drivers/gpu/drm/xe/regs/xe_engine_regs.h  |  22 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  13 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     |   5 +
 drivers/gpu/drm/xe/xe_devcoredump.c       | 328 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  66 +++++
 drivers/gpu/drm/xe/xe_guc_capture.c       |  78 ++++-
 6 files changed, 503 insertions(+), 9 deletions(-)

-- 
2.43.0

