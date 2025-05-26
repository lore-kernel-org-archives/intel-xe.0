Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F374C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 11:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A84610E321;
	Mon, 26 May 2025 11:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9XINPvR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E162B10E2A5
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 11:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748258453; x=1779794453;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=QHKaUdpjWMQeMqFmNOg0qYjLaKWgo+9ivP+vvXJsGSo=;
 b=k9XINPvR4W48Hm6tfB7D5oTPoTYw+pDY3JNgl0Zpq2W46BYxAUhOZPHv
 YxrciU3sQpLW5Nnhp4QxWpwW8oRyhjsNSXUqqW64fu7kSeRYpuweysKfp
 ktXJxXzzCjChU/iU3MhlOafMbz/YeItm2a+wbonzTzhtBirKODSO8fABy
 gkAGaXQna4JkBUMed3VP5vuKcJkV9jaUwa0zhfOOTKz1WOmAGo0p2Gybz
 B7yJPTD5HT/vnnJKEcpjx4Tjk1tZtHvVA2d8rA/mn/HhWft4t4aSLDASn
 vfae54BiG40VPr9UnY7H5ilTPDaxcLMxdvWtq2y1S1YiEzKWSfPQFwd9k Q==;
X-CSE-ConnectionGUID: H5JGUo5aStK6vGgotdenoQ==
X-CSE-MsgGUID: lHEuJJtsSUuRTQ02to49yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50116561"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="50116561"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 04:20:52 -0700
X-CSE-ConnectionGUID: WMY9c7jnRuKGklsVT44zXA==
X-CSE-MsgGUID: Sf1ZOaFXQgain8L68NUdXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147095775"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 04:20:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: John Harrison <john.c.harrison@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Cc: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v5] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
In-Reply-To: <87e44285-c2dc-4888-a889-3e588a0ebc8e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250522080020.2787294-1-satyanarayana.k.v.p@intel.com>
 <ebbae452-0a14-46dc-8e25-989c36bb0dda@intel.com>
 <LV3PR11MB8695662472A2F378B9B894FDF998A@LV3PR11MB8695.namprd11.prod.outlook.com>
 <87e44285-c2dc-4888-a889-3e588a0ebc8e@intel.com>
Date: Mon, 26 May 2025 14:20:47 +0300
Message-ID: <8a05cad99707578e18877f021f6e4674184065e3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 23 May 2025, John Harrison <john.c.harrison@intel.com> wrote:
> On 5/22/2025 10:33 PM, K V P, Satyanarayana wrote:
>> Hi
>>> -----Original Message-----
>>> From: Harrison, John C <john.c.harrison@intel.com>
>>> Sent: Friday, May 23, 2025 1:09 AM
>>> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; intel-
>>> xe@lists.freedesktop.org
>>> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Nikula, Jani
>>> <jani.nikula@intel.com>
>>> Subject: Re: [PATCH v5] drm/xe: Add helper function to inject fault into
>>> ct_dead_capture()
>>>
>>> On 5/22/2025 1:00 AM, Satyanarayana K V P wrote:
>>>> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
>>>> functions, the CI test systems are going out of space and crashing. To
>>>> avoid this issue, a new helper function is created and when fault is
>>>> injected into this xe_inject_fault() helper function, ct dead capture
>>>> is avoided which suppresses ct dumps in the log.
>>>>
>>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>>> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>
>>>> V4 -> V5:
>>>> - Fixed review comments.
>>>>
>>>> V3 -> V4:
>>>> - Updated the name of helper function and moved to xe_device.h file.
>>>>
>>>> V2 -> V3:
>>>> - Added inline function to avoid compilation error in the absence of
>>>> CONFIG_FUNCTION_ERROR_INJECTION.
>>>>
>>>> V1 -> V2:
>>>> - Fixed review comments.
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_device.c | 18 ++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_device.h | 14 ++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_guc_ct.c |  6 ++++++
>>>>    3 files changed, 38 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>> b/drivers/gpu/drm/xe/xe_device.c
>>>> index 660b0c5126dc..e1b4087a2974 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -1120,6 +1120,24 @@ static void xe_device_wedged_fini(struct
>>> drm_device *drm, void *arg)
>>>>    	xe_pm_runtime_put(xe);
>>>>    }
>>>>
>>>> +/**
>>>> + * xe_is_injection_active() - Helper function to test whether a fault
>>>> + * inject test is running.
>>>> + *
>>>> + * This is a helper function that the driver can use to detect whether
>>>> + * a fault injection test is running in order to suppress excessive d=
ebug
>>>> + * output. By default, the return value is fixed as zero but it can b=
e modified
>>>> + * by the fault injection framework to return an error.
>>>> + *
>>>> + * Returns:
>>>> + * 0 if no fault is injected.
>>>> + * Injected error if fault is injected.
>>>> + */
>>>> +int xe_is_injection_active(void)
>>>> +{
>>>> +	return xe_inject_fault();
>>>> +}
>>>> +
>>> I'm confused. What is the point of this wrapper?
>> We are injecting fault into xe_inject_fault() function which is generic.=
 The fault injection status is obtained from
