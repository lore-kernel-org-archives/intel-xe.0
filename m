Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCB7C27C42
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 01:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FB910EACC;
	Mon, 27 May 2024 01:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZWcGnbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC3110E050
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 01:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716774218; x=1748310218;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vzh5BJTEnwnXS588ccqcPM68wJJgIaUunpK5MUsNXPk=;
 b=UZWcGnbPsEmg4g88DFj/4Kw/IQWrXdtVEy+OxfUXj1oW36ia4VY1vsw4
 29qJJdGptjloUPKrYZu3X9qh6mbDQN9KPJYzUmetTukmYqhP6gyVSGLBC
 0Eh43Cr7wwt+/ZbYbnWfXZ3DJB84ld6ZuZcHvKfYhlbAiROIEw4PpUuK4
 5jd+e/Z7RI7p0TdWRScNjbnAo9FSMe3kH+QYHMXDX+V0UWNymqNuBfLBz
 841/KJTK0ZBtpyXRxVyrOaEmPw0hTN1kaxEDyNBaI4yjZvgx5wc8TFuY8
 63bubAEiqBRD6dDKbyOmDinT9l9dvrZRvCYeMUVY2uK6DV10MzzbrhCVL w==;
X-CSE-ConnectionGUID: KM1G1EceRn6v/mUycRCvyw==
X-CSE-MsgGUID: 8uBBikXTSbKX/KTzNIYLtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="11707460"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="11707460"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 18:43:37 -0700
X-CSE-ConnectionGUID: YGVh7Xx7RlCgPq9lh87j5w==
X-CSE-MsgGUID: 2bk36qMWQC6JNuqb+mVaYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="65821701"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 18:43:37 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v15 00/17] Add OA functionality to Xe
Date: Sun, 26 May 2024 18:43:16 -0700
Message-ID: <20240527014333.603914-1-ashutosh.dixit@intel.com>
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

For changes in later versions see changelog below.

This series is also available at:
        https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa

The series has been tested against this IGT series:
        https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa
	or,
	https://patchwork.freedesktop.org/series/130033/

Opensource consumers using uapi in this series:

gpuvis:
	https://github.com/mikesart/gpuvis/pull/86

mesa:
	https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29312

Test-with: 20240524031439.106332-1-ashutosh.dixit@intel.com

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

