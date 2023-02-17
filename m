Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE88C636D4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 11:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE1D10EF89;
	Fri, 17 Feb 2023 11:39:40 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB3810EFA6
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676633978; x=1708169978;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=kam1ypmNrGFb7rVoybF7ag2W3qvRjkmkXqSCXCa2QnA=;
 b=b8D6CmZBPwZlaB07mByypk4gbva0JTZN4BSCe+kZ/LyNQfO3Bg9LQHON
 Hgdk9nWnkaBZu/DU7b3dgyK/J18mxbkiv2jz6KaNZ1LnnOHfkg1qXOZ+F
 Je63okGJnB/mPk/r+u1hcitP+UAf0rrdgXlIHXTCYLKJrvCd5gQPmldtF
 QHLXxftPVjrSz/UIxjaox38gILMev1jfgQGVxBR2UnPqerT08vLMtB9i0
 su1PkXjpYjLg64cwp3l9iflSyJ8N2uPaA3ZkklmnNucivDTOWQ5e25Ij0
 xT59FUwJ6cVUwo8Ei/Xq9fpgN3jVzRDb/fa1v7omD7fVJUw+G8Vmq5L5N Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="320074186"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="320074186"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 03:39:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670513293"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="670513293"
Received: from akocherg-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.53.1])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 03:39:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230217005226.106499-3-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-3-lucas.demarchi@intel.com>
Date: Fri, 17 Feb 2023 13:39:31 +0200
Message-ID: <87y1owy0zw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v2 02/11] drm/xe: Sort includes
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Sort includes and split them in blocks:
>
> 1) .h corresponding to the .c. Example: xe_bb.c should have a "#include
>    "xe_bb.h" first.

Personally, I've never liked this, because the local headers could have
stuff that impacts global headers. And if there are conflicts, you kind
of want to have your local one look like the culprit (although modern
compilers are pretty good at showing both sites).

Note that to keep headers self-contained, this is not enough for headers
not associated with a .c, which is why we have the HDRTEST rule in i915.

> 2) #include <linux/...>
> 3) #include <drm/...>
> 4) local includes
> 5) i915 includes
>
> This is accomplished by running
> `clang-format --style=3Dfile -i --sort-includes drivers/gpu/drm/xe/*.c`
> and ignoring all the changes after the includes. There are also some
> manual tweaks to split the blocks.

Do you have the style file somewhere?

>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bb.c                  |  4 ++--
>  drivers/gpu/drm/xe/xe_bo.c                  |  2 --
>  drivers/gpu/drm/xe/xe_bo_evict.c            |  2 +-
>  drivers/gpu/drm/xe/xe_debugfs.c             |  2 +-
>  drivers/gpu/drm/xe/xe_device.c              |  9 ++++-----
>  drivers/gpu/drm/xe/xe_display.c             | 12 ++++++------
>  drivers/gpu/drm/xe/xe_dma_buf.c             |  8 +++-----
>  drivers/gpu/drm/xe/xe_engine.c              |  4 ++--
>  drivers/gpu/drm/xe/xe_exec.c                |  2 +-
>  drivers/gpu/drm/xe/xe_execlist.c            |  9 ++++-----
>  drivers/gpu/drm/xe/xe_force_wake.c          |  4 ++--
>  drivers/gpu/drm/xe/xe_ggtt.c                |  7 +++----
>  drivers/gpu/drm/xe/xe_gt.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_gt_clock.c            |  8 ++++----
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          |  2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c              |  2 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c        |  2 +-
>  drivers/gpu/drm/xe/xe_gt_sysfs.c            |  4 +++-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
>  drivers/gpu/drm/xe/xe_gt_topology.c         |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c                 | 13 +++++++------
>  drivers/gpu/drm/xe/xe_guc_ads.c             |  5 +++--
>  drivers/gpu/drm/xe/xe_guc_ct.c              |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_debugfs.c         |  2 +-
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c        |  2 +-
>  drivers/gpu/drm/xe/xe_guc_log.c             |  2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 12 +++++++-----
>  drivers/gpu/drm/xe/xe_guc_submit.c          |  6 +++---
>  drivers/gpu/drm/xe/xe_huc.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_huc_debugfs.c         |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c           |  3 +--
>  drivers/gpu/drm/xe/xe_hw_fence.c            |  1 -
>  drivers/gpu/drm/xe/xe_irq.c                 |  5 +++--
>  drivers/gpu/drm/xe/xe_lrc.c                 |  7 +++----
>  drivers/gpu/drm/xe/xe_migrate.c             | 11 ++++++-----
>  drivers/gpu/drm/xe/xe_mmio.c                |  3 +--
>  drivers/gpu/drm/xe/xe_mocs.c                |  4 ++--
>  drivers/gpu/drm/xe/xe_module.c              |  1 +
>  drivers/gpu/drm/xe/xe_pci.c                 |  5 ++---
>  drivers/gpu/drm/xe/xe_pcode.c               | 10 ++++------
>  drivers/gpu/drm/xe/xe_pm.c                  |  4 ++--
>  drivers/gpu/drm/xe/xe_preempt_fence.c       |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c                  |  4 ++--
>  drivers/gpu/drm/xe/xe_query.c               | 11 ++++++-----
>  drivers/gpu/drm/xe/xe_reg_sr.c              |  5 ++---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c       |  7 +++----
>  drivers/gpu/drm/xe/xe_ring_ops.c            |  4 ++--
>  drivers/gpu/drm/xe/xe_rtp.c                 |  1 -
>  drivers/gpu/drm/xe/xe_sa.c                  |  3 ++-
>  drivers/gpu/drm/xe/xe_sched_job.c           |  1 -
>  drivers/gpu/drm/xe/xe_sync.c                |  5 +++--
>  drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c         |  2 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c      |  2 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c        |  2 +-
>  drivers/gpu/drm/xe/xe_tuning.c              |  2 +-
>  drivers/gpu/drm/xe/xe_uc.c                  |  4 ++--
>  drivers/gpu/drm/xe/xe_vm.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_vm_madvise.c          |  8 +++++---
>  drivers/gpu/drm/xe/xe_wopcm.c               |  2 +-
>  59 files changed, 128 insertions(+), 132 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 8b9209571fd0..a25079d4e710 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -2,12 +2,12 @@
>  /*
>   * Copyright =C2=A9 2022 Intel Corporation
>   */
> -

Nitpick, throughout the series, I would leave a blank line after the
SPDX and copyright boilerplate, regardless of whether it's an #include
or header guard #ifdef that follows. They're not comments about what
follows, which is what it feels like when they're directly attached to
something that follows without a blank line.

>  #include "xe_bb.h"
> -#include "xe_sa.h"
> +
>  #include "xe_device.h"
>  #include "xe_engine_types.h"
>  #include "xe_hw_fence.h"
> +#include "xe_sa.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
>

...

> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 7886c8b85397..a27e6c1a6aff 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -3,13 +3,13 @@
>   * Copyright =C2=A9 2022 Intel Corporation
>   */
>=20=20
> +#include "xe_uc.h"
>  #include "xe_device.h"
> -#include "xe_huc.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_submit.h"
> -#include "xe_uc.h"
> +#include "xe_huc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"

Here, having the .h corresponding to the .c just looks like it's not
properly sorted.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
