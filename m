Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECF0C41513
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 20:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FE010ED11;
	Fri,  7 Jun 2024 20:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpBFXgx7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF0C10ED01
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 20:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717793006; x=1749329006;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CYqFIluzhP+wIHlFpwKGd9m/HdoQfwV39vag1oXWbmw=;
 b=QpBFXgx7cbFqe98F6QyiXmLN+NuIbxdBNWYV+dpudeWSr5OE7QzwmLSy
 omPW+vnbTv8VTcPhhz2za0pV+3U2++lo0Wlopk6+vfUPNJEs4mIDl8Hwg
 Wr5PBIGP78xk2vCdf/jmWY17Jm43u4L5DevR59Jj0MTbpk6X+CMRq+SXg
 3maGcosIPYG0qcFUERKQDQpKIW8K3T0pfHRqmHCWHU17uJBQYCsBIfDnP
 uu+GNlU1ITdyOG2YcCu+96EvB70cfFTmpBeq6fJs47yk5MW71+DY9GAOb
 c6pst+tFae7FVlI86uWCKN4lSzM8RPnZHeRKW7D1NMgyeV4B949LRcid6 Q==;
X-CSE-ConnectionGUID: Pi6zE8rWRO+FG4jrmNyBjg==
X-CSE-MsgGUID: UsaoGhhwT6CieElCZvp+nA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14651039"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14651039"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:43:26 -0700
X-CSE-ConnectionGUID: HuuQMXjHRL2/mNcWwE83Aw==
X-CSE-MsgGUID: d/a+c4ZZSy23SEnBtN4z0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43368433"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:43:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v16 00/17] Add OA functionality to Xe
Date: Fri,  7 Jun 2024 13:43:05 -0700
Message-ID: <20240607204322.1966831-1-ashutosh.dixit@intel.com>
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
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |    3 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |    2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |    3 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h          |  103 +
 drivers/gpu/drm/xe/xe_device.c                |   19 +-
 drivers/gpu/drm/xe/xe_device_types.h          |    4 +
 drivers/gpu/drm/xe/xe_gt_types.h              |    4 +
 drivers/gpu/drm/xe/xe_guc_pc.c                |   57 +
 drivers/gpu/drm/xe/xe_guc_pc.h                |    3 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |    2 +
 drivers/gpu/drm/xe/xe_lrc.c                   |   11 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |    1 +
 drivers/gpu/drm/xe/xe_module.c                |    6 +
 drivers/gpu/drm/xe/xe_oa.c                    | 2370 +++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                    |   27 +
 drivers/gpu/drm/xe/xe_oa_types.h              |  232 ++
 drivers/gpu/drm/xe/xe_perf.c                  |   67 +
 drivers/gpu/drm/xe/xe_perf.h                  |   20 +
 drivers/gpu/drm/xe/xe_query.c                 |   77 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   24 +-
 include/uapi/drm/xe_drm.h                     |  291 ++
 22 files changed, 3321 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

-- 
2.41.0

