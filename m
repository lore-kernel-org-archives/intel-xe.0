Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995DFCCF9E9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 11:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A6010E16B;
	Thu, 26 Sep 2024 11:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIWs05G5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D43E10E16B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727348589; x=1758884589;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=loyMv0EwO8W3e2dIfjFUdQOBJbQdKse4qRxMlLvljTA=;
 b=bIWs05G5PIglygsnUAVbxgGdfXjH4nwypJqIVfrhwVT2WMTM50dh7dPj
 our8Ar2/G7yy97wEU69/EUY3xnDrD9VWhY19VGj6Y+iQXzaCMamsz1t5q
 zknobBimJVq4pADEe0be5jFCeCpqIjc1Q1v6+dHshayPYh5F/RiFIK1BN
 WwPKrs45UAgmlyX+36L/jrtIJY7gnB9jflWE77UmCUz92F6Jv3FH9GzwL
 CB9znWpAOpL9fwVDQDNRz3dnSXFgUxKUwu5KIECHHH0aYNUC+rNWmH9j2
 WOx6mMvf9VMCcUjp53r2Kyye4/VhGjZmX6ObR+L6kIjrGJHpM/HKRxJDd A==;
X-CSE-ConnectionGUID: /JLn0YVwSJe3kT/r3VGpPg==
X-CSE-MsgGUID: KV+e7JDFS7K0lH789Nk8Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37103830"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="37103830"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 04:03:09 -0700
X-CSE-ConnectionGUID: k70qvActSLGfOyE/dvzirw==
X-CSE-MsgGUID: QR7/TQF4R6Wcgcu0U3gn1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="71778668"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 26 Sep 2024 04:03:06 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0DEAF27BC9;
 Thu, 26 Sep 2024 12:03:04 +0100 (IST)
Message-ID: <fe52746a-9395-4392-a96a-6caeb4a49597@intel.com>
Date: Thu, 26 Sep 2024 13:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] drm/xe: Error handling in xe_force_wake_get()
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-2-himal.prasad.ghimiray@intel.com>
 <f10c3f76-aac8-441f-80c1-c7e2632136f6@intel.com>
 <337515e5-83f8-4969-bc79-f1d380a31330@intel.com>
 <8b045c35-95bc-4977-840e-067c2abbcd10@intel.com>
 <b7102aa2-4a5a-4928-acf9-0384ad983fb4@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <b7102aa2-4a5a-4928-acf9-0384ad983fb4@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 25.09.2024 20:14, Ghimiray, Himal Prasad wrote:
