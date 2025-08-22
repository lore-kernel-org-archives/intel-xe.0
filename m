Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93A6CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 11:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52A710EAC2;
	Fri, 22 Aug 2025 11:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnpNoF0e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB31D10EAC2
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755860448; x=1787396448;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0sncXGvUK3F3AqHczGuRdyPmp3+6Sp7Y+IsrBXo7zpo=;
 b=fnpNoF0eb5M5RP1MPsr+MhvlDtDL9I1st6ORJ6oYEDsdnFKh1yQyYLZY
 JEKEOf3T3tML2zVSfgmztmrKEAyDiFBd8PCzMlmUAYhlUFHOSICMVqyRb
 /tZ0+prdJ3Dy41cw1NgcLGi4bGFaXw7GAtjOMgK+5L/IFITJkBTbmpW6e
 vHjyCLVuVndzSaAHEaMiQHkUT8ue8ZARD2Rru/JBfF3FwL+jboGjVMJUP
 q5u6LT/CJYZYUjcNu4VOeAb12u5tafYpKTxcCqPhr78zP6tdjlXsuz1SH
 8V0dvtTHg2UCI/yDPzcnoN9D+GOFGI0Ox0gplJZ2yVID8JzGQWUf3edHU g==;
X-CSE-ConnectionGUID: oYx6W+lNTKipSM3YXa6o5g==
X-CSE-MsgGUID: uomYFGr5RLieKVEyhjwKIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58027821"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58027821"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 04:00:48 -0700
X-CSE-ConnectionGUID: zTIOjO5dS0q2HJCVqidA/Q==
X-CSE-MsgGUID: 2fIarbBGRWm6UANP4lRvSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169044126"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.134])
 ([10.245.244.134])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 04:00:46 -0700
Message-ID: <2cd84781-89b2-4bfa-bcc3-70d37b6dfa94@intel.com>
Date: Fri, 22 Aug 2025 12:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] [ANDROID]: Implement xe_work_period_worker
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, carlos.santa@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com
References: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
 <20250822085932.2221054-7-aakash.deep.sarkar@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250822085932.2221054-7-aakash.deep.sarkar@intel.com>
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

