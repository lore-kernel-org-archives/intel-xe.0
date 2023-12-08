Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF52C10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39E810E9D6;
	Fri,  8 Dec 2023 06:43:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF7910E990
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017814; x=1733553814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FRleGuBFv0i6RMjgX1pW8IWniCkVKkINm6H/InRcB2o=;
 b=Xqrsts6vZd4oMRANrxvGj9qwSdt5W5EgyqSRXQz0ChjSUTskD51W5oyZ
 u69jcqFF6vM3Gsv8GJfI53BbEvqS+Vg3BjcVAXAdqRlr7Vd6ZiTEEjqPp
 vnKBZe5RPgHfRWK7gkXgtRHuyTYeC2XrdU4QcUHhY7ubEfmpZLqvhWP7G
 eGCUjcMe7MirLNF/s8evFltNoEV7gvnYtXSOZ4AW59u/DbMnuz18lEYUp
 3YMMzLMz0qTWwuySwHcBx3kqE+NiIQZFB2xrgU36rdrcZKEnOMiRXR8AM
 5ystKPuUp/DypN53tm06sCxXvSLqkOR+yexC5QDSEX5BKucxtDOb448DN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866601"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866601"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699220"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699220"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:34 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 00/17] Add OA functionality to Xe
Date: Thu,  7 Dec 2023 22:43:12 -0800
Message-ID: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
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

Here's the latest version of Xe OA patches, this time Xe2/LNL support and
some more updates to uapi. Uapi updates include:
* The "Xe way" of using chained xe_user_extension structs to specify
  properties
* A new query for OA unit properties

That said, some uapi pieces are still not done. These include:
* Previously proposed sync/fences scheme
* Single header per read, rather than header per report
* Other properties like OA buffer size and hold preemption which are
  missing but will be added incrementally in the future

Most code review comments are addressed but some are not. These include:
* Cleanup of verifying OA configs during ADD_CONFIG perf op
* Optimizing the OA buffer use case when only OAR/OAC is needed

Also the patches are completely redone and don't assume starting with the
i915 uapi, so they will need to be reviewed anew. Please review with
emphasis on the uapi.

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

Ashutosh Dixit (17):
  drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream
    types
  drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
  drm/xe/oa/uapi: Add oa_max_sample_rate sysctl
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
 drivers/gpu/drm/xe/regs/xe_oa_regs.h          |  107 +
 drivers/gpu/drm/xe/xe_device.c                |   13 +
 drivers/gpu/drm/xe/xe_device_types.h          |    4 +
 drivers/gpu/drm/xe/xe_gt_types.h              |    4 +
 drivers/gpu/drm/xe/xe_guc_pc.c                |   60 +
 drivers/gpu/drm/xe/xe_guc_pc.h                |    3 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |    2 +
 drivers/gpu/drm/xe/xe_lrc.c                   |   11 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |    1 +
 drivers/gpu/drm/xe/xe_module.c                |   10 +
 drivers/gpu/drm/xe/xe_oa.c                    | 2506 +++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                    |   31 +
 drivers/gpu/drm/xe/xe_oa_types.h              |  233 ++
 drivers/gpu/drm/xe/xe_perf.c                  |   67 +
 drivers/gpu/drm/xe/xe_perf.h                  |   20 +
 drivers/gpu/drm/xe/xe_query.c                 |   81 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   23 +
 include/uapi/drm/xe_drm.h                     |  278 ++
 22 files changed, 3460 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

-- 
2.41.0