> 
> 
> On 25-09-2024 22:50, Michal Wajdeczko wrote:
>>
>>
>> On 25.09.2024 18:36, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 25-09-2024 17:31, Michal Wajdeczko wrote:
>>>>
>>>>
>>>> On 24.09.2024 14:16, Himal Prasad Ghimiray wrote:
>>>>> If an acknowledgment timeout occurs for a domain awake request, do not
>>>>> increment the reference count for the domain. This ensures that
>>>>> subsequent _get calls do not incorrectly assume the domain is
>>>>> awake. The
>>>>> return value is a mask of domains whose reference counts were
>>>>> incremented, and these domains need to be released using
>>>>> xe_force_wake_put.
>>>>>
>>>>> The caller needs to compare the return value with the input domains to
>>>>> determine the success or failure of the operation and decide
>>>>> whether to
>>>>> continue or return accordingly.
>>>>>
>>>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>>>
>>>>> v3
>>>>> - Use explicit type for mask (Michal/Badal)
>>>>> - Improve kernel-doc (Michal)
>>>>> - Use unsigned int instead of abusing enum (Michal)
>>>>>
>>>>> v5
>>>>> - Use unsigned int for return (MattB/Badal/Rodrigo)
>>>>> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
>>>>>
>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_force_wake.c | 37 ++++++++++++++++++++++
>>>>> +-------
>>>>>    drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>>>>    2 files changed, 31 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/
>>>>> xe_force_wake.c
>>>>> index a64c14757c84..d190aa93be90 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> @@ -150,28 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>>                         (ffs(tmp__) - 1))) && \
>>>>>                         domain__->reg_ctl.addr)
>>>>>    -int xe_force_wake_get(struct xe_force_wake *fw,
>>>>> -              enum xe_force_wake_domains domains)
>>>>> +/**
>>>>> + * xe_force_wake_get() : Increase the domain refcount
>>>>> + * @fw: struct xe_force_wake
>>>>> + * @domains: forcewake domains to get refcount on
>>>>> + *
>>>>> + * This function takes references for the input @domains and wakes
>>>>> them if
>>>>> + * they are asleep.
>>>>
>>>> nit: likely we should also add the note that one shall call the
>>>> xe_force_wake_put() function to decrease refcounts
>>>
>>> Sure.
>>>
>>>>
>>>>> + *
>>>>> + * Return: mask of refcount increased domains.
>>>>
>>>> do we really need to expose implementation detail to the caller?
>>>>
>>>> can't we just treat the returned value as opaque data that just
>>>> needs to
>>>> be passed to the matching xe_force_wake_put(fw, ref) call ?
>>>>
>>>>> If the return value is
>>>>> + * equal to the input parameter @domains, the operation is considered
>>>>> + * successful.
>>>>
>>>> sorry, but I'm still little uncomfortable with such approach, due to a
>>>> mismatch between input parameter type that is enum
>>>> xe_force_wake_domains
>>>> and return type which is unsigned int, as IMO forcing the user to
>>>> compare two different types seems wrong
>>>
>>> Sure, I understand the thought process behind it. Will a helper to do it
>>> is OK. Justifying below for the helper.
>>>
>>>>
>>>> can't we just say that if returned value is zero then no domains were
>>>> waken (which would provide definite answer if single domain was
>>>> requested) ?
>>>
>>> I am concerned  about the scenario, where user ends up considering non
>>> zero return of FORCEWAKE_ALL as success.
>>
>> while user can always do something wrong, note that in above statement
>> we didn't say that _all_ requested domains were awake if ref != 0
>>
>>>
>>> Having multiple success or failure condition for same API, based on
>>> input parameter looks bad design to me.
>>
>> it's not multiple, in fact it is unified:
>>
>> 1) ALL_DOMAINS
>>
>>     ref = xe_force_wake_get(fw, ALL_DOMAINS)
>>     if (!ref)
>>         return -EIO
>>
>>     // explicit check
>>     if (xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
>>         ...
>>
>>     xe_force_wake_put(fw, ref)
>>
>>
>> 2a) SINGLE_DOMAIN
>>
>>     ref = xe_force_wake_get(fw, SINGLE_DOMAIN)
>>     if (!ref)
>>         return -EIO
>>
>>     // explicit check
>>     if (xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
>>         ...
>>
>>     xe_force_wake_put(fw, ref)
>>
>>
>> and what we did is just optimization for SINGLE_DOMAIN
>>
>> 2b) SINGLE_DOMAIN
>>
>>     ref = xe_force_wake_get(fw, SINGLE_DOMAIN)
>>     if (!ref)
>>         return -EIO
>>
>>     BUG_ON(!xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
>>
>>     xe_force_wake_put(fw, ref)
>>
>>>
>>> ref = xe_force_wake_get(fw, GT)
>>> if (ref) -> means success condn
>>>
>>> whereas
>>>
>>> ref = xe_force_wake_put(fw, ALL)
>>> if (ref) -> doesn't necessarily means successfully awakened all domain.
>>>
>>> User can very easily interpret it wrongly:
>>> ref = xe_force_wake_get(fw, ALL)
>>> if(!ref)
>>>      error_handling;
>>>
>>> /* Irrespective of failure or success of xe_force_wake_get code reaches
>>> here */
>>> do_multiple_operations(); /* Needed all fw domains supported on GT to be
>>> awake */
>>>
>>> xe_force_wake_put(fw, ref);
>>>
>>> We have use-cases throughout the driver where user relies on success/
>>> failure for FORCEWAKE_ALL domains.
>>
>> maybe for more consistent API we should have two functions:
>>
>> a) pass only if _all_ domains are awake
>>
>>     ref = xe_force_wake_get(fw, ALL_DOMAINS)
>>     if (!ref)
>>         return -EIO
>>
>>     // no need for explicit checks
>>     BUG_ON(!xe_force_wake_is_awake(fw, FOO_DOMAIN))
>>     BUG_ON(!xe_force_wake_is_awake(fw, BAR_DOMAIN))
>>     ...
>>
>>     xe_force_wake_put(fw, ref)
>>
>> b) fails only if _all_ domains are not awake
>>
>>     ref = xe_force_wake_get(fw, ALL_DOMAINS)
>>     if (!ref)
>>         return -EIO
>>
>>     // must do explicit checks
>>     if (xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
>>         ...
>>
>>     xe_force_wake_put(fw, ref)
>>>
>>>>
>>>> and for the xe_force_wake_get(fw, ALL_DOMAINS) case, we can provide
>>>> helper function that will check if specified domain is really awake:
>>>>
>>>>      ref = xe_force_wake_put(fw, ALL_DOMAIN)
>>>>
>>>>      if (ref) {
>>>>          xe_force_wake_is_awake(fw, SINGLE_DOMAIN)
>>>
>>>
>>> I assume this API is to check whether ref has domain in it or not. Will
>>> be good helper to have for such scenarios, Which are currently not there
>>> in driver.
>>
>> there could be two variants, one that checks fw
>>
>>     xe_force_wake_is_awake(fw, SINGLE_DOMAIN)
>>
>> other that checks ref
>>
>>     xe_force_wake_ref_has_domain(ref, SINGLE_DOMAIN)
>>
>> but the only benefit from the latter is that it could be lightweight as
>> otherwise
>>
>>     BUG_ON(xe_force_wake_is_awake(fw, SINGLE_DOMAIN) ^
>>            xe_force_wake_ref_has_domain(ref, SINGLE_DOMAIN))
>>
>>>
>>>
>>>>
>>>>          xe_force_wake_put(fw, ref)
>>>>      }
>>>>
>>>
>>> I believe a helper to determine success or failure of force_wake_get,
>>> instead of caller doing it will streamline all the domains and usecases.
>>>
>>> int xe_force_wake_get_status(enum domain, unsigned int fw_ref)
>>> {
>>>    return  (fw_ref == domain) ? 0 : -ETIMEDOUT;
>>> }
>>
>> I'm not sure we should provide error code, IMO simple bool function will
>> better and caller can decide what to do next
> 
> 
> -ETIMEDOUT is the actual error code for domain awake acknowledgment
> failure that is why I added it. I am fine with bool and letting caller
> decide.
> 
> Thinking more about it, better not to have xe_force_wake_is_awake and
> rely on xe_force_wake_ref_has_domain.

but nested functions like do_operations() may not have access to the
fw_ref, so we should still allow to check domain status without the ref

> fw->awake_domain is global state and could be awaken from anywhere
> doesn't guarantee it is awaken by current force_wake_get(). Can be a
> misused.

true, so lets just define two helpers to cover all use cases:

bool xe_force_wake_ref_has_domain(unsigned int fw_ref, enum domain)
bool xe_force_wake_is_awake(struct xe_fw *fw, enum domain)

> 
> Since you recommended using bool. How about ?
> 
> bool xe_force_wake_ref_has_domain(enum domain, unsigned int fw_ref)
> { return (fw_ref & domain == domain) ?  true : false ;
> }

you don't need ternary operator and fw_ref should be first:

bool xe_force_wake_ref_has_domain(unsigned int fw_ref, enum domain)

> 
> works for all scenario:
> 
> ref = xe_force_wake_get(fw, SINGLE)
> if(!xe_force_wake_ref_has_domain(SINGLE, ref)) -> failure
> 
> 
> ref = xe_force_wake_get(fw, ALL)
> !xe_force_wake_ref_has_domain(ALL, ref) -> failure
> 
> ref = xe_force_wake_get(fw, ALL)
> if(!xe_force_wake_ref_has_domain(SINGLE, ref)) -> failure
> 
> 
> If you find this to be ok. Will define this helper and use it to check
> status of force_wake_get.

with fixed/added helpers it's fine with me

> 
> BR
> Himal
> 
>>
>>>
>>> Usecases:
>>>
>>> A) No error check, just continue in case of failure too.
>>>
>>> ref =  xe_force_wake_get(fw, domain /* can be ALL_DOMAIN */);
>>> do_operations();
>>> xe_force_wake_put(fw, ref);
>>
>> yep
>>
>> and inside do_operations() we can always use xe_force_wake_is_awake to
>> check every domain
>>
>>>
>>> B) error check, abort in case of failure.
>>>
>>> ref =  xe_force_wake_get(fw, domain /* can be ALL_DOMAIN */);
>>> int err = xe_force_wake_get_status(domain, ref);
>>> if(err) {
>>>       xe_force_wake_put(fw, ref);
>>>           return err;
>>>          }
>>> do_operations();
>>> xe_force_wake_put(fw, ref);
>>
>> nay, too complicated, better:
>>
>> ref = xe_force_wake_get(fw, ALL);
>>
>> err = xe_force_wake_is_awake(fw, ALL) ? do_operations() : -EFATAL;
>>
>> xe_force_wake_put(fw, ref);
>>
>>>
>>> c) get all domain, but check specific domain:
>>>
>>> ref =  xe_force_wake_get(fw, ALL_domain);
>>>     if (xe_force_wake_get_status(domain, ref))
>>>          dmesg_warn( "unable to awake all requested domain \n");
>>
>> IIRC in xe_force_wake_get() there is one WARN already
>>
>>>
>>>      if (xe_fwref_has_domain(fw, SINGLE_DOMAIN))
>>>          do_operations()
>>>
>>>     xe_force_wake_put(fw, ref);
>>>
>>
>> so maybe simpler:
>>
>> ref = xe_force_wake_get(fw, ALL);
>>
>> err = xe_force_wake_is_awake(fw, FOO) ? do_operations() : -EMINOR;
>>
>> xe_force_wake_put(fw, ref);
>>
>>
>>>>> Otherwise, the operation is considered a failure, and
>>>>> + * the caller should handle the failure case, potentially returning
>>>>> + * -ETIMEDOUT.
>>>>> + */
>>>>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>>> +                   enum xe_force_wake_domains domains)
>>>>>    {
>>>>>        struct xe_gt *gt = fw->gt;
>>>>>        struct xe_force_wake_domain *domain;
>>>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>>>> +    unsigned int tmp, ret, awake_rqst = 0, awake_failed = 0;
>>>>>        unsigned long flags;
>>>>> -    int ret = 0;
>>>>>          spin_lock_irqsave(&fw->lock, flags);
>>>>>        for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>>            if (!domain->ref++) {
>>>>> -            woken |= BIT(domain->id);
>>>>> +            awake_rqst |= BIT(domain->id);
>>>>>                domain_wake(gt, domain);
>>>>>            }
>>>>>        }
>>>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>>>> -        ret |= domain_wake_wait(gt, domain);
>>>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>>> +        if (domain_wake_wait(gt, domain) == 0) {
>>>>> +            fw->awake_domains |= BIT(domain->id);
>>>>> +        } else {
>>>>> +            awake_failed |= BIT(domain->id);
>>>>> +            --domain->ref;
>>>>> +        }
>>>>>        }
>>>>> -    fw->awake_domains |= woken;
>>>>> +    ret = (domains & ~awake_failed);
>>>>>        spin_unlock_irqrestore(&fw->lock, flags);
>>>>>    +    xe_gt_WARN(gt, awake_failed, "domain%s %#x failed to
>>>>> acknowledgment awake\n",
>>>>> +           str_plural(hweight_long(awake_failed)), awake_failed);
>>>>> +
>>>>>        return ret;
>>>>>    }
>>>>>    diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/
>>>>> xe/xe_force_wake.h
>>>>> index a2577672f4e3..6c1ade39139b 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>>>>>                   struct xe_force_wake *fw);
>>>>>    void xe_force_wake_init_engines(struct xe_gt *gt,
>>>>>                    struct xe_force_wake *fw);
>>>>> -int xe_force_wake_get(struct xe_force_wake *fw,
>>>>> -              enum xe_force_wake_domains domains);
>>>>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>>> +                   enum xe_force_wake_domains domains);
>>>>>    int xe_force_wake_put(struct xe_force_wake *fw,
>>>>>                  enum xe_force_wake_domains domains);
>>>>>    
>>>>
>>>
>>
> 

