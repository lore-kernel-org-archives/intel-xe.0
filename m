Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C39C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 14:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938CC10E84C;
	Thu, 23 Jan 2025 14:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbci7Zhj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49F110E844
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 14:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737644363; x=1769180363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FBzYMtSjqfM7p/d6XIe2NK6Oa9E03Khm9cQkOjfvEHY=;
 b=nbci7Zhj+G1Kmfb85Bfj+KvrVFKPveRtk+XTy9g09NxuI0EkzYkne/yH
 jqO7XADJ94N9p+M/d8ms5E1fTagcaFvrDmeJGARKyox0LJQRAo5nDRz5z
 Pv3EgtJx+rcxo3BkrMCT1SPbBqMje59bTXq65veJeH5kn12Z66bNyZSm7
 8vodojx52DjQNGlCf2joymsS+/QeNPk73yGw/snPqMneWlpUJBhOPp4km
 gIQoi9u+tn386719wlZdYCqrEUWVJQWuKpV5Nd4rDzSOJJxQt3dFfxYtW
 ehJPDoWJ5ZV9zHIdq8GCdmGzkRrb622d89sCwaCHrffH5dK3EhIivSZxs w==;
X-CSE-ConnectionGUID: 24pLq69zQhWbTzsLj7nnzA==
X-CSE-MsgGUID: qzyr8M9GSuCNWbsfAxvX9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49134577"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="49134577"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 06:59:22 -0800
X-CSE-ConnectionGUID: 5bnGgniCTmWT6lxW0Ppa6Q==
X-CSE-MsgGUID: 0pDk5M6uQ+KlhWftR0hEmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107294353"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 06:59:21 -0800
Date: Thu, 23 Jan 2025 08:59:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, 
 Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v15 3/6] drm/xe/pmu: Extract xe_pmu_event_update()
Message-ID: <djk45hhruejm5yzsvyn7jfmby6holhyhfk74xnbkxmot2yqmwf@l2kz7pjdxvvp>
References: <20250123041923.1892837-1-lucas.demarchi@intel.com>
 <20250123041923.1892837-4-lucas.demarchi@intel.com>
 <Z5IX2Rixtx6csrKO@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z5IX2Rixtx6csrKO@intel.com>
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

On Thu, Jan 23, 2025 at 05:20:09AM -0500, Rodrigo Vivi wrote:
>On Wed, Jan 22, 2025 at 08:19:20PM -0800, Lucas De Marchi wrote:
>> Like other pmu drivers, keep the update separate from the read so it can
>> be called from other methods (like stop()) without side effects.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pmu.c | 24 +++++++++++++++---------
>>  1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index df93ba96bdc1e..33598272db6aa 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -117,18 +117,11 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>  	return val;
>>  }
>>
>> -static void xe_pmu_event_read(struct perf_event *event)
>> +static void xe_pmu_event_update(struct perf_event *event)
>>  {
>> -	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>  	struct hw_perf_event *hwc = &event->hw;
>> -	struct xe_pmu *pmu = &xe->pmu;
>>  	u64 prev, new;
>>
>> -	if (!pmu->registered) {
>> -		event->hw.state = PERF_HES_STOPPED;
>> -		return;
>> -	}
>> -
>>  	prev = local64_read(&hwc->prev_count);
>>  	do {
>>  		new = __xe_pmu_event_read(event);
>
>I really have the feeling that the names are inverted, and that this
>function should be the one actually called read, but I double
>checked and everybody else is doing the same, so I guess I just need
>more coffee...

yeah... that's because "read" here is used in 2 different contexts:

1) as implementation of the perf_pmu functor. We are implementing the
.event_read() so we call the function xe_pmu_event_read()
2) as the verb implying we are reading the HW since it's commonly used
in xe, so we call the function __xe_pmu_event_read()

however the perf_pmu implies that the HW values are updated not only in
the .read() call, but also in e.g. in the .stop() call. So we have

	xe_pmu_event_stop
	  xe_pmu_event_update
	    __xe_pmu_event_read

and

	xe_pmu_event_read
	  xe_pmu_event_update
	    __xe_pmu_event_read

__xe_pmu_event_read could be called event_hw_readout() or something like
that if it helps clearing up the confusion. Thoughts?

>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

let me know what you think about the rename above and I will keep your
r-b.

thanks
Lucas De Marchi

>
>> @@ -137,6 +130,19 @@ static void xe_pmu_event_read(struct perf_event *event)
>>  	local64_add(new - prev, &event->count);
>>  }
>>
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (!pmu->registered) {
>> +		event->hw.state = PERF_HES_STOPPED;
>> +		return;
>> +	}
>> +
>> +	xe_pmu_event_update(event);
>> +}
>> +
>>  static void xe_pmu_enable(struct perf_event *event)
>>  {
>>  	/*
>> @@ -166,7 +172,7 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
>>
>>  	if (pmu->registered)
>>  		if (flags & PERF_EF_UPDATE)
>> -			xe_pmu_event_read(event);
>> +			xe_pmu_event_update(event);
>>
>>  	event->hw.state = PERF_HES_STOPPED;
>>  }
>> --
>> 2.48.0
>>
