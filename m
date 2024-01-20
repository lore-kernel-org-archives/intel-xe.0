Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CE6C47DDC
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B0810EAF2;
	Sat, 20 Jan 2024 02:00:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBC910EACC
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716031; x=1737252031;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mlB2kBCGx+fGVpgZFHuy7pabrVNHIHP6T27w1bPCy/8=;
 b=R+nCNjeR1dupPyFkRJMUaZUSeP7/fs5mx6n+bZLuJkv9xOsc6pArWSaQ
 5fOwaicqKPFveA4p1tty5b0qE4ACUHv1M9fRIP2/MbrCKqoI0fQT+Yx2v
 clQN2R4+VMAb+CXyM9z/unZfTBvyutRm0dcFI+o+5DbOee641VMMDz29D
 nDOcyNuJHnTCDNtzjd9ttN/I416fdYxDuu3vpCCLNHrxIDgIZD+vY4Oha
 SHGzy4bYq/y9L+g2xYQsCqzAjppqa+ThJOUtDBO+MpsCYDF4aEeWXBdeN
 iejX3pAjEdTT8deQIvw5UPq8i3jV79zoo8pww73oJiEouavIB6dNIGyRM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472935"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472935"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125686"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125686"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/16] Add OA functionality to Xe
Date: Fri, 19 Jan 2024 18:00:10 -0800
Message-ID: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
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

For changes in v8, see:

https://patchwork.freedesktop.org/patch/575214/?series=128993&rev=1

This series is also available at:
        https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa

The series has been tested against this IGT series:
        https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa

v2: Fix build
v3: Rebase, due to s/xe_engine/xe_exec_queue/
v4: Re-run for testing
v5: Address review comments, new patches 11 through 17
v6: New patches 18 through 21
v7: Patches are completely redone and don't start with i915 version of the uapi
v8: See https://patchwork.freedesktop.org/patch/575214/?series=128993&rev=1

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
 drivers/gpu/drm/xe/xe_guc_pc.c                |   60 +
 drivers/gpu/drm/xe/xe_guc_pc.h                |    3 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |    2 +
 drivers/gpu/drm/xe/xe_lrc.c                   |   11 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |    1 +
 drivers/gpu/drm/xe/xe_module.c                |    6 +
 drivers/gpu/drm/xe/xe_oa.c                    | 2312 +++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                    |   30 +
 drivers/gpu/drm/xe/xe_oa_types.h              |  230 ++
 drivers/gpu/drm/xe/xe_perf.c                  |   67 +
 drivers/gpu/drm/xe/xe_perf.h                  |   20 +
 drivers/gpu/drm/xe/xe_query.c                 |   81 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   24 +-
 include/uapi/drm/xe_drm.h                     |  224 ++
 22 files changed, 3201 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

-- 
2.41.0

