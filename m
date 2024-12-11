Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D74AE7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 11:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AD310E3DE;
	Wed, 11 Dec 2024 11:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IY4oWDY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01C510E3DE
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733917153; x=1765453153;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xwJ87lAZCcYQsWNOEb9ZflEP8LMFfgSnSTvU/bIN1Lk=;
 b=IY4oWDY4J6OXRg1Fw4fn+u5gr/L2bmWNcUEyt1XYNMdA+KVaWHYKvqxL
 01gpnjKMWq3zkNyOIJ4pjE+ICO85syHKnIaUVMkv88nQSJhCWy02ESZbO
 HMkHKQ/uoYxIrzeSm0efJj8wLNtC/v+/zektU8mij4o5OrUp4MBFgNOZ8
 cZPepIlcso8dSjwKT5lrCoMWEdvV4rs6ow0PMHUGZYZxR6zAKBLusMwlI
 OE+ppxzHnm2vvz/oHx0pTHpUJXcJmNwvX7BXKm6ay88uER7lUfWbgagM4
 BO9+veXCLAlJ/qvEXklmRHlrcuYxm4rBMnvEDbce6gCz/9P1NJ8goLxr+ g==;
X-CSE-ConnectionGUID: VVC7zqh+RT27LtO/ratZNA==
X-CSE-MsgGUID: 2CwnF//8TL2N7cc2yjMZBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="51699292"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="51699292"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:39:12 -0800
X-CSE-ConnectionGUID: iJNISHxJRsmu8nIXYt3+oQ==
X-CSE-MsgGUID: Mn2BaLUqRq2xSV+KWJ/Cpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126711461"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.149.72])
 ([10.245.149.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:39:09 -0800
Message-ID: <01e6467e-c5b2-46a7-9f84-125186bfe8af@linux.intel.com>
Date: Wed, 11 Dec 2024 12:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe: introduce xe_gt_reset and
 xe_gt_wait_for_reset
To: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, raag.jadav@intel.com
References: <20241211111727.1481476-1-maciej.patelczyk@intel.com>
 <20241211111727.1481476-2-maciej.patelczyk@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241211111727.1481476-2-maciej.patelczyk@intel.com>
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


On 12/11/2024 12:17 PM, Maciej Patelczyk wrote:
> Add synchronous version gt reset as there are few places where it
> is expected.
> Also add a wait helper to wait until gt reset is done.
>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Patch 2 needs this so the same fixes should be applies here too

Fixes: f3bc5bb4d53d ("drm/xe: Allow userspace to configure CCS mode")
Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c   |  7 +++----
>  drivers/gpu/drm/xe/tests/xe_mocs.c |  3 +--
>  drivers/gpu/drm/xe/xe_gt.h         | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 +---
>  4 files changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index c9ec7a313c6b..a1af45e06189 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -264,10 +264,9 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
>  		 * however seems quite fragile not to also restart the GT. Try
>  		 * to do that here by triggering a GT reset.
>  		 */
> -		for_each_gt(__gt, xe, id) {
> -			xe_gt_reset_async(__gt);
> -			flush_work(&__gt->reset.worker);
> -		}
> +		for_each_gt(__gt, xe, id)
> +			xe_gt_reset(__gt);
> +
>  		if (err) {
>  			KUNIT_FAIL(test, "restore kernel err=%pe\n",
>  				   ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index 6f9b7a266b41..2698e433c6fa 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -162,8 +162,7 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
>  		if (flags & HAS_LNCF_MOCS)
>  			read_l3cc_table(gt, &mocs.table);
>  
> -		xe_gt_reset_async(gt);
> -		flush_work(&gt->reset.worker);
> +		xe_gt_reset(gt);
>  
>  		kunit_info(test, "mocs_reset_test after reset\n");
>  		if (flags & HAS_GLOBAL_MOCS)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 82b9b7f82fca..eb2946963420 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -56,6 +56,31 @@ void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
>  void xe_gt_remove(struct xe_gt *gt);
>  
> +/**
> + * xe_gt_wait_for_reset - wait for gt's async reset to finalize.
> + * @gt: GT structure
> + * Return:
> + * %true if it waited for the work to finish execution,
> + * %false if there was no scheduled reset or it was done.
> + */
> +static inline bool xe_gt_wait_for_reset(struct xe_gt *gt)
> +{
> +	return flush_work(&gt->reset.worker);
> +}
> +
> +/**
> + * xe_gt_reset - perform synchronous reset
> + * @gt: GT structure
> + * Return:
> + * %true if it waited for the reset to finish,
> + * %false if there was no scheduled reset.
> + */
> +static inline bool xe_gt_reset(struct xe_gt *gt)
> +{
> +	xe_gt_reset_async(gt);
> +	return xe_gt_wait_for_reset(gt);
> +}
> +
>  /**
>   * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
>   * first that matches the same reset domain as @class
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 3e8c351a0eab..e7792858b1e4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -132,11 +132,9 @@ static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>  static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_pm_runtime_get(gt_to_xe(gt));
> -	xe_gt_reset_async(gt);
> +	xe_gt_reset(gt);
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
> -	flush_work(&gt->reset.worker);
> -
>  	return 0;
>  }
>  
