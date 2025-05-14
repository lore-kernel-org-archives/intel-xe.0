Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8656AC3ABDD
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 17:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4779610E2CA;
	Wed, 14 May 2025 17:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/yJRd9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A837610E6C9
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747243421; x=1778779421;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H4GtS2dUKT+SpMSVabEusz0SLc6gvMGNZAr+1tuUhqg=;
 b=V/yJRd9pBjVZ5vkw2B3FvEVH+FlKSYooJ5dWDmmzz6ZwFd/7vS+km6a+
 KLP02rj+SkPqOJbG2AVdsBFIMcxfDUjIcRX+/oISKYOjyrezPLXdrzUKi
 iX5C7WEBJ1lG9IV03hcurs2OyYRIhiqJOoGVHFVvqt7e0LnDwIl653mkE
 TMTa+6RbzlYnKUfCRUMBgUKn1WSL8fEWJNP/Gnhw3LF+aq/cAK9K+9s/9
 cSYdD2EfvxXZC2ccLrJ4Ca0hQdwszkdewTW6MzMTCezk2sP7eTxs0mwDV
 WiLewnsbqmJZxiypD83vmi6948SigHFJ9zaLgWASnzqyeVgH8dRLZLIOd A==;
X-CSE-ConnectionGUID: aEuukagiSQ+LRPSVJnOBcA==
X-CSE-MsgGUID: q0pHqeUJQciqSVWbPxsUdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59790319"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="59790319"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:23:41 -0700
X-CSE-ConnectionGUID: 8f1pEkvUSB2hrJwesbVjVQ==
X-CSE-MsgGUID: V8G9opUcQY2KmJcNcGw3yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="137986822"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 14 May 2025 10:23:39 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E7F2E34914;
 Wed, 14 May 2025 18:23:37 +0100 (IST)
Message-ID: <779be9db-0359-4af2-b4f3-9cf90836162f@intel.com>
Date: Wed, 14 May 2025 19:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/7] drm/xe/vf: Finish RESFIX by reset if CTB not
 enabled
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
 <20250513224952.701343-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250513224952.701343-3-tomasz.lis@intel.com>
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



On 14.05.2025 00:49, Tomasz Lis wrote:
> The RESFIX state should be achievable only when CTB communication is
> enabled. If CTB was disabled and we still got it, then either we're
> dealing with unclean initial state, or the driver is not currently
> functional. In these cases, exit the RESFIX state by reset.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.c    | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
>  3 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4ff7ae1a5f16..b9af112ca771 100644
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
> @@ -932,6 +933,15 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>  
> +	if (!xe_guc_ct_enabled(&gt->uc.guc.ct)) {
> +		/*
> +		 * If at driver init, ignore migration which happened
> +		 * before the driver was loaded.
> +		 */
> +		xe_sriov_vf_post_migration_reset_guc_state(xe);

this triggers async-reset on all GTs, not only on this one where CTB is
off but on other GTs that might have CTB enabled and running - is it
safe to reset them too?

and if CTB is off, can't we just wait with "recovery" once we actually
start the CTB later on?

> +		return;
> +	}
> +
>  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>  	/*
>  	 * We need to be certain that if all flags were set, at least one
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 2674fa948fda..940b81036321 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -134,6 +134,24 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>  }
>  
> +/**
> + * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
> + * @xe: the &xe_device struct instance
> + *
> + * This function sends VF state reset to GuC, as a way of exiting RESFIX
> + * state if a proper post-migration recovery procedure has failed.
> + */
> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_reset_async(gt);
> +
> +	drm_notice(&xe->drm, "VF migration recovery reset scheduled\n");

note that there likely will be already

GT0: trying reset from xe_sriov_vf_post_migration_reset_guc_state
GT0: reset queued
GT1: trying reset from xe_sriov_vf_post_migration_reset_guc_state
GT1: reset queued

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