On 22/08/2025 09:59, Aakash Deep Sarkar wrote:
> The work of collecting the GPU run time for a given
> xe_user and emitting its event, is done by the
> xe_work_period_worker kworker. At the time of creation
> of a new xe_user, we simultaneously start a delayed
> kworker thread. The delay of execution is set to be
> 500 ms. After the completion of the work, the kworker
> schedules itself for the next execution. This is done
> as long as the reference to the xe_user pointer is
> valid.
> 
> During each execution cycle the xe_work_period_worker
> iterates over all the xe files in the xe_user::filelist
> and accumulate their corresponding GPU runtime into the
> xe_user::active_duration_ns; while also updating each of
> the xe_file::active_duration_ns. The total runtime for
> this uid in the current sampling period is the delta
> between the previous xe_user::active_duration_ns and
> the current xe_user::active_duration_ns.
> 
> We also record the current timestamp at the end of each
> invocation to xe_work_period_worker function in the
> xe_user::last_timestamp_ns. The sampling period for this
> uid is the delta between the previous timestamp and the
> current timestamp.
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 28 +++++++----
>   drivers/gpu/drm/xe/xe_user.c   | 85 ++++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_user.h   | 18 +++++--
>   3 files changed, 115 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index bd4a1c5c57ca..b4692d45c7e9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -151,12 +151,23 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   
>   		user->id = idx;
>   		drm_dev_get(&xe->drm);
> +
> +		xe_user_get(user);
> +		if (!schedule_delayed_work(&user->delay_work,
> +					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
> +			xe_user_put(user);
>   	}
> -	mutex_lock(&user->filelist_lock);
> +
> +	mutex_lock(&user->lock);
>   	list_add(&xef->user_link, &user->filelist);
> -	mutex_unlock(&user->filelist_lock);
> -	xef->user = user;
> +	mutex_unlock(&user->lock);
>   
> +	/*
> +	 * We have already taken a reference to the xe_user in
> +	 * xe_user_lookup in case this xe file doesn't own the
> +	 * pointer to the xe_user.
> +	 */
> +	xef->user = user;
>   	return 0;
>   }
>   
> @@ -172,11 +183,12 @@ static void xe_file_destroy(struct kref *ref)
>   	xe_drm_client_put(xef->client);
>   	kfree(xef->process_name);
>   
> -	mutex_lock(&xef->user->filelist_lock);
> -	list_del(&xef->user_link);
> -	mutex_unlock(&xef->user->filelist_lock);
> -
> -	xe_user_put(xef->user);
> +	if (xef->user) {
> +		mutex_lock(&xef->user->lock);
> +		list_del(&xef->user_link);
> +		xe_user_put(xef->user);
> +		mutex_unlock(&xef->user->lock);
> +	}
>   	kfree(xef);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> index 5c7d21dfcc45..50fb43d03b7b 100644
> --- a/drivers/gpu/drm/xe/xe_user.c
> +++ b/drivers/gpu/drm/xe/xe_user.c
> @@ -6,17 +6,94 @@
>   #include <linux/slab.h>
>   #include <drm/drm_drv.h>
>   
> +#include "xe_assert.h"
> +#include "xe_device_types.h"
> +#include "xe_exec_queue.h"
> +#include "xe_pm.h"
>   #include "xe_user.h"
>   
> +#define CREATE_TRACE_POINTS
> +#include "xe_power_gpu_work_period_trace.h"
> +
> +static inline void schedule_next_work(struct xe_device *xe, unsigned int id)
> +{
> +	struct xe_user *user;
> +
> +	mutex_lock(&xe->work_period.lock);
> +	user = xa_load(&xe->work_period.users, id);
> +	if (user && xe_user_get_unless_zero(user))
> +		schedule_delayed_work(&user->delay_work,
> +				msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL));
> +	mutex_unlock(&xe->work_period.lock);
> +}
>   /**
>    * worker thread to emit gpu work period event for this xe user
>    * @work: work instance for this xe user
>    *
>    * Return: void
>    */
> -static inline void work_period_worker(struct work_struct *work)
> +static void xe_work_period_worker(struct work_struct *work)
>   {
> -	//TODO: Implement this worker
> +	struct xe_user *user = container_of(work, struct xe_user, delay_work.work);
> +	struct xe_device *xe = user->xe;
> +	struct xe_file *xef;
> +	struct xe_exec_queue *q;
> +
> +	/*
> +	 * The GPU work period event requires the following parameters
> +	 *
> +	 * gpuid:           GPU index in case the platform has more than one GPU
> +	 * uid:             user id of the app
> +	 * start_time:      start time for the sampling period in nanosecs
> +	 * end_time:        end time for the sampling period in nanosecs
> +	 * active_duration: Total runtime in nanosecs for this uid in
> +	 *                  the current sampling period.
> +	 */
> +	u32 gpuid = 0, uid = user->uid, id = user->id;
> +	u64 start_time, end_time, active_duration;
> +	u64 last_active_duration, last_timestamp;
> +	unsigned long i;
> +
> +	mutex_lock(&user->lock);
> +
> +	// Save the last recorded active duration and timestamp
> +	last_active_duration = user->active_duration_ns;
> +	last_timestamp = user->last_timestamp_ns;
> +
> +	xe_pm_runtime_get(xe);

If this runs every ~500ms is this not the same as disabling RPM 
completely? IIRC when the RPM refcount reaches zero there is about 1 
second delay before trying to enter runtime suspend. If so, should this 
not be something like get_if_active(), and then rather have the resume 
side restart the worker as needed?

> +
> +	list_for_each_entry(xef, &user->filelist, user_link) {
> +
> +		wait_var_event(&xef->exec_queue.pending_removal,
> +		!atomic_read(&xef->exec_queue.pending_removal));
> +
> +		/* Accumulate all the exec queues from this file */
> +		mutex_lock(&xef->exec_queue.lock);
> +		xa_for_each(&xef->exec_queue.xa, i, q) {
> +			xe_exec_queue_get(q);
> +			mutex_unlock(&xef->exec_queue.lock);
> +
> +			xe_exec_queue_update_run_ticks(q);
> +
> +			mutex_lock(&xef->exec_queue.lock);
> +			xe_exec_queue_put(q);
> +		}
> +		mutex_unlock(&xef->exec_queue.lock);
> +		user->active_duration_ns += xef->active_duration_ns;
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +
> +	start_time = last_timestamp + 1;
> +	end_time = ktime_get_raw_ns();
> +	active_duration = user->active_duration_ns - last_active_duration;
> +	trace_gpu_work_period(gpuid, uid, start_time, end_time, active_duration);
> +	user->last_timestamp_ns = end_time;
> +	xe_user_put(user);
> +
> +	mutex_unlock(&user->lock);
> +
> +	schedule_next_work(xe, id);
>   }
>   
>   /**
> @@ -38,9 +115,9 @@ struct xe_user *xe_user_alloc(void)
>   		return NULL;
>   
>   	kref_init(&user->refcount);
> -	mutex_init(&user->filelist_lock);
> +	mutex_init(&user->lock);
>   	INIT_LIST_HEAD(&user->filelist);
> -	INIT_WORK(&user->work, work_period_worker);
> +	INIT_DELAYED_WORK(&user->delay_work, xe_work_period_worker);
>   	return user;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> index 55035a9c2c4c..80948199e743 100644
> --- a/drivers/gpu/drm/xe/xe_user.h
> +++ b/drivers/gpu/drm/xe/xe_user.h
> @@ -11,9 +11,11 @@
>   #include <linux/mutex.h>
>   #include <linux/workqueue.h>
>   
> -#include "xe_device.h"
> +#include "xe_device_types.h"
>   
>   
> +#define XE_WORK_PERIOD_INTERVAL 500
> +
>   /**
>    * This is a per process/user id structure for a xe device
>    * client. It is allocated when a new process/app opens the
> @@ -32,9 +34,9 @@ struct xe_user {
>   	struct xe_device *xe;
>   
>   	/**
> -	 * @filelist_lock: lock protecting the filelist
> +	 * @filelist_lock: lock protecting this structure
>   	 */
> -	struct mutex filelist_lock;
> +	struct mutex lock;
>   
>   	/**
>   	 * @filelist: list of xe files belonging to this xe user
> @@ -45,7 +47,7 @@ struct xe_user {
>   	 * @work: work to emit the gpu work period event for this
>   	 * xe user
>   	 */
> -	struct work_struct work;
> +	struct delayed_work delay_work;
>   
>   	/**
>   	 * @id: index of this user into the xe device users array
> @@ -73,6 +75,14 @@ struct xe_user {
>   struct xe_user *xe_user_alloc(void);
>   struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid);
>   
> +static inline struct xe_user *
> +xe_user_get_unless_zero(struct xe_user *user)
> +{
> +	if (kref_get_unless_zero(&user->refcount))
> +		return user;
> +	return NULL;
> +}
> +
>   static inline struct xe_user *
>   xe_user_get(struct xe_user *user)
>   {