>> xe_is_injection_active() function. This is to make function names meanin=
gful.
> But why?
>
> Why not just have a single function that is named=20
> "xe_is_injection_active" and has the fault injected into it directly? It=
=20
> has a meaningful name, it does what it needs to do, it keeps things=20
> simple. Why have an extra level of function wrapper for no benefit?
>
> And in terms of meaningful names, "xe_inject_fault" sounds like a=20
> function which is going to actually inject a fault somewhere. Whereas,=20
> you are wanting something more like=20
> "xe_stub_function_for_injecting_fault_into".=C2=A0 But as above, why both=
er?=20
> The comment tells you exactly what is happening here. There is no need=20
> for extra levels of wrapping just to change the name of a function.

I think all of this begs the question, does this belong in the kernel at
all? The problem is all in userspace ("CI test systems are going out of
space and crashing"). Userspace asks for error injection. Why does the
kernel need to apply the policy of not logging something specific in
this case? What else should the kernel not log, and who's going to
decide?

Personally I think logging core dumps in dmesg even in CI setting is
questionable, but let's just assume it's needed. Then there needs to be
a (debugfs?) knob for userspace to enable/disable that behaviour. The
fault injection test is very specific. Have the test disable dmesg
coredumps during fault injection tests. That's all. Don't make the
kernel more complicated and ridden with special casing for userspace
problems.


BR,
Jani.


>
> John.
>
>>>>    /**
>>>>     * xe_device_declare_wedged - Declare device wedged
>>>>     * @xe: xe device instance
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>>> b/drivers/gpu/drm/xe/xe_device.h
>>>> index 0bc3bc8e6803..13a43fe4fb64 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>> @@ -195,6 +195,20 @@ void xe_device_declare_wedged(struct xe_device
>>> *xe);
>>>>    struct xe_file *xe_file_get(struct xe_file *xef);
>>>>    void xe_file_put(struct xe_file *xef);
>>>>
>>>> +#ifdef CONFIG_FUNCTION_ERROR_INJECTION
>>>> +/*
>>>> + * As fault is injected using this function, need to make sure that
>>>> + * the compiler does not optimize and make it as a inline function.
>>>> + * To prevent compile optimization, "noinline" is added.
>>>> + */
>>>> +static noinline int xe_inject_fault(void) { return 0; }
>>>> +ALLOW_ERROR_INJECTION(xe_inject_fault, ERRNO);
>>>> +#else
>>>> +static inline int xe_inject_fault(void) { return 0; }
>>> Why not name this xe_is_injection_active() and just call it directly?
>>>
>>> John.
>>>
>>>> +#endif
>>>> +
>>>> +int xe_is_injection_active(void);
>>>> +
>>>>    /*
>>>>     * Occasionally it is seen that the G2H worker starts running after=
 a delay of
>>> more than
>>>>     * a second even after being queued and activated by the Linux work=
queue
>>> subsystem. This
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index 822f4c33f730..89f992feba31 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -2040,6 +2040,12 @@ static void ct_dead_capture(struct xe_guc_ct
>>> *ct, struct guc_ctb *ctb, u32 reaso
>>>>    	if (ctb)
>>>>    		ctb->info.broken =3D true;
>>>> +	/*
>>>> +	 * Huge dump is getting generated when injecting error for guc
>>> CT/MMIO
>>>> +	 * functions. So, let us suppress the dump when fault is injected.
>>>> +	 */
>>>> +	if (xe_is_injection_active())
>>>> +		return;
>>>>
>>>>    	/* Ignore further errors after the first dump until a reset */
>>>>    	if (ct->dead.reported)
>

--=20
Jani Nikula, Intel
