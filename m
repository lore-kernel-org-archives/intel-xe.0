Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42540C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 22:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F5610E514;
	Mon, 17 Jun 2024 22:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCrJvxgK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D3F10E51F
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 22:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718663820; x=1750199820;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MDdv6f4/+foWgVtbaaiH3B6SXyTczxLE12CBa1nwVmk=;
 b=VCrJvxgKiEM03VVVWUQo63ZBmV/nN94QhKpdL5hpe/Orj6rSHEfvlXcH
 6eO+UQAy1kDoi+FNgLnFmDWHrxXsoLulaos8ZPbOFtNoDqe2RjW1DfTeA
 Jeg3dPLnpBLBJbBijkQSlLhKwHnenulsawDmCETKnjlZLvZKuyDiOskt9
 mv+TrTLkuESNJnbwgKbjXayeS0fNTczQ6PP6jip2fyc4Jsh+hqqLOekPN
 t7X9l+tNJPbnIelu2TFvA14iLy1SX+xVgtbOGnWUgEl267lGDDasG/57S
 l/IgI9PFUG/zpgnaLeshPBfBBjagHo8KwoYPP48y3cLo5taGY6gqvmGBW Q==;
X-CSE-ConnectionGUID: l7zfqWFSQLuMWTrj3HHVqA==
X-CSE-MsgGUID: 1VRCE78GQgGG28QG/6R0Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18428968"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="18428968"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:36:59 -0700
X-CSE-ConnectionGUID: Ub3QSERDSayJNUpKSyN53g==
X-CSE-MsgGUID: XZEaMYHuQHyacIcX9GN0zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="72090768"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:36:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v18 00/17] Add OA functionality to Xe
Date: Mon, 17 Jun 2024 15:36:34 -0700
Message-ID: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Please see cover letter for v7 here:
https://patchwork.freedesktop.org/series/121084/#rev7

For changes in later versions see changelog below.

This series is also available at:
        https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa

The series has been tested against this IGT series:
        https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa
	or,
	https://patchwork.freedesktop.org/series/130033/

Opensource consumers using uapi in this series:

gpuvis:
	https://github.com/mikesart/gpuvis/pull/86 (merged)

mesa:
	https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29312

Test-with: 20240607200847.1964629-1-ashutosh.dixit@intel.com

v2: Fix build
v3: Rebase, due to s/xe_engine/xe_exec_queue/
v4: Re-run for testing
v5: Address review comments, new patches 11 through 17
v6: New patches 18 through 21
v7: Patches are completely redone and don't start with i915 version of the uapi
v8: See https://patchwork.freedesktop.org/patch/575214/?series=128993&rev=1
v9: See https://patchwork.freedesktop.org/patch/577441/?series=128993&rev=2
v10: See https://patchwork.freedesktop.org/patch/577943/?series=128993&rev=3
v11: See https://patchwork.freedesktop.org/patch/581239/?series=130705&rev=1
v12: Add last two new patches to enable Xe2+ overrun mode
v13: Update last two patches after code review completion
v14: https://patchwork.freedesktop.org/patch/595447/?series=134028&rev=1
v15: https://patchwork.freedesktop.org/patch/595549/?series=134056&rev=1
v16: https://patchwork.freedesktop.org/patch/597768/?series=134634&rev=1
v17: https://patchwork.freedesktop.org/patch/598236/?series=134742&rev=1
v18: Rebase

Ashutosh Dixit (17):
  drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream
    types
  drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
  drm/xe/oa/uapi: Add OA data formats
  drm/xe/oa/uapi: Initialize OA units
  drm/xe/oa/uapi: Add/remove OA config perf ops
  drm/xe/oa/uapi: Define and parse OA stream properties
  drm/xe/oa: OA stream initialization (OAG)
  drm/xe/oa/uapi: Expose OA stream fd
  drm/xe/oa/uapi: Read file_operation
  drm/xe/oa: Add OAR support
  drm/xe/oa: Add OAC support
  drm/xe/oa/uapi: Query OA unit properties
  drm/xe/oa/uapi: OA buffer mmap
  drm/xe/oa: Add MMIO trigger support
  drm/xe/oa: Override GuC RC with OA on PVC
  drm/xe/oa: Changes to OA_TAKEN
  drm/xe/oa: Enable Xe2+ overrun mode

 drivers/gpu/drm/xe/Makefile                   |    2 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |    1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |    2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |    3 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h          |  100 +
 drivers/gpu/drm/xe/xe_device.c                |   17 +-
 drivers/gpu/drm/xe/xe_device_types.h          |    4 +
 drivers/gpu/drm/xe/xe_gt_types.h              |    4 +
 drivers/gpu/drm/xe/xe_guc_pc.c                |   57 +
 drivers/gpu/drm/xe/xe_guc_pc.h                |    3 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |    2 +
 drivers/gpu/drm/xe/xe_lrc.c                   |   11 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |    1 +
 drivers/gpu/drm/xe/xe_module.c                |    5 +
 drivers/gpu/drm/xe/xe_oa.c                    | 2428 +++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                    |   27 +
 drivers/gpu/drm/xe/xe_oa_types.h              |  239 ++
 drivers/gpu/drm/xe/xe_perf.c                  |   92 +
 drivers/gpu/drm/xe/xe_perf.h                  |   20 +
 drivers/gpu/drm/xe/xe_query.c                 |   77 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   24 +-
 include/uapi/drm/xe_drm.h                     |  305 +++
 22 files changed, 3417 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

-- 
2.41.0

