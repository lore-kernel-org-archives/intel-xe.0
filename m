Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BC8C02194
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 11:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EFD10E1AD;
	Wed,  5 Feb 2025 11:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvwNZCyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A854510E1AD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 11:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738754989; x=1770290989;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=twvJ0r1rET9SErN5sBn6T3AZ/jGGDNqUykquDRYAGVA=;
 b=WvwNZCyylxiG6tgywfPfVvUasvwf5g8PY3kg8DZiuBPHBiFWp+97sPSk
 ygVOqATn3wwUJY7SS5ZBnv5zzuhEH92IZ9mSR2DwRaoXT4JlCiwIaDKQP
 A+0+qZUh5y+WDhTc4tbQQ4ZNx/rlY1zWUgApusUQnbg5lEsIpqATU7T8B
 d66AhTafICLkn4uLzOi29LQhI7uPTPdQyOSGDkPvCzNkkx6k/MH/IOL0c
 H1/JTyzub8oWdqD7io5hNHt1kdjQgJ1+KJ8I3LzFZmhWLmFenGcIvZ9Ue
 Bg0eSnuyjl9V2nh/1OU/dM4Cna+c7t4S1DaePNZkmC32zE/3qoFfPNtTM Q==;
X-CSE-ConnectionGUID: eBTVpxGXT0iI7a4gVNiAMg==
X-CSE-MsgGUID: v2iUuH92RFiSF4AY1RadPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49931866"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="49931866"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 03:29:48 -0800
X-CSE-ConnectionGUID: fw22lzt6QAmY50LSUPpEAg==
X-CSE-MsgGUID: 0cOhNGJuQEmLZVeUr/mn0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="141735323"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.119])
 ([10.246.3.119])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 03:29:45 -0800
Message-ID: <ac682fd4-196f-40ad-be72-95730248fc95@linux.intel.com>
Date: Wed, 5 Feb 2025 12:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/client: Skip drm-total-cycles if unable to
 read timestamp
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
 <20250204180522.2327214-4-marcin.bernatowicz@linux.intel.com>
 <15799e7d-1259-4a87-831b-1b6ceb8fee1a@intel.com>
 <dlawvvg26dolbcqdky3mkbqke4euaon4q2nvcjl4fit6jxshhb@vgzmhe6us5qt>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <dlawvvg26dolbcqdky3mkbqke4euaon4q2nvcjl4fit6jxshhb@vgzmhe6us5qt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 2/4/2025 9:13 PM, Lucas De Marchi wrote:
> On Tue, Feb 04, 2025 at 07:56:03PM +0100, Michal Wajdeczko wrote:
>>
>>
>> On 04.02.2025 19:05, Marcin Bernatowicz wrote:
>>> Ensure show_run_ticks() only prints drm-total-cycles when timestamp
>>> retrieval succeeds.
>>>
>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_drm_client.c | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/ 
>>> xe_drm_client.c
>>> index 63f30b6df70b..e5c4f342380e 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>> @@ -323,6 +323,7 @@ static void show_run_ticks(struct drm_printer *p, 
>>> struct drm_file *file)
>>>      struct xe_exec_queue *q;
>>>      u64 gpu_timestamp;
>>>      unsigned int fw_ref;
>>> +    int err;
>>>
>>>      /*
>>>       * Wait for any exec queue going away: their cycles will get 
>>> updated on
>>> @@ -350,7 +351,7 @@ static void show_run_ticks(struct drm_printer *p, 
>>> struct drm_file *file)
>>>      }
>>>      mutex_unlock(&xef->exec_queue.lock);
>>>
>>> -    gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>> +    err = xe_hw_engine_read_timestamp(hwe, &gpu_timestamp);
>>
>> can't we just check for !IS_SRIOV_VF here?
>>
>>>
>>>      xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
>>>      xe_pm_runtime_put(xe);
>>> @@ -371,8 +372,10 @@ static void show_run_ticks(struct drm_printer 
>>> *p, struct drm_file *file)
>>>          class_name = xe_hw_engine_class_to_str(class);
>>>          drm_printf(p, "drm-cycles-%s:\t%llu\n",
>>>                 class_name, xef->run_ticks[class]);
>>> -        drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>>> -               class_name, gpu_timestamp);
>>> +
>>> +        if (!err)
>>> +            drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>>
>> are we sure we don't break any tools that might look for this?
> 
> It may break if the tool is expecting drm-total-cycles-* to exist when it
> reads a drm-cycles-*. Also there isn't much value afaik from showing just
> the total cycles. IMO we could just skip the entire function
> on IS_SRIOV_VF().

igt@xe_drm_fdinfo is passing, as its checks are immune to the lack of 
drm-total-cycles-*. However, the only information we get is that the 
engine was busy (and comparison with spin->timestamp passes), with no 
utilization visible in gputop (the tool does not break).

We could "fool" the tools by setting drm-total-cycles to a CPU-based 
timestamp:

drm-total-cycles = mul_u64_u32_div(local_clock(),
                                    hwe->gt->info.reference_clock,
                                    NSEC_PER_SEC);

However, this is a no-go, as it could introduce more problems than benefits.

I also checked qmassa, but it does not handle VF devices (for unrelated 
reasons).

I'll send a second version skipping show_run_ticks if VF.

Thanks,
marcin
> 
> Lucas De Marchi
> 
>>
>>> +                   class_name, gpu_timestamp);
>>>
>>>          if (capacity[class] > 1)
>>>              drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>>

