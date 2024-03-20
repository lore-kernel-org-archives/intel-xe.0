Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60293C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 13:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2688E10EA83;
	Wed, 20 Mar 2024 13:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhGzIb6D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F1110EA83
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710940051; x=1742476051;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/jbNDl4eTmwCTQETePrY3/ot5DpoICBQNC0Rb2alXRA=;
 b=jhGzIb6DKSGhcanNCEFSo6LDCl2IUJ3mkGkS34ty6USoOjKcYs9gt7Ot
 iIrnE7pktC9s5EGa6hQwentPpEEV/95EZHOevMwcvcqAm1Xd5o+A6GSjN
 PrOMYx69/8mRMVl+eA0yU/zj9nC+EXn34hQoXij0r8p11o/GA8cg0FfaA
 F5YuHZXcRadwV66vXxQ0s2Bf8sq5DnkvCst9QccyAjk/tSgl2OkBEzJfN
 VqePdp9IyJxNVfQxKg6NQopgrEnv5K4MVQopKJQjlFRNGaTbSMZhxhj7A
 7G2DKG95Rh5gUlAt5s79Ccz8KQ/RMS0jWjjNl4+KbjQLm8nIQdnXs1dhb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5987062"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5987062"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 06:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14542261"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.15])
 ([10.246.36.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 06:07:28 -0700
Message-ID: <1ebfbec2-ae11-4ac3-8395-17031146dff8@linux.intel.com>
Date: Wed, 20 Mar 2024 14:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240318164342.3094-1-nirmoy.das@intel.com>
 <20240318164342.3094-2-nirmoy.das@intel.com>
 <5f468d07-be94-479d-a0ae-6e8c76486f11@intel.com>
 <3dabee23-9a7a-4f43-be33-d4902a5fc7af@intel.com>
 <ghya5zsi2nxf4rx3253d3yh7btwybd2k6pdxeps26wnqabyf3d@yrghhvwbu57t>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ghya5zsi2nxf4rx3253d3yh7btwybd2k6pdxeps26wnqabyf3d@yrghhvwbu57t>
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


On 3/20/2024 4:20 AM, Lucas De Marchi wrote:
> On Mon, Mar 18, 2024 at 07:41:56PM +0100, Nirmoy Das wrote:
>>
>> On 3/18/2024 6:41 PM, Michal Wajdeczko wrote:
>>>
>>> On 18.03.2024 17:43, Nirmoy Das wrote:
>>>> Add a warn for NULL job when sync->type is
>>>> DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming
>>>> error and should never happen so warn and let the kernel crash
>>>> if that ever happens.
>>> IMO adding WARN and then let kernel crash is pointless as you will have
>>> almost exactly the same report as from NPD
>>
>> WARN should give us the line number which is not the case for NDP I 
>> think.
>
> and a NPD will put the line with the NPD straight in the RIP line.

I always observed NPD to be func name + offset,  not the line number.


> So,
> to second what Michal said, what's the point?
>
> it would make sense if you were adding the warning earlier and make the
> driver still behave. The place it was added, not so much

I will not defend this patch much :) now that I think I have a better one

https://patchwork.freedesktop.org/series/131371/


Regards,

Nirmoy

>
> Lucas De Marchi
>
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>> for programming errors we should xe_assert() that will provide 
>>> necessary
>>> hint during code refactor but will be compiled on production builds
>>>
>>> only if you feel that that job could be still (but unlikely) NULL then
>>> you should use drm_WARN/xe_gt_WARN and provide necessary fallback
>>>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_sync.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_sync.c 
>>>> b/drivers/gpu/drm/xe/xe_sync.c
>>>> index 02c9577fe418..247505c3478d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sync.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>>>> @@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry 
>>>> *sync, struct xe_sched_job *job,
>>>>              dma_fence_put(fence);
>>>>          }
>>>>      } else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
>>>> +        XE_WARN_ON(!job);
>>>>          job->user_fence.used = true;
>>>>          job->user_fence.addr = sync->addr;
>>>>          job->user_fence.value = sync->timeline_value;
