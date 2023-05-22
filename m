Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912D5C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 11:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEF910E2C3;
	Mon, 22 May 2023 11:07:43 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B96E10E2C3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684753662; x=1716289662;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zq+czV1/3+RyDU1BHiKD4tbImwfTon4eJMyK9t9p8OE=;
 b=RiWqAB1o0uQIHpm07VAD0zf5D7ij12GwxrFE91ucspn6gONJn6V6i6N5
 Jq2OWO/F4brUXfKzCpGOkgqXv3iRSAaPpGdMrm5e/gzfLIUV6QHc7zQJA
 aHas9V1SX3qMiGOwzQY0WHGHgvjZfr8rnyRR41r+txHjCSbLtBF1QYEHw
 6mvJD12XSyE8g8JTXY6wHgoAvXyl53iYMG5aT8KFrfl5Cewc3zyiC9UJS
 DYV9Xt8VjsFJ/HB6vI4SmqrOA5aKilL2IOWqgbskVu4cH/tGsueuR0IiS
 niKJN7735GftnqsbB3y/3+RDp7a5LNpCwCPdC2QFQqbUu2Ru5VCGEGAoq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="333254553"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="333254553"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="768468793"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="768468793"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.40.98])
 ([10.249.40.98])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:07:39 -0700
Message-ID: <90a44499-610f-1efc-9154-855bd22aed73@linux.intel.com>
Date: Mon, 22 May 2023 13:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230522110133.25968-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230522110133.25968-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix kernel-doc issues
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/22/2023 1:01 PM, Matthew Auld wrote:
> drivers/gpu/drm/xe/xe_guc_submit_types.h:47: warning: cannot understand
> function prototype: 'struct guc_submit_parallel_scratch '
>
> drivers/gpu/drm/xe/xe_devcoredump_types.h:38: warning: Function
> parameter or member 'ct' not described in 'xe_devcoredump_snapshot'
>
> CI doesn't appear to be running BAT anymore, assuming this is caused by
> the CI.Hooks now failing due to above warnings.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 +-
>   drivers/gpu/drm/xe/xe_guc_submit_types.h  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 350b905d1797..c0d711eb6ab3 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -27,7 +27,7 @@ struct xe_devcoredump_snapshot {
>   	ktime_t boot_time;
>   
>   	/* GuC snapshots */
> -	/** @ct_snapshot: GuC CT snapshot */
> +	/** @ct: GuC CT snapshot */
>   	struct xe_guc_ct_snapshot *ct;
>   	/** @ge: Guc Engine snapshot */
>   	struct xe_guc_submit_engine_snapshot *ge;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> index 88e855dae056..6765b2c6eab1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> @@ -41,7 +41,7 @@ struct sync_semaphore {
>   };
>   
>   /**
> - * Struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
> + * struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
>    */
>   struct guc_submit_parallel_scratch {
>   	/** @wq_desc: Guc scheduler workqueue descriptor */
