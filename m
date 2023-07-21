Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CE6C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 00:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9279510E165;
	Fri, 21 Jul 2023 00:30:13 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0708E10E154
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 00:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689899411; x=1721435411;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oO4/9eMCmYmNZA0iwHHZlyTjOMG190ZoxtDfcQhOFqo=;
 b=R2fn4LQ/k4oKC0pHURfQGoKmfslg6SjLjNgyLnBUp+Doe02xGoFHEGtB
 Qhd7kcmDlbSutq38AbFaTBFqkeWA2eh4LeYIClwAIjhT/Uwi3U34c4s/v
 HoJc5IZkcI0JPWRa7OnXsyiJmz7pt2Dv4asDXelIEhVP/5K4jrxrRhkoa
 YapvEy6FHZvTQgmDU/OEDHU6mjrKdwbBiie94K5uVUXDXQZ94BLwZgRpb
 xgJPsB7hZ83mwbnlpH4KqOEEgZQVbgkbLMszNKHCLAqSEm8dh4PHNUyRl
 dWeVqBxmRoo+2DK5VsVNqkWlSqkS28IH+R4eM9JN+L2JM8X56G9z8R1qk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="366934992"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="366934992"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 17:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="790015270"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="790015270"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 17:30:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jul 2023 17:29:56 -0700
Message-ID: <20230721003006.3467377-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/10] Add OA functionality to Xe
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

This patchset is the initial port of i915 perf/OA functionality to the Xe
driver. It has been tested against the following IGT patch:

https://patchwork.freedesktop.org/series/121082/

The following features in i915 have not been ported and will be added (as
new patches) if/as they are needed:

* NOA wait
* GuC ctx id (guc_sw_ctx_id)
* CTX_R_PWR_CLK_STATE/GEN8_R_PWR_CLK_STATE
* hold_preemption (DRM_XE_OA_PROP_HOLD_PREEMPTION)
* sseu_config (DRM_XE_OA_PROP_GLOBAL_SSEU)
* Override gucrc (override_gucrc_mode)
* MTL bios_c6_setup
* ratelimits
* compat ioctl

I am providing the following additional HAX patch (not part of this series)
to help review these patches:

https://patchwork.freedesktop.org/patch/548718/?series=120100&rev=3

The commit message in the above patch explains how it can be useful for
reviewing this series.

Test-with: 20230720231756.3464641-1-ashutosh.dixit@intel.com

Ashutosh Dixit (10):
  drm/xe/oa: Introduce OA uapi
  drm/xe/oa: Add OA types
  drm/xe/oa: Add registers and GPU commands used by OA
  drm/xe/oa: Module init/exit and probe/remove
  drm/xe/oa: Add/remove config ioctl's
  drm/xe/oa: Start implementing OA stream open ioctl
  drm/xe/oa: OA stream initialization
  drm/xe/oa: Expose OA stream fd
  drm/xe/oa: Read file_operation
  drm/xe/oa: Implement queries

 drivers/gpu/drm/xe/Makefile               |    1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h  |    5 +
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   27 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h      |  173 ++
 drivers/gpu/drm/xe/xe_device.c            |   16 +
 drivers/gpu/drm/xe/xe_device_types.h      |    4 +
 drivers/gpu/drm/xe/xe_gt_types.h          |    4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |    2 +
 drivers/gpu/drm/xe/xe_module.c            |    5 +
 drivers/gpu/drm/xe/xe_oa.c                | 2358 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                |   28 +
 drivers/gpu/drm/xe/xe_oa_types.h          |  292 +++
 drivers/gpu/drm/xe/xe_query.c             |    5 +-
 include/uapi/drm/xe_drm.h                 |  257 ++-
 14 files changed, 3175 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h

-- 
2.41.0

