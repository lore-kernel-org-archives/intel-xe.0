Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9214C54E55
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 05:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9FB112770;
	Tue,  5 Mar 2024 05:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1Rzy5pO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21EF1126C3
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 05:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709616810; x=1741152810;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qunh21hpPMUeK32gKx3XUoFK1/Ig77KDpKSdhNMabto=;
 b=b1Rzy5pOvfkqS0A2L+mYMXzODMPQQf4IZPMP8TUwkRPAAJJVztfsz+ys
 ZcEAwOrV9EQUPmbONOuXPAejWmHr09cOe1a/d0QNsBfnFX9iHICFXVd0x
 ZzQ8VR2fw59K4L2yenmyoe+MIhIzspTn5VX0DRaTFgl/3nAFvtUGs1miC
 Wif/WQ5Kt0WstphxRA4bgT5lxCX2dv9De3O4xK5sqvv1ZvpRf7WaDFYwz
 atSHufxnbckIMU0/LJr4iAleoe+h2vGGpR1fZNhZdU+VevRCwlKqvN43b
 /I0I2z0OJaPwKqYo54Rs7d5nydvIN468T064fpLW0GYz5msgTXtXbpsXP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21601469"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="21601469"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9660201"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:33:12 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/16] Add OA functionality to Xe
Date: Mon,  4 Mar 2024 21:32:44 -0800
Message-ID: <20240305053300.2406240-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Please see cover letter for v7 here:
https://patchwork.freedesktop.org/series/121084/#rev7

For changes in v8 through v10, see:
https://patchwork.freedesktop.org/series/128993/

For changes in v11, see:
https://patchwork.freedesktop.org/series/130705/

This series is also available at:
        https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa

The series has been tested against this IGT series:
        https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa, or,
	https://patchwork.freedesktop.org/series/130033/

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

Ashutosh Dixit (16):
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
  drm/xe/oa: Disable overrun mode for Xe2+ OAG
  drm/xe/oa: Add OAR support
  drm/xe/oa: Add OAC support
  drm/xe/oa/uapi: Query OA unit properties
  drm/xe/oa/uapi: OA buffer mmap
  drm/xe/oa: Add MMIO trigger support
  drm/xe/oa: Override GuC RC with OA on PVC

 drivers/gpu/drm/xe/Makefile                   |    2 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |    3 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |    4 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |    3 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h          |  100 +
 drivers/gpu/drm/xe/xe_device.c                |   18 +-
 drivers/gpu/drm/xe/xe_device_types.h          |    4 +
 drivers/gpu/drm/xe/xe_gt_types.h              |    4 +
 drivers/gpu/drm/xe/xe_guc_pc.c                |   56 +
 drivers/gpu/drm/xe/xe_guc_pc.h                |    3 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |    2 +
 drivers/gpu/drm/xe/xe_lrc.c                   |   11 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |    1 +
 drivers/gpu/drm/xe/xe_module.c                |    6 +
 drivers/gpu/drm/xe/xe_oa.c                    | 2328 +++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                    |   30 +
 drivers/gpu/drm/xe/xe_oa_types.h              |  226 ++
 drivers/gpu/drm/xe/xe_perf.c                  |   67 +
 drivers/gpu/drm/xe/xe_perf.h                  |   20 +
 drivers/gpu/drm/xe/xe_query.c                 |   77 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   24 +-
 include/uapi/drm/xe_drm.h                     |  286 ++
 22 files changed, 3267 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

-- 
2.41.0

