Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6660FCD4857
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 15:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A69510E7F8;
	Wed,  4 Sep 2024 15:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNmYKS4H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AFB10E7F8
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 15:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725464538; x=1757000538;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k04x/GYa9PT/Yu5rtzc1bAN+oU8rcX5Goq7icTVNKYs=;
 b=dNmYKS4Hbwudsqne9R0EbuMtZd9AF6lQnaP9ZpxE5TEBC/cg3VtcewfA
 SW6npuSSR7z/pL2bWSvZaa1dMcZMtYaY/SKYt8iYKnR8f3BNcqvzNK8df
 9p+gphc5sVR3zUI1fp3BpZ2wN41LAhKGRNAuYrlTeSx4qF4r/3n3owqdl
 YwLnHV0rOozzIRDw9NeVR7tmBJXdgOZftjOobHTwrik9NoMkJ9PndzLzn
 5fhX54VESv8PBtVEHOgZSkgXkSLgPLcw81sPfV5v7hpnC1BbwDnpHxbKj
 SmN5oWo7JxYTPXLjtRhEiCDMeT1rbt6cXPtvbztyzv6AuXP/fbJGdPTLl A==;
X-CSE-ConnectionGUID: I93yyy7rQ0u3aJkJyfjjlw==
X-CSE-MsgGUID: AxIB/1lvQNu2GQoOwSv+zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24090318"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24090318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 08:42:18 -0700
X-CSE-ConnectionGUID: cA+hKn4CRxWlAYNn1RlaEQ==
X-CSE-MsgGUID: kmC4LHoiTIGrKbDvVl6kqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="70121903"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 08:42:17 -0700
Message-ID: <cd6009f5-6404-4404-be21-712425d4a24c@intel.com>
Date: Wed, 4 Sep 2024 16:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Kill missing outer runtime PM protection warning
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240903223822.380841-1-rodrigo.vivi@intel.com>
 <23623c0f-f3e5-4227-9a84-7490ae3978ec@intel.com> <Zth22JdcjlcSAzin@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Zth22JdcjlcSAzin@intel.com>
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

On 04/09/2024 16:03, Rodrigo Vivi wrote:
> On Wed, Sep 04, 2024 at 01:49:47PM +0100, Matthew Auld wrote:
>> On 03/09/2024 23:38, Rodrigo Vivi wrote:
>>> This message was very useful to ensure that Xe was taking all
>>> the needed outer runtime pm references. However, at this point
>>> it is only a false positive. So, remove it.
>>>
>>> False positive cases:
>>>
>>> 1:
>>> [184.983389] xe ...: [drm] Missing outer runtime PM protection
>>> [snip]
>>> [184.984096]  drm_ioctl+0x2cf/0x580 [drm]
>>> [snip]
>>> [184.984710] xe 0000:00:02.0: Runtime PM usage count underflow!
>>>
>>> In this case the underflow is the problem since we are sure that
>>> the ioctl is protected. But something else is abusing the 'put'
>>> calls.
>>>
>>> 2:
>>> rpm_status:           0000:03:00.0 status=RPM_SUSPENDING
>>> console:              xe_bo_evict_all (called from suspend)
>>> xe_sched_job_create:  dev=0000:03:00.0, ...
>>> xe_sched_job_exec:    dev=0000:03:00.0, ...
>>> xe_pm_runtime_put:    dev=0000:03:00.0, ...
>>> xe_sched_job_run:     dev=0000:03:00.0, ...
>>> rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
>>> rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
>>> rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
>>> console:              xe 0000:03:00.0: [drm] Missing outer runtime
>>> 		      	 	       	     	     PM protection
>>> console:               xe_guc_ct_send+0x15/0x50 [xe]
>>> console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
>>> [snip]
>>> console:               drm_sched_run_job_work+0x649/0xc20
>>>
>>> At this point, BOs are getting evicted from VRAM with rpm
>>> usage-counter = 2, but rpm status = SUSPENDING.
>>> The xe->pm_callback_task won't be equal 'current' because this call is
>>> coming from a work queue.
>>>
>>> So, pm_runtime_get_if_active() will be called and return 0 because rpm
>>> status != ACTIVE (but equal SUSPENDING).
>>>
>>> The only way out is to just grab the reference and move on.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pm.c | 10 ++--------
>>>    1 file changed, 2 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index da68cd689a96..e1a5e43b0f34 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -592,20 +592,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
>>>     * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
>>>     * @xe: xe device instance
>>>     *
>>> - * This function should be used in inner places where it is surely already
>>> + * This function should *only* be used in inner places where it is surely already
>>>     * protected by outer-bound callers of `xe_pm_runtime_get`.
>>> - * It will warn if not protected.
>>>     * The reference should be put back after this function regardless, since it
>>>     * will always bump the usage counter, regardless.
>>>     */
>>>    void xe_pm_runtime_get_noresume(struct xe_device *xe)
>>>    {
>>> -	bool ref;
>>> -
>>> -	ref = xe_pm_runtime_get_if_in_use(xe);
>>> -
>>> -	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
>>> -		pm_runtime_get_noresume(xe->drm.dev);
>>
>> This has proven to find real bugs in the past, right? If so, it seems
>> unfortunate to drop this completely?
> 
> You do have a point....
> 
>> What about making it slightly more
>> fuzzy with something like:
>>
>> drm_WARN(!pm_read_callback_task() && !pm_runtime_active(), ...
> 
> I don't like inspecting the status directly because it can be racy,
> but in this particular case it would for sure avoid the case-2 of
> our false positives. But perhaps something like this:
> 
> @@ -600,12 +600,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
>    */
>   void xe_pm_runtime_get_noresume(struct xe_device *xe)
>   {
> +       struct device *dev = xe->drm.dev;
>          bool ref;
>   
>          ref = xe_pm_runtime_get_if_in_use(xe);
>   
> -       if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
> -               pm_runtime_get_noresume(xe->drm.dev);
> +       if (drm_WARN(&xe->drm, !ref && dev->power.runtime_status != RPM_SUSPENDING,
> +                    "Missing outer runtime PM protection\n"))
> +               pm_runtime_get_noresume(dev);
> 
> 
>>
>> That should avoid the false positive, at the cost of not finding some real
>> bugs, but at least gives us something?
> 
> Well, right, this eliminates the false positive case 2.
> But still at least the false positive case 1.

I see that more as secondary issue due to some ref imbalance or 
something. Do you have some logs for 1 or link? I might have an idea.

> 
> The big problem that I saw with this warning at this moment, was that
> CI-buglog classified all the "Missing outer runtime PM protection"
> in a single bucket and that was ignored because we had the issue of
> the pending ggtt_node removal case to handle.
> 
> Meanwhile we masked all these bugs that I'm hunting now, because
> they all looked the ggtt_node removal.
> 
> But well, I guess we could workaround and continue the clean-up
> on the CI-buglog side and workaround false positives instead of
> simply removing this protection and going blindly forever on
> the unprotected potential new inner callers...
> 
> thought on the diff above? (&& dev->power.runtime_status != RPM_SUSPENDING)

Yeah seems fine, but maybe also need to check resuming also?

> 
> Thanks a lot,
> Rodrigo.
> 
>>
>>> +	pm_runtime_get_noresume(xe->drm.dev);
>>>    }
>>>    /**
