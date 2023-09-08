Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CB9EE57C0
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3552D10E863;
	Fri,  8 Sep 2023 04:23:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1517110E85F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147035; x=1725683035;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HZU2sCAkPDlDKNbs2RrM1MqaWcvlv06AjtYRJ86dPqQ=;
 b=eHP7RorgBjf2r7xZ2hSsgu6qC6OAMzYvP9v2uFMxpXO9m6nMqTNMdNSo
 PNK8QLlPrj6LGJHRsZFl+752NmbpwwAHrU3hA7TLgYdrGw+XyTFUgeEm1
 cvVJdBCIu9Mx44pejsvU1E0AEfY1ekMq/aP8tFix6mtUR8h4e9W2Gymzw
 3VHv52AlFjGUjuK5iIuhA+Au5j38AZmJHkxiIgYQorl0Niao02DRmaWjx
 pTJv8gosv00icfU5sxaUgVUimd0/lNhj6c9KkOFOrt2S5AFO8IjcVgw6X
 6oW+HPq2Ek7NqjXyaKOcwVHohbdqp+WjzFIAN6Wbc1/yuSoS5lsGKRbgs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935381"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935381"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200701"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200701"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:31 -0700
Message-ID: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/17] Add OA functionality to Xe
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

This patchset is the initial port of i915 perf/OA functionality to the XE
driver. It has been tested against the following IGT patch:

https://patchwork.freedesktop.org/series/121082/

The following features in i915 have not been ported and will be added (as
new patches) if/as they are needed:

* Inline batch submission on stream exec_queue/hw_engine
* NOA wait
* GuC ctx id (guc_sw_ctx_id)
* CTX_R_PWR_CLK_STATE/GEN8_R_PWR_CLK_STATE
* hold_preemption (DRM_XE_OA_PROP_HOLD_PREEMPTION)
* sseu_config (DRM_XE_OA_PROP_GLOBAL_SSEU)
* MTL bios_c6_setup
* ratelimits
* compat ioctl

I am providing the following additional HAX patch (not part of this series)
to help review these patches:

https://patchwork.freedesktop.org/patch/551683/?series=120100&rev=4

The commit message in the above patch explains how it can be useful for
reviewing this series.

This series is also available at:
        https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa

The series has been tested against this IGT series:
        https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa

v2: Fix build
v3: Rebase, due to s/xe_engine/xe_exec_queue/
v4: Re-run for testing
v5: Address review comments
    Add new patches 11 through 17
    New OA uapi: Patch 12, 13, 14, 15. More uapi changes will posted in future series.

Ashutosh Dixit (17):
  drm/xe/oa: Introduce OA (observability architecture) uapi
  drm/xe/oa: Add OA types
  drm/xe/oa: Add registers and GPU commands used by OA
  drm/xe/oa: Module init/exit and probe/remove
  drm/xe/oa: Add/remove config ioctl's
  drm/xe/oa: Start implementing OA stream open ioctl
  drm/xe/oa: OA stream initialization
  drm/xe/oa: Expose OA stream fd
  drm/xe/oa: Read file_operation
  drm/xe/oa: Implement queries
  drm/xe/oa: Override GuC RC with OA on PVC
  drm/xe/perf: "Perf" layer to support multiple perf counter stream types
  drm/xe/oa: Multiplex PERF ops through a single PERF ioctl
  drm/xe/oa: Simplify OA configs in uapi
  drm/xe/oa: Remove OA format names from OA uapi
  drm/xe/oa: Make xe_oa_timestamp_frequency per gt
  drm/xe/oa: Remove filtering reports on context id

 drivers/gpu/drm/xe/Makefile               |    2 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h  |    2 +
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   13 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h      |  173 ++
 drivers/gpu/drm/xe/xe_device.c            |   13 +
 drivers/gpu/drm/xe/xe_device_types.h      |    4 +
 drivers/gpu/drm/xe/xe_gt_types.h          |    4 +
 drivers/gpu/drm/xe/xe_guc_pc.c            |   60 +
 drivers/gpu/drm/xe/xe_guc_pc.h            |    3 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |    2 +
 drivers/gpu/drm/xe/xe_module.c            |    5 +
 drivers/gpu/drm/xe/xe_oa.c                | 2349 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                |   28 +
 drivers/gpu/drm/xe/xe_oa_types.h          |  307 +++
 drivers/gpu/drm/xe/xe_perf.c              |   36 +
 drivers/gpu/drm/xe/xe_perf.h              |   16 +
 drivers/gpu/drm/xe/xe_query.c             |    6 +-
 include/uapi/drm/xe_drm.h                 |  244 ++-
 18 files changed, 3264 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

-- 
2.41.0

