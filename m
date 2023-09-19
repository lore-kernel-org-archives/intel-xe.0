Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BA9CE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1030710E13B;
	Tue, 19 Sep 2023 16:16:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6553410E13B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140178; x=1726676178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fFAa+O/z5IgUMIC4TvQiR9RQz52DyR8ogGdFxlcr2Dk=;
 b=gGW3oQaYmxuQasBbAuA5OQYn/89Mxg41tTyFMeGAYt7LeOYaC2GWvcpY
 4NVwpfiY3UlNa3YdU7VVuoY1/oOmSR7whRC9ZZ4GdA13rDCy5OchG7q6m
 iO29GUVMZbNCo+mmiayZcLkDfVG2vDN1eGeXLqSbLLhKpS7XVp37Firib
 OuAYTJ8OIHFjvoUVPLgFBn7crfLv20JRjBIt4FOmLKJfIrGFhWZ1FOyEx
 8OQ8Ctc+Jb5pu8woy06QxXvi1Bd7g0YxKlvgKt5dBFxxSrhJE9VBxBrVL
 zcWNuiOZct3cPx7UgSQself4HH5T8jPizQuXD1PNNP01SfmUR4WHqhhTO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913519"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913519"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016499"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016499"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:28 -0700
Message-ID: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/21] Add OA functionality to Xe
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
driver. The following features in i915 have not been ported and will be
added (as new patches) if/as they are needed:

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
v5: Address review comments, new patches 11 through 17
v6: New patches 18 through 21

Ashutosh Dixit (21):
  drm/xe/uapi: Introduce OA (observability architecture) uapi
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
  drm/xe/uapi: "Perf" layer to support multiple perf counter stream
    types
  drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl
  drm/xe/uapi: Simplify OA configs in uapi
  drm/xe/uapi: Remove OA format names from OA uapi
  drm/xe/oa: Make xe_oa_timestamp_frequency per gt
  drm/xe/oa: Remove filtering reports on context id
  drm/xe/uapi: More OA uapi fixes/additions
  drm/xe/uapi: Drop OA_IOCTL_VERSION
  drm/xe/uapi: Use OA unit id to identify OA unit
  drm/xe/uapi: Convert OA property key/value pairs to a struct

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
 drivers/gpu/drm/xe/xe_oa.c                | 2314 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                |   27 +
 drivers/gpu/drm/xe/xe_oa_types.h          |  307 +++
 drivers/gpu/drm/xe/xe_perf.c              |   36 +
 drivers/gpu/drm/xe/xe_perf.h              |   16 +
 drivers/gpu/drm/xe/xe_query.c             |    5 +-
 include/uapi/drm/xe_drm.h                 |  288 ++-
 18 files changed, 3272 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

-- 
2.41.0

