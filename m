Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61491D3E773
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 21:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E2110E0F9;
	Tue,  5 Nov 2024 21:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jn+3c1Uu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAC310E0F9
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 21:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730843805; x=1762379805;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OpzWjyV3rIH7zAjuVPBVPJssipvFGxAdFdR80eaIuRg=;
 b=jn+3c1UuVF1AuKXIzNO/oqFoSWXp3I7RMyg4TFdSXv5grrMajDBfvql5
 2+Chh0N09LUVr/XF8uTyo6HaBItqWV+GuT7YRytl4O8Fb7AXp8Ggk55Iq
 tpUyw9gEBplUzB8S/4lbiMOzWBS1j0fa1OBVkJZ5TUZ8Cy3WgaqO1JMNb
 h1whrpwzlfCvMFYJhnjAemmtRVie/2z8YW19k8zelUiJIGU+laN9pFIKk
 enovMk+UbSZ93+XhZz9TPvlazyKKWRnCeYdS8OooIJ7emahVPio7yPZkp
 TtWwncqzJ3PetpxAGNN01uqt+RJawuvAftL136dNvriNS/TyEF0A5fCbI g==;
X-CSE-ConnectionGUID: ygjsZPblTKehMv1c8CtcBw==
X-CSE-MsgGUID: 8Oi10uFvQb+DNSs8nCRjmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30390943"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30390943"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 13:56:30 -0800
X-CSE-ConnectionGUID: /9GSrcjoTrmAJLldcFx+zw==
X-CSE-MsgGUID: AZib4mkVToaV7bUsGG6hNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88682675"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.146.158])
 ([10.245.146.158])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 13:56:24 -0800
Message-ID: <ddc74c9d-97a0-4700-8b0b-4bfa8eb64b49@linux.intel.com>
Date: Tue, 5 Nov 2024 22:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Take job list lock in xe_sched_first_pending_job
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241105160327.2970277-1-nirmoy.das@intel.com>
 <Zypa9M+p2+4RZ3Oa@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zypa9M+p2+4RZ3Oa@lstrano-desk.jf.intel.com>
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


On 11/5/2024 6:50 PM, Matthew Brost wrote:
> On Tue, Nov 05, 2024 at 05:03:27PM +0100, Nirmoy Das wrote:
>> Access to the pending_list should always happens under job_list_lock.
>>
>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Is this showing up in any bug reports? The only user of this function is
> guc_exec_queue_stop which as stopped the scheduler worker so I think
> accessing to the pending_list is in fact safe without this lock. This is
> however a micro-optimization in a non-hot path which I think is frowned
> upon.

This showed up in coverity report so no real bug report. Also agree that with current usage this won't

cause any issue so avoided adding Cc to stable.

>
> So I think with above the fixes tag is not strickly required.

I will remove the Fixes tag before merging.

>
> For the patch though:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Thanks,

Nirmoy

>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gpu_scheduler.h | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> index 64b2ae6839db..c250ea773491 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> @@ -71,8 +71,14 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
>>  static inline
>>  struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
>>  {
>> -	return list_first_entry_or_null(&sched->base.pending_list,
>> -					struct xe_sched_job, drm.list);
>> +	struct xe_sched_job *job;
>> +
>> +	spin_lock(&sched->base.job_list_lock);
>> +	job = list_first_entry_or_null(&sched->base.pending_list,
>> +				       struct xe_sched_job, drm.list);
>> +	spin_unlock(&sched->base.job_list_lock);
>> +
>> +	return job;
>>  }
>>  
>>  static inline int
>> -- 
>> 2.46.0
>>
