Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EC0C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 11:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B4B10E02E;
	Mon,  9 Jun 2025 11:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VteseP7K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF9610E02E
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 11:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749466864; x=1781002864;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XtZKRdnrBnDW0hw1oob0NFHXilUd31BYMptrgZd1ses=;
 b=VteseP7KnUbE460fCq4xIMYRoN+Gh3+RtcR7DsYwZV3rnFMAemfZOMjn
 CDeO/LbtMRjfuHIH8ghgu2A1vh4guU2yV7gwQMZAJWGOABWT0nl2k87V+
 0WbJIaux+FiTJ+kpUbmdpxVWdHkDxIubYOq26h9ZAGVtp2SwPOHiDtAyt
 lPIA1yuejBxhR9wdjLuBd4WveCw58BQRqBuOSzSBVw22b7omCa4gyaRz8
 FbLnM0Y85wcH19C5uQpjNLW1rjnkQTap9uvq9pXpboDXjeR4WZfL8FV6T
 ABMDX/9lsz3R6oPeL6QnG1O9JwEDafBXscVfJzu/Fp5zPSh4fHjqGffkq Q==;
X-CSE-ConnectionGUID: ezlY8t4VRTOrMBpzQv8B2w==
X-CSE-MsgGUID: yRgg0MtGRIOEtW6Ia+OMyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="55203525"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="55203525"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 04:01:03 -0700
X-CSE-ConnectionGUID: DhiSzdheTxidjTRwoJOSvA==
X-CSE-MsgGUID: OTDy7Q1qTBKbYmtV5PtbDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="147004493"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2025 04:01:01 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5737932CB7;
 Mon,  9 Jun 2025 12:00:59 +0100 (IST)
Message-ID: <80e07435-4db8-4456-b8f0-f8864b4d4574@intel.com>
Date: Mon, 9 Jun 2025 13:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] drm/xe/vf: Finish RESFIX by reset if CTB not
 enabled
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250606001823.1010994-1-tomasz.lis@intel.com>
 <20250606001823.1010994-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250606001823.1010994-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 06.06.2025 02:18, Tomasz Lis wrote:
> The RESFIX state should be achievable only when CTB communication is

I'm not sure this is a valid statement, we can't make assumptions about
the VF driver state, and CTB is enabled only when driver is actively
submitting workloads, which might not be its 100% life time

> enabled. If CTB was disabled and we still got it, then either we're
> dealing with unclean initial state, or the driver is not currently
> functional. In these cases, exit the RESFIX state by reset.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.c    | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
>  3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 792523cfa6e6..8fa210c0ef1a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_sriov_vf_types.h"
>  #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
>  #include "xe_mmio.h"
> @@ -721,6 +722,16 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>  
> +	if (!xe_guc_ct_enabled(&gt->uc.guc.ct)) {
> +		/*
> +		 * If driver initialization is running in parallel to this handler,
> +		 * ignore the migration which happened before the driver was loaded.

CT could be temporarily disabled during reset or suspend
shouldn't we attempt to do fixups in those cases?

> +		 * Force GuC to take the VF out of RESFIX state without any fixups.
> +		 */
> +		xe_sriov_vf_post_migration_reset_guc_state(xe);
> +		return;

if we exit early here, wouldn't that impact logic in the
vf_ready_to_recovery_on_all_gts() which looks for bits in gt_flags?

> +	}
> +
>  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>  	/*
>  	 * We need to be certain that if all flags were set, at least one
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 6526fe450e55..eff6c7b96f25 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -147,6 +147,22 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  		xe_sriov_info(xe, "migration not supported by this module version\n");
>  }
>  
> +/**
> + * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
> + * @xe: the &xe_device struct instance
> + *
> + * This function sends VF state reset to GuC, as a way of exiting RESFIX

"sends VF state reset to GuC"

well, this function does much more than that

> + * state if a proper post-migration recovery procedure has failed.
> + */
> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_reset_async(gt);
> +}
> +
>  /**
>   * vf_post_migration_requery_guc - Re-query GuC for current VF provisioning.
>   * @xe: the &xe_device struct instance
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 7b8622cff2b7..ba846af34a13 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -10,5 +10,6 @@ struct xe_device;
>  
>  void xe_sriov_vf_init_early(struct xe_device *xe);
>  void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe);
>  
>  #endif

