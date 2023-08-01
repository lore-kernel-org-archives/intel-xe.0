Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB705C0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 14:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7223110E0F4;
	Tue,  1 Aug 2023 14:01:37 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B97D10E0F4
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690898495; x=1722434495;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MOqtfzn6mfDrtvjkF4pmhZXzFbKTlyUpd8BuCPOeBHM=;
 b=AzbVsQwcb446l3K33PzSuyM48Wi/wChCQeXNsBJ32+CWDH7KR+Bcmx4g
 S0B5ZaIxAzRdQeeI9Wt2VDaT3MGGeV5kCCum5mVHK+FQVRT5gSXPy0XpZ
 DG+PAt5GYJOqTUeLEo1BTt39VvYLn48/zCiMjTNaddwls9R3cg1rJYd+q
 +JoO1piu1S4IaJY6+jErfqJTSypkWZJJSWCAn1ORK0teOUuJW0EjEToEH
 gNe0Z1R5Jc40DyP6ZMwWlWhMteNcZOSa5A7hf9nvzSiVP51YUGr/x8Lew
 TXBnEyqDQSMJlc2ljfezoH2M1GGATFYF1exUtoQ/Z3ngh9B17Xl1lt7Z3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369298886"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="369298886"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:01:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="798665516"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="798665516"
Received: from igorban-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.36.188])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:01:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230727145530.7-3-francois.dugast@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230727145530.7-1-francois.dugast@intel.com>
 <20230727145530.7-3-francois.dugast@intel.com>
Date: Tue, 01 Aug 2023 17:01:30 +0300
Message-ID: <877cqex3np.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v3 2/3] drm/xe: Prefer WARN() over BUG() to
 avoid crashing the kernel
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
Cc: Francois Dugast <francois.dugast@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 27 Jul 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> Replace calls to XE_BUG_ON() with calls XE_WARN_ON() which in turn calls
> WARN() instead of BUG(). BUG() crashes the kernel and should only be
> used when it is absolutely unavoidable in case of catastrophic and
> unrecoverable failures, which is not the case here.
>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  2 +-

This seems to have been merged already, but it's really not helping us
to touch i915 and xe in the same commits unless it's absolutely
necessary. The i915 display part especially should've been a fixup patch
to something else.


BR,
Jani.

>  drivers/gpu/drm/xe/xe_bb.c                   |  8 +--
>  drivers/gpu/drm/xe/xe_bo.c                   | 52 +++++++++---------
>  drivers/gpu/drm/xe/xe_bo.h                   | 14 ++---
>  drivers/gpu/drm/xe/xe_bo_evict.c             |  4 +-
>  drivers/gpu/drm/xe/xe_execlist.c             | 14 ++---
>  drivers/gpu/drm/xe/xe_force_wake.c           |  4 +-
>  drivers/gpu/drm/xe/xe_force_wake.h           |  4 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                 | 12 ++---
>  drivers/gpu/drm/xe/xe_gt_clock.c             |  4 +-
>  drivers/gpu/drm/xe/xe_gt_debugfs.c           |  2 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c  | 12 ++---
>  drivers/gpu/drm/xe/xe_guc.c                  | 22 ++++----
>  drivers/gpu/drm/xe/xe_guc_ads.c              | 14 ++---
>  drivers/gpu/drm/xe/xe_guc_ct.c               | 22 ++++----
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c         |  2 +-
>  drivers/gpu/drm/xe/xe_guc_log.c              |  4 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 48 ++++++++---------
>  drivers/gpu/drm/xe/xe_huc.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c            | 10 ++--
>  drivers/gpu/drm/xe/xe_hw_fence.c             |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c                  |  8 +--
>  drivers/gpu/drm/xe/xe_macros.h               |  1 -
>  drivers/gpu/drm/xe/xe_migrate.c              | 34 ++++++------
>  drivers/gpu/drm/xe/xe_pt.c                   | 22 ++++----
>  drivers/gpu/drm/xe/xe_res_cursor.h           | 12 ++---
>  drivers/gpu/drm/xe/xe_ring_ops.c             |  8 +--
>  drivers/gpu/drm/xe/xe_sched_job.c            |  2 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c       |  4 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c                | 16 +++---
>  drivers/gpu/drm/xe/xe_uc_fw.h                |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c                   | 56 ++++++++++----------
>  drivers/gpu/drm/xe/xe_wait_user_fence.c      |  2 +-
>  drivers/gpu/drm/xe/xe_wopcm.c                | 18 +++----
>  34 files changed, 221 insertions(+), 222 deletions(-)
>

-- 
Jani Nikula, Intel Open Source Graphics Center
