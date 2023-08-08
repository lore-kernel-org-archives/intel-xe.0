Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079C8EB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 01:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72A110E390;
	Tue,  8 Aug 2023 01:32:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FFE10E14B
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 01:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691458323; x=1722994323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VuUIcXqDUGq0k7XRMU1lVNbINkOffjJHx++0irWqhnk=;
 b=KPLnHx86qsnyH+R2I80OM7e1u1dI4/VvHoBX1hawH6Ok01SO5giN2ljy
 fAqlTVwlR3RV/PfF6HkExWCLmflP6D8DYXuK+f2wKkY5vpJ/75YG5pt3P
 bqlp1qylaVHB3+Tkqs+PyysOUSiDtHqXRoQXiEGQB9lSY8vsjOZaPBnh2
 GVX+YKdtVjNODWOS+adv7Z/IYnzbaUgoTO0Fiwy992UrVJHOJ9oe/Yy/6
 EYIVkPZODPA2H4dDAhRMXQ4b3TG3CrM841SLdNhA7z/kID7aEFmtxSl+m
 d0YQ3GUFEghlbQpbaOlroLQxxq9ZLMnyzXZSDnw90q0x75cyfEaV+mLXt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350284311"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="350284311"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 18:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="708075756"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="708075756"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 18:32:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:31:49 -0700
Message-ID: <20230808013159.38811-1-ashutosh.dixit@intel.com>
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

* Inline batch submission on stream exec_queue/hw_engine
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

https://patchwork.freedesktop.org/patch/551683/?series=120100&rev=4

The commit message in the above patch explains how it can be useful for
reviewing this series.

Test-with: 20230808010017.37819-1-ashutosh.dixit@intel.com

v2: Fix build
v3: Rebase, due to s/xe_engine/xe_exec_queue/

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
 drivers/gpu/drm/xe/xe_oa.c                | 2356 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                |   28 +
 drivers/gpu/drm/xe/xe_oa_types.h          |  295 +++
 drivers/gpu/drm/xe/xe_query.c             |    5 +-
 include/uapi/drm/xe_drm.h                 |  257 ++-
 14 files changed, 3176 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h

-- 
2.41.0

