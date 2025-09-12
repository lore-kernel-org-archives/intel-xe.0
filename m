Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8466DCAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 10:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F3510E187;
	Fri, 12 Sep 2025 10:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5+hNg78";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95310E187
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757671780; x=1789207780;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o0Yy+kHhK2ia+I4NglXOxmobjmRYWoxsAdmOLfZ6ZR0=;
 b=g5+hNg78v5KTnThKHKtpzs5cbzhphPSR9B/+20bE+ycwocsnSZzQe1Eh
 QK1ISSw+sd69duMYE4s+/vbzn68YudvTb2nSmc8eROtXC1/QOd8xw+PYA
 SMP1fuv32+m+FkGeGDyTDmLP7A65zXDUEUVmaYOT2hjmuV5ns/ZeCin49
 TvlBC3UqM3ejq34UttOPd3t6jbFH9UpYB8HZnFxIkq7sBEb1A1kV0iZT2
 uJTV+lrcSQfn3UDMxN2mYnwDK7wfM/9qY9kv5CEQEik8IeMa24bkH++tE
 WkO6/RPnt0M/Lh2reBfcIUf1fntFcJDD8FN5r3QCsd8sOfDUKTWtczslI g==;
X-CSE-ConnectionGUID: +BcZBU1BSnOdL+wQPtrSKQ==
X-CSE-MsgGUID: BNsSfUiJRju9a89g6X8y4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70700331"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="70700331"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 03:09:40 -0700
X-CSE-ConnectionGUID: HmJEF/IlTHuc0GN6EcaEng==
X-CSE-MsgGUID: zQmye42cRduibkc/4ZXbrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173761566"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.134])
 ([10.245.244.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 03:09:38 -0700
Message-ID: <dd98ea1a-1343-4dd3-8e8c-83c7f2c4137e@intel.com>
Date: Fri, 12 Sep 2025 11:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] Fix runtime PM handling of Xe work period worker
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
 <20250912090354.2619418-10-aakash.deep.sarkar@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250912090354.2619418-10-aakash.deep.sarkar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/09/2025 10:03, Aakash Deep Sarkar wrote:
> The autosuspend delay for the xe device is set to 1000 msecs. This
> means that the RPM framework would wait for 1000 msecs before initiating
> the runtime suspend. Since the Xe work period kworker runs approximately
> every 500 msecs, taking a full runtime PM reference from our kworker
> would cancel any pending suspend requests and would resume the device
> synchronously from within our kworker. In other words the opportunistic
> runtime suspend would never come to pass with our kworker running every
> 500 msecs.
> 
> To address this issue, we only take a runtime PM reference in our work
> period kworker, if the device is already awake. Otherwise we mark the
> kworker as suspended and skip the rescheduling of our kworker.
> 
> In the runtime resume callback for our xe device, we check which of the
> xe users are in a suspended state and reschedule the work for these xe
> users.
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c   |  4 ++++
>   drivers/gpu/drm/xe/xe_user.c | 28 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_user.h |  7 +++++++
>   3 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 5e8126ca8e27..0e4dbf9880e4 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -25,6 +25,7 @@
>   #include "xe_pxp.h"
>   #include "xe_sriov_vf_ccs.h"
>   #include "xe_trace.h"
> +#include "xe_user.h"
>   #include "xe_wa.h"
>   
>   /**
> @@ -558,6 +559,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_pxp_pm_resume(xe->pxp);
>   
> +	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD))
> +		xe_users_runtime_resume(xe);
> +
>   	if (IS_SRIOV_VF(xe))
>   		xe_sriov_vf_ccs_register_context(xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> index 50fb43d03b7b..3fa3a590ca9e 100644
> --- a/drivers/gpu/drm/xe/xe_user.c
> +++ b/drivers/gpu/drm/xe/xe_user.c
> @@ -60,7 +60,12 @@ static void xe_work_period_worker(struct work_struct *work)
>   	last_active_duration = user->active_duration_ns;
>   	last_timestamp = user->last_timestamp_ns;
>   
> -	xe_pm_runtime_get(xe);
> +	if (!xe_pm_runtime_get_if_active(xe)) {
> +		WRITE_ONCE(user->suspended, true);
> +		xe_user_put(user);
> +		mutex_unlock(&user->lock);

I think this might lead to strange behaviour when !if_active() triggers, 
and suspend is later cancelled, so the suspend never actually runs but 
here we just returned and never re-scheduled the worker so it might 
never run again, like say something grabbing a new rpm ref before the 
1000ms grace period? Maybe we can just re-schedule the worker as normal 
here, skipping the other stuff, and then add xe_users_runtime_suspend() 
which cancels the worker instead, and is then only run if suspend 
actually triggers?

Also this patch should be squashed with the patch that introduces the 
worker. Each patch in the series should be self contained, and ideally 
~functional. Also patch prefix should be "drm/xe:".

> +		return;
> +	}
>   
>   	list_for_each_entry(xef, &user->filelist, user_link) {
>   
> @@ -118,6 +123,7 @@ struct xe_user *xe_user_alloc(void)
>   	mutex_init(&user->lock);
>   	INIT_LIST_HEAD(&user->filelist);
>   	INIT_DELAYED_WORK(&user->delay_work, xe_work_period_worker);
> +	WRITE_ONCE(user->suspended, false);
>   	return user;
>   }
>   
> @@ -160,3 +166,23 @@ struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid)
>   
>   	return NULL;
>   }
> +
> +void xe_users_runtime_resume(struct xe_device* xe)
> +{
> +	struct xe_user *user = NULL;
> +	unsigned long i = 0;
> +
> +	mutex_lock(&xe->work_period.lock);
> +	xa_for_each(&xe->work_period.users, i, user) {
> +		if (READ_ONCE(user->suspended) == true) {
> +			xe_user_get(user);
> +
> +			if (!schedule_delayed_work(&user->delay_work,
> +					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
> +				xe_user_put(user);
> +
> +			WRITE_ONCE(user->suspended, false);
> +		}
> +	}
> +	mutex_unlock(&xe->work_period.lock);
> +}
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> index 7c30bf470aa7..cd6cf3e15329 100644
> --- a/drivers/gpu/drm/xe/xe_user.h
> +++ b/drivers/gpu/drm/xe/xe_user.h
> @@ -49,6 +49,11 @@ struct xe_user {
>   	 */
>   	struct delayed_work delay_work;
>   
> +	/**
> +	 * @suspended: is the work period suspended for this user
> +	 */
> +	bool suspended;
> +
>   	/**
>   	 * @id: index of this user into the xe device users array
>   	 */
> @@ -110,5 +115,7 @@ static inline void xe_user_put(struct xe_user *user)
>   	kref_put(&user->refcount, __xe_user_free);
>   }
>   
> +void xe_users_runtime_resume(struct xe_device* xe);
> +
>   #endif // _XE_USER_H_
>   

